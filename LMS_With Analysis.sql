

/*creating new database with the name Lib_mngmt_system*/

create database lib_mngmt_system

use lib_mngmt_system


/*Creating new table with name tbl_category consisting of category_id & category_name*/

CREATE TABLE tbl_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50)
);




/*Creating new table with name tbl_publisher consisting of publisher_id, pubisher_name, 
publication_language & publication_type*/

CREATE TABLE tbl_publisher (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(50),
    publication_language VARCHAR(15),
    publication_type VARCHAR(20)
);



/*Creating new table with name tbl_location consisting of location_id, shelf_no, 
shelf_name & floor_no*/

CREATE TABLE tbl_location (
    location_id INT PRIMARY KEY AUTO_INCREMENT,
    shelf_no VARCHAR(10),
    shelf_name VARCHAR(50),
    floor_no INT
);



/*Creating new table with name tbl_author consisting of author_id, first_name & last_name*/

create table tbl_author
(
author_id int primary key AUTO_INCREMENT,
first_name varchar(20),
last_name varchar(20)
);


/*Creating new table with name tbl_book consisting of book_id, isbn_code,book_title,category_id,publisher_id,
publication year, book edition, copies_total, copies_available & location_id*/

create table tbl_book
(
book_id int primary key AUTO_INCREMENT,
isbn_code varchar(15),
book_title varchar(50),
category_id int,
publisher_id int,
publication_year date,
book_edition int,
copies_total int,
copies_available int,
location_id int,

constraint fk_category_id foreign key (category_id) references tbl_category(category_id),
constraint fk_publisher_id foreign key (publisher_id) references tbl_publisher(publisher_id),
constraint fk_location_id foreign key (location_id) references tbl_location(location_id)
);



/*Creating new table with name tbl_book_author consisting of book_id & author_id*/

create table tbl_book_author
(
book_id int,
author_id int,

constraint fk_book_id foreign key (book_id) references tbl_book(book_id),
constraint fk_author_id foreign key (author_id) references tbl_author(author_id)
);


/*Creating new table with name tbl_member_status consisting of active_status_id, account_type,
account_status, membership_start_date & membership_end_date*/

create table tbl_member_status
(
active_status_id int primary key AUTO_INCREMENT,
account_type varchar(20),
account_status varchar(10),
membership_start_date date,
membership_end_date date
);



/*Creating new table with name tbl_member consisting of member_id, first_name, last_name,
city, mobile_no, email_id, date_of_birth & active_status_id*/

create table tbl_member
(
member_id int primary key AUTO_INCREMENT,
first_name varchar(20),
last_name varchar(20),
city varchar(20),
mobile_no varchar(10),
email_id varchar(50),
date_of_birth date,
active_status_id int,

constraint fk_active_status_id foreign key (active_status_id) references tbl_member_status
);


/*Creating new table with name tbl_library_staff consisting of issue_by_id, staff_name & staff_designation*/

CREATE TABLE tbl_library_staff (
    issue_by_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(50),
    staff_designation VARCHAR(20)
);

CREATE TABLE tbl_book_issue (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    issue_date DATE,
    return_date DATE,
    issue_status VARCHAR(20),
    issued_by_id INT,
    
    CONSTRAINT fk_issue_book_id FOREIGN KEY (book_id) REFERENCES tbl_book (book_id),
    CONSTRAINT fk_issue_member_id FOREIGN KEY (member_id) REFERENCES tbl_member (member_id),
    CONSTRAINT fk_issue_issued_by_id FOREIGN KEY (issued_by_id) REFERENCES tbl_library_staff (issue_by_id)
);




/*Creating new table with name tbl_fine_due consisting of fine_id, member_id,
issue_id, fine_date & fine_total*/

CREATE TABLE tbl_fine_due (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    issue_id INT,
    fine_date DATE,
    fine_total INT,
    
    CONSTRAINT fk_member_id FOREIGN KEY (member_id) REFERENCES tbl_member (member_id),
    CONSTRAINT fk_issue_id FOREIGN KEY (issue_id) REFERENCES tbl_book_issue (issue_id)
);


/*Creating new table with name tbl_fine_payment consisting of fine_payment_id, member_id,
payment_date & payment_amount*/

CREATE TABLE tbl_fine_payment (
    fine_payment_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    payment_date DATE,
    payment_amount INT,
    
    CONSTRAINT fk_payment_member_id FOREIGN KEY (member_id) REFERENCES tbl_member (member_id)
);


