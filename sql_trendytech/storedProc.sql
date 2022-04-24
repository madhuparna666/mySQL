

create database film;
use film;

DROP TABLE Movie;

CREATE TABLE Moviee(
     Film_Name VARCHAR(100),
     Film_ReleaseDate date,
     Film_RunTime_min int);
     
INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Welcome", '2021-09-11 01:18:39', "123"); 

INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Barfi", "2020-02-11 04:18:39", "167");

INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Squid Game", '2021-11-30',"189");

INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Squid ame", "2021/12/21","180");



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


use film;
create table tickets (
        ticket_id varchar(100) primary key,
        ticket_for_movie varchar(100));
        
 INSERT INTO tickets (ticket_id,ticket_for_movie) 
 VALUES (1001,"Squid Game");    
 
 INSERT INTO tickets (ticket_id,ticket_for_movie) 
 VALUES (1002,"Barfi"); 
 INSERT INTO tickets (ticket_id,ticket_for_movie) 
 VALUES (1003,"Game");   
 
 INSERT INTO Movie (Film_Name,Film_ReleaseDate,Film_RunTime_min) 
VALUES ("Squid ame", "2021/12/21","180");

        
        select m.Film_ReleaseDate,t.ticket_id,t.ticket_for_movie
        from Movie m 
        
        
        show film;
        
        select * from Movie; 
        select * from tickets;




















