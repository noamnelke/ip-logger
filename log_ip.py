import gspread
from oauth2client.service_account import ServiceAccountCredentials
from get_ip import get_external_ip
from datetime import datetime

SPREADSHEET_NAME = "Home IP Log"

scope = ['https://spreadsheets.google.com/feeds',
         'https://www.googleapis.com/auth/drive']

credentials = ServiceAccountCredentials.from_json_keyfile_name('client_secret.json', scope)

gc = gspread.authorize(credentials)

# Open a worksheet from spreadsheet with one shot
wks = gc.open(SPREADSHEET_NAME).sheet1

ip = get_external_ip()
now = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

if wks.cell(2, 3).value == ip:
    wks.update_cell(2, 2, now)
else:
    wks.insert_row([now, now, ip], index=2, value_input_option="USER_ENTERED")
