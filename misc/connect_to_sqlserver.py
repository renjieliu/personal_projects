import pyodbc 
server = r'renjie.rocks' 
database = 'Test' 
username = 'sa' 
password = 'xxxxxxxx' 
connection = pyodbc.connect(r'DRIVER={ODBC Driver 11 for SQL Server};'
						r'SERVER=LRJTHINKPAD-PC\SQLEXPRESS;'
						r'DATABASE=POC;'
						#r'Trusted_Connection=yes;'
						r'UID=sa;'
					    r'PWD=xxxxxxxx'						
						)
cursor = connection.cursor()

command =  "select dateadd(Day, 2000, '2013-03-18')"
cursor.execute(command) 
row = cursor.fetchone() 
while row: 
	print(f"Result: {row[0]}")
	# if(row[0]>=3.14):
		# print(f"Yes, it's greater than 3.14, the number is {row[0]}")
	# else:
		# print(f"No, it's not greater than 3.14, the number is {row[0]}")

	row = cursor.fetchone()



