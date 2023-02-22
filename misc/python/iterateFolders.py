import os


def listFiles(path:"string"):
    for f in os.listdir(path):
        if os.path.isdir(path + "\\" + f):
            print(path + "\\" + f)
            listFiles(path + "\\" + f)
        else:
            print(path + "\\" + f )



listFiles(r"\\Unhq.un.org\shared\bi_home\ART\05_Umoja\03 Umoja data warehouse integration\Consolidated Movements for CR and PM")




