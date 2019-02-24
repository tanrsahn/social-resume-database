USE SOCIAL;

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

INSERT INTO LOCATION VALUES(1001,35100,"Kazım Dirik Neighboorhoog","372. street",9,"Öğrenci köyü","Turkey","İzmir");
INSERT INTO LOCATION VALUES(1002,90000,"Abraham Lake","122. street",11,"Next to Stadium","England","Liverpool");
INSERT INTO LOCATION VALUES(1003,60000,"Papa John's","45. street",13,"Across the Museum","Italy","Rome");
INSERT INTO LOCATION VALUES(1004,40000,"Marco de Sol","372. street",9,"By the Arena","Spain","Madrid");
INSERT INTO LOCATION VALUES(1005,75500,"St. Lucas","85. street",34,"Behind of The Church","Poland","Krakow");
INSERT INTO LOCATION VALUES(1006,34000,"Cihangir","34. street",42,"Cami Karşısı","Turkey","İstanbul");
INSERT INTO LOCATION VALUES(1007,35100,"Pelican Valley","Alpha Avenue",15,null,"Finland","Helsinki");
INSERT INTO LOCATION VALUES(1008,36521,"Naruto Orochimaru","23. street",43,null,"Japan","Tokio");
INSERT INTO LOCATION VALUES(1009,75757,"Peachy Neighboorhood","32. street",23,null,"Korea","Seul");
INSERT INTO LOCATION VALUES(1010,32145,"Motherland Neighboorhood","25. street",93,null,"Ukraine","Kiev");

INSERT INTO MEDIA VALUES(2001,"https://picsum.photos/SaatKulesi");
INSERT INTO MEDIA VALUES(2002,"https://picsum.photos/WembleyStadium");
INSERT INTO MEDIA VALUES(2003,"https://picsum.photos/PizzaPizza");
INSERT INTO MEDIA VALUES(2004,"https://picsum.photos/ElToro");
INSERT INTO MEDIA VALUES(2005,"https://picsum.photos/Students");
INSERT INTO MEDIA VALUES(2006,"https://picsum.photos/burger");
INSERT INTO MEDIA VALUES(2007,"https://picsum.photos/cats");
INSERT INTO MEDIA VALUES(2008,"https://picsum.photos/banananana");
INSERT INTO MEDIA VALUES(2009,"https://picsum.photos/snow");
INSERT INTO MEDIA VALUES(2010,"https://picsum.photos/egeuni");
INSERT INTO MEDIA VALUES(2011,"https://picsum.photos/python");
INSERT INTO MEDIA VALUES(2012,"https://picsum.photos/yapayzeka");
INSERT INTO MEDIA VALUES(2013,"https://picsum.photos/yoyoplay");
INSERT INTO MEDIA VALUES(2014,"https://picsum.photos/dbadmin");
INSERT INTO MEDIA VALUES(2015,"https://picsum.photos/wands");

INSERT INTO S_PROFILE VALUES(3001,2001,2001);
INSERT INTO S_PROFILE VALUES(3002,2002,2002);
INSERT INTO S_PROFILE VALUES(3003,2003,2003);
INSERT INTO S_PROFILE VALUES(3004,2004,2004);
INSERT INTO S_PROFILE VALUES(3005,2005,2005);
INSERT INTO S_PROFILE VALUES(3006,2006,2006);
INSERT INTO S_PROFILE VALUES(3007,2007,2007);
INSERT INTO S_PROFILE VALUES(3008,2008,2008);
INSERT INTO S_PROFILE VALUES(3009,2009,2009);
INSERT INTO S_PROFILE VALUES(3010,2010,2010);
INSERT INTO S_PROFILE VALUES(3011,2011,2011);
INSERT INTO S_PROFILE VALUES(3012,2012,2012);
INSERT INTO S_PROFILE VALUES(3013,2013,2013);
INSERT INTO S_PROFILE VALUES(3014,2014,2014);
INSERT INTO S_PROFILE VALUES(3015,2015,2015);

