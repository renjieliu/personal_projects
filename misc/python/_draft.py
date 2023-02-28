import pandas as pd
import pyodbc
import os
import warnings
import pymssql
import openpyxl
import matplotlib.pyplot as plt
import time


warnings.filterwarnings('ignore') # do not show Python package internal warnings

server = 'server:port'
db = 'dbName'
username = 'usr'
pwd = 'pwd'
scriptsFolder = r'path_to_sql_folder'
outputExcel = r'path_to_output_excel_file'


#cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={db};Trusted_Connection=yes;')
# xxx = pymssql.connect(host=server, database=db, user=username, password=pwd)



print(pymssql.__file__)
print(pd.__file__)

print(pymssql.__version__)



