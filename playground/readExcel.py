import pandas as pd
path = "C:\\Users\\renjie.liu\\Desktop\\a\\UNDP_April_2018_2.xlsx"
e = pd.ExcelFile(path)
sh = e.parse('March 2018')
for a in sh[0]:
    print(a)