INSERT INTO S_USER VALUES(4001,"busifre","Ali","Metin","Korkmaz","M","905001220121","ali@gmail.com",default,"free","1985-02-22",default,0,1001,3001);
INSERT INTO S_USER VALUES(4002,"password","Harry","James","Potter","M","632150021425","harrypotter@gmail.com",default,"free","1980-06-16",default,0,1002,3002);
INSERT INTO S_USER VALUES(4003,"pizzaword","Bellima","Selina","Attenzione","F","85362152654","msattenzione@gmail.com",default,"free","1975-05-05",default,0,1003,3003);
INSERT INTO S_USER VALUES(4004,"bullpasword","Sergio","Gonzales","Ramos","M","3654182542","sergioramos@gmail.com",default,"free","1988-02-12",default,0,1004,3004);
INSERT INTO S_USER VALUES(4005,"plkrakow","Nicole","Maria","Warsawian","M","3654182542","marianic@gmail.com",default,"premium","1989-10-05",default,0,1005,3005);
INSERT INTO S_USER VALUES(4006,"alfaomega1","Melisa","Ayşe","Korkmaz","F","541865475","melisa@gmail.com",default,"free","1982-12-14",default,0,1006,3006);
INSERT INTO S_USER VALUES(4007,"54jane54","Mary","Jane","Finnishson","F","25484652","mjfinnish@gmail.com",default,"free","1987-05-05",default,0,1007,3007);
INSERT INTO S_USER VALUES(4008,"anime3","Sasuke","Itachi","Uchiha","M","2525451563","sasuke@gmail.com",default,"free","1990-06-05",default,0,1008,3008);
INSERT INTO S_USER VALUES(4009,"school","Mehmet","Akif","Ersoy","M","5241532654","mehmetakif@gmail.com",default,"premium","1975-01-05",default,0,1006,3009);

INSERT INTO COMMUNITY VALUES(5001,3001);
INSERT INTO COMMUNITY VALUES(5002,3002);
INSERT INTO COMMUNITY VALUES(5003,3003);
INSERT INTO COMMUNITY VALUES(5004,3004);
INSERT INTO COMMUNITY VALUES(5005,3005);
INSERT INTO COMMUNITY VALUES(5006,3001);
INSERT INTO COMMUNITY VALUES(5007,3002);
INSERT INTO COMMUNITY VALUES(5008,3004);
INSERT INTO COMMUNITY VALUES(5009,3005);
INSERT INTO COMMUNITY VALUES(5010,3006);
INSERT INTO COMMUNITY VALUES(5011,3007);

INSERT INTO LIKEABLE_OBJECT VALUES(6001);
INSERT INTO LIKEABLE_OBJECT VALUES(6002);
INSERT INTO LIKEABLE_OBJECT VALUES(6003);
INSERT INTO LIKEABLE_OBJECT VALUES(6004);
INSERT INTO LIKEABLE_OBJECT VALUES(6005);
INSERT INTO LIKEABLE_OBJECT VALUES(6006);
INSERT INTO LIKEABLE_OBJECT VALUES(6007);
INSERT INTO LIKEABLE_OBJECT VALUES(6008);
INSERT INTO LIKEABLE_OBJECT VALUES(6009);
INSERT INTO LIKEABLE_OBJECT VALUES(6010);
INSERT INTO LIKEABLE_OBJECT VALUES(6011);
INSERT INTO LIKEABLE_OBJECT VALUES(6012);

INSERT INTO S_PAGE VALUES(7001,0,"LOGO Yazılım","LOGOYZLM","2002-12-03",default,"www.logo.com","Yazılım Şirketi","#software, #coding","02123652145","info@logo.com","impressium 1","Türkiye'nin yazılımı",null,"Company",1006,5001,3010,6001);
INSERT INTO S_PAGE VALUES(7002,0,"Magis is Real","MGCRL","2004-06-10",default,"www.magicisreal.com","Commercial Company","#harryPotter, #magic","0516524523","info@magic.com","impressium 2","We sell magic staff",null,"Company",1007,5002,3011,6002);
INSERT INTO S_PAGE VALUES(7003,0,"PizzaPizza","PZZPZZ","1996-11-08",default,"www.pizzapizza.com","Food","#pizza","36985214754","info@pizza.com","impressium 3","Best pizza here",null,"Company",1008,5003,3012,6003);
INSERT INTO S_PAGE VALUES(7004,0,"Madrid Tourism","MRDTRZM","1987-02-11",default,"www.madridtourism.com","Tourism","#Vacation","20145253656","info@madridtourism.com","impressium 4","You'll love Madrid",null,"Tourism",1008,5004,3013,6004);
INSERT INTO S_PAGE VALUES(7005,0,"Falcon University","falconuni","1982-10-05",default,"www.falconuni.org","School","#Education","05142536954","info@falconuni.com","impressium 5",null,null,"School",1002,5005,3014,6005);

