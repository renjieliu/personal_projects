from requests import get

ip = get('https://api.ipify.org').content.decode('utf8')
print('My public IP address is: {}'.format(ip))

i = 1
while i <= 1000000:
    i += 1
    
print(i)





# # import pandas as pd
# # import pyodbc
# # import os
# # import warnings
# # import pymssql
# # import openpyxl
# # import matplotlib.pyplot as plt
# # import time


# # warnings.filterwarnings('ignore') # do not show Python package internal warnings

# # server = 'server:port'
# # db = 'dbName'
# # username = 'usr'
# # pwd = 'pwd'
# # scriptsFolder = r'path_to_sql_folder'
# # outputExcel = r'path_to_output_excel_file'


# # #cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={db};Trusted_Connection=yes;')
# # # xxx = pymssql.connect(host=server, database=db, user=username, password=pwd)



# # print(pymssql.__file__)
# # print(pd.__file__)

# # print(pymssql.__version__)

# import sys


# for i in range(10):  
#     print("Loading" + "." * i) 
#     print("newline, should be covered")
#     sys.stdout.write("\033[F, new line: covering the previous line") # Cursor up one line




