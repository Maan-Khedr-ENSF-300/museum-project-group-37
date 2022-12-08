import mysql.connector

def format(cur):
    col_names=cur.column_names
    search_result=cur.fetchall()
    print("Search found ",len(search_result)," Entries:\n")
    header_size=len(col_names)
    for i in range(header_size):
        print("{:<30s}".format(col_names[i]),end='')
    print()
    print(30*header_size*'-')
    for row in search_result:
        for val in row:
            print("{:<30s}".format(str(val)),end='')
        print()


def insert_sculpture(cur,cnx):
    id_numbersc = input("Please enter the id number of the sculpture: ") or None
    delete_sculpture_id = "delete from sculpture where ID_No = %s"
    val = (id_numbersc,)
    cur.execute(delete_sculpture_id, val)
    height_sc = input("Enter the height of the sculpture (press enter and leave blank if unknown): ") or None
    material_sc = input("Enter the material of the sculpture (press enter and leave blank if unknown): ") or None
    style_sc = input("Enter the style of the sculpture (press enter and leave blank if unknown): ") or None
    weight_sc = input("Enter the weight of the sculpture (press enter and leave blank if unknown): ") or None
    insert_sculpture = ("insert into sculpture "
                        "values (%s,%s,%s,%s,%s)")
    sculpture_data = (id_numbersc,height_sc,material_sc,style_sc,weight_sc)
    cur.execute(insert_sculpture,sculpture_data)
    cnx.commit()
    instr = "select * from sculpture"
    cur.execute(instr)
    format(cur)
    startup()
    while id_numbersc == None:
        print("Your sculpture needs an id number!")
        id_numbersc = input("Please enter the id number of the sculpture: ") or None
        if id_numbersc == None:
            continue
        else:
            delete_sculpture_id = "delete from sculpture where ID_No = %s"
            val = (id_numbersc,)
            cur.execute(delete_sculpture_id, val)
            height_sc = input("Enter the height of the sculpture (press enter and leave blank if unknown): ") or None
            material_sc = input("Enter the material of the sculpture (press enter and leave blank if unknown): ") or None
            style_sc = input("Enter the style of the sculpture (press enter and leave blank if unknown): ") or None
            insert_sculpture = ("insert into sculpture "
                                "values (%s,%s,%s,%s)")
            sculpture_data = (id_numbersc,height_sc,material_sc,style_sc)
            cur.execute(insert_sculpture,sculpture_data)
            cnx.commit()
            instr = "select * from sculpture"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()
        

def insert_statue(cur,cnx):
    id_numberst = input("Please enter the id number of the statue: ") or None
    delete_statue_id = "delete from statue where ID_No = %s"
    val = (id_numberst,)
    cur.execute(delete_statue_id, val)
    height_st = input("Enter the height of the statue (press enter and leave blank if unknown): ") or None
    material_st = input("Enter the material of the statue (press enter and leave blank if unknown): ") or None
    style_st = input("Enter the style of the statue (press enter and leave blank if unknown): ") or None
    insert_statue = ("insert into statue "
                        "values (%s,%s,%s,%s)")
    statue_data = (id_numberst,height_st,material_st,style_st)
    cur.execute(insert_statue,statue_data)
    cnx.commit()
    instr = "select * from statue"
    cur.execute(instr)
    format(cur)
    startup()
    while id_numberst == None:
        print("Your statue needs an id number!")
        id_numberst = input("Please enter the id number of the statue: ") or None
        if id_numberst == None:
            continue
        else:
            delete_statue_id = "delete from statue where ID_No = %s"
            val = (id_numberst,)
            cur.execute(delete_statue_id, val)
            height_st = input("Enter the height of the statue (press enter and leave blank if unknown): ") or None
            material_st = input("Enter the material of the statue (press enter and leave blank if unknown): ") or None
            style_st = input("Enter the style of the statue (press enter and leave blank if unknown): ") or None
            insert_statue = ("insert into statue "
                                "values (%s,%s,%s,%s)")
            statue_data = (id_numberst,height_st,material_st,style_st)
            cur.execute(insert_statue,statue_data)
            cnx.commit()
            instr = "select * from statue"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()


