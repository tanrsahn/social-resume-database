DROP database IF EXISTS LINKEDIN; 
CREATE database LINKEDIN;
USE LINKEDIN;

CREATE TABLE MEDIA(
	media_id int,
    	media_url varchar(255),
    
	PRIMARY KEY(media_id)
);
	
CREATE TABLE L_PROFILE(	
	profile_id int,
    	pp_media_id int,
	cp_media_id int,
	
    	FOREIGN KEY(pp_media_id) REFERENCES MEDIA(media_id),
    	FOREIGN KEY(cp_media_id) REFERENCES MEDIA(media_id),
    	PRIMARY KEY(profile_id)
);

CREATE TABLE COUNTRY(
	country_name varchar(45),
    
	PRIMARY KEY(country_name)
);

CREATE TABLE CITY(
	country_name varchar(45),
	city_name varchar(45),
    
	FOREIGN KEY(country_name) REFERENCES COUNTRY(country_name) ON UPDATE CASCADE ON DELETE CASCADE,
    	PRIMARY KEY(country_name, city_name)
);

CREATE TABLE LOCATION(
	location_id int,
	zip_code varchar(45),
	neighbourhood varchar(45),
	street varchar(45),
	apt_no int,
	adress_description text,
	country_name varchar(45),
	city_name varchar(45),

	FOREIGN KEY(country_name,city_name) REFERENCES CITY(country_name,city_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(location_id)
);

CREATE TABLE L_USER(
	user_id int,
	user_password varchar(45),
	fname varchar(45),
	mname varchar(45),
	lname varchar(45),
	gender varchar(45),
	phone varchar(13),
	e_mail varchar(45),
	create_date datetime DEFAULT CURRENT_TIMESTAMP,
	user_type varchar(45),
	friend_count int DEFAULT 0,
	birth_date date NOT NULL,
	location_id int,
	profile_id int,

	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id),
	FOREIGN KEY(profile_id) REFERENCES L_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id)
);

CREATE TABLE L_LANGUAGE(
	language_name varchar(45),
	profiency varchar(45),

	PRIMARY KEY(language_name)
);

CREATE TABLE PATENT(
	patent_id int,
	patent_number varchar(45),
	patent_url varchar(255),
	title varchar(45),
	patent_status varchar(45),
	patent_date date,
	patent_description text,
	country_name varchar(45),

	FOREIGN KEY(country_name) REFERENCES COUNTRY(country_name),
	PRIMARY KEY(patent_id)
);

CREATE TABLE COMMUNITY(	
	community_id int,
	user_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(community_id)
);

CREATE TABLE L_ORGANIZATION(
	organization_id int,
	organization_name varchar(45),
	employee_count int,
	about text,
	head_quarter varchar(45),
	web_site varchar(255),
	sector varchar(45),
	foundation_date date,
	service_type varchar(45),
	organization_type varchar(45),    
	community_id int,
	profile_id int,

	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(profile_id) REFERENCES L_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(organization_id)
);
	
CREATE TABLE PUBLICATION(
	publication_id int,
	title varchar(45),
	publication_url varchar(255),
	publish_date date,
	publish_description text,
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id),
	PRIMARY KEY(publication_id)
);

CREATE TABLE PROJECT(
	project_id int,
	start_date date,
	end_date date,
	project_url varchar(255),
	project_description text,    
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id),
	PRIMARY KEY(project_id)
);

CREATE TABLE COURSE(
	course_id int,
	course_name varchar(45),
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id),
	PRIMARY KEY(course_id)
);

CREATE TABLE TEST_SCORE(
	test_score_id varchar(45),
	score float,
	test_date date,
	test_description text,    
	user_id int,
	organization_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id),
	PRIMARY KEY(test_score_id)
);

CREATE TABLE HONOR_AND_AWARD(
	honor_and_award_id int,
	title varchar(45),
	h_a_issuer varchar(45),
	h_a_date date,
	h_a_description text,    
	user_id int,
	organization_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id),
	PRIMARY KEY(honor_and_award_id)
);

CREATE TABLE ORGANIZATION_ROLE(
	organization_role_id int,
	organization_name varchar(45),
	role_position varchar(45),
	start_date date,
	end_date date,
	role_description text,    
	user_id int,
	organization_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id),
	PRIMARY KEY(organization_role_id)
);

CREATE TABLE CERTIFICATE(
	certificate_id int,
	cerfiticate_name varchar(45),
	issue_date date,
	expiration_date date,
	certificate_url varchar (255),
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id),
	PRIMARY KEY(certificate_id)
);

CREATE TABLE ABILITY(
	ability_name varchar(45),

	PRIMARY KEY(ability_name)
);

CREATE TABLE JOB_OFFER(
	job_offer_id int,
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
	
CREATE TABLE L_GROUP(
	group_id int,
	privacy_type varchar(45),
	group_name varchar(45),
	about text,
	group_rules text,
	media_id int,
	community_id int,

	FOREIGN KEY(media_id) REFERENCES MEDIA(media_id) ON UPDATE CASCADE ON DELETE SET NULL,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(group_id)
);
	
CREATE TABLE LIKEABLE_OBJECT(	
	likeable_object_id int,

	PRIMARY KEY(likeable_object_id)
);

CREATE TABLE L_STATUS(
	status_id int,
	status_text text,
	like_count int DEFAULT 0,
	media_id int,
	shared_status_id int,
	profile_id int,
	likeable_object_id int,

	FOREIGN KEY(media_id) REFERENCES MEDIA(media_id),
	FOREIGN KEY(shared_status_id) REFERENCES L_STATUS(status_id),
	FOREIGN KEY(profile_id) REFERENCES L_PROFILE(profile_id),
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id),
	PRIMARY KEY(status_id)
);
	
