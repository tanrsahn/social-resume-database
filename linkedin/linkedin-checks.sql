DELIMITER |
CREATE TRIGGER fri_count BEFORE INSERT ON `l_connect`
FOR EACH ROW
BEGIN
	IF (SELECT friend_count FROM l_user WHERE f_user.user_id=NEW.user_id)>1000 OR
	   (SELECT friend_count FROM l_user WHERE f_user.user_id=NEW.connect_with_user_id)>1000
	THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Arkadaş sayısı 1000\'den fazla olamaz';
	END IF;
END|  
DELIMITER ;

DELIMITER |
CREATE TRIGGER connect_exist BEFORE INSERT ON `l_connect`
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT * FROM l_connect WHERE l_connect.user_id=NEW.connect_with_user_id AND l_connect.connect_with_user_id=NEW.user_id)
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
			NEW.user_id=member_of.user_id AND
			NEW.community_id=(
				SELECT community_id 
				FROM l_group 
				WHERE member_of.group_id=l_group.group_id
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
    IF NEW.sender_user_id=NEW.receiver_user_id
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
		SELECT count(*)
		FROM l_group
        WHERE l_group.group_id=NEW.group_id
		GROUP BY l_group.group_id
        )>300
	THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'Kullanıcı 300 den fazla gruba katılamaz';
	END IF;
END|   
DELIMITER ;
