create database quanlysinhvien ;
use quanlysinhvien ;

create table class (
classid int not null primary key auto_increment ,
classname varchar(60) not null ,
startdate datetime not null ,
`status` bit 
) ;

create table student (
studentid int not null primary key auto_increment ,
studentname varchar(30) not null ,
address varchar(50) ,
phone varchar(20) ,
`status` bit ,
classid int not null ,
foreign key (classid) references class(classid) 
);

create table `subject` (
subid int not null primary key auto_increment ,
subname varchar(30) not null ,
credit tinyint not null default 1 check (credit >= 1) ,
`status` bit default 1
) ;

create table mark (
markid int not null primary key auto_increment ,
subid int not null ,
studentid int not null ,
mark float default 0 check (mark between 0 and 100) ,
examtimes tinyint default 1 ,
unique (subid ,studentid),
foreign key (subid) references `subject`(subid) ,
foreign key (studentid) references `student`(studentid) 
);

alter 