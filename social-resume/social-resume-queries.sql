USE SOCIAL;

#Query-1
SELECT s_page.e_mail
FROM s_page
WHERE s_page.page_category_name="school";
	
#Query-2
SELECT s_group.group_name
FROM s_group
WHERE privacy_type="unlisted";

#Query-3
SELECT gender,COUNT(*) AS kisi_sayisi
FROM s_user
WHERE user_type="premium"
GROUP BY gender;

#Query-4
SELECT organizatiON_name
FROM s_user JOIN organizatiON_role ON s_user.user_id=organizatiON_role.user_id
WHERE gender="F";

#Query-5
SELECT a.sayi
FROM (SELECT COUNT(*) AS sayi
	FROM author JOIN s_user ON author.user_id=s_user.user_id
	WHERE EXTRACT(YEAR FROM s_user.birth_date) BETWEEN 1990 AND 2000
	GROUP BY author.user_id) AS a;
		
#Query-6
SELECT a.sektor,max(kisi)
FROM (SELECT s_organization.sector AS sektor ,COUNT(*) AS kisi
	FROM works_on JOIN s_organization ON works_on.organization_id=s_organization.organization_id
	GROUP BY works_on.organization_id) AS a;
	
#Query-7
SELECT publication.organization_id,sector
FROM publication JOIN s_organization ON publication.organization_id=s_organization.organization_id;
		
#Query-9
SELECT group_name
FROM s_user JOIN member_of ON s_user.profile_id=member_of.profile_id
	JOIN s_group ON member_of.group_id=s_group.group_id
WHERE user_type="premium";
	
#Query-10
SELECT a.country_name,max(a.sayi)
FROM (SELECT patent.country_name,COUNT(*) AS sayi
	FROM invents JOIN s_user ON invents.user_id=s_user.user_id
		JOIN patent ON patent.patent_id=invents.patent_id
	WHERE gender="F"
	GROUP BY patent.country_name) AS a;
