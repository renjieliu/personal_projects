import os

path = r"C:\Users\liurenjie\Desktop\New folder\\"

for f in os.listdir(path):
    file = path +f
    os.rename(file, file+".jpg")



