# update the file name with a file mapping.

import os

path = r"\\path\\to\\folder\\"
os.chdir(path)
print(os.getcwd())

lkp = {"src.ext":"tgt.ext"} #hashmap for source name and target name

for k, v in lkp.items():
    print(k, v)
    #print(os.getcwd())
    os.rename(k,v)
   

