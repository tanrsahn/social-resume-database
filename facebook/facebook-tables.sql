DROP database IF EXISTS FACEBOOK; 
CREATE database FACEBOOK;
USE FACEBOOK;

CREATE TABLE COUNTRY(
	country_name varchar(45) NOT NULL,

	PRIMARY KEY(country_name)
);

CREATE TABLE CITY(
	country_name varchar(45) NOT NULL,
	city_name varchar(45) NOT NULL,
    
	FOREIGN KEY(country_name) REFERENCES COUNTRY(country_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(country_name,city_name)
);

CREATE TABLE LOCATION(
	location_id int NOT NULL UNIQUE AUTO_INCREMENT,
	zipcode int NOT NULL,
	neighboorhood varchar(45),
	street varchar(45),
	apt_no int,
	description text,
	country_name varchar(45) NOT NULL,
	city_name varchar(45) NOT NULL,
	
	FOREIGN KEY(country_name,city_name) REFERENCES CITY(country_name,city_name) ON UPDATE CASCADE ON DELETE CASCADE,	
	PRIMARY KEY(location_id)
);

CREATE TABLE MEDIA(
	media_id int NOT NULL UNIQUE AUTO_INCREMENT,
	media_url varchar(255) NOT NULL,
	
	PRIMARY KEY(media_id)
);

CREATE TABLE F_PROFILE(
	profile_id int NOT NULL UNIQUE AUTO_INCREMENT,
	pp_media_id int,
	cp_media_id int,
	
	FOREIGN KEY(pp_media_id) REFERENCES MEDIA(media_id),
	FOREIGN KEY(cp_media_id) REFERENCES MEDIA(media_id),
	PRIMARY KEY(profile_id)
);

CREATE TABLE F_USER(
	user_id int NOT NULL UNIQUE AUTO_INCREMENT,
	user_password varchar(16) NOT NULL,
	fname varchar(45) NOT NULL,
	mname varchar(45),
	lname varchar(45) NOT NULL,
	gender varchar(6),
	phone varchar(13),
	e_mail varchar(45) NOT NULL,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	birth_date date NOT NULL CHECK ((EXTRACT(YEAR FROM CURRENT_TIMESTAMP)-EXTRACT(YEAR FROM birth_date))>13),
	activeness boolean DEFAULT true,
	friend_count int DEFAULT 0,
	location_id int,
	country_name varchar(45),
	city_name varchar(45),
	profile_id int,
	
	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id),
	FOREIGN KEY(country_name,city_name) REFERENCES CITY(country_name,city_name) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id)
);

CREATE TABLE PAGE_CATEGORY(
	category_name varchar(45) NOT NULL UNIQUE,
	
	PRIMARY KEY(category_name)
);

CREATE TABLE COMMUNITY(
	community_id int NOT NULL UNIQUE AUTO_INCREMENT,
	
	PRIMARY KEY(community_id)
);

CREATE TABLE LIKEABLE_OBJECT(
	likeable_object_id int NOT NULL UNIQUE AUTO_INCREMENT,
	
	PRIMARY KEY(likeable_object_id)
);

CREATE TABLE F_PAGE(
	page_id int NOT NULL UNIQUE AUTO_INCREMENT,
	like_count int DEFAULT 0,
	pname varchar(255) NOT NULL,
	username varchar(20) NOT NULL,
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
	
	FOREIGN KEY(location_id) REFERENCES LOCATION (location_id),
	FOREIGN KEY(category_name) REFERENCES PAGE_CATEGORY(category_name) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(page_id)
);

CREATE TABLE APPLICATION(
	application_id int NOT NULL UNIQUE AUTO_INCREMENT,
	application_name varchar(45) NOT NULL,

	PRIMARY KEY(application_id)
);

CREATE TABLE OTHER_ACCOUNTS(
	account_name varchar(45) NOT NULL,
	account_type varchar(45) NOT NULL,
	profile_id int,
	
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
    	PRIMARY KEY(account_name,account_type)
);

CREATE TABLE F_GROUP(
	group_id int NOT NULL UNIQUE AUTO_INCREMENT,
	group_name varchar(45) NOT NULL,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	privacy_type varchar(20),
	community_id int,
	
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(group_id)
);

