import mysql.connector as c
con=c.connect(host = "localhost",user = "root", passwd = "3323125869",database="sql_iq")
cursor = con.cursor()
while True:
    code = int(input("enter employee code :"))
    name = input("enter name :")
    salary =int(input("enter salary :"))
    query ="insert into emp values({},'{}',{})".format(code,name,salary);
    cursor.execute(query)
    con.commit()
    print("data inserted succesfully..")
    x=int(input("1->Enter More \n2->Exit\nEnter choice "))
    if x==2:
        break
