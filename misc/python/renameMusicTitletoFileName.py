#-*-coding:utf-8-*-
import eyed3
import os
import shutil

def rename_music_files(directory):
    arr = os.listdir(directory)
    for i, filename in enumerate(arr):
        path = directory + "\\" + filename
        print('Path', path)
        nameParts = filename.split(".")
        audiofile = eyed3.load(path) # audiofile = eyed3.load(encode().decode('utf-8'))
        if audiofile and audiofile.tag:
            audiofile.tag.title = nameParts[-2] # remove the extension
            audiofile.tag.save(version=eyed3.id3.ID3_DEFAULT_VERSION,encoding='utf-8') 
        else:
            shutil.move(path, r"C:\Users\liurenjie\Desktop\bad")
        
        print(f"Progress: {i+1} of {len(arr)} Completed") # progress

folder = r"path/to/folder"
rename_music_files(folder)