CREATE TABLE F_EVENT(
	event_id int NOT NULL UNIQUE AUTO_INCREMENT,
	event_name varchar(45) NOT NULL,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	date_and_hour datetime NOT NULL,
	description text,
	location_id int,
	community_id int,
	
	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id),
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(event_id)
);

CREATE TABLE ALBUM(
	album_id int NOT NULL UNIQUE AUTO_INCREMENT,
	profile_id int,
	
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,	
	PRIMARY KEY(album_id)
);

CREATE TABLE F_STATUS(
	status_id int NOT NULL UNIQUE AUTO_INCREMENT,
	status_type varchar(45) NOT NULL,
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
	
	FOREIGN KEY(event_id) REFERENCES F_EVENT(event_id),
	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id),
	FOREIGN KEY(shared_status_id) REFERENCES F_STATUS(status_id),
	FOREIGN KEY(media_id) REFERENCES MEDIA(media_id),
	FOREIGN KEY(album_id) REFERENCES ALBUM(album_id),
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(status_id)
);

CREATE TABLE FRIENDS_WITH(
	user_id int NOT NULL,
	friends_user_id int NOT NULL,
	beginning_date datetime DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY(user_id) REFERENCES F_USER(user_id)  ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(friends_user_id) REFERENCES F_USER(user_id)  ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,friends_user_id)		
);

CREATE TABLE USES_APPLICATION(
	user_id int NOT NULL,
	application_id int NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES F_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(application_id) REFERENCES APPLICATION(application_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,application_id)	
);

CREATE TABLE ASSOCIATED(
	user_id int NOT NULL, 
	page_id int NOT NULL,
	associated_type varchar(45),
	
	FOREIGN KEY(user_id) REFERENCES F_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(page_id) REFERENCES F_PAGE(page_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,page_id)	
);

CREATE TABLE ATTENDS(
	user_id int NOT NULL,
	event_id int NOT NULL,
	attends_type varchar(45),
	
	FOREIGN KEY(user_id) REFERENCES F_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(event_id) REFERENCES F_EVENT(event_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,event_id)	
);

CREATE TABLE HAS_MEDIA(
	album_id int NOT NULL,
	media_id int NOT NULL,
	
	FOREIGN KEY(album_id) REFERENCES ALBUM(album_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(media_id) REFERENCES MEDIA(media_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(album_id, media_id)	
);

CREATE TABLE INTERNET_SITES(
	user_id int NOT NULL,
	internet_site varchar(255) NOT NULL,
	
	FOREIGN KEY(user_id) REFERENCES F_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,internet_site)	
);

CREATE TABLE F_COMMENT(
	comment_id int AUTO_INCREMENT,
	comment_text text NOT NULL,
	profile_id int NOT NULL,
	status_id int NOT NULL,
	like_count int DEFAULT 0,
	likeable_object_id int,
	
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(status_id) REFERENCES F_STATUS(status_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(comment_id)	
);

CREATE TABLE F_LIKE(
	profile_id int NOT NULL,
	likeable_object_id int NOT NULL,
	
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,likeable_object_id)	
);

CREATE TABLE MANAGES(
	profile_id int NOT NULL,
	community_id int NOT NULL,
	
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,community_id)	
);

CREATE TABLE MESSAGE(
	message_id int NOT NULL UNIQUE AUTO_INCREMENT,
	sender_profile_id int NOT NULL,
	receiver_profile_id int NOT NULL,
	message text,
	date_time datetime DEFAULT CURRENT_TIMESTAMP,
	
	FOREIGN KEY(sender_profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(receiver_profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(message_id)	
);

CREATE TABLE MEMBER_OF(
	profile_id int NOT NULL,
	group_id int NOT NULL,

	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(group_id) REFERENCES F_GROUP(group_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,group_id)
);

CREATE TABLE SHARE_IN_GROUPS(
	profile_id int NOT NULL,
	group_id int NOT NULL,
	status_id int NOT NULL,
	
	FOREIGN KEY(profile_id) REFERENCES F_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(group_id) REFERENCES F_GROUP(group_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(status_id) REFERENCES F_STATUS(status_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,group_id,status_id)
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