/*Creating new table with name tbl_book_request_status consisting of available_status_id, available_status
& nearest_available_date*/

create table tbl_book_request_status
(
available_status_id int primary key AUTO_INCREMENT,
available_status varchar(10),
nearest_available_date date
);

/*Creating new table with name tbl_book_request consisting of request_id, book_id, member_id,
request_date & available_status_id*/

CREATE TABLE tbl_book_request (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT,
    member_id INT,
    request_date DATE,
    available_status_id INT,
    CONSTRAINT fk_request_book_id FOREIGN KEY (book_id) REFERENCES tbl_book(book_id),
    CONSTRAINT fk_request_member_id FOREIGN KEY (member_id) REFERENCES tbl_member(member_id),
    CONSTRAINT fk_request_available_status_id FOREIGN KEY (available_status_id) REFERENCES tbl_book_request_status(available_status_id)
);



/*Insert data into table tbl_author */

select * from tbl_author

insert into tbl_author (first_name, last_name)
values('PK', 'Nag'), ('JP', 'Holman'), ('APJ', 'Kalam'), ('E', 'Sreedharan'),('RL', 'Norton'),
('Amrita', 'Pritam'), ('Mahadevi', 'Verma'), ('Sudha', 'Murthy'), ('Ruskin', 'Bond'), ('Robert', 'Frost'),
('Rabindranath', 'Tagore'), ('Jack', 'Canfield'), ('Dale', 'Carnegie'), ('Swami', 'Vivekanand'), ('Munshi', 'Premchand'),
('Stephen', 'Covey'), ('F', 'Beer'), ('R', 'Johnston'), ('Amish', 'Tripathi'), ('Stephen', 'Timoshenko'), 
('Anton', 'Chekhov'), ('Leo', 'Tolstoy'), ('Mahatma', 'Gandhi'), ('JL', 'Nehru'),('Nelson', 'Mandela');

/*Insert data into table tbl_category */

select * from tbl_category

insert into tbl_category (category_name)
values('Engineering&Technology'), ('Spritualism'), ('Self_Development'), ('Literature'), ('History'), 
('Crime'), ('Comedy'), ('Romantic'), ('Folk_Tales'), ('Fiction'), 
('Non_Fiction'), ('Poetry'), ('Drama'), ('Adventure'), ('Mythology') 

/*Insert data into table tbl_publisher */

select * from tbl_publisher

insert into tbl_publisher (publisher_name,publication_language,publication_type)
values('ABC','English','Journals'), ('ABC','Hindi','Journals'), 
('CBS','English','Handbooks'), ('CBS','Hindi','Handbooks'),
('XYZ','English','Research_Reports'), ('XYZ','Hindi','Research_Reports'),
('XYZ','English','Books'), ('XYZ','Hindi','Books'),
('ZAB','English','Magzines'),('ZAB','Hindi','Magzines')


/*Insert data into table tbl_location */

select * from tbl_location

insert into tbl_location (shelf_no,shelf_name,floor_no)
values('10001', 'Engineering_Mechanical',1), ('10001', 'Engineering_Mechanical',2), ('10001', 'Engineering_Mechanical',3),
('10002', 'Engineering_Electrical',1), ('10002', 'Engineering_Electrical',2), ('10002', 'Engineering_Electrical',3),
('10003', 'Engineering_Computers',1), ('10003', 'Engineering_Computers',2), ('10003', 'Engineering_Computers',3),
('20001', 'Philosophy',1), ('20001', 'Philosophy',2),('20001', 'Philosophy',3), ('20001', 'Philosophy',4),
('20002', 'Spritualism',1), ('20002', 'Spritualism',2), ('20002', 'Spritualism',3), ('20002', 'Spritualism',4),
('30001', 'Self_Development',1), ('30001', 'Self_Development',2), ('30001', 'Self_Development',3),
('30002', 'Competitions',1), ('30002', 'Competitions',2), ('30002', 'Competitions',3),
('30003', 'Literature',1), ('30003', 'Literature',2), ('30003', 'Literature',3),('30003', 'Literature',4),
('40001', 'Journals',1), ('40001', 'Journals',2), ('40001', 'Journals',3)


/*Insert data into table tbl_book */

select * from tbl_book

