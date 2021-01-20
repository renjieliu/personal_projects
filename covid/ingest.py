#!/usr/bin/python3

import os
import datetime
import time
import json
import pymssql
import pandas as pd

def importToDB(filePath):
	server = "server"
	user = "user"
	password = "password"
	db = "db"

	with open(filePath,'r') as f:
		txt = f.read()
		data = json.loads(txt)
		#print(type(data))
		def extractCountry(output, data):
			for k, v in data.items(): 
				if k == 'countries':
					output[0] = v
				elif type(v) == type({}): 
					extractCountry(output, v)
		output = [{}] 
		extractCountry(output, data)
		hmp = output[0]
		hmp['Total'] = hmp['']
		del hmp['']
		
		df = pd.DataFrame.from_dict(hmp).T
		df.index.name='ID'
		df['ID'] = df.index
		arr = df.to_numpy()

	command = []
	currTime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") 
	for name,iso_code,cases,recovered,deaths,data_updated,last_bot_check,state_province,id in arr:
		command.append(f"insert into covid values('{id}', '{name}','{iso_code}',{cases},{recovered},{deaths},'{data_updated}','{last_bot_check}','{state_province}', '{currTime}' )")
		
	conn = pymssql.connect(server, user, password, db)
	cursor = conn.cursor()
	cnt = 0
	for c in command:
		cnt += 1 
	#     if cnt %10 == 0: 
	#         print(cnt)
		cursor.execute(c)

	conn.commit()
	conn.close()


brk = 0

while brk == 0: #get the file from the website and check if there's a change compared with the previous file, if there is a difference, import the file to the db and move the file from temp folder to the data folder
	currTime = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
	currFile = "/home/pi/Share/projects/covid/data/temp/coronavirus.json." + currTime
	command = ("wget https://media-cdn.factba.se/rss/json/coronavirus.json -P /home/pi/Share/projects/covid/data/temp/;"
			   "mv /home/pi/Share/projects/covid/data/temp/coronavirus.json " + currFile + " ;"
			  )
	# print(command)
	getFile = os.popen(command).read()
	command = "ls -ar  /home/pi/Share/projects/covid/data/ | grep corona |  head -n 1" 
	# print(command)
	last_file = os.popen(command).read()
	command = "diff /home/pi/Share/projects/covid/data/" + last_file[:-1] + " " + currFile + " ;"
	#print(command)
	res = os.popen(command).read()
	if res:
		#print(res)
		importToDB(currFile)
		command = "mv " + currFile + " /home/pi/Share/projects/covid/data"
		res = os.popen(command).read()

		
	command = "rm -rf /home/pi/Share/projects/covid/data/temp/*"
	res = os.popen(command).read()
	
	time.sleep(300)
	brk = 0


