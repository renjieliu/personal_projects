import mysql.connector
import redis

mysql_conn = mysql.connector.connect(
    user='root',
    password='xxxxxxxx',
    host='localhost',
    database='POC')

cur = mysql_conn.cursor()

start = 1
end = 11030431 #this can be changed to the count(*) from the table

page_size = 2000

count = 0
current_row = 0

file = open( "/home/pi/Share/cpu_temp.txt", "a")
while count < end/page_size:

    curr_start = start + count * page_size
    curr_end = start + (count + 1) * page_size if start + (count + 1) * page_size < end else end

    query = ("select * from cpu_temp order by time limit " + str(curr_start) + ", " + str(curr_end))

    cur.execute(query)

    #redis_conn = redis.Redis()

    print "Current Batch", count

    for (time, temp, date) in cur:
        current_row=current_row+1
        file.write(str(time) + "|| " + str(temp)+"\r\n" )
        #redis_conn.set(time, temp)
        if current_row % 1000 == 0:
           print current_row
    count = count + 1

cur.close()
mysql_conn.close()


