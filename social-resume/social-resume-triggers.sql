DROP TRIGGER IF EXISTS ins_like;
DELIMITER |
CREATE TRIGGER ins_like AFTER INSERT ON s_like
FOR EACH ROW BEGIN 
	UPDATE s_status SET like_count=like_count+1 WHERE likeable_object_id=NEW.likeable_object_id; 
	UPDATE s_page SET like_count=like_count+1 WHERE likeable_object_id=NEW.likeable_object_id;
	UPDATE s_comment SET like_count=like_count+1 WHERE likeable_object_id=NEW.likeable_object_id; 
END|
DELIMITER ;

DROP TRIGGER IF EXISTS del_like;
DELIMITER |
CREATE TRIGGER del_like AFTER DELETE ON s_like
FOR EACH ROW BEGIN 
	UPDATE s_status SET like_count=like_count-1 WHERE likeable_object_id=OLD.likeable_object_id; 
	UPDATE s_page SET like_count=like_count-1 WHERE likeable_object_id=OLD.likeable_object_id;
	UPDATE s_comment SET like_count=like_count-1 WHERE likeable_object_id=OLD.likeable_object_id; 
END|
DELIMITER ;

DROP TRIGGER IF EXISTS ins_friend;
DELIMITER |
CREATE TRIGGER ins_friend AFTER INSERT ON friends_with
FOR EACH ROW BEGIN 
	UPDATE s_user SET friend_count=friend_count+1 WHERE f_user.user_id=NEW.user_id;
	UPDATE s_user SET friend_count=friend_count+1 WHERE f_user.user_id=NEW.friends_user_id;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS del_friend;
DELIMITER |
CREATE TRIGGER del_friend AFTER DELETE ON friends_with
FOR EACH ROW BEGIN 
	UPDATE s_user SET friend_count=friend_count-1 WHERE s_user.user_id=OLD.user_id;
	UPDATE s_user SET friend_count=friend_count-1 WHERE s_user.user_id=OLD.friends_user_id;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_likeable_status;
DELIMITER |
CREATE TRIGGER auto_likeable_status BEFORE INSERT ON s_status
FOR EACH ROW BEGIN 
	IF NEW.likeable_object_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='likeable_object' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO likeable_object VALUES(null);
    		SET NEW.likeable_object_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_likeable_page;
DELIMITER |
CREATE TRIGGER auto_likeable_page BEFORE INSERT ON s_page
FOR EACH ROW BEGIN 
	IF NEW.likeable_object_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='likeable_object' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO likeable_object VALUES(null);
    		SET NEW.likeable_object_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_likeable_comment;
DELIMITER |
CREATE TRIGGER auto_likeable_comment BEFORE INSERT ON s_comment
FOR EACH ROW BEGIN 
	IF NEW.likeable_object_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='likeable_object' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO likeable_object VALUES(null);
    		SET NEW.likeable_object_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_community_page;
DELIMITER |
CREATE TRIGGER auto_community_page BEFORE INSERT ON s_page
FOR EACH ROW BEGIN 
	IF NEW.community_id IS NULL
	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='community' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO community VALUES(null);
		SET NEW.community_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_community_group;
DELIMITER |
CREATE TRIGGER auto_community_group BEFORE INSERT ON s_group
FOR EACH ROW BEGIN 
	IF NEW.community_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='community' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO community VALUES(null);
    		SET NEW.community_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_community_event;
DELIMITER |
CREATE TRIGGER auto_community_event BEFORE INSERT ON s_event
FOR EACH ROW BEGIN 
	IF NEW.community_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='community' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO community VALUES(null);
    		SET NEW.community_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_profile_page;
DELIMITER |
CREATE TRIGGER auto_profile_page BEFORE INSERT ON s_page
FOR EACH ROW BEGIN 
	IF NEW.profile_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='s_profile' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO s_profile VALUES(null);
    		SET NEW.profile_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_profile_user;
DELIMITER |
CREATE TRIGGER auto_profile_user BEFORE INSERT ON s_user
FOR EACH ROW BEGIN 
	IF NEW.profile_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='s_profile' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO s_profile VALUES(null);
    		SET NEW.profile_id=@auto_id;
	END IF;
END|
DELIMITER ;
