import os

path = r"C:\Users\Renjie.Liu\Desktop\Wallpapers\\"

for f in os.listdir(path):
    file = path +f
    os.rename(file, file+".jpg")



