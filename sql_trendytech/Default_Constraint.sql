use sample;

# altering an existing column to add a default constraint

-- for MS SQL server
-- ALTER TABLE tblPerson
-- ADD CONSTRAINT DF_tblPerson_GenderID
-- DEFAULT 3 FOR GenderID ;

-- For MySQL
ALTER TABLE tblPerson
ALTER GenderID SET DEFAULT 3;

INSERT INTO tblPerson(ID,NAME,EMAIL) VALUES (010,"RAjA","Raja@.com");
INSERT INTO tblPerson(ID,NAME,EMAIL) VALUES (009,"RAkA","Raka@.com");
select * from tblPerson;