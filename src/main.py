import requests

from modules.download import download_file
from modules.process import process


def download_parse_data(request):
    """Responds to any HTTP request.
    Args:
        request (flask.Request): HTTP request object.
    Returns:
        The response text or any set of values that can be turned into a
        Response object using
        `make_response <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>`.
    """
    # request_json = request.get_json()

    download_file()
    file_path = process()

    params = {'file_path': file_path}
    url = "https://us-central1-gcp-tqt-ejw.cloudfunctions.net/load_parquet_into_bq"
    response = request.get(url, params)

    if response.status_code != 200:
        raise Exception('Response from loading parquet')


def load_parquet_into_bq(request):
    """Responds to any HTTP request.
    Args:
        request (flask.Request): HTTP request object.
    Returns:
        The response text or any set of values that can be turned into a
        Response object using
        `make_response <http://flask.pocoo.org/docs/1.0/api/#flask.Flask.make_response>`.
    """
    request_json = request.get_json()
    print(request_json)