def insert_painting(cur,cnx):
    id_numberp = input("Please enter the id number of the painting: ") or None
    delete_painting_id = "delete from painting where ID_No = %s"
    val = (id_numberp,)
    cur.execute(delete_painting_id, val)
    type_p = input("Enter the paint type of the painting (press enter and leave blank if unknown): ") or None
    material_p = input("Enter the material of the painting (press enter and leave blank if unknown): ") or None
    style_p = input("Enter the style of the painting (press enter and leave blank if unknown): ") or None
    insert_painting = ("insert into painting "
                        "values (%s,%s,%s,%s)")
    painting_data = (id_numberp,type_p,material_p,style_p)
    cur.execute(insert_painting,painting_data)
    cnx.commit()
    instr = "select * from painting"
    cur.execute(instr)
    format(cur)
    startup()
    while id_numberp == None:
        print("Your painting needs an id number!")
        id_numberp = input("Please enter the id number of the painting: ") or None
        if id_numberp == None:
            continue
        else:
            delete_painting_id = "delete from painting where ID_No = %s"
            val = (id_numberp,)
            cur.execute(delete_painting_id, val) 
            type_p = input("Enter the paint type of the painting (press enter and leave blank if unknown): ") or None
            material_p = input("Enter the material of the painting (press enter and leave blank if unknown): ") or None
            style_p = input("Enter the style of the painting (press enter and leave blank if unknown): ") or None
            insert_painting = ("insert into painting "
                                "values (%s,%s,%s,%s)")
            painting_data = (id_numberp,type_p,material_p,style_p)
            cur.execute(insert_painting,painting_data)
            cnx.commit()
            instr = "select * from painting"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()

def insert_other(cur,cnx):
    id_numbero = input("Please enter the id number of other: ") or None
    delete_other_id = "delete from other where ID_No = %s"
    val = (id_numbero,)
    cur.execute(delete_other_id, val)
    type_o = input("Enter the type of the piece (press enter and leave blank if unknown): ") or None
    style_o = input("Enter the style of the piece (press enter and leave blank if unknown): ") or None
    insert_other = ("insert into other "
                        "values (%s,%s,%s)")
    other_data = (id_numbero,type_o,style_o)
    cur.execute(insert_other,other_data)
    cnx.commit()
    instr = "select * from other"
    cur.execute(instr)
    format(cur)
    startup()
    while id_numbero == None:
        print("Your piece needs an id number!")
        id_numbero = input("Please enter the id number of the piece: ") or None
        if id_numbero == None:
            continue
        else:
            delete_other_id = "delete from other where ID_No = %s"
            val = (id_numbero,)
            cur.execute(delete_other_id, val)
            type_o = input("Enter the type of the piece (press enter and leave blank if unknown): ") or None
            style_o = input("Enter the style of the piece (press enter and leave blank if unknown): ") or None
            insert_other = ("insert into other "
                                "values (%s,%s,%s)")
            other_data = (id_numbero,type_o,style_o)
            cur.execute(insert_other,other_data)
            cnx.commit()
            instr = "select * from other"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()



def insert_artist(cur,cnx):
    artist_name = input("Please enter the name of the artist: ") or None
    delete_artist_name = "delete from artist where Aname = %s"
    val = (artist_name,)
    cur.execute(delete_artist_name, val)
    date_d = input("Enter the date the artist died (press enter and leave blank if unknown): ") or None
    date_b = input("Enter the date the artist was born (press enter and leave blank if unknown): ") or None
    des_a = input("Enter a short description of the artist (press enter and leave blank if unknown): ") or None
    e_poch = input("Enter the era of the artist (press enter and leave blank if unknown): ") or None
    style_m = input("Enter the main style of the artist (press enter and leave blank if unknown): ") or None
    origin_c = input("Enter the country of origin of the artist (press enter and leave blank if unknown): ") or None
    insert_artist = ("insert into artist "
                        "values (%s,%s,%s,%s,%s,%s,%s)")
    artist_data = (artist_name,date_d,date_b,des_a,e_poch,style_m,origin_c)
    cur.execute(insert_artist,artist_data)
    cnx.commit()
    instr = "select * from artist"
    cur.execute(instr)
    format(cur)
    startup()
    while artist_name == None:
        print("Your artist needs a name!")
        artist_name = input("Please enter the name of the artist: ") or None
        if artist_name == None:
            continue
        else:
            delete_artist_name = "delete from artist where Aname = %s"
            val = (artist_name,)
            cur.execute(delete_artist_name, val)
            date_d = input("Enter the date the artist died (press enter and leave blank if unknown): ") or None
            date_b = input("Enter the date the artist was born (press enter and leave blank if unknown): ") or None
            des_a = input("Enter a short description of the artist (press enter and leave blank if unknown): ") or None
            e_poch = input("Enter the era of the artist (press enter and leave blank if unknown): ") or None
            style_m = input("Enter the main style of the artist (press enter and leave blank if unknown): ") or None
            origin_c = input("Enter the country of origin of the artist (press enter and leave blank if unknown): ") or None
            insert_artist = ("insert into artist "
                                "values (%s,%s,%s,%s,%s,%s,%s)")
            artist_data = (artist_name,date_d,date_b,des_a,e_poch,style_m,origin_c)
            cur.execute(insert_artist,artist_data)
            cnx.commit()
            instr = "select * from artist"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()


