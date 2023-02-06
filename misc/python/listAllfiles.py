# The script is to list all the files inside a folder on a host, along with the files within the subfolder
from datetime import datetime
import os

hostname = "T430"
paths = ['D:\\My Files','H:\\']
output_file = f"D:\\files.txt"
curr_time = datetime.now()
output = []


def listAllFiles(output,hostname, path, curr_time):
	
	if path[-25:] != "System Volume Information":
		arr = os.listdir(path)
		for a in arr:
			realPath = path + '/' + a
			output.append(f'"{hostname}","{realPath}","{curr_time}"')
			if os.path.isdir(realPath):
				listAllFiles(output, hostname, realPath, curr_time)

for p in paths:
	listAllFiles(output, hostname, p, curr_time)


# output the result to a file
with open(output_file, 'a', encoding='utf-8') as file:
	for o in output:
		s = (o+"\n").replace("\\","\\\\")
		file.write(s)
