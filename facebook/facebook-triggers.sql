DROP TRIGGER IF EXISTS ins_like;
DELIMITER |
CREATE TRIGGER ins_like AFTER INSERT ON f_like
FOR EACH ROW BEGIN 
	UPDATE f_status SET like_count=like_count+1 WHERE likeable_object_id=NEW.likeable_object_id; 
	UPDATE f_page SET like_count=like_count+1 WHERE likeable_object_id=NEW.likeable_object_id;
	UPDATE f_comment SET like_count=like_count+1 WHERE likeable_object_id=NEW.likeable_object_id; 
END|
DELIMITER ;

DROP TRIGGER IF EXISTS del_like;
DELIMITER |
CREATE TRIGGER del_like AFTER DELETE ON f_like
FOR EACH ROW BEGIN 
	UPDATE f_status SET like_count=like_count-1 WHERE likeable_object_id=OLD.likeable_object_id; 
	UPDATE f_page SET like_count=like_count-1 WHERE likeable_object_id=OLD.likeable_object_id;
	UPDATE f_comment SET like_count=like_count-1 WHERE likeable_object_id=OLD.likeable_object_id; 
END|
DELIMITER ;

DROP TRIGGER IF EXISTS ins_friend;
DELIMITER |
CREATE TRIGGER ins_friend AFTER INSERT ON friends_with
FOR EACH ROW BEGIN 
	UPDATE f_user SET friend_count=friend_count+1 WHERE f_user.user_id=NEW.user_id;
	UPDATE f_user SET friend_count=friend_count+1 WHERE f_user.user_id=NEW.friends_user_id;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS del_friend;
DELIMITER |
CREATE TRIGGER del_friend AFTER DELETE ON friends_with
FOR EACH ROW BEGIN 
	UPDATE f_user SET friend_count=friend_count-1 WHERE f_user.user_id=OLD.user_id;
	UPDATE f_user SET friend_count=friend_count-1 WHERE f_user.user_id=OLD.friends_user_id;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_likeable_status;
DELIMITER |
CREATE TRIGGER auto_likeable_status BEFORE INSERT ON f_status
FOR EACH ROW BEGIN 
	IF NEW.likeable_object_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='likeable_object' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO likeable_object VALUES(NULL);
    		SET NEW.likeable_object_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_likeable_page;
DELIMITER |
CREATE TRIGGER auto_likeable_page BEFORE INSERT ON f_page
FOR EACH ROW BEGIN 
	IF NEW.likeable_object_id IS NULL
	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='likeable_object' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO likeable_object VALUES(NULL);
    		SET NEW.likeable_object_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_likeable_comment;
DELIMITER |
CREATE TRIGGER auto_likeable_comment BEFORE INSERT ON f_comment
FOR EACH ROW BEGIN 
	IF NEW.likeable_object_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='likeable_object' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO likeable_object VALUES(NULL);
    		SET NEW.likeable_object_id=@auto_id;
	END IF;    
END|
DELIMITER ;


DROP TRIGGER IF EXISTS auto_community_page;
DELIMITER |
CREATE TRIGGER auto_community_page BEFORE INSERT ON f_page
FOR EACH ROW BEGIN 
	IF NEW.community_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='community' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO community VALUES(NULL);
    		SET NEW.community_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_community_group;
DELIMITER |
CREATE TRIGGER auto_community_group BEFORE INSERT ON f_group
FOR EACH ROW BEGIN 
	IF NEW.community_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='community' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO community VALUES(NULL);
    		SET NEW.community_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_community_event;
DELIMITER |
CREATE TRIGGER auto_community_event BEFORE INSERT ON f_event
FOR EACH ROW BEGIN 
	IF NEW.community_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='community' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO community VALUES(NULL);
    		SET NEW.community_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_profile_page;
DELIMITER |
CREATE TRIGGER auto_profile_page BEFORE INSERT ON f_page
FOR EACH ROW BEGIN 
	IF NEW.profile_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='f_profile' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO f_profile VALUES(NULL);
    		SET NEW.profile_id=@auto_id;
	END IF;
END|
DELIMITER ;

DROP TRIGGER IF EXISTS auto_profile_user;
DELIMITER |
CREATE TRIGGER auto_profile_user BEFORE INSERT ON f_user
FOR EACH ROW BEGIN 
	IF NEW.profile_id IS NULL
    	THEN
		SET @auto_id := (SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES
				 WHERE TABLE_NAME='f_profile' AND TABLE_SCHEMA=DATABASE()); 
		INSERT INTO f_profile VALUES(NULL);
    		SET NEW.profile_id=@auto_id;
	END IF;
END|
DELIMITER ;
