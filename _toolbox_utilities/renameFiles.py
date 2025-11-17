import os

path = r"C:\\path\to\the\target_folder\\"
os.chdir(path)
print(os.getcwd())

for f in os.listdir(path):
    s = path + f
    os.rename(s, s+'.png')




