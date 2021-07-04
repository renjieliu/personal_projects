# The script is to list all the files inside a folder on a host, along with the files within the subfolder
from datetime import datetime
import os

hostname = "T430"
path = 'D:\\My Files'
output_file = f"D:\\files.txt"
curr_time = datetime.now()
output = []


def listAllFiles(output,hostname, path, curr_time):
    arr = os.listdir(path)
    for a in arr:
        realPath = path + '/' + a
        if os.path.isdir(realPath):
            output.append(f'{hostname}`{path}/{a}`{curr_time}')
            listAllFiles(output, hostname, realPath, curr_time)
        else:
            output.append(f'{hostname}`{path}/{a}`{curr_time}')

listAllFiles(output, hostname, path, curr_time)


# output the result to a file
with open(output_file, 'w', encoding='utf-8') as file:
    for o in output:
        s = (o+"\n").replace("\\","\\\\")
        file.write(s)

		
		