insert into tbl_book (isbn_code,book_title,category_id,publisher_id,publication_year,book_edition,copies_total,copies_available,location_id )
values('9876543210001', 'Thermodynamics', 1, 7, '2016-01-01',3,15,10,1),
('9876543210002', 'Heat & Mass Transfer', 1, 7, '2014-01-01',2,5,2,2),
('9876543210003', 'Wings of Fire', 11, 7, '1999-01-01',1,10,5,18),
('9876543210004', 'Kinematics of Machines', 1, 7, '2012-01-01',3,5,5,3),
('9876543210005', 'Khaton ka Safarnama', 8, 8, '1985-01-01',1,3,3,24),
('9876543210006', 'Black Rose', 8, 7, '1970-01-01',1,1,1,24),
('9876543210007', 'Kagaz Te Kanvas', 8, 8, '1980-01-01',1,5,3,25),
('9876543210008', 'Gillu', 4, 8, '1960-01-01',1,2,2,26),
('9876543210009', 'How I taught my grandmother to read', 4, 7, '1990-01-01',1,5,5,26),
('9876543210010', 'Three Thousand Stitches', 4, 7, '2010-01-01',1,5,5,27),
('9876543210011', 'Wise and Otherwise', 4, 7, '2012-01-01',1,5,5,26),
('9876543210012', 'The Room on the Roof', 4, 7, '1970-01-01',1,5,5,27),
('9876543210013', 'Happy Birthday, World', 11, 7, '2000-01-01',1,1,1,27),
('9876543210014', 'The Road Not Taken', 12, 7, '1920-01-01',1,1,1,24),
('9876543210015', 'Geetanjali', 12, 7, '1920-01-01',3,1,1,25),
('9876543210016', 'The 25 Success Principles', 3, 7, '1980-01-01',6,10,5,18),
('9976543210002', 'How to stop worrying and start living', 3, 7, '2005-01-01',10,10,2,19),
('9976543210003', 'Karma Yoga', 11, 7, '1980-01-01',5,2,2,11),
('9976543210004', 'Godan', 10, 8, '2012-01-01',10,2,2,24),
('9976543210005', 'Premashram', 10, 8, '2010-01-01',10,2,2,24),
('9976543210006', 'The Seven Habits of Highly Effective People', 3, 7, '2000-01-01',15,10,2,20),
('9876543210007', 'Mechanics', 1, 8, '2000-01-01',3,3,3,3),
('9876543210008', 'The Immortals of Meluha', 15, 8, '2012-01-01',1,3,3,27),
('9876543210009', 'Strengh of Materials', 1, 8, '2000-01-01',6,2,2,2),
('9876543210010', 'The Seagull', 13, 8, '1960-01-01',1,1,1,27),
('9876543210011', 'War and Peace', 13, 8, '1970-01-01',21,1,1,26),
('9876543210012', 'Harijan', 11, 1, '1932-01-01',1,1,1,29),
('9876543210013', 'The Story of my experiments with Truth', 11, 8, '1925-01-01',1,1,1,26),
('9876543210014', 'The Discovery of India', 5, 8, '1945-01-01',1,3,3,24),
('9876543210015', 'Long walk to freedom', 5, 8, '1999-01-01',1,2,2,25),
('9876543210016', 'Beyond Religion', 2, 8, '2010-01-01',1,2,2,15),
('9876543210017', 'Ikigai', 2, 8, '2010-01-01',1,2,0,15),
('9976443210004', 'Gaban', 10, 8, '2012-01-01',10,2,0,24),
('9976549210004', 'Idgah', 10, 8, '2012-01-01',10,2,0,24)

select * from tbl_book_author

insert into tbl_book_author (book_id,author_id)
values(1,1),(2,2),(3,3),(4,5),(5,6),(6,6),(7,6),(8,7),(9,8),(10,8),
(11,8),(12,9),(13,9),(14,10),(15,11),(16,12),(17,13),
(18,14),(19,15),(20,15),(21,16),(22,17),(22,18),(23,19),(24,20),
(25,21),(26,22),(27,23),(28,23),(29,24),(30,25),(31,null)

/*Insert data into table tbl_member_status */

select * from tbl_member_status

