create database if not exists Social_Media_DB;

use Social_Media_DB;

drop table if exists posts;
drop table if exists comments;
drop table if exists users;

create table users (
	username varchar(15) not null,
	first_name varchar(20) not null,
	last_name varchar(20) not null,
	email varchar(30) not null,
	state char(2) not null,
	password varchar(15) not null,
	birth_date date not null,
	primary key (username)
);

create table posts (
	id int(11) not null auto_increment,
	users_username varchar(15) not null,
	date_posted datetime default current_timestamp,
	contents varchar(255) not null,
	primary key (id),
	foreign key (users_username) references users(username)
);

create table comments (
	id int(11) not null auto_increment,
	users_username varchar(15) not null,
	date_posted datetime default current_timestamp,
	contents varchar(255) not null,
	posts_id int(11) not null,
	primary key(id),
	foreign key (posts_id) references posts(id),
	foreign key (users_username) references users(username)
);