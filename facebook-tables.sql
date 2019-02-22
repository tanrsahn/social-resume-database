drop database if exists FACEBOOK; 
create database FACEBOOK;
use FACEBOOK;
Create table COUNTRY(
	country_name varchar(45) not null,
	primary key(country_name)
);

Create table CITY(
	country_name varchar(45) not null,
	city_name varchar(45) not null,
    foreign key(country_name) references COUNTRY(country_name) on update cascade on delete cascade,
	primary key(country_name,city_name)
);

Create table LOCATION(
	location_id int not null unique AUTO_INCREMENT,
	zipcode int not null,
	neighboorhood varchar(45),
	street varchar(45),
	apt_no int,
	description text,

	country_name varchar(45) not null,
	city_name varchar(45) not null,
	foreign key(country_name,city_name) references CITY(country_name,city_name) on update cascade on delete cascade,
	
	primary key(location_id)
);

Create table MEDIA(
	media_id int not null unique AUTO_INCREMENT,
	media_url varchar(255) not null,
	primary key(media_id)
);

CREATE table F_PROFILE(
	profile_id int not null unique AUTO_INCREMENT,
	
	pp_media_id int,
	cp_media_id int,
	
	foreign key(pp_media_id) references MEDIA(media_id),
	foreign key(cp_media_id) references MEDIA(media_id),
	primary key(profile_id)
	
);

Create table F_USER(
	user_id int not null unique AUTO_INCREMENT,
	user_password varchar(16) not null,
	fname varchar(45) not null,
	mname varchar(45),
	lname varchar(45) not null,
	gender varchar(6),
	phone varchar(13),
	e_mail varchar(45) not null,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	birth_date date not null CHECK ((extract(year from CURRENT_TIMESTAMP)-extract(year from birth_date))>13),
	activeness boolean DEFAULT true,
	friend_count int default 0,

	location_id int,
	country_name varchar(45),
	city_name varchar(45),
	profile_id int,
	foreign key(location_id) references LOCATION(location_id),
	foreign key(country_name,city_name) references CITY(country_name,city_name) on update cascade on delete set null,
	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	primary key (user_id)
);

Create table PAGE_CATEGORY(
	category_name varchar(45) not null unique,
	primary key(category_name)
);

CREATE table COMMUNITY(
	community_id int not null unique AUTO_INCREMENT,
	
	primary key(community_id)
);

CREATE table LIKEABLE_OBJECT(
	likeable_object_id int not null unique AUTO_INCREMENT,
	
	primary key(likeable_object_id)
);

Create table F_PAGE(
	page_id int not null unique AUTO_INCREMENT,
	like_count int default 0,
	pname varchar(255) not null,
	username varchar(20) not null,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	company_date date,
	web_site varchar(255),
	purpose_info text,	
	interest_areas text,
	phone varchar(13),
	e_mail varchar(45),
	impressium varchar(255),
	about text,
    awards text,

	location_id int,
	category_name varchar(45),
	profile_id int,
	community_id int,
	likeable_object_id int,
	foreign key (location_id) references LOCATION (location_id),
	foreign key (category_name) references PAGE_CATEGORY(category_name) on update cascade on delete cascade,
	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	foreign key(community_id) references COMMUNITY(community_id) on update cascade on delete cascade,
	foreign key (likeable_object_id) references LIKEABLE_OBJECT(likeable_object_id) on update cascade on delete cascade,
	primary key(page_id)
);

Create table APPLICATION(
	application_id int not null unique AUTO_INCREMENT,
    application_name varchar(45) not null,
	primary key(application_id)
);

