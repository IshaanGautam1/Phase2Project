create database phase2project;
use phase2project;

create table classes(
classname varchar(35)
);

create table students(
name varchar(35),
class varchar(35)
);

create table subjects(
name varchar(35)
);

create table teachers(
name varchar(35),
subject varchar(35)
);