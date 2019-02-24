USE SOCIAL;
SET SQL_SAFE_UPDATES = 0;
UPDATE s_page SET page_name="Pizza Pizza" WHERE page_name="PizzaPizza";
UPDATE s_user SET user_password="metinali123" WHERE fname="Ali";
UPDATE patent SET patent_status="on demand" WHERE patent_id=17001;

DELETE FROM location WHERE zipcode=35100;
DELETE FROM media WHERE media_id=2001;
DELETE FROM city WHERE city_name="Moscow";