Create table OTHER_ACCOUNTS(
	account_name varchar(45) not null,
	account_type varchar(45) not null,
	
	profile_id int,
	foreign key (profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
    PRIMARY KEY (account_name,account_type)
	
);

Create table F_GROUP(
	group_id int not null unique AUTO_INCREMENT,
	group_name varchar(45) not null,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	privacy_type varchar(20),
	
	community_id int,
	foreign key(community_id) references COMMUNITY(community_id) on update cascade on delete cascade,
	primary key(group_id)
);

Create table F_EVENT(
	event_id int not null unique AUTO_INCREMENT,
	event_name varchar(45) not null,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	date_and_hour datetime not null,
	description text,

	location_id int,
	community_id int,
	foreign key (location_id) references LOCATION(location_id),
	foreign key(community_id) references COMMUNITY(community_id) on update cascade on delete cascade,
	primary key(event_id)
);

Create table ALBUM(
	album_id int not null unique AUTO_INCREMENT,
	
	profile_id int,
	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,	
	primary key(album_id)
);

Create table F_STATUS(
	status_id int not null unique AUTO_INCREMENT,
	status_type varchar(45) not null,
	feeling varchar(45),
	like_count int default 0,
	status_text text,
    
	event_id int,
	location_id int,
	shared_status_id int,
	media_id int,
	album_id int,
	likeable_object_id int,
	profile_id int,
	foreign key (event_id) references F_EVENT(event_id),
	foreign key (location_id) references LOCATION(location_id),
	foreign key (shared_status_id) references F_STATUS(status_id),
	foreign key (media_id) references MEDIA(media_id),
	foreign key (album_id) references ALBUM(album_id),
	foreign key (likeable_object_id) references LIKEABLE_OBJECT(likeable_object_id) on update cascade on delete cascade,
	foreign key (profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	primary key(status_id)
);

CREATE table FRIENDS_WITH(
	user_id int not null,
	friends_user_id int not null,
	beginning_date datetime DEFAULT CURRENT_TIMESTAMP,
	foreign key(user_id) references F_USER(user_id)  on update cascade on delete cascade,
	foreign key(friends_user_id) references F_USER(user_id)  on update cascade on delete cascade,
	primary key(user_id,friends_user_id)		
);

CREATE table USES_APPLICATION(
	user_id int not null,
	application_id int not null,
	
	foreign key(user_id) references F_USER(user_id) on update cascade on delete cascade,
	foreign key(application_id) references APPLICATION(application_id) on update cascade on delete cascade,
	primary key(user_id,application_id)	
);
CREATE table ASSOCIATED(
	user_id int not null, 
	page_id int not null,
	associated_type varchar(45),
	
	foreign key(user_id) references F_USER(user_id) on update cascade on delete cascade,
	foreign key(page_id) references F_PAGE(page_id) on update cascade on delete cascade,
	primary key(user_id,page_id)	
);
CREATE table ATTENDS(
	user_id int not null,
	event_id int not null,
	attends_type varchar(45),
	
	foreign key(user_id) references F_USER(user_id) on update cascade on delete cascade,
	foreign key(event_id) references F_EVENT(event_id) on update cascade on delete cascade,
	primary key(user_id,event_id)	
);

CREATE table HAS_MEDIA(
	album_id int not null,
	media_id int not null,
	
	foreign key(album_id) references ALBUM(album_id) on update cascade on delete cascade,
	foreign key(media_id) references MEDIA(media_id) on update cascade on delete cascade,
	primary key(album_id, media_id)
		
);

CREATE table INTERNET_SITES(
	user_id int not null,
	internet_site varchar(255) not null,
	
	foreign key(user_id) references F_USER(user_id) on update cascade on delete cascade,
	primary key(user_id,internet_site)	
);

CREATE table F_COMMENT(
	comment_id int AUTO_INCREMENT,
	comment_text text not null,
	profile_id int not null,
	status_id int not null,
	like_count int default 0,
	likeable_object_id int,
	
	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	foreign key(status_id) references F_STATUS(status_id) on update cascade on delete cascade,
	foreign key (likeable_object_id) references LIKEABLE_OBJECT(likeable_object_id) on update cascade on delete cascade,
	primary key(comment_id)	
	
);

CREATE table F_LIKE(
	profile_id int not null,
	likeable_object_id int not null,
	
	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	foreign key(likeable_object_id) references LIKEABLE_OBJECT(likeable_object_id) on update cascade on delete cascade,
	primary key(profile_id,likeable_object_id)	
);

CREATE table MANAGES(
	profile_id int not null,
	community_id int not null,
	
	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	foreign key(community_id) references COMMUNITY(community_id) on update cascade on delete cascade,
	primary key(profile_id,community_id)	
);

CREATE table MESSAGE(
	message_id int not null unique AUTO_INCREMENT,
	sender_profile_id int not null,
	receiver_profile_id int not null,
	message text,
	date_time datetime DEFAULT CURRENT_TIMESTAMP,
	
	foreign key(sender_profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	foreign key(receiver_profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	primary key(message_id)	
);

CREATE table MEMBER_OF(
	profile_id int not null,
	group_id int not null,

	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	foreign key(group_id) references F_GROUP(group_id) on update cascade on delete cascade,
	primary key(profile_id,group_id)	
);

CREATE table SHARE_IN_GROUPS(
	profile_id int not null,
	group_id int not null,
	status_id int not null,
	
	foreign key(profile_id) references F_PROFILE(profile_id) on update cascade on delete cascade,
	foreign key(group_id) references F_GROUP(group_id) on update cascade on delete cascade,
	foreign key(status_id) references F_STATUS(status_id) on update cascade on delete cascade,
	primary key(profile_id,group_id,status_id)	
);
ALTER TABLE LOCATION AUTO_INCREMENT=1001;
ALTER TABLE MEDIA AUTO_INCREMENT=2001;
ALTER TABLE F_PROFILE AUTO_INCREMENT=3001;
ALTER TABLE F_USER AUTO_INCREMENT=4001;
ALTER TABLE COMMUNITY AUTO_INCREMENT=5001;
ALTER TABLE LIKEABLE_OBJECT AUTO_INCREMENT=6001;
ALTER TABLE F_PAGE AUTO_INCREMENT=7001;
ALTER TABLE APPLICATION AUTO_INCREMENT=8001;
ALTER TABLE F_GROUP AUTO_INCREMENT=9001;
ALTER TABLE F_EVENT AUTO_INCREMENT=10001;
ALTER TABLE ALBUM AUTO_INCREMENT=11001;
ALTER TABLE F_STATUS AUTO_INCREMENT=12001;
ALTER TABLE F_COMMENT AUTO_INCREMENT=13001;
ALTER TABLE MESSAGE AUTO_INCREMENT=14001;
