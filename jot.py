import os
import dotenv 
import pymssql

dotenv.load_dotenv(".env")

MSSQL_DB_SERVER = os.getenv('MSSQL_DB_SERVER')
MSSQL_DB = os.getenv('MSSQL_DB')
MSSQL_DB_USER = os.getenv('MSSQL_DB_USER')
MSSQL_DB_PWD = os.getenv('MSSQL_DB_PWD')
MSSQL_DB = os.getenv('MSSQL_DB')


def exec_sql(MSSQL_DB_SERVER, MSSQL_DB_USER, MSSQL_DB_PWD, SQL_Command, mode): 
    with pymssql.connect(server=MSSQL_DB_SERVER, database=MSSQL_DB, user=MSSQL_DB_USER,password=MSSQL_DB_PWD) as connection:
        with connection.cursor() as cursor:
            cursor.execute(SQL_Command)
            if mode == 1:
                print(cursor.fetchall())
            else:
                print(f'{sql} runs successfully!')
                connection.commit()
            

sql = 'select * from stock_20220112'

mode = 1 # mode 1 --> select , 2 --> update, delete, insert
exec_sql(MSSQL_DB_SERVER, MSSQL_DB_USER, MSSQL_DB_PWD, sql, mode)





# # This is a package in preview.
# from azureml.opendatasets import NycTlcYellow

# from datetime import datetime
# from dateutil import parser


# end_date = parser.parse('2018-05-06')
# start_date = parser.parse('2018-05-01')
# nyc_tlc = NycTlcYellow(start_date=start_date, end_date=end_date)
# nyc_tlc_df = nyc_tlc.to_pandas_dataframe()

# nyc_tlc_df.info()


 