insert into tbl_member_status ( account_type,account_status,membership_start_date,membership_end_date)
values('student','active','2018-01-01','2020-01-01'),
('student','active','2019-01-01','2021-01-01'),
('student','inactive','2016-01-01','2017-01-01'),
('student','inactive','2015-01-01','2016-01-01'),
('professional','active','2020-01-01','2022-01-01'),
('professional','active','2018-01-01','2022-01-01'),
('professional','inactive','2015-01-01','2018-01-01'),
('professional','inactive','2016-01-01','2016-01-01'),
('staff','active','2020-01-01','2022-01-01'),
('staff','active','2020-01-01','2022-01-01'),
('staff','inactive','2015-01-01','2016-01-01')

/*Insert data into table tbl_member*/

select * from tbl_member

insert into tbl_member (first_name,last_name,city,mobile_no,email_id,date_of_birth,active_status_id)
values('A','Kumar','Delhi','9999999999','a@xyz.com','1996-01-01',1),
('B','Kumar','Delhi','9999999999','b@xyz.com','1990-01-01',5),
('C','Kumar','Noida','9999999999','c@xyz.com','2000-01-01',3),
('A','Singh','Noida','9999999999','as@xyz.com','2002-01-01',2),
('B','Singh','Noida','9999999999','bs@xyz.com','1985-01-01',4),
('B','Singh','Noida','9999999999','bs@xyz.com','1985-01-01',6),
('C','Singh','Delhi','9999999999','cs@xyz.com','1990-01-01',7),
('X','Patel','Delhi','9999999999','x@xyz.com','1990-01-01',9),
('Y','Arora','Delhi','9999999999','y@xyz.com','1985-01-01',10),
('Z','Khanna','Delhi','9999999999','z@xyz.com','1970-01-01',11)

/*Insert data into table tbl_library_staff*/

select * from tbl_library_staff

insert into tbl_library_staff (staff_name,staff_designation)
values('X Patel', 'Librarian'),
('Y Arora', 'Librarian'),
('R Tiwari', 'Head Librarian')

/*Insert data into table tbl_book_issue*/

select * from tbl_book_issue


insert into tbl_book_issue (book_id, member_id,issue_date,return_date,issue_status,issued_by_id)
values(7, 1, '2022-11-01', '2022-11-15', 'overdue', 1),
(8, 1, '2022-11-01', '2022-11-15', 'underdue', 1),
(1, 2, '2022-11-10', '2022-11-25', 'underdue', 1),
(10, 2, '2022-11-12', '2022-11-27', 'underdue', 2),
(18, 2, '2022-11-12', '2022-11-27', 'underdue', 2),
(2, 4, '2022-10-10', '2022-10-25', 'overrdue', 1),
(15, 5, '2022-10-10', '2022-10-25', 'overdue', 2)

/*Insert data into table tbl_fine_due*/

select * from tbl_fine_due

insert into tbl_fine_due (member_id,issue_id,fine_date,fine_total)
values(5,1,'2022-11-20',25),
(4,2,'2022-11-20',25),
(1,6,'2022-11-20',150)


/*Insert data into table tbl_fine_payment*/

select * from tbl_fine_payment

insert into tbl_fine_payment (member_id,payment_date,payment_amount)
values(5,'2022-11-20',25),
(4,'2022-11-20',25),
(1,'2022-11-20',150)


/*Insert data into table tbl_book_request_status*/

select * from tbl_book_request_status

insert into tbl_book_request_status (available_status, nearest_available_date)
values('not_avail','2022-11-22'),
('not_avail','2022-11-30'),
('not_avail','2022-11-25'),
('available','2022-11-16')

/*Insert data into table tbl_book_request*/

select * from tbl_book_request

insert into tbl_book_request (book_id,member_id, request_date, available_status_id)
values(33,1,'2022-11-15',3),
(34,1,'2022-11-15',4),
(33,2,'2022-11-15',4),
(32,4,'2022-11-15',2),
(25,5,'2022-11-15',1)




/*Problem # 1: 
Write a query to display all the member id, member name, city, account_type, 
account_status, membership start and end date.*/

select m.member_id, m.first_name, m.last_name, m.city, ms.account_type, ms.account_status, 
ms.membership_start_date, ms.membership_end_date
from tbl_member m
join tbl_member_status ms on m.active_status_id=ms.active_status_id

/*Problem # 2:
Write a query to display the member details whose account is inactive.*/

select m.member_id, m.first_name, m.last_name, m.city, ms.account_type, ms.account_status, 
ms.membership_start_date, ms.membership_end_date
from tbl_member m
join tbl_member_status ms on m.active_status_id=ms.active_status_id
where account_status='inactive'

