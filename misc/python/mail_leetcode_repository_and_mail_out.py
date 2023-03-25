import requests
import datetime as dt
import os

import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication

sourceURL= r"https://sourceURL"

# download the file

with requests.get(sourceURL) as r:
    targetFolder = r"path/to/target/folder"
    targetFileNamePre = "leetcode-master_"
    targetFileNameDateTime = dt.datetime.now().strftime("%Y%m%d_%H%M")
    targetFileNameExtension =  r.headers['content-disposition'].split('.')[-1]
    #print(r.headers)
    targetFileName = targetFileNamePre + targetFileNameDateTime + '.' + targetFileNameExtension
    targetFullPath = targetFolder + "\\" + targetFileName

    with open(targetFullPath, 'wb') as f: #write the file to the target location
        f.write(r.content)


    # send out the file as attachment

    # create a message
    msg = MIMEMultipart()
    msg['From'] = 'xxx@@gmail.com'
    msg['To'] = 'xxx@xxx.com'
    msg['Subject'] = targetFileName
    body = targetFileName
    msg.attach(MIMEText(body, 'plain'))
    
    if os.path.isfile(targetFullPath): # attach the file to the mail
        with open(targetFullPath, 'rb') as f:
            attach = MIMEApplication(f.read(),_subtype=targetFileNameExtension)
            attach.add_header('Content-Disposition','attachment',filename=str(targetFileName))
            msg.attach(attach)

    # set up the SMTP server
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('xxx@xxx.com', 'app_password')

    # send the message
    server.sendmail(msg['From'], msg['To'], msg.as_string())
    print('Email sent!')

    # close the connection
    server.quit()
    







