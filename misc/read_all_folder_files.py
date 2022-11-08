import os; 

def readFileContents(output, path):
	
	if path[-25:] != "System Volume Information": # do not read the system folder
		arr = os.listdir(path)
		for a in arr:
			realPath = path + '/' + a
			if os.path.isdir(realPath):
				readFileContents(output, realPath)
			else:
				with open(realPath, 'r') as f:
					for _ in f.readlines():
						output[0] += _



paths = [r"xxx"]
output = [""]


combinedOutput = r"xxxxx"

if os.path.exists(combinedOutput):
	os.remove(combinedOutput)

for p in paths:
	readFileContents(output, p)

with open(combinedOutput, 'w') as f:
	f.write(output[0])

