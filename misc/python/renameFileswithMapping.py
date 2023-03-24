import os

print(os.getcwd())

path = r"D:\fileLocations\\"
os.chdir(path)

print(os.getcwd())

lkp = {"oldName1": "newName1", "oldName2": "newName2"}

for k, v in lkp.items():
    print(k, v)
    #print(os.getcwd())
    os.rename(k,v)
 