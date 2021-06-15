CREATE TABLE User (
  `Username` varchar(200) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `First_name` varchar(45) NOT NULL,
  `Last_name` varchar(45) NOT NULL,
  `Phone_no` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Type` varchar(11) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

create index First_name on User(First_name);

create index Last_name on User(Last_name);

insert into User(Username,Password,First_name,Last_name,Phone_no,Email,Type )values
('abhinay_1','abhinay','abhinay','Bandi',7044901766,'abhinay.bandi41@gmail.com','s'),
('ankita_1','ankita','ankita','kumari',9999999999,'ankita@gmail.com','s'),
('chandana_1','chandana','chandana','chowdary',9999999999,'chandana@gmail.com','t');
insert into User value ('charan_1','Charan','charan','reddy',8125581808,'charanreddy@gmail.com','s');
insert into User(Username,Password,First_name,Last_name,Phone_no,Email,Type )values
('Kriti_123','kriti','Kriti','Jain',7044925766,'kriti.jain@gmail.com','s'),
('rishabh_01','rish123','Rishabh','Srivastava',7055145623,'rishabh@gmail.com','s'),
('dhwani_012','dhai234','Dhwani','Vyas',7066789452,'dhwani@gmail.com','t'),
('varsha_012','varsha234','Varsha','Vyas',7066749552,'varsha@gmail.com','s'),
('john_012','jhon234','John','Sever',9166789452,'john@gmail.com','s'),
('ali_s123','sever23','Ali','Sever',7212345682,'ali01@gmail.com','t'),
('prutha','prutha234','Prutha','Kulkarni',9837956865,'prutha12@gmail.com','s'),
('divya45','divya234','Divya','Patel',9874561237,'divya@gmail.com','s'),
('aditi789','aditi234','Aditi','Sinha',8566789452,'aditi@gmail.com','t'),
('shahi','shahi234','Shahi','Ashesh',6532147895,'shahi@gmail.com','t');
select * from User;

create table `categories`(
`category_id` int,
`topics` varchar(100),
primary key (`category_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into categories values ( 1,'maths'),(2,'computerScience'),(3,'DatabaseSystems'),(4,'General Knowledge');

create table `level`(
`level_id` int(10),
`levels` varchar(100),
primary key(`level_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

insert into level values (1,'beginner'),(2,'medium'),(3,'hard');

CREATE TABLE `Quiz` (
  `Quiz_id` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(2000),
  `Title` varchar(45) NOT NULL,
  `level_id` int(10),
  `category_id` int,
  `timer` time,
  `creater_id` varchar(200),
  `last_modified_time` datetime,
  PRIMARY KEY (`Quiz_id`),
  CONSTRAINT `levels_id` FOREIGN KEY (`level_id`) REFERENCES `level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `category_id` FOREIGN KEY(`category_id`) REFERENCES `categories`(`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT `User_namess__` FOREIGN KEY (`creater_id`) REFERENCES `User` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(1,'check your knowledge on maths','integers',1,1,30,'chandana_1',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(2,'check your knowledge on maths','integers',2,1,30,'chandana_1',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(3,'check your knowledge on maths','integers',3,1,30,'chandana_1',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(4,'check your knowledge on maths','integers',1,2,30,'chandana_1',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(5,'check your knowledge on maths','integers',2,2,30,'chandana_1',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(6,'check your knowledge on maths','integers',3,2,30,'dhwani_012',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(7,'check your knowledge on maths','integers',1,3,30,'dhwani_012',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(8,'check your knowledge on maths','integers',2,3,30,'dhwani_012',now());
Insert into Quiz(Quiz_id,Description,Title,level_id,category_id,timer,creater_id,last_modified_time) values(9,'check your knowledge on maths','integers',3,3,30,'dhwani_012',now());

select * from Quiz;

CREATE TABLE `Questions` (
  `Question_id` int(1) NOT NULL,
  `Quiz_id` int(11) NOT NULL,
  `Question` varchar(2000) NOT NULL,
   `Correct_Answer` varchar(2000) NOT NULL,
   `hint` varchar(2000) ,
   `imgurl` varchar(2000) ,
  PRIMARY KEY (`Question_id`,`Quiz_id`),
  KEY `Quiz_id_idx` (`Quiz_id`),
  CONSTRAINT `Quiz_id` FOREIGN KEY (`Quiz_id`) REFERENCES `Quiz` (`Quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COMMENT='	Quiz_id(foreign key, reference of quiz_id from quiz)\n	Question\n	Option_1\n	Option_2\n	Option_3\n	Option_4\n	Correct_Answer\n';

Select * from Questions;
Insert into Questions(Question_id,Quiz_id,Question,Correct_Answer) values 
  (1,1,'What is the sum of first 10 prime numbers?','129'),
  (2,1,'The number of 3-digit numbers divisible by 6, is?','150'),
  (3,1,'A clock strikes once at 1 o’clock, twice at 2 o’clock, thrice at 3 o’clock and so on. How many times will it strike in 24 hours?','156'),
  (4,1,'Which of the following numbers gives 240 when added to its own square?','15'),
  (5,1,'The average of first 50 natural numbers is?','25.5'),
  (6,1,'If 6 is 50% of a number, what is the number?','12'),
  (7,1,'Area of a parallelogram whose base is 9 cm and height is 4 cm is ………..square cm?','36'),
 (1,2,'what is square of 5',25),
 (2,2,'Find the sum of (+4)+(+20)',24),
 (3,2,'what is the value of -12 - (-10)',-2),
 (4,2,' Put in order from least to greatest.-5, 0, -3, 5, -2, 4, 1', '-5,-3,-2,0,1,4,5'),
 (5,2,'What is the absolute value of -7?',7),
 (6,2,'12, 87, -9, -14, 34, -147, -107 Which of these integers has the greatest value?',87),
 (1,3,'John borrows 5 dollars from his parents. He then borrows $23 from his friends. What is the amount John owes?',28),
 (2,3,' A football team gained 9 yards on one play and then lost 22 yards on the next. Write a sum of integers to find the overall change in field position.',-13),
 (3,3,'a number less than zero','Negative Number'),
 (1,4,'Andy read 4/5 th of a story book which has 100 pages. How many pages of the book is not yet read by Andy?','20'),
  (2,4,'The quotient in a division sum is 403. The divisor is 100 and the remainder is 58. The dividend is?','40358'),
  (3,4,'Which least number should be added to 2600 to make it a perfect square?','1'),
  (4,4,'The least number of five digits which is completely divisible by 39, is ?','10023'),
  (5,4,'What is 121 times 11 ?','1331'),
  (6,4,'A car covers a distance of 200km in 2 hours 40 minutes, 
   whereas a jeep covers the same distance in 2 hours. 
   What is the ratio of their speed ?','3:4'),
 (1,5,'Moving of messages of from originator to recipient is called?','transfer'),
 (2,5,'What are special test messages consisting of empty envelopes?','probes'),
 (3,5,'Which is an optical disk?','CDROM'),
 (4,5,'1 byte equals how many bits',8),
 (5,5,'Word length of Super computers?',64),
 (6,6,' FIFO stands for?','First in First out'),
 (7,6,'The first film which uses the morphing is?','willow'),
 (8,6,'The Expert system was introduced in?',1958),
 (9,6,'The beginning of Artificial Intelligence in?',1958),
 (1,7,'A number is greater than 3 but less than 8. 
   Also the number is greater than 6 but less than 10. What is the number ?','7'),
   (2,7,'A clock reads 4:30. 
   If the minute hand points East, in what direction will the hour hand point?','North-East'),
   (3,7,'The sum of squares of two numbers is 80 and the square of difference between the two numbers is 36. 
     Find the product of two numbers','22'),
   (4,7,'The value of 1.07 × 65 + 1.07 × 26 + 1.07 × 9 is?','107'),
   (5,7,'If ‘+’ means ‘×’, ‘-‘ means ‘+’, ‘×’ means ‘÷’ and ‘÷’ means ‘-‘ then find the value of;
    6 – 9 + 8 × 3 ÷ 20?','10'),
    (6,7,'$ 2496 is spend in the floor repair of 30 × 16 ft hall. 
	What is repair cost per square feet?','5.20'),
    (7,7,'45% of 640 + 64% of 450 = ? % of 1440?','40'),
    (8,7,'Of what number the 2/5 of 5/8 of 4/7 = 22?','154'),
 (1,8,'A database is divided into?','Records'),
 (2,8,'Primary keys are use to identify a unique set of records?','True'),
 (3,8,'Validation can ensure that no incorrect data is entered?','True'),
 (4,8,'What does SQL stand for?','Structured Query LAnguage'),
 (1,9,'Which SQL statement is used to extract data from a database?','Select'),
 (2,9,'Which SQL statement is used to update data in a database?','update'),
 (3,9,'Which SQL statement is used to delete data from a database?','delete');
 
 
 



CREATE TABLE `Answers` (
  `Username` varchar(200) NOT NULL,
  `Question_id` int(1) NOT NULL,
  `Answer` varchar(2000) NOT NULL,
  `Quiz_id` int(11) NOT NULL,
  `count_no` int(100),
  PRIMARY KEY (`Username`,`Question_id`,`count_no`),
  KEY `Question_id_idx` (`Question_id`),
  CONSTRAINT `Questions_id` FOREIGN KEY (`Question_id`) REFERENCES `Questions` (`Question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Usersname` FOREIGN KEY (`Username`) REFERENCES `User` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
	
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



create table `Options`(
	`Question_id` int(1) NOT NULL,
	`Quiz_id` int(11) NOT NULL,
	`Option_id` int(11) NOT NULL Auto_Increment,	
	`options` varchar(2000) NOT NULL,
	primary key (`Option_id`),
	CONSTRAINT `Questionsid` FOREIGN KEY (`Question_id`) REFERENCES `Questions` (`Question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `Quizsid` FOREIGN KEY (`Quiz_id`) REFERENCES `Quiz` (`Quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE
)ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
Select * from Options;

 Insert into Options (Question_id, Quiz_id, options) values
 (1,1,129),(1,1,130),(1,1,140),(1,1,150),
 (2,1,129),(2,1,130),(2,1,140),(2,1,150),
 (3,1,129),(3,1,130),(3,1,140),(3,1,156),
 (4,1,12),(4,1,15),(4,1,36),(4,1,25.5),
(5,1,12),(5,1,15),(5,1,36),(5,1,25.5),
(6,1,12),(6,1,15),(6,1,36),(6,1,25.5),
(7,1,12),(7,1,15),(7,1,36),(7,1,25.5),
 (1,2,24),(1,2,25),(1,2,35),(1,2,36),
 (2,2,24),(2,2,12),(2,2,36),(2,2,11),
 (3,2,-2),(3,2,2),(3,2,0),(3,2,8),
 (4,2,'-5,-3,-2,0,1,4,5'),(4,2,'-5,-3,-2,0,1,5,4'),(4,2,'5,-3,-2,0,1,4,-5'),
 (5,2,7),(5,2,-7),(5,2,1/7),(5,2,3/4),
 (6,2,87),(6,2,28),(6,2,56),(6,2,34),
 (7,2,87),(7,2,28),(7,2,56),(7,2,34),
 (1,3,87),(1,3,28),(1,3,56),(1,3,-13),
 (2,3,'Negative'),(2,3,'positive'),
 (1,4,20),(1,4,1),(1,4,5),(1,4,6),
 (2,4,40358),(2,4,10023),(2,4,1331),(2,4,10000),
 (3,4,20),(3,4,1),(3,4,5),(3,4,6),
(4,4,40358),(4,4,10023),(4,4,1331),(4,4,10000),
(5,4,40358),(5,4,10023),(5,4,1331),(5,4,10000),
(6,4,'3:4'),(6,4,'4:3'),(6,4,'5:4'),(6,4,'6:7'),
 
 (1,5,'Transfer'),(1,5,'Transform'),(1,5,'Repeat'),
 (2,5,'Probe'),(2,5,'prove'),(2,5,'proof'),(2,5,'people'),
 (3,5,'DVDROM'),(3,5,'CDROM'),(3,5,'BLU_RAY'),
 (4,5,4),(4,5,8),(4,5,11),(4,5,12),
 (5,5,64),(5,5,96),(5,5,108),(5,5,86),
 (1,6,'First in First out'),(1,6,'First int first out'),(1,6,'First integer first outdated'),
 (2,6,'willow'),(2,6,'pillow'),(2,6,'millow'),
 (3,6,1958),(3,6,1986),(3,6,1890),(3,6,1947),
 (4,6,1958),(4,6,1986),(4,6,1890),(4,6,1947),
 
(1,7,7),(1,7,107),(1,7,22),(1,7,10),
(2,7,'North-East'),(2,7,'North-South'),(2,7,'east-west'),(2,7,'north-west'),
(3,7,7),(3,7,107),(3,7,22),(3,7,10),
 (4,7,7),(4,7,107),(4,7,22),(4,7,10),
 (5,7,7),(5,7,107),(5,7,22),(5,7,10),
 (6,7,5.20),(6,7,6.8),(6,7,9),(6,7,5.1),
 (7,7,40),(7,7,154),(7,7,160),(7,7,180),
 (8,7,40),(8,7,154),(8,7,160),(8,7,180),
 
 (1,8,'Records'),(1,8,'files'),(1,8,'rows'),(1,8,'columns'),
 (2,8,'True'),(2,8,'False'),
(3,8,'True'),(3,8,'False'),
(4,8,'' ),
(1,9,'Select'),(1,9,'update'),(1,9,'delete'),
(2,9,'Select'),(2,9,'update'),(2,9,'delete'),
(3,9,'Select'),(3,9,'update'),(3,9,'delete');
 
 
 
 
 
 
 
 


CREATE TABLE `Score` (
  `Username` varchar(200) NOT NULL,
  `Quiz_id` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Attempt_no` varchar (100),
  PRIMARY KEY (`Username`,`Quiz_id`,`Attempt_no`),
  KEY `Quizid_idx` (`Quiz_id`),
  CONSTRAINT `Quizid` FOREIGN KEY (`Quiz_id`) REFERENCES `Quiz` (`Quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `User_name` FOREIGN KEY (`Username`) REFERENCES `User` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




Select * from Score;
create table `payment`(
`payment_id`  INT NOT NULL AUTO_INCREMENT,
`Username` varchar(200),
  `Card_no` varchar(30) NOT NULL,
  `Expiry_date` date DEFAULT NULL,
  `Cvv` int(10) DEFAULT NULL,
  `Zip` varchar(10) DEFAULT NULL,
`status` varchar(100),
`Deadline` date,
primary key(`payment_id`),
UNIQUE KEY `Card_no` (`Card_no`),
CONSTRAINT `Users_name` FOREIGN KEY (`Username`) REFERENCES `User` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
 )ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
 
 INSERT INTO payment (Username,Card_no,Expiry_date,CVV,Zip,status,Deadline)
 VALUES ('abhinay_1',"5365339247682073","2019-08-28 ",263,"2266",'paid','2020-05-08'),
('charan_1',"6443092601684185","2021-11-04 ",638,"9408",'paid','2020-11-02');

Select * from payment p right join User u on u.Username = p.Username ;

Create Table `feedback`(
`feedback_id` varchar(100),
`Quiz_id` int(11) NOT NULL,
 `Username` varchar(200) NOT NULL,
`feedback` varchar(2000),
`ratings` int(5),
primary key(`feedback_id`),
 CONSTRAINT `Quizsi_d` FOREIGN KEY (`Quiz_id`) REFERENCES `Quiz` (`Quiz_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `User_names_` FOREIGN KEY (`Username`) REFERENCES `User` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
  )ENGINE=InnoDB DEFAULT CHARSET=latin1;
  
  Insert into feedback values(1,1,'abhinay_1','Very Good',5),(2,1,'abhinay_1','It is hard as per level given',4);
  
  




DELIMITER $$
CREATE PROCEDURE `find_average_max_score`(in quiz_id int , out avgscore float(9,3) ,out maxscore int)
BEGIN
Set avgscore = (Select (sum(Score)/count(*)) from Score group by(Quiz_id) having Quiz_id = quiz_id);
set maxscore = (Select Max(Score) from Score group by (Quiz_id) having Quiz_id = quiz_id); 
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `find_user_max_score`(in quiz_id int, in username char, out user_max_score int)
BEGIN
Select max(Score) into user_max_score from Score where Username = username group by (Quiz_id)  having Quiz_id = quiz_id;
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE `find_user_type`(in username char, out t int)
BEGIN
Declare deadline date; 
Declare stat char;
Declare d int;
SET  stat = (select status from payment where Username = username order by Deadline desc limit 1);
SET  d = datediff((select Deadline from payment where Username = username order by Deadline desc limit 1),CURDATE());
IF(stat = 'paid' and d >0)
	Then
    set t = 1;
   Else
    set t =0;
	End if; 
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE `date_modify`(in quiz_id int)
BEGIN
Update Quiz
Set last_modified_time = now() where Quiz_id = quiz_id;
END$$
DELIMITER ;


DELIMITER $$

Create Procedure`scorecal`(`uname` VARCHAR(200), `quizid`
INT(11), `attempt` int(100))
begin
Declare Score int;
set Score = (select count(*) 
		from Questions q, Answers a
		where 
		a.Username = uname and
		a.Quiz_id = quizid and
		a.count_no = attempt and
		a.Quiz_id = q.Quiz_id and
		a.Question_id = q.Question_id and
		a.Answer = q.Correct_Answer);
Insert into Score values(uname,quizid,Score,now(),attempt);
end$$
DELIMITER ;

DELIMITER $$
CREATE Trigger `modify`
before update on Questions
for each row
BEGIN
declare quiz_id int;
set quiz_id = new.Quiz_id;
CALL date_modify(quiz_id);
END$$
DELIMITER ;

DELIMITER $$
CREATE Trigger `score_trigger`
after insert on Answers
for each row
BEGIN
declare uname char;
declare qid int;
declare num int ;
set uname = (select Username from Answers);
set qid = (select Quiz_id from Answers);
set num = (select count_no from Answers);
CALL scorecal(uname,qid,num);
END$$
DELIMITER ;



/*! 
Insert into Answers values('abhinay_1',1,'Select',9,1),('abhinay_1',2,'update',9,1),('abhinay_1',3,'Select',9,1);

call scorecal ('abhinay_1',9,1);

call find_user_max_score (9,'abhinay_1',@max);
call find_average_max_score(9,@avg_sc,@max_score);

Select @avg_sc,@max_score;
*/
Insert into Answers values('abhinay_1',1,'Select',9,2),('abhinay_1',2,'update',9,2),('abhinay_1',3,'delete',9,2);

call scorecal ('abhinay_1',9,1);



CREATE VIEW `User_detail_with_card_info` AS
Select u.Username,u.Password,u.First_name,u.Last_name,u.Phone_no,u.Email,u.Type,p.Card_no,p.Expiry_date,p.Zip,p.status,p.Deadline from payment p right join User u on u.Username = p.Username ;

CREATE VIEW `Category_level_Quiz` AS
Select q.Title,q.timer,c.topics,l.levels from Quiz q inner join level l on l.level_id = q.level_id inner join categories c on c.category_id = q.category_id   ;  

CREATE VIEW `Question_Quiz` AS
Select q.Title,c.topics,qe.Question,qe.Correct_Answer,o.options  from Quiz q,Questions qe,categories c,Options o where q.Quiz_id = qe.Quiz_id and q.category_id = c.category_id and o.Question_id = qe.Question_id and o.Quiz_id = qe.Quiz_id  ;


CREATE VIEW `Correct_Answer` AS
Select q.Question,q.Correct_Answer,a.Answer,a.count_no,a.Username from Questions q, Answers a where q.Question_id = a.Question_id and q.Quiz_id = a.Quiz_id ;



Select * from User;
Select * from payment;
Select * from categories;
Select * from Quiz;
Select * from level;
Select * from Questions;
Select * from Options; 
Select * from Answers;
Select * from Score;
Select * from feedback;



  

