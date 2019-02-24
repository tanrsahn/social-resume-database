USE LINKEDIN;

INSERT INTO MEDIA VALUES(1001,"https://picsum.photos/SaatKulesi");
INSERT INTO MEDIA VALUES(1002,"https://picsum.photos/WembleyStadium");
INSERT INTO MEDIA VALUES(1003,"https://picsum.photos/PizzaPizza");
INSERT INTO MEDIA VALUES(1004,"https://picsum.photos/ElToro");
INSERT INTO MEDIA VALUES(1005,"https://picsum.photos/Students");
INSERT INTO MEDIA VALUES(1006,"https://picsum.photos/burger");
INSERT INTO MEDIA VALUES(1007,"https://picsum.photos/cats");
INSERT INTO MEDIA VALUES(1008,"https://picsum.photos/banananana");
INSERT INTO MEDIA VALUES(1009,"https://picsum.photos/snow");
INSERT INTO MEDIA VALUES(1010,"https://picsum.photos/egeuni");
INSERT INTO MEDIA VALUES(1011,"https://picsum.photos/python");
INSERT INTO MEDIA VALUES(1012,"https://picsum.photos/yapayzeka");
INSERT INTO MEDIA VALUES(1013,"https://picsum.photos/yoyoplay");
INSERT INTO MEDIA VALUES(1014,"https://picsum.photos/dbadmin");
INSERT INTO MEDIA VALUES(1015,"https://picsum.photos/wands");

INSERT INTO L_PROFILE VALUES(2001,1001,1001);
INSERT INTO L_PROFILE VALUES(2002,1002,1002);
INSERT INTO L_PROFILE VALUES(2003,1003,1003);
INSERT INTO L_PROFILE VALUES(2004,1004,1004);
INSERT INTO L_PROFILE VALUES(2005,1005,1005);
INSERT INTO L_PROFILE VALUES(2006,1006,1006);
INSERT INTO L_PROFILE VALUES(2007,1007,1007);
INSERT INTO L_PROFILE VALUES(2008,1008,1008);
INSERT INTO L_PROFILE VALUES(2009,1009,1009);
INSERT INTO L_PROFILE VALUES(2010,1010,1010);
INSERT INTO L_PROFILE VALUES(2011,1011,1011);
INSERT INTO L_PROFILE VALUES(2012,1012,1012);
INSERT INTO L_PROFILE VALUES(2013,1013,1013);
INSERT INTO L_PROFILE VALUES(2014,1014,1014);
INSERT INTO L_PROFILE VALUES(2015,1015,1015);

INSERT INTO COUNTRY VALUES("Turkey");
INSERT INTO COUNTRY VALUES("England");
INSERT INTO COUNTRY VALUES("Italy");
INSERT INTO COUNTRY VALUES("Spain");
INSERT INTO COUNTRY VALUES("Poland");
INSERT INTO COUNTRY VALUES("Ukraine");
INSERT INTO COUNTRY VALUES("Finland");
INSERT INTO COUNTRY VALUES("Japan");
INSERT INTO COUNTRY VALUES("Korea");
INSERT INTO COUNTRY VALUES("Russia");
INSERT INTO COUNTRY VALUES("Hungary");

INSERT INTO CITY VALUES("Turkey","İzmir");
INSERT INTO CITY VALUES("Turkey","İstanbul");
INSERT INTO CITY VALUES("England","Liverpool");
INSERT INTO CITY VALUES("Italy","Rome");
INSERT INTO CITY VALUES("Spain","Madrid");
INSERT INTO CITY VALUES("Poland","Krakow");
INSERT INTO CITY VALUES("Ukraine","Kiev");
INSERT INTO CITY VALUES("Japan","Tokio");
INSERT INTO CITY VALUES("Finland","Helsinki");
INSERT INTO CITY VALUES("Russia","Moscow");
INSERT INTO CITY VALUES("Korea","Seul");
INSERT INTO CITY VALUES("Hungary","Budapest");

INSERT INTO LOCATION VALUES(3001,35100,"Kazım Dirik Neighboorhoog","372. street",9,"Öğrenci köyü","Turkey","İzmir");
INSERT INTO LOCATION VALUES(3002,90000,"Abraham Lake","122. street",11,"Next to Stadium","England","Liverpool");
INSERT INTO LOCATION VALUES(3003,80000,"Papa John's","45. street",13,"Across the Museum","Italy","Rome");
INSERT INTO LOCATION VALUES(3004,40000,"Marco de Sol","372. street",9,"By the Arena","Spain","Madrid");
INSERT INTO LOCATION VALUES(3005,75500,"St. Lucas","85. street",34,"Behind of The Church","Poland","Krakow");
INSERT INTO LOCATION VALUES(3006,34000,"Cihangir","34. street",42,"Cami Karşısı","Turkey","İstanbul");
INSERT INTO LOCATION VALUES(3007,35100,"Pelican Valley","Alpha Avenue",15,null,"Finland","Helsinki");
INSERT INTO LOCATION VALUES(3008,36521,"Naruto Orochimaru","23. street",43,null,"Japan","Tokio");
INSERT INTO LOCATION VALUES(3009,75757,"Peachy Neighboorhood","32. street",23,null,"Korea","Seul");
INSERT INTO LOCATION VALUES(3010,32145,"Motherland Neighboorhood","25. street",93,null,"Ukraine","Kiev");

