USE LINKEDIN;

#Query-1
SELECT *
FROM l_user
WHERE user_type="premium";

#Query-2
SELECT *
FROM l_organization
WHERE employee_count>100;

#Query-3
SELECT *
FROM l_group
WHERE group_name LIKE "%python%";

#Query-4
SELECT max(kisi_sayisi),a.country_name
FROM(SELECT COUNT(*) AS kisi_sayisi,country_name
		FROM l_user JOIN location ON l_user.location_id=location.location_id
		GROUP BY country_name) AS a;

#Query-5
SELECT fname,mname,lname,title
FROM honor_and_award JOIN l_user ON l_user.user_id=honor_and_award.user_id
WHERE l_user.user_type="premium";

#Query-6
SELECT fname,mname,lname,role_position
FROM l_user JOIN organization_role ON l_user.user_id=organization_role.user_id
WHERE l_user.gender="F";
    
#Query-7
SELECT AVG(a.sayi)
FROM (SELECT COUNT(*) AS sayi
		FROM author JOIN l_user ON l_user.user_id=author.user_id
		WHERE EXTRACT(YEAR FROM l_user.birth_date) <2000
		GROUP BY author.user_id) AS a;
        
#Query-8
SELECT son.phone
FROM course JOIN take ON course.course_id=take.course_id 
	JOIN l_user AS son ON son.user_id=take.user_id
WHERE course.organization_id=
	(SELECT organization_id
		FROM works_on JOIN l_user
			ON works_on.user_id=l_user.user_id
		WHERE works_on.end_date=null AND fname="Ali" AND mname="Metin" AND lname="Korkmaz");

#Query-9
SELECT course_name
FROM course
WHERE course.organization_id=
	 (SELECT a.id FROM           
		(SELECT MAX(studies.start_date),studies.organization_id AS id
			FROM studies JOIN l_user
				ON studies.user_id=l_user.user_id
			WHERE fname="Ali" AND mname="Metin" AND lname="Korkmaz") AS a);

#Query-10
SELECT fname,mname,lname,course_name
FROM l_user JOIN take ON take.user_id=l_user.user_id 
	JOIN course ON take.course_id=course.course_id
WHERE gender="M";
