import pandas as pd
import datetime
import pymssql
import sys

server = "server"
user = "user"
password = "password"
db = "db"

if len(sys.argv) == 1:
	print('Script usage: script.py csv_file_location.csv [visit_location(T430, UN_Laptop, Others)]')

else:
	input_csv = sys.argv[1]
	if len(sys.argv) < 3:
		visit_location = 'T430'
	else:
		if 'UN' in sys.argv[2]:
			visit_location = 'UN_Laptop'
		elif 'T430' in sys.argv[2]:
			visit_location = 'T430'
		else:
			visit_location = 'Other' 


	conn = pymssql.connect(server, user, password, db)
	cursor = conn.cursor()


	df = pd.read_csv(input_csv)

	df = df.melt(id_vars = ['Domain'],value_name='seconds', var_name='date' )

	df = df[df['seconds']>0]

	arr = df.to_numpy()

	currTime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")



	currTime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
	pre = "INSERT INTO webTracker VALUES ('"
	command = []
	for domain, date, length in arr: # there's a change the there will be more than 1 columns for same date. named like date.1, date.2. We will only take the date part.
		command.append(pre+ domain + "','"  + date.split('.')[0] + "'," + str(length) + ",'" + visit_location + "','" +  currTime + "')")

	cnt = 0 
	for c in command:
		cnt += 1 
		if cnt %1000 ==0: print(cnt)
		cursor.execute(c)
	# CPU times: user 15.4 s, sys: 23.5 s, total: 38.8 s
	# Wall time: 19min 50s


	conn.commit()


	cursor.execute("SELECT cnt = count(*) FROM webTracker WHERE record_insert_date= %s", currTime)

	for row in cursor:
		print('Inserted %s records' %row[0])

	conn.close()




