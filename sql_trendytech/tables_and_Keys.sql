CREATE DATABASE SAMPLE;

#Rename DATABASE SAMPLE TO DB- 
## working with tables & keys

USE sample;

CREATE TABLE tblGender
(
ID INT NOT NULL PRIMARY KEY,   # A table can have 1 primary key only
GENDER NVARCHAR(50) NOT NULL
)

INSERT INTO tblGender(ID,GENDER) VALUES (1,"MALE");
INSERT INTO tblGender(ID,GENDER) VALUES (2,"FEMALE");
INSERT INTO tblGender(ID,GENDER) VALUES (3,"UNKNOWN");

SELECT * FROM tblGender;
select * from tblPerson; # tblperson table created Graphically 

INSERT INTO tblPerson(ID,NAME,EMAIL,GENDERID) VALUES (1,"James","j@gmail.com",2);
INSERT INTO tblPerson(ID,NAME,EMAIL,GENDERID) VALUES (2,"Mike","M@gmail.com",3);
INSERT INTO tblPerson(ID,NAME,EMAIL,GENDERID) VALUES (3,"Martin","martin@mail.com",1);
INSERT INTO tblPerson(ID,NAME,EMAIL,GENDERID) VALUES (4,"ROB","r@mail.com",NULL);
INSERT INTO tblPerson(ID,NAME,EMAIL,GENDERID) VALUES (5,"MaC","maC@mail.com",2);
INSERT INTO tblPerson(ID,NAME,EMAIL,GENDERID) VALUES (6,"JACK","Jack@mail.com",NULL);
INSERT INTO tblPerson(ID,NAME,EMAIL) VALUES (007,"RAYA","R@s.com");

## creating foreign key constraint
## what is foreign key? It's a field in one table ; 
                        # that refers to the PRIMARY KEY of another table
                        
ALTER TABLE tblPerson ADD CONSTRAINT tblPerson_GenderID_FK
FOREIGN KEY(GenderID) REFERENCES tblGender(ID);				

