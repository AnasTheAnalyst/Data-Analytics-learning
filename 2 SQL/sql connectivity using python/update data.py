import mysql.connector as c
con=c.connect(host = "localhost",user = "root", passwd = "3323125869",database="sql_iq")
cursor = con.cursor()

cursor.execute("select * from emp")
data = cursor.fetchall()
for i in data:
    print(i)
print("total number of rows=",cursor.rowcount)