CREATE TABLE HAS_ABILITY(
	ability_name varchar(45),
	user_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(ability_name, user_id)
);
	
CREATE TABLE APPLY(
	user_id int,
	job_offer_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(job_offer_id) REFERENCES JOB_OFFER(job_offer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, job_offer_id)
);

CREATE TABLE AUTHOR(
	user_id int,
	publication_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id),
	FOREIGN KEY(publication_id) REFERENCES PUBLICATION(publication_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, publication_id)
);
	
CREATE TABLE PROJECT_CREATE(
	user_id int,
	project_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(project_id) REFERENCES PROJECT(project_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, project_id)
);
	
CREATE TABLE TAKE(
	user_id int,
	course_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(course_id) REFERENCES COURSE(course_id) ON UPDATE CASCADE ON DELETE CASCADEe,
	PRIMARY KEY(user_id, course_id)
);

CREATE TABLE FOLLOW(
	user_id int,
	organization_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, organization_id)
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

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, organization_id)
);

CREATE TABLE MEMBER_OF(
	user_id int,
	group_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(group_id) REFERENCES L_GROUP(group_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, group_id)
);
	
CREATE TABLE HAS_CERTIFICATE(
	user_id int,
	certificate_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(certificate_id) REFERENCES CERTIFICATE(certificate_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, certificate_id)
);
	 
CREATE TABLE MESSAGE(
	sender_user_id int,
	receiver_user_id int,
	message_id int,
	message text,
	message_datetime datetime DEFAULT CURRENT_TIMESTAMP,

	FOREIGN KEY(sender_user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(receiver_user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(sender_user_id, receiver_user_id, message_id)
);
	
CREATE TABLE L_CONNECT(
	user_id int,
	connect_with_user_id int,
	beginning_date date,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id ) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(connect_with_user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,connect_with_user_id)
);
	
CREATE TABLE CONFIRM(
	confirmer_id int,
	ability_name varchar(45),
	confirmed_user_id int,

	FOREIGN KEY(confirmer_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(ability_name) REFERENCES HAS_ABILITY(ability_name) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(confirmed_user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(confirmer_id, ability_name, confirmed_user_id)
);
	
CREATE TABLE HAS_LANGUAGE(
	user_id int,
	language_name varchar(45),

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(language_name) REFERENCES L_LANGUAGE(language_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id, language_name)
);
	
CREATE TABLE INVENTS(
	user_id int,
	patent_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(patent_id) REFERENCES PATENT(patent_id) ON UPDATE CASCADE ON DELETE CASCADE, 
	PRIMARY KEY(user_id, patent_id)
);
	
CREATE TABLE HAS_LOCATION(
	organization_id int,
	location_id int,

	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(location_id) REFERENCES LOCATION(location_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(organization_id, location_id)
);
	
CREATE TABLE ASK(
	job_offer_id int,
	ability_name varchar(45),

	FOREIGN KEY(job_offer_id) REFERENCES JOB_OFFER(job_offer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(ability_name) REFERENCES ABILITY(ability_name) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(job_offer_id, ability_name)
);
	
CREATE TABLE SHARE_IN_GROUPS(
	user_id int,
	group_id int,
	status_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(group_id) REFERENCES L_GROUP(group_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(status_id) REFERENCES L_STATUS(status_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,group_id,status_id)
);
	
CREATE TABLE PUBLISH_OFFER(
	user_id int,
	organization_id int,
	job_offer_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(job_offer_id) REFERENCES JOB_OFFER(job_offer_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,organization_id,job_offer_id)
);
	
CREATE TABLE SCHOOL(
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(organization_id)
);
	
CREATE TABLE COMPANY(
	organization_id int,

	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(organization_id)
);

CREATE TABLE MANAGES(
	user_id int,
	community_id int,

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(community_id) REFERENCES COMMUNITY(community_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,community_id)
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

	FOREIGN KEY(user_id) REFERENCES L_USER(user_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(organization_id) REFERENCES L_ORGANIZATION(organization_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(user_id,organization_id)
);

CREATE TABLE L_COMMENT(
	profile_id int,
	status_id int,
	comment_id int,
	comment_text text,
	like_count int DEFAULT 0,	
	likeable_object_id int,

	FOREIGN KEY(profile_id) REFERENCES L_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(status_id) REFERENCES L_STATUS(status_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,status_id,comment_id)
);

 CREATE TABLE L_LIKE(	
	profile_id int,
	likeable_object_id int,

	FOREIGN KEY(profile_id) REFERENCES L_PROFILE(profile_id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY(likeable_object_id) REFERENCES LIKEABLE_OBJECT(likeable_object_id) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY(profile_id,likeable_object_id)
);
