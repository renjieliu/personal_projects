#!/usr/bin/python3

import os
import datetime
import time

brk = 0

while brk == 0:
	currTime = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
	currFile = "/home/pi/Share/projects/covid/temp/coronavirus.json." + currTime
	command = ("wget https://media-cdn.factba.se/rss/json/coronavirus.json -P /home/pi/Share/projects/covid/temp/;"
			   "mv /home/pi/Share/projects/covid/temp/coronavirus.json " + currFile + " ;"
			  )
	# print(command)
	getFile = os.popen(command).read()
	command = "ls -ar  /home/pi/Share/projects/covid/ | grep corona |  head -n 1" 
	# print(command)
	last_file = os.popen(command).read()
	command = "diff /home/pi/Share/projects/covid/" + last_file[:-1] + " " + currFile + " ;"
	#print(command)
	res = os.popen(command).read()
	if res:
		#print(res)
		command = "mv " + currFile + " /home/pi/Share/projects/covid/"
		res = os.popen(command).read()
	command = "rm -rf /home/pi/Share/projects/covid/temp/*"
	res = os.popen(command).read()
	
	time.sleep(60)
	brk = 0


