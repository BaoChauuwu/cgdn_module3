create database if not exists C0205l1;

create table Class(
id int primary key auto_increment,
name varchar(50),
dob date,
gender boolean
);


create table Tearcher(
id int primary key auto_increment,
name varchar(50),
dob date,
gender boolean,
salary float
);