USE FACEBOOK;

#Query-1
SELECT fname,mname,lname,EXTRACT(YEAR FROM CURRENT_TIMESTAMP)-EXTRACT(YEAR FROM birth_date)
	FROM f_user
	WHERE EXTRACT(YEAR FROM CURRENT_TIMESTAMP)-EXTRACT(YEAR FROM birth_date)>20;
    
#Query-2
SELECT pname, company_date
	FROM f_page 
	WHERE EXTRACT(YEAR FROM company_date) BETWEEN 2000 AND 2005;
    
#Query-3
SELECT group_name
	FROM f_group
	WHERE group_name LIKE "%python%";
    
#Query-4
SELECT user_id, status_id, comment_id, comment_text
FROM f_comment JOIN f_user
	ON f_comment.profile_id=f_user.profile_id
WHERE user_id=4001;

#Query-5
SELECT a.application_name,MAX(a.ct)
	FROM
	(SELECT application_name,COUNT(*) AS ct
	FROM uses_application JOIN application
		ON uses_application.application_id=application.application_id
	GROUP BY application.application_id) AS a;

#Query-6
SELECT a.profil,album_sayisi
FROM
	(SELECT f_page.profile_id AS profil, COUNT(*) AS album_sayisi
	FROM album JOIN f_page
		ON album.profile_id=f_page.profile_id
	GROUP BY f_page.profile_id) AS a
WHERE album_sayisi>1;

#Query-7
SELECT gonderici.fname,gonderici.lname,message.message,alici.fname,alici.lname
FROM message
	JOIN f_user AS gonderici
		ON message.sender_profile_id=gonderici.profile_id
    JOIN f_user AS alici
		ON message.receiver_profile_id=alici.profile_id;

#Query-8
SELECT a.page_id
FROM
	(SELECT page_id,manages.community_id AS com_id
	FROM manages JOIN f_page
		ON f_page.profile_id=manages.profile_id) AS a
	JOIN attends
    ON (SELECT event_id FROM f_event WHERE community_id=a.com_id)=attends.event_id
WHERE attends.user_id=4001;

#Query-9
SELECT a.isim name,MAX(kisi)
	FROM
	(SELECT f_event.event_name AS isim,COUNT(*) AS kisi 
	FROM f_user,attends,f_event 
	WHERE f_user.user_id=attends.user_id AND attends.event_id=f_event.event_id AND 
		EXTRACT(YEAR FROM CURRENT_TIMESTAMP)-EXTRACT(YEAR FROM birth_date) BETWEEN 18 AND 30 
	GROUP BY f_event.event_name) AS a;

#Query-10
SELECT sokak,MAX(event_sayisi)
FROM
	(SELECT location.street AS sokak,COUNT(*) AS event_sayisi
	FROM attends JOIN f_event
		ON attends.event_id=f_event.event_id
	JOIN location
		ON f_event.location_id=location.location_id
	GROUP BY location.street) AS a
