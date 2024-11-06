import os
import dotenv 
import pymssql

dotenv.load_dotenv(".env")

MSSQL_DB_SERVER = os.getenv('MSSQL_DB_SERVER')
MSSQL_DB = os.getenv('MSSQL_DB')
MSSQL_DB_USER = os.getenv('MSSQL_DB_USER')
MSSQL_DB_PWD = os.getenv('MSSQL_DB_PWD')
MSSQL_DB = os.getenv('MSSQL_DB')

def exec_sql(MSSQL_DB_SERVER, MSSQL_DB_USER, MSSQL_DB_PWD, sql_to_execute, mode): 
    with pymssql.connect(server=MSSQL_DB_SERVER, database=MSSQL_DB, user=MSSQL_DB_USER,password=MSSQL_DB_PWD) as connection:
        with connection.cursor() as cursor:
            cursor.execute(sql_to_execute)
            if mode == 1:
                print(cursor.fetchall())
            else:
                print(f'SQL: {sql_to_execute} runs successfully!')
                connection.commit()

mode = 1 # mode 1 --> select , 2 --> update, delete, insert
sql_to_execute = 'select name = getdate()'
exec_sql(MSSQL_DB_SERVER, MSSQL_DB_USER, MSSQL_DB_PWD, sql_to_execute, mode)


