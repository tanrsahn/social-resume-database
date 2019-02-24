DROP database IF EXISTS SOCIAL; 
CREATE database SOCIAL;
USE SOCIAL;

CREATE TABLE COUNTRY(
	country_name varchar(45) NOT NULL UNIQUE,
	
	PRIMARY KEY(country_name)
);

CREATE TABLE CITY(
	country_name varchar(45) NOT NULL,
	city_name varchar(45) NOT NULL,
    
	FOREIGN KEY(country_name) REFERENCES COUNTRY(country_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(country_name,city_name)
);

CREATE TABLE LOCATION(
	location_id int AUTO_INCREMENT,
	zipcode int NOT NULL,
	neighboorhood varchar(45),
	street varchar(45),
	apt_no int,
	location_description text,
	country_name varchar(45),
	city_name varchar(45),

	FOREIGN KEY(country_name,city_name) REFERENCES CITY(country_name,city_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(location_id)
);

CREATE TABLE MEDIA(
	media_id int AUTO_INCREMENT,
	media_url varchar(255),

	PRIMARY KEY(media_id)
);

CREATE TABLE S_PROFILE(	
	profile_id int AUTO_INCREMENT,    
	pp_media_id int,
	cp_media_id int,

	FOREIGN KEY(pp_media_id) REFERENCES MEDIA(media_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(cp_media_id) REFERENCES MEDIA(media_id) ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY(profile_id)
);

CREATE TABLE S_USER(
	user_id int AUTO_INCREMENT,
	user_password varchar(16) NOT NULL,
	fname varchar(45) NOT NULL,
	mname varchar(45),
	lname varchar(45) NOT NULL,
	gender varchar(6),
	phone varchar(13),
	e_mail varchar(45) NOT NULL,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	user_type varchar(45) NOT NULL,
	birth_date date NOT NULL,
	activeness boolean DEFAULT true,
    	friend_count int DEFAULT 0,
	location_id int,
	profile_id int,
	
	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (user_id)
);

CREATE TABLE COMMUNITY(
	community_id int AUTO_INCREMENT,    
	profile_id int,

	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id),
	PRIMARY KEY(community_id)
);

CREATE TABLE LIKEABLE_OBJECT(
	likeable_object_id int AUTO_INCREMENT,

	PRIMARY KEY(likeable_object_id)
);

CREATE TABLE S_PAGE(
	page_id int AUTO_INCREMENT,
	like_count int DEFAULT 0,
	page_name varchar(255),
	username varchar(20),
	company_date date,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	web_site varchar(255),
	purpose_info text,
	interest_areas text,
	phone varchar(13),
	e_mail varchar(45),
	impressium varchar(255),
	about text,
	awards text,
	page_category_name varchar(45),	
	location_id int,
	community_id int,
	profile_id int,
	likeable_object_id int,

	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(page_id)
);

CREATE TABLE APPLICATION(
	application_id int AUTO_INCREMENT,
	application_name varchar(45),

	PRIMARY KEY(application_id)
);

CREATE TABLE S_GROUP(
	group_id int AUTO_INCREMENT,
	privacy_type varchar(45) NOT NULL,
	group_name varchar(45) NOT NULL,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	about text,
	group_rules text,    
	media_id int,
	community_id int,

	FOREIGN KEY(media_id) REFERENCES MEDIA(media_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(group_id)
);

CREATE TABLE S_EVENT(
	event_id int AUTO_INCREMENT,
	event_name varchar(45) NOT NULL,
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	date_and_hour datetime,
	event_description text,
	location_id int,
	community_id int,
	
	FOREIGN KEY (location_id) REFERENCES LOCATION(location_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(event_id)
);

CREATE TABLE ALBUM(
	album_id int AUTO_INCREMENT,	
	profile_id int NOT NULL,
	
	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE, 	
	PRIMARY KEY(album_id)
);

CREATE TABLE HAS_MEDIA(
	album_id int,
	media_id int,
	
	FOREIGN KEY(album_id) REFERENCES ALBUM(album_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(media_id) REFERENCES MEDIA(media_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(album_id, media_id)
);

CREATE TABLE S_STATUS(
	status_id int AUTO_INCREMENT,
	status_text text,
	like_count int DEFAULT 0, 
	status_type varchar(45) NOT NULL,
	feeling varchar(45),    
	event_id int,
	location_id int,
	shared_status_id int,
	media_id int,
	album_id int,
	likeable_object_id int,
	profile_id int,

	FOREIGN KEY(event_id) REFERENCES S_EVENT(event_id),
	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(shared_status_id) REFERENCES S_STATUS(status_id),
	FOREIGN KEY(media_id) REFERENCES MEDIA(media_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(album_id) REFERENCES ALBUM(album_id),
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(status_id)
);

CREATE TABLE S_COMMENT(
	profile_id int NOT NULL,
	status_id int NOT NULL,
	comment_id int AUTO_INCREMENT,
	comment_text text NOT NULL,
	like_count int,
	likeable_object_id int,

	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(status_id) REFERENCES S_STATUS(status_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(comment_id)
);
	
CREATE TABLE MESSAGE(
	message_id int AUTO_INCREMENT,
	sender_profile_id int NOT NULL,
	receiver_profile_id int NOT NULL,
	message text,
	message_datetime datetime DEFAULT CURRENT_TIMESTAMP,

	FOREIGN KEY(sender_profile_id) REFERENCES S_USER(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(receiver_profile_id) REFERENCES S_USER(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(message_id)
);
	
CREATE TABLE USES_APPLICATION(
	user_id int,
	application_id int,
	
	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(application_id) REFERENCES APPLICATION(application_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,application_id)	
);
	
CREATE TABLE OTHER_ACCOUNTS(
	account_name varchar(45) NOT NULL,
	account_type varchar(45) NOT NULL,

	profile_id int,
	FOREIGN KEY (profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (account_name,account_type)
);
	
CREATE TABLE S_LANGUAGE(
	language_name varchar(45),
	profiency varchar(45),

	PRIMARY KEY(language_name)
);
	
CREATE TABLE ABILITY(
	ability_name varchar(45),

	PRIMARY KEY(ability_name)
);
	
CREATE TABLE S_LIKE(
	profile_id int,
	likeable_object_id int,

	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,likeable_object_id)
);
	
CREATE TABLE S_ORGANIZATION(
	organization_id int AUTO_INCREMENT,
	page_id int,
	employee_count int DEFAULT 0,
	head_quarter varchar(45),
	sector varchar(45),
	service_type varchar(45),

	FOREIGN KEY(page_id) REFERENCES S_PAGE(page_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(organization_id)
);
	
CREATE TABLE WORKS_ON(
	user_id int,
	organization_id int,
	works_on_type varchar(45),
	start_date date,
	end_date date,
	title varchar(45),
	sector varchar(45),
	work_description text, 

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, organization_id)
);
	
CREATE TABLE STUDIES(
	user_id int,
	organization_id int,
	degree varchar(45),
	start_date date,
	end_date date,
	department varchar(45),
	activities_and_communities varchar(255),
	studies_description varchar(255),

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,organization_id)
);
	
CREATE TABLE MEMBER_OF(
	profile_id int,
	group_id int,

	FOREIGN KEY(profile_id) REFERENCES S_USER(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(group_id) REFERENCES S_GROUP(group_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id, group_id)
);
	
CREATE TABLE MANAGES(
	profile_id int,
	community_id int,

	FOREIGN KEY(profile_id) REFERENCES S_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,community_id)
);
	
CREATE TABLE ORGANIZATION_ROLE(
	organization_role_id int AUTO_INCREMENT,
	organization_name varchar(45),
	role_position varchar(45),
	start_date date,
	end_date date,
	role_description text,
	user_id int,
	organization_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id),
	PRIMARY KEY(organization_role_id)
);
	
CREATE TABLE HONOR_AND_AWARD(
	honor_and_award_id int AUTO_INCREMENT,
	title varchar(45),
	h_a_issuer varchar(45),
	h_a_date date,
	h_a_description text,
	user_id int,
	organization_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id),
	PRIMARY KEY(honor_and_award_id)
);
	
CREATE TABLE COURSE(
	course_id int AUTO_INCREMENT,
	course_name varchar(45),
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id),
	PRIMARY KEY(course_id)
);
	
CREATE TABLE TEST_SCORE(
	test_score_id int AUTO_INCREMENT,
	score float,
	test_date date,
	test_description text,
	user_id int,
	organization_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id),
	PRIMARY KEY(test_score_id)
);
	
CREATE TABLE CERTIFICATE(
	certificate_id int AUTO_INCREMENT,
	cerfiticate_name varchar(45),
	issue_date date,
	expiration_date date,
	certificate_url varchar (255),
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id),
	PRIMARY KEY(certificate_id)
);
	
CREATE TABLE PUBLICATION(
	publication_id int AUTO_INCREMENT,
	title varchar(45),
	publication_url varchar(255),
	publish_date date,
	publish_description text,
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id),
	PRIMARY KEY(publication_id)
);
	
CREATE TABLE PROJECT(
	project_id int AUTO_INCREMENT,
	start_date date,
	end_date date,
	project_url varchar(255),
	project_description text,
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES S_ORGANIZATION(organization_id),
	PRIMARY KEY(project_id)
);

CREATE TABLE SHARE_IN_GROUPS(
	user_id int,
	group_id int,
	status_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(group_id) REFERENCES S_GROUP(group_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(status_id) REFERENCES S_STATUS(status_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,group_id,status_id)
);

CREATE TABLE INTERNET_SITES(
	user_id int,
	internet_site varchar(255),
	
	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,internet_site)	
);
	
CREATE TABLE JOB_OFFER(
	job_offer_id int AUTO_INCREMENT,
	create_date date,
	deadline date,
	apply_count int,
	industry varchar(45),
	employment_type varchar(45),
	seniority_level varchar(45),
	job_functions varchar(45),
	offer_description text,

	PRIMARY KEY(job_offer_id)
);
	
CREATE TABLE ASK(
	job_offer_id int,
	ability_name varchar(45),

	FOREIGN KEY(job_offer_id) REFERENCES JOB_OFFER(job_offer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(ability_name) REFERENCES ABILITY(ability_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(job_offer_id, ability_name)
);
	
CREATE TABLE HAS_LOCATION(
	page_id int,
	location_id int,

	FOREIGN KEY(page_id) REFERENCES S_ORGANIZATION(page_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(page_id, location_id)
);
	
CREATE TABLE HAS_LANGUAGE(
	user_id int,
	language_name varchar(45),

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(language_name) REFERENCES S_LANGUAGE(language_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, language_name)
);
	
CREATE TABLE HAS_CERTIFICATE(
	user_id int,
	certificate_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(certificate_id) REFERENCES CERTIFICATE(certificate_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, certificate_id)
);
	 
CREATE TABLE TAKE(
	user_id int,
	course_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(course_id) REFERENCES COURSE(course_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, course_id)
);
	
CREATE TABLE AUTHOR(
	user_id int,
	publication_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(publication_id) REFERENCES PUBLICATION(publication_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, publication_id)
);
	
CREATE TABLE PROJECT_CREATE(
	user_id int,
	project_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(project_id) REFERENCES PROJECT(project_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, project_id)
);
	
CREATE TABLE HAS_ABILITY(
	ability_name varchar(45),
	user_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(ability_name, user_id)
);
	
CREATE TABLE APPLY(
	user_id int,
	job_offer_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(job_offer_id) REFERENCES JOB_OFFER(job_offer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, job_offer_id)
);
	
CREATE TABLE ATTENDS(
	user_id int,
	event_id int,
	attends_type varchar(45),
	
	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(event_id) REFERENCES S_EVENT(event_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,event_id)	
);
	
CREATE TABLE ASSOCIATED(
	user_id int,
	page_id int,
	associated_type varchar(45),
	
	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(page_id) REFERENCES S_PAGE(page_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,page_id)	
);
	
CREATE TABLE PATENT(
	patent_id int AUTO_INCREMENT,
	patent_number varchar(45),
	patent_url varchar(255),
	title varchar(45),
	patent_status varchar(45),
	patent_date date,
	patent_description text,
	country_name varchar(45),

	FOREIGN KEY(country_name) REFERENCES COUNTRY(country_name) ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY(patent_id)
);
	
CREATE TABLE INVENTS(
	user_id int,
	patent_id int,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(patent_id) REFERENCES PATENT(patent_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, patent_id)
);
	
CREATE TABLE CONFIRM(
	confirmer_id int,
	ability_name varchar(45),
	confirmed_user_id int,

	FOREIGN KEY(confirmer_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(ability_name) REFERENCES HAS_ABILITY(ability_name) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(confirmed_user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(confirmer_id, ability_name, confirmed_user_id)
);
	
CREATE TABLE FRIENDS_WITH(
	user_id int,
	friends_user_id int,
	beginning_date datetime DEFAULT CURRENT_TIMESTAMP,

	FOREIGN KEY(user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(friends_user_id) REFERENCES S_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,friends_user_id)		
);

ALTER TABLE LOCATION AUTO_INCREMENT=1001;
ALTER TABLE MEDIA AUTO_INCREMENT=2001;
ALTER TABLE S_PROFILE AUTO_INCREMENT=3001;
ALTER TABLE S_USER AUTO_INCREMENT=4001;
ALTER TABLE COMMUNITY AUTO_INCREMENT=5001;
ALTER TABLE LIKEABLE_OBJECT AUTO_INCREMENT=6001;
ALTER TABLE S_PAGE AUTO_INCREMENT=7001;
ALTER TABLE APPLICATION AUTO_INCREMENT=8001;
ALTER TABLE S_GROUP AUTO_INCREMENT=9001;
ALTER TABLE S_EVENT AUTO_INCREMENT=10001;
ALTER TABLE ALBUM AUTO_INCREMENT=11001;
ALTER TABLE S_STATUS AUTO_INCREMENT=12001;
ALTER TABLE S_COMMENT AUTO_INCREMENT=13001;
ALTER TABLE MESSAGE AUTO_INCREMENT=14001;
ALTER TABLE S_ORGANIZATION AUTO_INCREMENT=15001;
ALTER TABLE ORGANIZATION_ROLE AUTO_INCREMENT=16001;
ALTER TABLE HONOR_AND_AWARD AUTO_INCREMENT=17001;
ALTER TABLE COURSE AUTO_INCREMENT=18001;
ALTER TABLE TEST_SCORE AUTO_INCREMENT=19001;
ALTER TABLE CERTIFICATE AUTO_INCREMENT=20001;
ALTER TABLE PUBLICATION AUTO_INCREMENT=21001;
ALTER TABLE PROJECT AUTO_INCREMENT=22001;
ALTER TABLE JOB_OFFER AUTO_INCREMENT=23001;
ALTER TABLE PATENT AUTO_INCREMENT=24001;
