create database nmv;

create table student(
	id int not null primary key auto_increment,
    name varchar(20) not null
);
 
 use nmv;
 
 desc student;
 
 insert into student values (2, 'Anand');
 
 select * from student;
 
 
 
 
  alter table student add column dept varchar(20);
  
  alter table student modify column dept varchar(25);
  
  alter table student change column dept depat_name varchar(25);
 
 
--  0	8	11:28:57	insert into student values('charan')	Error Code: 1136. Column count doesn't match value count at row 1	0.000 sec
 
 
