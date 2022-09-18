@echo off & python -x "%~f0" %* & goto :eof		
import getpass
import os

USER_NAME = getpass.getuser()

roll=str(input("Enter roll no: "))
passwd=str(input("Enter password: "))
curl_cmd = f'curl "http://172.16.166.10:8090/login.xml" -X POST -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:104.0) Gecko/20100101 Firefox/104.0" -H "Accept: */*" -H "Accept-Language: en-US,en;q=0.5" -H "Accept-Encoding: gzip, deflate" -H "Content-Type: application/x-www-form-urlencoded" -H "Origin: http://172.16.166.10:8090" -H "Connection: keep-alive" -H "Referer: http://172.16.166.10:8090/httpclient.html" --data-raw "mode=191&username={roll}&password={passwd}&a=1663443400319&producttype=0"'

def startup_service():
    bat_path = fr"C://Users//{USER_NAME}//AppData//Roaming//Microsoft//Windows//Start Menu//Programs//Startup" 
    with open(bat_path + '//' + "login.bat", "w+") as bat_file:
        bat_file.write(fr'start {curl_cmd}')

startup_service()
