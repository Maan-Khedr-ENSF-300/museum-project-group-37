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
    ('015','Italy','Middle ages','Field Armour of King Henry VIII ', 'Armour worn', '1544'),
    ('016','Italy','Middle ages','Cup with cover', 'Rock crystal and gilded silver cup', '1511'),
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
    weight_lbs					varchar(30), 
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );

    INSERT INTO SCULPTURE (ID_No, Height, Material, Style, weight_lbs)
    VALUES
    ('015','73 inch','gold','italian', '94.4'),
    ('016','13 inch','crystal','lapidary', '12.4'),
    ('017','21 inch','glass','abstract', '0.9'),
    ('018','57 inch','wood','furniture', '48.2');


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
    C_des					varchar(200),
    Contpers				varchar(30),
    Ctype					varchar(80),
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
GRANT ALL PRIVILEGES ON ART_MUSEUM.* TO db_admin@localhost;
GRANT Select ON ART_MUSEUM.* TO read_access@localhost;

DROP USER IF EXISTS administrator@localhost;
DROP USER IF EXISTS guest@localhost;
CREATE USER administrator@localhost IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER guest@localhost;
GRANT db_admin@localhost TO administrator@localhost;
GRANT read_access@localhost TO guest@localhost;
SET DEFAULT ROLE ALL TO administrator@localhost;
SET DEFAULT ROLE ALL TO guest@localhost;