CREATE DATABASE IF NOT EXISTS college;

USE college;

CREATE TABLE IF NOT EXISTS student (
   roll_no int primary key ,
   name varchar(50),
   marks int not null,
   grade varchar(1),
   city varchar(60)
);

INSERT INTO student
(roll_no, name, marks, grade, city)
values
(1,"adam",48 , 'E', "karachi"),
(2,"jon", 86, 'A', "punjab"),
(4,"cassey",79, 'B' , "KPK"),
(7,"mena",99, 'A', "karachi");

TRUNCATE table student;

SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks) ASC;


CREATE TABLE payments (
  cust_id INT primary key,
  cust varchar(60) not null,
  mode VARCHAR(60) NOT null,
  city VARCHAR(60)
);

INSERT INTO payments 
(cust_id ,cust , mode ,  city)
VALUES 
(101,"john","NETBANKING","Portland"),
(102,"neon","NETBANKING","karchi"),
(104,"bob","NETBANKING",""),
(106,"bees","NETBANKING","germany"),
(107,"john","Credit card","New York"),
(108,"john","Credit card","USA"),
(109,"john","Credit card","UAE");

-- practice question 
SELECT mode , count(mode)
FROM payments
GROUP BY mode ;

select city , count(roll_no)
from student
WHERE grade = 'A'
GROUP BY city 
HAVING max(marks) > 90
ORDER BY city DESC;

SET SQL_SAFE_UPDATES = 0;

UPDATE student
set grade = 'F'
WHERE roll_no = 1;

DELETE FROM student 
WHERE grade = 'F';

select * FROM student;

-- foreign key
CREATE TABLE dept(
 id int primary key,
 name varchar(50)
);

CREATE TABLE teacher(
 id int primary key, 
 course_name varchar(50),
 dept_id int ,
 foreign key(dept_id) references dept(id)
 ON update cascade
 ON DELETE CASCADE
);

drop table teacher;

INSERT INTO dept
(id, name)
values
(1,"adam"),
(2,"jon"),
(4,"cassey"),
(7,"mena");


INSERT INTO teacher 
(id, course_name,dept_id)
values
(12,"phy:",1),
(24,"math",2),
(47,"scfi",4),
(79,"chem",7);

truncate teacher;

select * from dpt;

update dpt
set id = 101
where id = 1;

ALTER TABLE dept 
CHANGE course_id course_name VARCHAR(20)  ; 

ALTER TABLE dept 
RENAME TO  DPT;

ALTER TABLE dpt
DROP COLUMN course_name;

select * from stu;

ALTER TABLE student 
RENAME TO stu;

ALTER TABLE stu
CHANGE COLUMN name full_name VARCHAR(50);

SET SQL_SAFE_UPDATES= 0;

DELETE from stu 
where marks < 80;

ALTER TABLE stu
DROP COLUMN grade;

-- JOINS --
CREATE DATABASE uni;

use uni;

CREATE TABLE student(
id int unique primary key,
full_name VARCHAR(50)
);

INSERT INTO student 
(id, full_name)
VALUES 
(101,"cassey"),
(102,"john"),
(134,"monee"),
(133,"neen"),
(223,"secot");


CREATE TABLE course(
id int unique primary key,
course VARCHAR(50)
);

INSERT INTO course
(id,course)
VALUES 
(102,"math"),
(101,"cs"),
(133,"eng"),
(333,"chem");


select * from student;
select * from course;

-- inner joins --
SELECT * 
FROM student as s
INNER JOIN course as c 
ON s.id = c.id;

-- outer joins --
SELECT * 
FROM student as s
lEFT JOIN course as c 
ON s.id = c.id
UNION 
SELECT * 
FROM student as s
RIGHT JOIN course as c 
ON s.id = c.id;

-- practice question --
SELECT * 
FROM student as s
RIGHT JOIN course as c 
ON s.id = c.id
WHERE s.id IS NULL;

SELECT * 
FROM student as s
LEFT JOIN course as c 
ON s.id = c.id
WHERE c.id IS NULL;

SELECT * 
FROM student as s
lEFT JOIN course as c 
ON s.id = c.id
WHERE c.id is null
UNION 
SELECT * 
FROM student as s
RIGHT JOIN course as c 
ON s.id = c.id
WHERE s.id is null;