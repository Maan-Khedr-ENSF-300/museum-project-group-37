import mysql.connector

def format(cur):
    col_names=cur.column_names
    search_result=cur.fetchall()
    print("Search found ",len(search_result)," Entries:\n")
    header_size=len(col_names)
    for i in range(header_size):
        print("{:<50s}".format(col_names[i]),end='')
    print()
    print(30*header_size*'-')
    for row in search_result:
        for val in row:
            print("{:<50s}".format(str(val)),end='')
        print()

def admin_consol(cur,cnx): 
    print("Which operation would you like to execute?")
    print("1-Insert")
    print("2-Delete")
    print("3-Update")
    print("4-Create Table")
    print("5-Create View")
    print("6-Alter")
    print("7-Query")
    print("8-Manage Users")
    selection = input("Please type 1, 2, 3, 4, 5, 6, 7, or 8 to select: ")
    if selection == '8':
        user_adding(cur,cnx)
    




def user_adding(cur,cnx):
    print()
    print("List of all current users and their privileges:")
    print()
    instr = "select * from information_schema.USER_PRIVILEGES"
    cur.execute(instr)
    format(cur)
    print()
    print("Which operation would you like to execute?")
    print("1- Add a new user")
    print("2- Edit current users")
    print("3- Can block users")
    print("4- Modify users")
    selection = input("Please enter 1,2,3 or 4: ")
    if selection == '1':
        username = input("Please enter the username you would like to add: ") or None
        password = input("Please enter the password you would like to add: ") or None
        dropping_user = "drop user if exists '%s'@localhost" %(username)
        cur.execute(dropping_user,)
        adding_user = "create user '%s'@localhost identified by '%s'"%(username,password)
        cur.execute(adding_user)
        privileges = "grant all privileges on *.* to '%s'@localhost with grant option"%(username)
        cur.execute(privileges)
        flushing = "flush privileges"
        cur.execute(flushing)
        cnx.commit()
        print("The user was added successfully")
        startup()

def user_access(cur):
    print()
    print("List of all current users and their privileges:")
    print()
    instr = "select * from information_schema.USER_PRIVILEGES"
    cur.execute(instr)
    format(cur)
    print()
    pass


def guest_view(cur):
    print("What are you looking for:")
    print("1- Event information")
    print("2- Participant information")
    print("3- Country information")
    selection = input()

    if selection == '2':
        subselection = input('Please type 1 for Athletes or 2 for Coaches:\n')
        if subselection == '1':
            pass
        if subselection == '2':
            pass

def startup():
  
    # Connect to server
    print()
    print("Welcome to the Art Mesuem Database:")
    print("In order to proceed please select your role from the list below:")
    print("1-DB Admin")
    print("2-Data Entry")
    print("3-Browse as guest")
    print("4-Exit application")

    selection = input("Please type 1, 2, 3 or 4 to select: ")

    if selection in ['1','2']:
        username= input("user name: ")
        passcode= input("password: ")
    else:
        username="guest"
        passcode=None
  
    cnx = mysql.connector.connect(
        host="127.0.0.1",
        port=3306,
        user=username,
        password= passcode) 

    # Get a cursor
    cur = cnx.cursor()

    # Execute a query
    cur.execute("use art_museum")


    if selection == '1':
        admin_consol(cur,cnx)
    elif selection == '2':
        pass
    elif selection == '3':
        guest_view(cur)
    else:
        quit


if __name__ == "__main__":
    startup()

def guest_view(cur):
    print("What are you looking for:")
    print("1- Event information")
    print("2- Participant information")
    print("3- Country information")
    selection = input()

