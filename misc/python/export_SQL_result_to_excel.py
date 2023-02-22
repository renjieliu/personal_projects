'''
Read all the SQL files within the folder
Execute them against the database 
Save the result into one Excel
'''

import pandas as pd
import pyodbc
import os
import warnings

warnings.filterwarnings('ignore') # do not show Python package internal warnings


server = 'server, port'
db = 'dbName'
username = 'usr'
password = 'pwd'
scriptsFolder = r'path_to_sql_folder'
outputExcel = r'path_to_output_excel_file'

#cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={db};Trusted_Connection=yes;')
cnxn = pyodbc.connect(f'Driver=SQL Server;Server={server};Database={db}; UID={username};PWD={password}')

allFiles = os.listdir(scriptsFolder)
#print(arr)
sheet_cnt = 0
writer = pd.ExcelWriter(outputExcel, mode='a', if_sheet_exists = 'replace')

for file in allFiles:
    realPath = scriptsFolder + '/' + file
    if realPath[-4:].upper() == '.SQL': # only take the SQL file
        sheet_cnt += 1
        print(f'Working on {sheet_cnt} of total {len(allFiles)} files: ' + file)
        
        with open(realPath, 'r') as f:
            sql = "" # otherwise, pd.read_sql will return the first sql result. It returns None for the ones creating temp table or the ones with "Warning: Null value is eliminated by an aggregate or other SET operation."
            for _ in f.readlines():
                sql += _ 
        
        cursor = cnxn.cursor()
        cursor.execute(sql)
        while cursor.nextset(): #only get the last result sets from the query
            df = pd.DataFrame.from_records(cursor.fetchall(),
                               columns = [desc[0] for desc in cursor.description])
        df.to_excel(writer, sheet_name=f'Sheet_{sheet_cnt}', index=False,)
        
        # ws = writer.sheets[f'Sheet_{sheet_cnt}']
        # ws.hide()

writer.save()



