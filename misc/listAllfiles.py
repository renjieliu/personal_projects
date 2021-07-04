from datetime import datetime
import os

def listAllFiles(output,hostname, path, curr_time, output_file):
    arr = os.listdir(path)
    for a in arr:
        realPath = path + '/' + a
        if os.path.isdir(realPath):
            listAllFiles(output, hostname, realPath, curr_time,output_file)
        else:
            output.append(f'{hostname}`{path}/{a}`{curr_time}')

	with open(output_file, 'w', encoding='utf-8') as file:
		for o in output:
			s = (o+"\n").replace("\\","\\\\")
			file.write(s)
		
		
hostname = "T430"
path = 'D:\\My Files'
output_file = f"D:\\files.txt"
curr_time = datetime.now()
output = []

listAllFiles(output, hostname, path, curr_time)

