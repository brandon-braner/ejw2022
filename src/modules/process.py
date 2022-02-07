"""Process the data files"""
import re
import datetime
from datetime import timedelta
import argparse
import gcsfs
import pandas as pd
from multiprocessing import Process

from .config import gs_file_path, project

fs = gcsfs.GCSFileSystem(project=project)
RAW_PATH = f"gs://{gs_file_path}/raw_data"
RESULTS_PATH = f"gs://{gs_file_path}/results"


def validate_date(date: str):
    """Validate if the date is valid

    Args:
        date (str): Date string to validate
    """
    try:
        date = datetime.datetime.strptime(date, "%m-%d-%Y")
    except ValueError:
        raise ValueError("Incorrect data format, should be MM-DD-YYYY")


def process_file(metafile: str, datafile: str, date: str):
    """Process a file

    Args:
        metafile (str): metafile path
        datafile (str): datafile path
        date (str): file date
    """
    # Parse the metafile
    widths = []
    colnames = []
    with fs.open(metafile, "r") as fid:
        _ = fid.readline()  # throw away header

        # Parse column names and widths
        for line in fid:
            tokens = line.split()
            widths.append(int(tokens[-1]))
            colnames.append(
                re.sub("[^0-9a-zA-Z]+", "_", "_".join(tokens[1:-3]).lower())
            )

    # Read the datafile
    with fs.open(datafile, "r") as fid:
        df = pd.read_fwf(fid, widths=widths, names=colnames)
        for column in colnames:
            df[column] = df[column].astype(str)
        df["batch_date"] = pd.to_datetime(date)

    # Create the output path
    outfile_name = datafile.split("/")[-1].replace(".dat", f"_{date}.parquet")
    outfile_path = f"{RESULTS_PATH}/{outfile_name}"

    # Upload the results
    df.to_parquet(outfile_path, index=False)


def process(process_all: bool = False):
    process_all = process_all
    date = datetime.datetime.now() - timedelta(days=((datetime.datetime.now().isoweekday() + 1) % 7))
    date = date.strftime("%m-%d-%Y")
    if not process_all and not date:
        raise ValueError("No arguments passed")

    # Check if all files are to be processed
    if process_all:
        metafiles = fs.glob(f"{RAW_PATH}/*/*.des")
        datafiles = fs.glob(f"{RAW_PATH}/*/*.dat")
        dates = [x.split("/")[-2] for x in metafiles]

        procs = []
        for metafile, datafile, date in zip(metafiles, datafiles, dates):
            proc = Process(target=process_file, args=(metafile, datafile, date))
            proc.start()
            procs.append(proc)

        for proc in procs:
            proc.join()
    else:
        # Validate the date
        validate_date(date)

        # Get the files
        metafile = fs.glob(f"{RAW_PATH}/{date}/*.des")
        datafile = fs.glob(f"{RAW_PATH}/{date}/*.dat")

        if len(metafile) == 0 or len(datafile) == 0:
            raise FileNotFoundError(
                f"Meta and/or data file not present at {RAW_PATH}/{date}/"
            )

        process_file(metafile[0], datafile[0], date)
