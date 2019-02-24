USE linkedin;
SET SQL_SAFE_UPDATES = 0;
UPDATE l_user SET user_type="free" WHERE fname="Ali";
UPDATE l_status SET status_text="değişmiş text" WHERE status_id=9001;
UPDATE manages SET user_id=4002 WHERE user_id=4001;

DELETE FROM l_profile WHERE profile_id=3002;
DELETE FROM l_like WHERE profile_id=3002;
DELETE FROM city WHERE city_name="Moscow";
