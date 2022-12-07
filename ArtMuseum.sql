DROP DATABASE IF EXISTS ART_MUSEUM;
CREATE DATABASE ART_MUSEUM; 
USE ART_MUSEUM;

DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT (
	ID_No					varchar(30),
	Country					varchar(30),
	Epoch					varchar(30) not null,
    Title					varchar(60),
    Descrip					varchar(60),
    Year1                   varchar(30),
	primary key (ID_No)
);

    INSERT INTO ART_OBJECT (ID_No, Country, Epoch, Title, Descrip, Year1)
    VALUES
    ('015','Italy','Middle ages','Field Armour of King Henry VIII of England', 'armour worn by King Henry VIII', '1544'),
    ('016','Italy','Middle ages','Cup and cover', 'Rock crystal and gilded silver cup', '1511'),
    ('017','Spain','Victorian','The Absinthe glass', 'Painted bronze Absinthe spoon', '1914'),
    ('018','France','Middle ages','The sea-dog table','Wallnut wood gilded silver table', '1575'),
    ('019','Italy','Middle ages','Angel bearing candlestick', 'Bronze angel statue', '1524'),
    ('020','England','Middle ages','Unidentified saint', 'Stone saint statue', '1505'),
    ('021','France','Middle ages','John the Evangelist', 'Stone statue', '1505'),
    ('022','Britian','Renaissance','Armor garniture of george clifford', 'armor worn by geroge clifford', '1586'),
    ('023','Spain','Modern art','Violen and engraving','Abstract modern day art', '1913'),
    ('024','Spain','Edwardian','Still life : The table', 'cut and pasted printed wall papers', '1914'),
    ('025','Netherlands','Jacobian era','Trompe l’Oeil Still life with flower garland and curtain', 'still life flower painting', '1658'),
    ('026','Spain','Jacobian era','still life with four bunches of grapes', 'oil painted grapes', '1636'),
    ('027','Unites states','Victorian', 'Reconstructed jug', 'Alkaline glazed stone ware jug', '1840'),
    ('028','Germany','Middle ages', 'Basin', 'Gilded silver basin', '1535');


DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE ( 
	ID_No					varchar(30),
	Height					varchar(30), 
    Material				varchar(30),
    Style					varchar(30),
    Weight					varchar(30), 
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );

    INSERT INTO SCULPTURE (ID_No, Height, Material, Style)
    VALUES
    ('015','73 inch','gold','italian'),
    ('016','13 inch','crystal','lapidary'),
    ('017','21 inch','glass','abstract'),
    ('018','57 inch','wood','furniture');


    DROP TABLE IF EXISTS STATUE;
    CREATE TABLE STATUE (
    ID_No					varchar(30), 
    Height					varchar(30), 
    Material				varchar(30),
    Style					varchar(30),
    Weight					varchar(30), 
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );
    
    INSERT INTO STATUE (ID_No, Height, Material, Style)
    VALUES
    ('019','40 inch','bronze','equestrian'),
    ('020','20 inch','terracotta','hellinistic'),
    ('021','18 inch','terracotta','roman'),
    ('022','70 inch','steel','armor');
    
    DROP TABLE IF EXISTS PAINTING;
    CREATE TABLE PAINTING (
    ID_No					varchar(30),
    Ptype					varchar(30),
    Material				varchar(30), 
	Style					varchar(30),
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );

    INSERT INTO PAINTING (ID_No, Ptype, Material, Style)
    VALUES
    ('023','watercolour','canvas','abstract'),
    ('024','acrylic','wood','abstract'),
    ('025','oil','canvas','still-life'),
    ('026','acrylic','canvas','still-life');
    
    DROP TABLE IF EXISTS OTHER;
    CREATE TABLE OTHER (
    ID_No					varchar(30),
    Otype					varchar(30),
    Ostyle					varchar(30),
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );

    INSERT INTO OTHER (ID_No, Otype, Ostyle)
    VALUES
    ('027','pottery','stoneware'),
    ('028','item','silver');
    
    DROP TABLE IF EXISTS ARTIST;
    CREATE TABLE ARTIST (
    Aname					varchar(30),
    Date_died				varchar(30),
    Date_born				varchar(30),
    A_des					varchar(60),
    Epoch					varchar(30),
    Main_style				varchar(30),
    CountOfOrigin			varchar(30),
    primary key (Aname)
    );
    
    INSERT INTO ARTIST (Aname, Date_died, Date_born, A_des, Epoch, Main_style, CountOfOrigin)
    VALUES
    ('Benedetto da Rovezzano','December 2 1552','May 21 1474','Italian sculptor who mainly worked in Florence', 'Renaissance', ' sculptor', 'Italy'),
    ('Michiel Sittow','October 16 1525','September 3 1469',' Painter from Estonia who did early Netherlandish painting' , 'Victorian', 'painter', 'Estonia'),
    ('Georges Braque','August 31 1963','May 13 1882','20th century French collagist who was important in cubism', 'modern art', 'collagist', 'France'),
    ('Samuel Dirksz van Hoogstraten','October 19 1678','August 2 1627','Dutch painter of the Golden Age', 'Golden Age', 'painter', 'Netherlands');


    DROP TABLE IF EXISTS COLLECTIONS;
    CREATE TABLE COLLECTIONS (
    Cname					varchar(30),
    C_des					varchar(30),
    Contpers				varchar(30),
    Ctype					varchar(30),
    Phone					varchar(30),
    Address					varchar(30),
    primary key (Cname)
    );

    INSERT INTO COLLECTIONS (Cname, C_des, Contpers, Ctype, Phone, Address)
    VALUES
    ('masterpieces of the louvre','Artworks essential to history and the history of art','Alissa Brown','Paintings', '(945)-589-6261', '1798 Chapel Street'),
    ('the art of portraiture','portraiture through the ages with sculptures, paintings, drawings and engravings of emblematic figures','Ashley Carter','paintings, drawings and engravings of emblematic figures', '(751)-431-1244', '292 Lyon Avenue');


