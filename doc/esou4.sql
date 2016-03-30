use mysql;
DELETE FROM user WHERE User = "esou" and Host = "localhost";
FLUSH PRIVILEGES;
DROP DATABASE if exists esou4;
CREATE DATABASE esou4 default character set utf8;
GRANT ALL ON esou4.* TO esou@'%' IDENTIFIED BY 'esou' WITH GRANT OPTION;
FLUSH PRIVILEGES;

use esou4;

drop table if exists managers;

create table managers (
	id int primary key auto_increment,
	login_name varchar(255) not null unique,
	password varchar(255) not null,
	name varchar(255) not null,
	email varchar(255),
	mobile varchar(255)
);

drop table if exists clients;

create table clients (
	id int primary key auto_increment,
	name varchar(255) not null,
	short_name varchar(255) not null,
	user_num int,
	user_limit int,
	expre_date varchar(255),
	subject_num int,
	subject_limit int,
	person varchar(255),
	email varchar(255),
	mobile varchar(255),
	url varchar(255),
	address varchar(255),
	available int,
	manager_id int,
	create_date varchar(255)
);

drop table if exists users;

create table users (
	id int primary key auto_increment,
	login_name varchar(255) not null unique,
	password varchar(255) not null,
	username varchar(255) not null,
	client_id int,
	department varchar(255),
	email varchar(255),
	mobile varchar(255),
	telephone varchar(255),
	role int,
	available int,
	create_date varchar(255),
	last_login_date varchar(255),
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists login_log;

create table login_log (
	id int primary key auto_increment,
	ip varchar(255),
	login_time varchar(255),
	user_id int,
	client_id int,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists subject_group;

create table subject_group (
	id int primary key auto_increment,
	name varchar(255),
	client_id int,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists projects;

create table projects (
	id int primary key auto_increment,
	name varchar(255),
	user_id int,
	client_id int,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists subjects;

create table subjects (
	id int primary key auto_increment,
	name varchar(255),
	search_string longtext,
	search_condition longtext,
	time_range varchar(255),
	need_report int,
	report_create_date varchar(255),
	report_addrs varchar(255),
	report_freq int,
	need_alarm int,
	alarm_create_date varchar(255),
	alarm_addrs varchar(255),
	alarm_freq int,
	alarm_rule varchar(255),
	create_date varchar(255),
	username varchar(255),
	shared int,
	subject_group_id int,
	user_id int,
	client_id int,
	foreign key (subject_group_id) references subject_group(id) on delete cascade on update cascade,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists reports;

create table reports (
	id int primary key auto_increment,
	name varchar(255),
	content longtext,
	categories varchar(255),
	date varchar(255),
	addrs varchar(255),
	results varchar(255),
	user_id int,
	client_id int,
	subject_id int,
	foreign key (subject_id) references subjects(id) on delete cascade on update cascade,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists alarms;

create table alarms (
	id int primary key auto_increment,
	name varchar(255),
	content longtext,
	date varchar(255),
	addrs varchar(255),
	results varchar(255),
	subject_id int,
	user_id int,
	client_id int,
	foreign key (subject_id) references subjects(id) on delete cascade on update cascade,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists articles;

create table articles (
	id int primary key auto_increment,
	title longtext,
	content longtext,
	summary longtext,
	author longtext,
	pubdate varchar(255),
	word varchar(255),
	sub_title varchar(255),
	search_id varchar(255),
	emotion varchar(255),
	author_type varchar(255),
	channel_category varchar(255),
	domain varchar(255),
	domain_source varchar(255),
	domain_level varchar(255),
	media_type varchar(255),
	message_type varchar(255),
	url varchar(255),
	num int,
	user_id int,
	client_id int,
	project_id int,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade,
	foreign key (project_id) references projects(id) on delete cascade on update cascade
);

drop table if exists probes;

create table probes (
	id int primary key auto_increment,
	search_id varchar(255),
	title longtext,
	source varchar(255),
	keywords varchar(255),
	url varchar(255),
	create_time varchar(255),
	delete_time varchar(255),
	deleted varchar(255),
	user_id int,
	client_id int,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);

drop table if exists home_subject;

create table home_subject (
	id int primary key auto_increment,
	name varchar(255),
	search_string longtext,
	search_condition longtext,
	subject_group_id int,
	subject_id int,
	user_id int,
	client_id int,
	foreign key (subject_group_id) references subject_group(id) on delete cascade on update cascade,
	foreign key (subject_id) references subjects(id) on delete cascade on update cascade,
	foreign key (user_id) references users(id) on delete cascade on update cascade,
	foreign key (client_id) references clients(id) on delete cascade on update cascade
);
--
-- Table structure for table `weibokeyword_users`
--

DROP TABLE IF EXISTS `weibokeyword_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weibokeyword_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `downloadnum` int(11) NOT NULL,
  `ispassed` int(11) DEFAULT '1',
  `addtime` varchar(19) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=287 DEFAULT CHARSET=utf8;

insert into managers(login_name, password, name) values('admin@admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin');

