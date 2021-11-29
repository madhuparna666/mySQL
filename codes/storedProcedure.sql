

create database film;
use film;

CREATE TABLE Movie(
     Film_Name VARCHAR(100),
     Film_ReleaseDate date,
     Film_RunTime_min int);
     
INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Welcome", '2021-09-11 01:18:39', "123"); 

INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Barfi", "2020-02-11 04:18:39", "167");

INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Squid Game", '2021-11-30',"189");


select * from Movie;    


# stored Procedure creation
/* USE: Instead of using same code again and again; we can create stored proc to save time */

delimiter //
CREATE PROCEDURE Movie_detail ()
BEGIN
	SELECT Film_Name
		  ,Film_ReleaseDate
		  ,Film_RunTime_min
	FROM Movie

	ORDER BY Film_Name ASC;
    
END // 