DROP ROLE IF EXISTS db_admin@localhost, read_access@localhost;
CREATE ROLE db_admin@localhost, read_access@localhost;
GRANT ALL PRIVILEGES ON OLYMPICARCHERY.* TO db_admin@localhost;
GRANT Select ON OLYMPICARCHERY.* TO read_access@localhost;

DROP USER IF EXISTS administrator@localhost;
DROP USER IF EXISTS guest@localhost;
CREATE USER administrator@localhost IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER guest@localhost;
GRANT db_admin@localhost TO administrator@localhost;
GRANT read_access@localhost TO guest@localhost;
SET DEFAULT ROLE ALL TO administrator@localhost;
SET DEFAULT ROLE ALL TO guest@localhost;

def insert_sculpture(cur,cnx):
    id_numbersc = input("Please enter the id number of the sculpture: ") or None
    delete_sculpture_id = "delete from sculpture where id number = %s"
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
    format(cur)
    while id_numbersc == None:
        print("Your sculpture needs an id number!")
        id_numbersc = input("Please enter the id number of the sculpture: ") or None
        if id_numbersc == None:
            continue
        else:
            delete_sculpture_id = "delete from sculpture where id number = %s"
            val = (id_numbersc,)
            cur.execute(delete_sculpture_id, val)
            height_sc = input("Enter the height of the sculpture (press enter and leave blank if unknown): ") or None
            material_sc input("Enter the material of the sculpture (press enter and leave blank if unknown): ") or None
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
    delete_statue_id = "delete from statue where id number = %s"
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
    while id_numberst == None:
        print("Your statue needs an id number!")
        id_numberst = input("Please enter the id number of the statue: ") or None
        if id_numberst == None:
            continue
        else:
            delete_statue_id = "delete from statue where id number = %s"
            val = (id_numberst,)
            cur.execute(delete_statue_id, val)
            height_st = input("Enter the height of the statue (press enter and leave blank if unknown): ") or None
            material_st input("Enter the material of the statue (press enter and leave blank if unknown): ") or None
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
    delete_painting_id = "delete from painting where id number = %s"
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
    while id_numberp == None:
        print("Your painting needs an id number!")
        id_numberp = input("Please enter the id number of the painting: ") or None
        if id_numberp == None:
            continue
        else:
            delete_painting_id = "delete from painting where id number = %s"
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
    delete_other_id = "delete from other where id number = %s"
    val = (id_numbero,)
    cur.execute(delete_other_id, val)
    type_o = input("Enter the type of the piece (press enter and leave blank if unknown): ") or None
    style_o = input("Enter the style of the piece (press enter and leave blank if unknown): ") or None
    insert_other = ("insert into other "
                        "values (%s,%s,%s)")
    other_data = (id_numbero,type_o,style_o)
    cur.execute(other_painting,other_data)
    cnx.commit()
    instr = "select * from other"
    cur.execute(instr)
    format(cur)
    while id_numbero == None:
        print("Your piece needs an id number!")
        id_numbero = input("Please enter the id number of the piece: ") or None
        if id_numbero == None:
            continue
        else:
            delete_other_id = "delete from other where id number = %s"
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
            cur.execute(insert_arist,artist_data)
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



def insert_art_project(cur,cnx):
    id_numberap = input("Please enter the id number of the art project: ") or None
    delete_ap_id = "delete from art_projec where id number = %s"
    val = (id_numberap,)
    cur.execute(delete_ap_id, val)
    country_ap = input("Enter the country of the art project (press enter and leave blank if unknown): ") or None
    epoch_ap = input("Enter the era of the art project (press enter and leave blank if unknown): ") or None
    title_ap = input("Enter the title of the art project (press enter and leave blank if unknown): ") or None
    des_ap = input("Enter a description for the art project(press enter and leave blank if unknown): ") or None
    year_ap = input("Enter the year of the art project (press enter and leave blank if unknown): ") or None
    insert_ap = ("insert into art_project "
                        "values (%s,%s,%s,%s,%s,%s)")
    ap_data = (id_numberap,country_ap, epoch_ap, title_ap, des_ap, year_ap ,insert_ap)
    cur.execute(insert_ap,ap_data)
    cnx.commit()
    instr = "select * from art_project"
    cur.execute(instr)
    format(cur)
    while id_numberap == None:
        print("Your art project needs an id number!")
        id_numberap = input("Please enter the id number of the painting: ") or None
        if id_numberap == None:
            continue
        else:
            delete_ap_id = "delete from art_project where id number = %s"
            val = (id_numberap,)
            cur.execute(delete_ap_id, val)
            country_ap = input("Enter the country of the art project (press enter and leave blank if unknown): ") or None
            epoch_ap = input("Enter the era of the art project (press enter and leave blank if unknown): ") or None
            title_ap = input("Enter the title of the art project (press enter and leave blank if unknown): ") or None
            des_ap = input("Enter a description for the art project(press enter and leave blank if unknown): ") or None
            year_ap = input("Enter the year of the art project (press enter and leave blank if unknown): ") or None
            insert_ap = ("insert into art_project "
                                "values (%s,%s,%s,%s)")
            ap_data = (id_numberap,country_ap, epoch_ap, title_ap, des_ap, year_ap ,insert_ap)
            cur.execute(insert_ap,ap_data)
            cnx.commit()
            instr = "select * from art_project"
            cur.execute(instr)
            print("Displaying results...")
            format(cur)
            startup()

            