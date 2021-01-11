import pypyodbc

connection = pypyodbc.connect("Driver={SQL Server Native Client 11.0};"
                      "Server=NYVM0432;"
                      "Database=Oracle_BI_DW;"
                      "Trusted_Connection=yes;")


cursor = connection.cursor()
cursor.execute('EXEC sp_helptext \'FullLoad_WC_ORG_REPORTING_DH_Real_20181221\'; ')

output = ''

for row in cursor:
	output += row[0]

print(output)







