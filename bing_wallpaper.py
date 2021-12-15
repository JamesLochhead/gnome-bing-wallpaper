#!/usr/bin/env python3

import os
import subprocess
from datetime import datetime
import requests
BACKGROUNDS_DIRECTORY = "/home/james/Pictures/Bing/"

BASE_URL = "https://www.bing.com"
#BASE_URL = "https://www2.bing.com"
#BASE_URL = "https://www4.bing.com"
#BASE_URL = "https://www.cn.bing.com"
JSON_METADATA_SUFFIX = "/HPImageArchive.aspx?format=js&idx=0&n=1"

response = requests.get(BASE_URL + JSON_METADATA_SUFFIX)
image_suffix = response.json()['images'][0]['url']
date_today = datetime.now().strftime("%Y-%m-%d")
file_name = date_today + ".jpeg"

file_path = BACKGROUNDS_DIRECTORY + file_name
command = "gsettings set org.gnome.desktop.background picture-uri \'file:///" + file_path + "\'"

downloadReponse = requests.get(BASE_URL + image_suffix)
if not os.path.exists(file_path):
    with open(file_path,"wb") as file:
        file.write(downloadReponse.content)

command_result = subprocess.run(command.split(), capture_output=True)

print(response.json()['images'][0]['startdate'])
