# IP Logger
A small tool for logging your IP address to a Google Sheet.

It's intended to be run as a cron job and/or on every network connection.

## Setup

The script expects a file called `client_secret.json` with the credentials for accessing the spreadsheet. Find instructions for obtaining this file [here](https://gspread.readthedocs.io/en/latest/oauth2.html) or [here](https://www.twilio.com/blog/2017/02/an-easy-way-to-read-and-write-to-a-google-spreadsheet-in-python.html).

It currently expects a spreadsheet named `Home IP Log` that the email from `client_secret.json` has edit permissions to.

To make the spreadsheet human readable, add a header row with the following headings:

| First seen | Last seen | IP
| ---------- | --------- | --

You can leave the rest of the spreadsheet empty.

When the script is executed it inserts a row with the current timestamp and external IP. If the last (top) IP is the same as what was detected, instead of inserting a row, the script updates the "Last seen" time.

### Environment setup
Create a virtualenv:
```sh
python -m venv venv
```

Activate the virtualenv:
```sh
source venv/bin/activate
```

Install the requirements:
```sh
pip install -r requirements.txt
```

## Execution
To execute the script, from the script directory, run `python log_ip.py`.

To do it automatically add a cron job and/or a hook on network connection. To set this up automatically on Linux systems, just run `sudo ./install.sh`.
