show databases;

use customer;
## decimal values
CREATE TABLE big_data_course(
course_id INT NOT NULL,
course_name varchar(30) NOT NULL,
course_duration_months decimal(3,1) NOT NULL,
course_fee INT NOT NULL,
PRIMARY KEY(course_id)
);

insert into big_data_course values(1,'Sql',2.5,2000);
insert into big_data_course values(2,'Data Structures',3.5,5000);
insert into big_data_course values(3,'Power BI',3.0,1500);

update big_data_course set course_fee = 2100 where course_id = 1;

select * from big_data_course;
desc big_data_course;


update big_data_course set course_fee = 3000 where course_id = 3;


### Timestamp 

CREATE TABLE trendytech(
course_id INT NOT NULL,
course_name VARCHAR(30) NOT NULL,
course_duration_months DECIMAL(3,1) NOT NULL,
course_fee INT NOT NULL,
changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (course_id)
);
# WE CAN USE "CURRENT_TIMESTAMP()" insetad of NOW()
# UPDATE NOW() --> WILL SHOW THE TIMESTAMP IF YOU UPDATE ANY COLUMN VALUE AFTER INSERTING

# here we have to mention the column names because "changed_at" column is for timestamp,
# so we don't have to add value in it.
#that's why it will through error if we don't mention the columns
INSERT INTO trendytech(course_id,course_name,course_duration_months,course_fee) VALUES (10,"HADOOP",1,1500);
INSERT INTO trendytech(course_id,course_name,course_duration_months,course_fee) VALUES (20,"AIRFLOW",1.5,6500);
INSERT INTO trendytech(course_id,course_name,course_duration_months,course_fee) VALUES (13,"AZURE CLOUD",2.5,5500);
INSERT INTO trendytech(course_id,course_name,course_duration_months,course_fee) VALUES (18,"AZURE synapse",1.5,5900);
INSERT INTO trendytech(course_id,course_name,course_duration_months,course_fee) VALUES (1,'APACHE SPARK', 5,10000);
INSERT INTO trendytech(course_id,course_name,course_duration_months,course_fee) VALUES (3,'SQL', 1,1000);
INSERT INTO trendytech(course_id,course_name,course_duration_months,course_fee) VALUES (2,'python', 2,2000);
SELECT * FROM trendytech;

drop table trendytech;
UPDATE trendytech SET course_fee = 2000 WHERE course_id = 10;