INSERT INTO L_USER VALUES(4001,"busifre","Ali","Metin","Korkmaz","M","905001220121","ali@gmail.com",default,"premium",0,"1995-02-22",3001,2001);
INSERT INTO L_USER VALUES(4002,"password","Harry","James","Potter","M","632150021425","harrypotter@gmail.com",default,"free",0,"1990-06-16",3002,2002);
INSERT INTO L_USER VALUES(4003,"pizzaword","Bellima","Selina","Attenzione","F","85362152654","msattenzione@gmail.com",default,"premium",0,"1975-05-05",3003,2003);
INSERT INTO L_USER VALUES(4004,"bullpasword","Sergio","Gonzales","Ramos","M","3654182542","sergioramos@gmail.com",default,"free",0,"1998-02-12",3004,2004);
INSERT INTO L_USER VALUES(4005,"plkrakow","Nicole","Maria","Warsawian","M","3654182542","marianic@gmail.com",default,"premium",0,"1999-10-05",3005,2005);
INSERT INTO L_USER VALUES(4006,"alfaomega1","Melisa","Ayşe","Korkmaz","F","541865475","melisa@gmail.com",default,"free",0,"1982-12-14",3006,2006);
INSERT INTO L_USER VALUES(4007,"54jane54","Mary","Jane","Finnishson","F","25484652","mjfinnish@gmail.com",default,"free",0,"1987-05-05",3007,2007);
INSERT INTO L_USER VALUES(4008,"anime3","Sasuke","Itachi","Uchiha","M","2525451563","sasuke@gmail.com",default,"free",0,"1990-06-05",3008,2008);
INSERT INTO L_USER VALUES(4009,"school","Mehmet","Akif","Ersoy","M","5241532654","mehmetakif@gmail.com",default,"premium",0,"1975-01-05",3006,2013);

INSERT INTO MESSAGE VALUES(4001,4002,5001,"hi, can i get some info about job?", default);
INSERT INTO MESSAGE VALUES(4002,4001,5002,"yes it's about coding databases", default);
INSERT INTO MESSAGE VALUES(4001,4002,5003,"Sounds interesting.", default);
INSERT INTO MESSAGE VALUES(4003,4004,5004,"Hey are you coming tomorrow?", default);
INSERT INTO MESSAGE VALUES(4003,4004,5005,"For the training", default);
INSERT INTO MESSAGE VALUES(4004,4003,5006,"Yess i'm excited", default);

INSERT INTO COMMUNITY VALUES(5001,4001);
INSERT INTO COMMUNITY VALUES(5002,4001);
INSERT INTO COMMUNITY VALUES(5003,4002);
INSERT INTO COMMUNITY VALUES(5004,4003);
INSERT INTO COMMUNITY VALUES(5005,4005);
INSERT INTO COMMUNITY VALUES(5006,4006);
INSERT INTO COMMUNITY VALUES(5007,4008);
INSERT INTO COMMUNITY VALUES(5008,4009);

INSERT INTO L_ORGANIZATION VALUES(6001,"LOGO Yazılım",1,"Yazılım Şirketi","İstanbul","www.logo.com","Software","2002-12-03","Software development","Company",5001,2009);
INSERT INTO L_ORGANIZATION VALUES(6002,"Magic is Real",1,"Company that sells Harry Potter things","London","www.harrypotter.com","Commerce","2004-06-10","Trade","Company",5002,2010);
INSERT INTO L_ORGANIZATION VALUES(6003,"PizzaPizza",1,"Best Pizza You'll Ever Eat","Rome","www.pizzapizza.com","Food","1996-11-08","Restaurant","Company",5003,2011);
INSERT INTO L_ORGANIZATION VALUES(6004,"Arena Madrid",1,"Great Arena in the center of Madrid","Madrid","www.arenamadrid.com","Entertainment","1985-08-07","Stadium","Company",5004,2012);
INSERT INTO L_ORGANIZATION VALUES(6005,"Şahin Üniversitesi",1,"Teaches the Future","İstanbul","www.sahinuni.org","Education","1995-01-01","Education","School",5008,2014);

INSERT INTO LIKEABLE_OBJECT VALUES(7001);
INSERT INTO LIKEABLE_OBJECT VALUES(7002);
INSERT INTO LIKEABLE_OBJECT VALUES(7003);
INSERT INTO LIKEABLE_OBJECT VALUES(7004);
INSERT INTO LIKEABLE_OBJECT VALUES(7005);
INSERT INTO LIKEABLE_OBJECT VALUES(7006);
INSERT INTO LIKEABLE_OBJECT VALUES(7007);
INSERT INTO LIKEABLE_OBJECT VALUES(7008);
INSERT INTO LIKEABLE_OBJECT VALUES(7009);
INSERT INTO LIKEABLE_OBJECT VALUES(7010);
INSERT INTO LIKEABLE_OBJECT VALUES(7011);
INSERT INTO LIKEABLE_OBJECT VALUES(7012);
INSERT INTO LIKEABLE_OBJECT VALUES(7013);