def insert_collections(cur,cnx):
    c_name = input("Please enter the name of the collection: ") or None
    delete_c_name = "delete from collections where Cname = %s"
    val = (c_name,)
    cur.execute(delete_c_name, val)
    des_c = input("Enter a short description of the collection (press enter and leave blank if unknown): ") or None
    contact_p = input("Enter the contact person of the collection (press enter and leave blank if unknown): ") or None
    type_c = input("Enter the collection type (press enter and leave blank if unknown): ") or None
    phone_c = input("Enter the contact phone number (press enter and leave blank if unknown): ") or None
    address_c = input("Enter the collection address (press enter and leave blank if unknown): ") or None
    insert_collections = ("insert into collections "
                        "values (%s,%s,%s,%s,%s,%s)")
    collections_data = (c_name, des_c, contact_p, type_c, phone_c, address_c)
    cur.execute(insert_collections,collections_data)
    cnx.commit()
    instr = "select * from collections"
    cur.execute(instr)
    format(cur)
    startup()
    while c_name == None:
        print("Your collection needs a name!")
        c_name = input("Please enter the name of the collection: ") or None
        if c_name == None:
            continue
        else:
            delete_c_name = "delete from collections where Cname = %s"
            val = (c_name,)
            cur.execute(delete_c_name, val)
            des_c = input("Enter a short description of the collection (press enter and leave blank if unknown): ") or None
            contact_p = input("Enter the contact person of the collection (press enter and leave blank if unknown): ") or None
            type_c = input("Enter the collection type (press enter and leave blank if unknown): ") or None
            phone_c = input("Enter the contact phone number (press enter and leave blank if unknown): ") or None
            address_c = input("Enter the collection address (press enter and leave blank if unknown): ") or None
            insert_collections = ("insert into collections "
                        "values (%s,%s,%s,%s,%s,%s)")
            collections_data = (c_name, des_c, contact_p, type_c, phone_c, address_c)
            cur.execute(insert_collections,collections_data)
            cnx.commit()
            instr = "select * from collections"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()



def insert_art_object(cur,cnx):
    id_numberao = input("Please enter the id number of the art object: ") or None
    delete_ao_id = "delete from art_object where ID_No = %s"
    val = (id_numberao,)
    cur.execute(delete_ao_id, val)
    country_ao = input("Enter the country of the art object (press enter and leave blank if unknown): ") or None
    epoch_ao = input("Enter the era of the art object(press enter and leave blank if unknown): ") or None
    title_ao = input("Enter the title of the art object (press enter and leave blank if unknown): ") or None
    des_ao = input("Enter a description for the art object(press enter and leave blank if unknown): ") or None
    year_ao = input("Enter the year of the art object (press enter and leave blank if unknown): ") or None
    insert_ao = ("insert into art_object "
                        "values (%s,%s,%s,%s,%s,%s)")
    ao_data = (id_numberao,country_ao, epoch_ao, title_ao, des_ao, year_ao )
    cur.execute(insert_ao,ao_data)
    cnx.commit()
    instr = "select * from art_object"
    cur.execute(instr)
    format(cur)
    startup()
    while id_numberao == None:
        print("Your art object needs an id number!")
        id_numberao = input("Please enter the id number of the art object: ") or None
        if id_numberao == None:
            continue
        else:
            delete_ao_id = "delete from art object where ID_No = %s"
            val = (id_numberao,)
            cur.execute(delete_ao_id, val)
            country_ao = input("Enter the country of the art object (press enter and leave blank if unknown): ") or None
            epoch_ao = input("Enter the era of the art object (press enter and leave blank if unknown): ") or None
            title_ao = input("Enter the title of the art object (press enter and leave blank if unknown): ") or None
            des_ao = input("Enter a description for the art object(press enter and leave blank if unknown): ") or None
            year_ao = input("Enter the year of the art object (press enter and leave blank if unknown): ") or None
            insert_ao = ("insert into art_object "
                                "values (%s,%s,%s,%s)")
            ao_data = (id_numberao,country_ao, epoch_ao, title_ao, des_ao, year_ao ,insert_ao)
            cur.execute(insert_ao,ao_data)
            cnx.commit()
            instr = "select * from art_object"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()

