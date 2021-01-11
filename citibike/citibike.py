import os

path = r"/mnt/sandisk/citibike/raw/"

for f in os.listdir(path):
	file = path +f
	#command = 'unzip ' + file +  ' -d /mnt/sandisk/citibike/data'
	#print(command)
	command = 'tail -n +2 ' + file + ' >> /mnt/sandisk/citibike/data/combined.csv'
	print(command)
	os.system(command)
	


