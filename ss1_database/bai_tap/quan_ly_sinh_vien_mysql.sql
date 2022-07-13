drop database student_management ;

create database student_management ;

use student_management ;

create table student (
`id` int not null primary key,
`name` varchar(45),
`age` int null ,
`country` varchar(45) null 
);

create table class (
`id` int ,
`name` varchar(45)  
) ;

create table teacher (
`id` int ,
`name` varchar(45) ,
`age` varchar(45),
`country` varchar(45)
) ;