INSERT INTO S_ORGANIZATION VALUES(14001,7001,1,"İstanbul","Software",null);
INSERT INTO S_ORGANIZATION VALUES(14002,7002,1,"Liverpool","Commerce",null);
INSERT INTO S_ORGANIZATION VALUES(14003,7003,1,"Rome","Food",null);
INSERT INTO S_ORGANIZATION VALUES(14004,7004,1,"Madrid","Tourism",null);
INSERT INTO S_ORGANIZATION VALUES(14005,7002,1,"Liverpool","School",null);

INSERT INTO S_GROUP VALUES(8001,"Public","Herkes için Java",default,null,null,2011,5006);
INSERT INTO S_GROUP VALUES(8002,"Private","Harry Potter Fans",default,null,null,2015,5007);

INSERT INTO S_EVENT VALUES(9001,"Madrid Fest",default,"2018-12-28","Great fun waits for you",1004,5008);

INSERT INTO ALBUM VALUES(1001,3001);
INSERT INTO ALBUM VALUES(1002,3002);
INSERT INTO ALBUM VALUES(1003,3003);
INSERT INTO ALBUM VALUES(1004,3004);
INSERT INTO ALBUM VALUES(1005,3005);
INSERT INTO ALBUM VALUES(1006,3006);

INSERT INTO MEDIA VALUES(10001,2001);
INSERT INTO MEDIA VALUES(10002,2002);
INSERT INTO MEDIA VALUES(10003,2003);
INSERT INTO MEDIA VALUES(10004,2004);
INSERT INTO MEDIA VALUES(10005,2005);
INSERT INTO MEDIA VALUES(10006,2006);

INSERT INTO S_STATUS VALUES(11001,"Logo Yazılımdan yenilik",default,"text",null,null,1006,null,null,null,6006,3001);
INSERT INTO S_STATUS VALUES(11002,"Madrid is waiting for you",default,"event","excited",9001,1004,null,null,null,6007,3004);

INSERT INTO S_COMMENT VALUES(3005,11002,12001,"Can't wait to come there!!",0,6008);

INSERT INTO MESSAGE VALUES(13001,3004,3005,"Are you coming to fest??",default);
INSERT INTO MESSAGE VALUES(13002,3005,3004,"Sure I'm so excited",default);
INSERT INTO MESSAGE VALUES(13003,3004,3005,"Great! See you there",default);
INSERT INTO MESSAGE VALUES(13004,3001,3002,"Hello",default);
INSERT INTO MESSAGE VALUES(13005,3002,3001,"Hey what's up?",default);

INSERT INTO ORGANIZATION_ROLE VALUES(15001,"TEMA","Organizator","2014-05-01","2015-05-01","Organized a event",4007,null);

INSERT INTO PUBLICATION VALUES(16001,"Java ile Görüntü işleme","www.makale.org/javayapayzeka","1999-11-02",null,14001);
INSERT INTO PUBLICATION VALUES(16002,"Pizza üzerine bir manifesto","www.makale.org/pizza","1996-10-02",null,14003);

INSERT INTO AUTHOR VALUES(4001,16001);
INSERT INTO AUTHOR VALUES(4003,16002);

INSERT INTO WORKS_ON VALUES(4001,14001,"fulltime","1987-01-01",null,"Genel Müdür","Software",null);
INSERT INTO WORKS_ON VALUES(4002,14002,"fulltime","1990-01-01",null,"CEO","Commerce",null);
INSERT INTO WORKS_ON VALUES(4003,14003,"parttime","1995-01-01",null,"Chef","Food",null);
INSERT INTO WORKS_ON VALUES(4004,14004,"fulltime","1997-01-01",null,"Guide","Commerce",null);
INSERT INTO WORKS_ON VALUES(4009,14005,"fulltime","1999-01-01",null,"Teacher","School",null);

INSERT INTO PATENT VALUES(17001,"JVJ101","www.patent.org/pythonAI","Python AI","Confirmed","2002-05-11",null,"Turkey");
INSERT INTO PATENT VALUES(17002,"ELE101","www.patent.org/yuruyenucak","Yuruyen ucak","Confirmed","2001-04-11",null,"Turkey");
INSERT INTO PATENT VALUES(17003,"TLS0P","www.patent.org/teleskop","Teleskop","Confirmed","2004-02-11",null,"Italy");

INSERT INTO INVENTS VALUES(4006,17001);
INSERT INTO INVENTS VALUES(4006,17002);
INSERT INTO INVENTS VALUES(4003,17003);
