import mysql.connector

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


def user_management(cur,cnx):
    user_choice = input("Would you like to print all current users? (Y or N) ")
    if user_choice == 'Y':
        pass
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
        pass
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


