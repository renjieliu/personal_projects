import pypyodbc

connection = pypyodbc.connect("Driver={SQL Server Native Client 11.0};"
                      "Server=NYVM0444;"
                      "Database=ARTDEV;"
                      "Trusted_Connection=yes;")


cursor = connection.cursor()
cursor.execute('EXEC sp_helptext \'usp_2IncrementalLoad_WC_UMOJA_EMP_POS_INC_CONSOLIDATED\'; ')

output = ''

for row in cursor:
	output += row[0]

print(output)



