USE FACEBOOK;
SET SQL_SAFE_UPDATES = 0;
UPDATE f_user SET activeness=false WHERE user_id=4001;
UPDATE application SET application_name="facebook" WHERE application_name="fcebook";
UPDATE f_page SET username="monica42" WHERE username="monica";

DELETE FROM f_like WHERE profile_id=3001;
DELETE FROM likeable_object WHERE likeable_object_id=6006;
DELETE FROM other_accounts WHERE profile_id=3001;