def admin_consol(cur,cnx): 
    print("Which operation would you like to execute?")
    print("1-Insert")
    print("2-Delete")
    print("3-Update")
    print("4-Create Table")
    print("5-Create View")
    print("6-Alter")
    print("7-Query")
    
    selection = input("Please type 1, 2, 3, 4, 5, 6, or 7 to select: ")
    if selection == '1':
        print("Which table would you like to insert your data into?")
        print("1-Art object")
        print("2-Structure")
        print("3-Statue")
        print("4-Painting")
        print("5-Other")
        print("6-Artist")
        print("7-Collection")

        sub_selection = input("Please type 1, 2, 3, 4, 5, 6, or 7 to select: ")
        if sub_selection == '1':
            insert_art_object(cur,cnx)
        elif sub_selection in ['2','3','4','5'] :
            print("Please insert into art object first")
            insert_art_object(cur,cnx)
            if sub_selection == '2':
                insert_sculpture(cur,cnx)
            elif sub_selection == '3':
                insert_statue(cur,cnx)
            elif sub_selection == '4' : 
                insert_painting(cur,cnx)
            elif sub_selection == '5':
                insert_other(cur,cnx) 
        elif sub_selection == '6':
            insert_artist(cur,cnx)
        elif sub_selection == '7':
            insert_collections(cur,cnx)

    

def block_users(cur,cnx):
    print()
    print("List of all current users and their privileges:")
    print()
    instr = "select * from information_schema.USER_PRIVILEGES"
    cur.execute(instr)
    format(cur)
    print()
    username = input("Please enter the username of the user you would like to block or unblock: ")
    print("What would you like to do?")
    print("1- Block user", username)
    print("2- Unblock user", username)
    selection = input("Please enter 1 or 2: ")
    if selection == '1':
        instr = "alter user '%s'@localhost account lock"%(username)
        cur.execute(instr)
        privileges = "flush privileges"
        cur.execute(privileges)
        cnx.commit()
        print("User ", username, "was successfully blocked")
        startup()
    if selection == '2':
        instr = "alter user '%s'@localhost account unlock"%(username)
        cur.execute(instr)
        privileges = "flush privileges"
        cur.execute(privileges)
        cnx.commit()
        print("User", username, "was successfully unblocked")
        startup()


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
    print("3- Block users")
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
    if selection == '2':
        user_edit(cur,cnx)
    if selection == '3':
        block_users(cur, cnx)

def user_edit(cur,cnx):
    print()
    print("List of all current users and their privileges:")
    print()
    instr = "select * from information_schema.USER_PRIVILEGES"
    cur.execute(instr)
    format(cur)
    print()
    print("What would you like to do?")
    print("1- Change a user's username")
    print("2- Change a user's password")
    selection = input("Please enter 1, or 2: ")
    if selection == '1':
        username = input("Please enter the username of the user you would like to edit: ")
        new_username = input("Please enter the new username you would like for this user: ")
        instr = "rename user '%s'@localhost to '%s'@localhost" %(username,new_username)
        cur.execute(instr)
        privileges = "flush privileges"
        cur.execute(privileges)
        cnx.commit()
        print("The username was updated successfully!")
        startup()
    elif selection == '2':
        username = input("Please enter the username of the user you would like to edit: ")
        new_password = input("Please enter the new password you would like for this user: ")
        passwordconfirm = input("Please re-enter the password to confirm: ")  
        if new_password == passwordconfirm:
            instr = "alter user '%s'@localhost identified by '%s'" %(username,passwordconfirm)
            cur.execute(instr)
            privileges = "flush privileges"
            cur.execute(privileges)
            cnx.commit()
            print("The password was changed successfully!")
            startup()
        else: 
            print()
            print("The passwords do not match ... ")
            startup()
    else: 
        startup()


def guest_view(cur):
    print("What would you like to see:")
    print("1- Art Object Information")
    print("2- Artist Information")
    print("3- Our Collections")
    selection = input()

    if selection == '1':
        print("Which type of art object would you like to see information for?")
        print("1- Sculptures")
        print("2- Statues")
        print("3- Paintings")
        print("4- Other")
        subselection = input('Please type 1, 2, 3 or 4:')
        if subselection == '1':
            join = "from sculpture natural join art_object"
            cur.execute(join)
            instr = "select * from art_object"
            cur.execute(instr)
            format(cur)
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
    if selection == '3':
        username="guest"
        passcode=None
    if selection == '4':
        quit()
  
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

