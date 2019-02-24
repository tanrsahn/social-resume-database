USE SOCIAL;
DELIMITER |
CREATE TRIGGER fri_count BEFORE INSERT ON `friends_with`
FOR EACH ROW
BEGIN
    	IF (SELECT friend_count FROM s_user WHERE s_user.user_id=NEW.user_id)>1000 OR
	   (SELECT friend_count FROM s_user WHERE s_user.user_id=NEW.friends_user_id)>1000
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Arkadaş sayısı 1000\'den fazla olamaz';
	END IF;
END|  
DELIMITER ;

DELIMITER |
CREATE TRIGGER fri_exist BEFORE INSERT ON `friends_with`
FOR EACH ROW
BEGIN
    	IF EXISTS (SELECT * FROM friends_with WHERE friends_with.user_id=NEW.friends_user_id AND friends_with.friends_user_id=NEW.user_id)
	THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Arkadaşlık zaten mevcut';
	END IF;
END|   
DELIMITER ;  

DELIMITER |
CREATE TRIGGER manager_in_group BEFORE INSERT ON `manages`
FOR EACH ROW
BEGIN
    	IF EXISTS(
		SELECT *
		FROM member_of
		WHERE 
			NEW.profile_id=member_of.profile_id AND
			NEW.community_id=(
				SELECT community_id 
				FROM s_group 
				WHERE member_of.group_id=s_group.group_id
			)
	)THEN
		SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'Grupta olmayan kişi yöneticilik yapamaz';
	END IF;
END|   
DELIMITER ;

DELIMITER |
CREATE TRIGGER recursive_message BEFORE INSERT ON `message`
FOR EACH ROW
BEGIN
    	IF NEW.sender_profile_id=NEW.receiver_profile_id
	THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Kullanıcı kendisine mesaj yollayamaz';
	END IF;
END|   
DELIMITER ;

DELIMITER |
CREATE TRIGGER group_count BEFORE INSERT ON `member_of`
FOR EACH ROW
BEGIN
    	IF (
		SELECT COUNT(*)
		FROM member_of
        	WHERE NEW.group_id=member_of.group_id
		GROUP BY member_of.profile_id)>300
	THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Kullanıcı 300 den fazla gruba katılamaz';
	END IF;
END|   
DELIMITER ;