INSERT INTO L_GROUP VALUES(8001,"Standart","Polish Python Team","uczyć się python","No rude people, We are here to learn",null,5005);
INSERT INTO L_GROUP VALUES(8002,"Standart","C Severler","C öğreniyoruz","Kaba ve öğrenmek istemeyen insanlar için değildir", null,5006);
INSERT INTO L_GROUP VALUES(8003,"Unlisted","Anime and More","Perfect group for anime and manga followers","Everyone is welcome",null,5007);

INSERT INTO MANAGES VALUES(4008,5007);

INSERT INTO MEMBER_OF VALUES(4008,8003);
INSERT INTO MEMBER_OF VALUES(4001,8003);
INSERT INTO MEMBER_OF VALUES(4002,8003);
INSERT INTO MEMBER_OF VALUES(4003,8003);
INSERT INTO MEMBER_OF VALUES(4004,8003);

INSERT INTO L_STATUS VALUES(9001,"Logo yazılımdan bir yenilik daha!",0,null,null,2001,7001);
INSERT INTO L_STATUS VALUES(9002,"Logo çığır açıyor!",0,null,null,2001,7002);
INSERT INTO L_STATUS VALUES(9003,"Have you seen the new wands?",0,1015,null,2002,7003);
INSERT INTO L_STATUS VALUES(9004,"How to cook the best pizza?",0,null,null,2003,7001);
INSERT INTO L_STATUS VALUES(9005,"You wont believe what happened!",0,null,null,2004,7001);

INSERT INTO WORKS_ON VALUES(4001,6001,"Fulltime","2000-06-01",null,"Java Developer","Software","Java kodu yazma ve geliştirme");
INSERT INTO WORKS_ON VALUES(4002,6002,"Parttime","2005-07-01",null,"Manager","Commerce","Managment of the Store");
INSERT INTO WORKS_ON VALUES(4003,6003,"Fulltime","2012-11-05",null,"Head Chef","Food","Cooking Pizza");
INSERT INTO WORKS_ON VALUES(4004,6004,"Parttime","196-03-01",null,"Matador","Entertainment","Seyircilere şov sunmak");

INSERT INTO L_COMMENT VALUES(2001,9001,10001,"Heyecanla bekliyoruz!",0,7009);
INSERT INTO L_COMMENT VALUES(2002,9001,10002,"İnanılmaz umarım yakında kullanabiliriz",0,7010);
INSERT INTO L_COMMENT VALUES(2003,9004,10003,"Seems delicious!",default,7011);
INSERT INTO L_COMMENT VALUES(2005,9005,10004,"Wow amazing",default,7012);

INSERT INTO HONOR_AND_AWARD VALUES(11001,"En iyi Girişimci Ödülü-2018","LOGO Yazılım","2018-11-02","Üstün girişimcilik başarılarından dolayı takdim eidlmiştir.",4001,6001);
INSERT INTO HONOR_AND_AWARD VALUES(11002,"Best Sellerman Of UK","Magic is Real","2016-02-05","Made the best sells of 2015-2016",4002,6002);
INSERT INTO HONOR_AND_AWARD VALUES(11003,"Best Pizza Chef", "PizzaPizza","2017-05-06","Cooked the best pizzas of 2017",4003,6003);

INSERT INTO ORGANIZATION_ROLE VALUES(12001,"TUGVA","Gönüllü","2016-01-01",null,"gençlere kod eğitimi verilmesinde gönüllü görev aldı.",4001,null);
INSERT INTO ORGANIZATION_ROLE VALUES(12002,"Kızılay","Kan Bağışçısı","2002-01-01",null,"Düzenli kan bağışçısı",4006,null);
INSERT INTO ORGANIZATION_ROLE VALUES(12003,"PizzaPizza","Feeding the homeless","2018-02-04","2018-02-11","Feeding homeless with pizza",4003,6003);

INSERT INTO PUBLICATION VALUES(13001,"Akif'in Hayatı","www.makale.org/akif","2017-06-05","Mehmet Akif Ersoy'un biyografisi",6005);

INSERT INTO AUTHOR VALUES(4009,13001);

INSERT INTO COURSE VALUES(14001,"Python 101",6005);
INSERT INTO COURSE VALUES(14002,"Diksiyon 101",6005);
INSERT INTO COURSE VALUES(14003,"Etkin Kodlama",6005);
INSERT INTO COURSE VALUES(14004,"OOP Programming",6001);

INSERT INTO TAKE VALUES(4001,14004);
INSERT INTO TAKE VALUES(4001,14002);
INSERT INTO TAKE VALUES(4001,14003);
INSERT INTO TAKE VALUES(4006,14001);
INSERT INTO TAKE VALUES(4006,14002);
INSERT INTO TAKE VALUES(4006,14003);
INSERT INTO TAKE VALUES(4009,14002);