/*Problem # 3:
Write a query to display the member details whose account type is student.*/

select m.member_id, m.first_name, m.last_name, m.city, ms.account_type, ms.account_status, 
ms.membership_start_date, ms.membership_end_date
from tbl_member m
join tbl_member_status ms on m.active_status_id=ms.active_status_id
where account_type='student'

/*Problem # 4:
Write a query to display the member details whose account type is student and account is  inactive.*/

select m.member_id, m.first_name, m.last_name, m.city, ms.account_type, ms.account_status, 
ms.membership_start_date, ms.membership_end_date
from tbl_member m
join tbl_member_status ms on m.active_status_id=ms.active_status_id
where account_type='student' and account_status='inactive'

/*Problem # 5:
Write a query to display the member details who have fine due.*/

select m.member_id, m.first_name, m.last_name, m.city, f.fine_date, f.fine_total,
ms.account_type, ms.account_status, 
ms.membership_start_date, ms.membership_end_date
from tbl_member m
join tbl_fine_due f on m.member_id=f.member_id
join tbl_member_status ms on m.active_status_id=ms.active_status_id

/*Problem- # 6:
Write a query to display the member details who have fine due and account is inactive.*/

select m.member_id, m.first_name, m.last_name, m.city, f.fine_date, f.fine_total,
ms.account_type, ms.account_status, 
ms.membership_start_date, ms.membership_end_date
from tbl_member m
join tbl_fine_due f on m.member_id=f.member_id
join tbl_member_status ms on m.active_status_id=ms.active_status_id
where account_status='inactive'

/*Problem- # 7:
Write a query to display total number of active membership and inactive membership.*/

SELECT 
    SUM(CASE WHEN ms.account_status = 'active' THEN 1 ELSE 0 END) AS total_active_members,
    SUM(CASE WHEN ms.account_status = 'inactive' THEN 1 ELSE 0 END) AS total_inactive_members
FROM 
    tbl_member m
JOIN 
    tbl_member_status ms ON m.active_status_id = ms.active_status_id;


/*Problem- # 8:
Write a query to display how many books this library owns.*/

select sum(copies_total) as total_books from tbl_book

/*Problem- # 9:
Write a query to display how many books are available for borrowing.*/

select sum(copies_available) as books_available_for_borrowing from tbl_book

/*Problem- # 10:
Write a query to display categorywise book count*/

select  c.category_name, b.copies_total
from tbl_category c
join tbl_book b on b.category_id=c.category_id
order by b.copies_total desc

/*Problem- # 11:
Write a query to display total engineering & technology books*/

select sum(copies_total) as total_engineering_technology_books
from tbl_category c
join tbl_book b on b.category_id=c.category_id
where category_name='Engineering&Technology'

/*Problem- # 12:
Write a query to search a book with name 'Three Thousand Stitches'. Is it available for borrowing?*/

select * from tbl_book where book_title='Three Thousand Stitches'

--There are total 5 copies and all 5 copies are available for borrowing

/*Problem- # 13:
Write a query to issue book with book_id=10 to a member  with member_id=4*/

INSERT INTO tbl_book_issue (book_id, member_id, issue_date, return_date, issue_status, issued_by_id)
VALUES (10, 4, '2022-11-20', '2022-12-05', 'underdue', 1);

UPDATE tbl_book 
SET copies_available = copies_available - 1 
WHERE book_id = 10;


/*Problem- # 14:
Write a query to return book with book_id=10 to a member  with member_id=4*/

-- Update the tbl_book_issue to set the issue status as 'returned'
UPDATE tbl_book_issue 
SET issue_status = 'returned' 
WHERE book_id = 10 AND member_id = 4;

-- Update tbl_book to increase the available copies
UPDATE tbl_book 
SET copies_available = copies_available + 1 
WHERE book_id = 10;


/*Problem- # 15:
Write a query to show fine details of member with member name='A Kumar'*/

select m.member_id, m.first_name, m.last_name, m.city, f.fine_date, f.fine_total,
ms.account_type, ms.account_status, 
ms.membership_start_date, ms.membership_end_date
from tbl_member m
join tbl_fine_due f on m.member_id=f.member_id
join tbl_member_status ms on m.active_status_id=ms.active_status_id
where m.first_name='A' and m.last_name='Kumar'
