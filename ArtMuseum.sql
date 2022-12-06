DROP DATABASE IF EXISTS ART_MUSEUM;
CREATE DATABASE ART_MUSEUM; 
USE ART_MUSEUM;

DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT (
	ID_No					varchar(30),
	Country					varchar(30),
	Epoch					varchar(30) not null,
    Title					varchar(30),
    Descrip					varchar(30),
	primary key (ID_No)
);

DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE ( 
	ID_No					varchar(30),
	Height					varchar(30), 
    Material				varchar(30),
    Style					varchar(30),
    Weight					varchar(30), 
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );
    
    DROP TABLE IF EXISTS STATUE;
    CREATE TABLE STATUE (
    ID_No					varchar(30), 
    Height					varchar(30), 
    Material				varchar(30),
    Style					varchar(30),
    Weight					varchar(30), 
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );
    
    
    DROP TABLE IF EXISTS PAINTING;
    CREATE TABLE PAINTING (
    ID_No					varchar(30),
    Ptype					varchar(30),
    Material				varchar(30), 
	Style					varchar(30),
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );
    
    DROP TABLE IF EXISTS OTHER;
    CREATE TABLE OTHER (
    ID_No					varchar(30),
    Otype					varchar(30),
    Ostyle					varchar(30),
    FOREIGN KEY (ID_No) REFERENCES ART_OBJECT (ID_No)
    );
    
    DROP TABLE IF EXISTS ARTIST;
    CREATE TABLE ARTIST (
    Aname					varchar(30),
    Date_died				varchar(30),
    Date_born				varchar(30),
    A_des					varchar(30),
    Epoch					varchar(30),
    Main_style				varchar(30),
    CountOfOrigin			varchar(30),
    primary key (Aname)
    );
    
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