import os; 

def readFileContents(output, path):
	
	if path[-25:] != "System Volume Information": # do not read the system folder
		arr = os.listdir(path)
		for a in arr:
			realPath = path + '/' + a
			if os.path.isdir(realPath):
				readFileContents(output, realPath)
			elif realPath[-4:].upper() == '.SQL': # only take the SQL file
				with open(realPath, 'r') as f:
					output[0] += ('-----' + realPath + '\r\n')
					for _ in f.readlines():
						output[0] += _
				output[0] += '\r\n GO \r\n\r\n\r\n' # adding go to the end of each file
				



paths = [r"."]
output = [""]


combinedOutput = paths[0] + r"./combined.SQL"

if os.path.exists(combinedOutput):
	os.remove(combinedOutput)

for p in paths:
	readFileContents(output, p)

with open(combinedOutput, 'w') as f:
	f.write(output[0])



