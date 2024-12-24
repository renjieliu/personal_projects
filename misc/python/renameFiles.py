import os

path = r"C:\Users\liurenjie\Desktop\Assets\\"

for f in os.listdir(path):
    file = path +f
    rename_into = file+".jpg"
    os.rename(file, rename_into)



