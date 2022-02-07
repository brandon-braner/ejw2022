"""Download the latest zip file and upload it to the bucket"""
import os
import time
import zipfile
import gcsfs
from urllib import request
from datetime import datetime, timedelta
from .config import gs_file_path, project

RAW_PATH = f"gs://{gs_file_path}/raw_data"
FILENAME = "INMT4AA1.zip"


def download_file():
    fs = gcsfs.GCSFileSystem(project=project)

    # Download the zip file
    download_file_path = f"/tmp/{FILENAME}"
    print("Downloading the zip file...")
    start_time = time.time()
    request.urlretrieve(
        f"https://www.doc.state.nc.us/offenders/{FILENAME}", filename=download_file_path
    )
    end_time = time.time()
    print(f"Downloaded in {end_time - start_time} seconds")

    # Check if file was successfully downloaded
    if not os.path.exists(download_file_path):
        raise FileNotFoundError("Error in downloading the zip file.")

    # Extract the data from the zip file
    with zipfile.ZipFile(download_file_path, "r") as zip_ref:
        zip_ref.extractall("/tmp/")

    # Get last Saturday's date
    date = datetime.now() - timedelta(days=((datetime.now().isoweekday() + 1) % 7))
    date = date.strftime("%m-%d-%Y")

    # Upload the files to the bucket
    metafile = FILENAME.replace(".zip", ".des")
    # Check if file was successfully downloaded
    if not os.path.exists(metafile):
        raise FileNotFoundError(
            "Could not find the '.des' file. Error in unzipping the data."
        )
    print("Uploading the metafile to the bucket...")
    start_time = time.time()
    fs.put_file(metafile, f"{RAW_PATH}/{date}/{metafile}")
    end_time = time.time()
    print(f"Uploaded metafile in {end_time - start_time} seconds")
    datafile = FILENAME.replace(".zip", ".dat")
    # Check if file was successfully downloaded
    if not os.path.exists(datafile):
        raise FileNotFoundError(
            "Could not find the '.dat' file. Error in unzipping the data."
        )

    print("Uploading the datafile to the bucket...")
    start_time = time.time()
    fs.put_file(datafile, f"{RAW_PATH}/{date}/{datafile}")
    end_time = time.time()
    print(f"Uploaded datafile in {end_time - start_time} seconds")