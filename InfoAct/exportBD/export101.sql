--------------------------------------------------------
--  File created - sâmbătă-mai-26-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_ACTOR
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ACTOR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ACTOR_FILM
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ACTOR_FILM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ATASAMENT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ATASAMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_DOCUMENT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_DOCUMENT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 101 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FAVORIT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FAVORIT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FILM
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FILM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_GEN"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_GEN_FILM
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_GEN_FILM"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RECENZIE
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RECENZIE"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ROL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ROL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_ROL_DREPT
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ROL_DREPT"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_UTILIZATOR
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_UTILIZATOR"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_UTILIZATOR_ROL
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_UTILIZATOR_ROL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ACTOR
--------------------------------------------------------

  CREATE TABLE "ACTOR" 
   (	"ID" NUMBER, 
	"NUME" NVARCHAR2(100), 
	"DT_NASTERE" DATE, 
	"LOC_NASTERE" NVARCHAR2(100), 
	"DESCRIERE" NVARCHAR2(2000), 
	"ID_DOCUMENT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ACTOR_FILM
--------------------------------------------------------

  CREATE TABLE "ACTOR_FILM" 
   (	"ID" NUMBER, 
	"ID_ACTOR" NUMBER, 
	"ID_FILM" NUMBER, 
	"PERSONAJ" NVARCHAR2(100)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ATASAMENT
--------------------------------------------------------

  CREATE TABLE "ATASAMENT" 
   (	"ID" NUMBER, 
	"ID_DOCUMENT" NUMBER, 
	"ID_UTILIZATOR" NUMBER, 
	"DT_UPLOAD" DATE, 
	"URL" NVARCHAR2(200), 
	"ID_ACTOR" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DOCUMENT
--------------------------------------------------------

  CREATE TABLE "DOCUMENT" 
   (	"ID" NUMBER, 
	"TIP" NVARCHAR2(4)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table DREPT
--------------------------------------------------------

  CREATE TABLE "DREPT" 
   (	"ID" NUMBER, 
	"COD" NVARCHAR2(10), 
	"ENTITATE" NVARCHAR2(20), 
	"DESCRIERE" NVARCHAR2(500)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FAVORIT
--------------------------------------------------------

  CREATE TABLE "FAVORIT" 
   (	"ID" NUMBER, 
	"ID_FILM" NUMBER, 
	"ID_USER" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FILM
--------------------------------------------------------

  CREATE TABLE "FILM" 
   (	"ID" NUMBER, 
	"NUME" NVARCHAR2(100), 
	"DESCRIERE" NVARCHAR2(2000), 
	"DT" DATE, 
	"ID_DOCUMENT" NUMBER, 
	"GENURI" NVARCHAR2(300)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table RECENZIE
--------------------------------------------------------

  CREATE TABLE "RECENZIE" 
   (	"ID" NUMBER, 
	"DT" DATE, 
	"NOTA" NUMBER, 
	"TEXT" NVARCHAR2(2000), 
	"ID_FILM" NUMBER, 
	"ID_USER" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ROL
--------------------------------------------------------

  CREATE TABLE "ROL" 
   (	"ID" NUMBER, 
	"COD" NVARCHAR2(10), 
	"NUME" NVARCHAR2(50), 
	"MEMO" NVARCHAR2(500)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ROL_DREPT
--------------------------------------------------------

  CREATE TABLE "ROL_DREPT" 
   (	"ID" NUMBER, 
	"ID_ROL" NUMBER, 
	"ID_DREPT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UTILIZATOR
--------------------------------------------------------

  CREATE TABLE "UTILIZATOR" 
   (	"ID" NUMBER, 
	"NUME" NVARCHAR2(50), 
	"USERNAME" NVARCHAR2(20), 
	"PAROLA" NVARCHAR2(100), 
	"EMAIL" NVARCHAR2(30), 
	"ID_DOCUMENT" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table UTILIZATOR_ROL
--------------------------------------------------------

  CREATE TABLE "UTILIZATOR_ROL" 
   (	"ID" NUMBER, 
	"ID_ROL" NUMBER, 
	"ID_UTILIZATOR" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into ACTOR
SET DEFINE OFF;
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('62','Heath Ledger',to_date('04-04-1979','DD-MM-RRRR'),'Perth, Western Australia, Australia','When hunky, twenty-year-old heart-throb Heath Ledger first came to the attention of the public in 1999, it was all too easy to tag him as a "pretty boy" and an actor of little depth. He spent several years trying desperately to sway this image, but this was a double-edged sword. His work comprised nineteen films, including 10 Things I Hate About You (1999), The Patriot (2000), A Knight''s Tale (2001), Monster''s Ball (2001), Ned Kelly (2003), The Brothers Grimm (2005), Lords of Dogtown (2005), Brokeback Mountain (2005), Casanova (2005), Iubire si dependenta (2006), Noi suntem Bob Dylan (2007), The Dark Knight (2008) and The Imaginarium of Doctor Parnassus (2009). He also produced and directed music videos and aspired to be a film director.

Heath Ledger was born on the fourth of April 1979, in Perth, Western Australia, to Sally (Ramshaw), a teacher of French, and Kim Ledger, a mining engineer who also raced cars. His ancestry was Scottish, English, Irish, and Sephardi Jewish. As the story goes, in junior high school it was compulsory to take one of two electives, either cooking or drama. As Heath could not see himself in a cooking class he tried his hand at drama. Heath was talented, however the rest of the class did not acknowledge his talent. When he was seventeen he and a friend decided to pack up, leave school, take a car and rough it to Sydney. Heath believed Sydney to be the place where dreams were made or, at least, where actors could possibly get their big break. Upon arriving in Sydney with a purported sixty-nine cents to his name, Heath tried everything to get a break.','69');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('61','Christian Bale',to_date('30-01-1974','DD-MM-RRRR'),'Haverfordwest, Pembrokeshire, Wales, UK','Christian Charles Philip Bale was born in Pembrokeshire, Wales, UK on January 30, 1974, to English parents Jennifer "Jenny" (James) and David Charles Howard Bale. His mother was a circus performer and his father, who was born in South Africa, was a commercial pilot. The family lived in different countries throughout Bale''s childhood, including England, Portugal, and the United States. Bale acknowledges the constant change was one of the influences on his career choice.

His first acting job was a cereal commercial in 1983; amazingly, the next year, he debuted on the West End stage in "The Nerd". A role in the 1986 NBC mini-series Anastasia: The Mystery of Anna (1986) caught Steven Spielberg''s eye, leading to Bale''s well-documented role in Empire of the Sun (1987). For the range of emotions he displayed as the star of the war epic, he earned a special award by the National Board of Review for Best Performance by a Juvenile Actor.

Adjusting to fame and his difficulties with attention (he thought about quitting acting early on), Bale appeared in Kenneth Branagh''s 1989 adaptation of Shakespeare''s Henry V (1989) and starred as Jim Hawkins in a TV movie version of Treasure Island (1990). Bale worked consistently through the 1990s, acting and singing in Newsies (1992), Swing Kids (1993), Little Women (1994), The Portrait of a Lady (1996), The Secret Agent (1996), Metroland (1997), Velvet Goldmine (1998), All the Little Animals (1998), and A Midsummer Night''s Dream (1999). Toward the end of the decade, with the rise of the Internet, Bale found himself becoming one of the most popular online celebrities around, though he, with a couple notable exceptions, maintained a private, tabloid-free mystique.','68');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('63','Peter Dinklage',to_date('11-06-1969','DD-MM-RRRR'),'Morristown, New Jersey, USA','Peter Dinklage is an American actor. Since his breakout role in The Station Agent (2003), he has appeared in numerous films and theatre plays. Since 2011, Dinklage has portrayed Tyrion Lannister in the HBO series Game of Thrones. For this he won an Emmy for Outstanding Supporting Actor in a Drama Series and a Golden Globe Award for Best Supporting Actor - Series, Miniseries or Television Film in 2011.

Peter Hayden Dinklage was born in Morristown, New Jersey, to Diane (Hayden), an elementary school teacher, and John Carl Dinklage, an insurance salesman. He is of German, Irish, and English descent. In 1991, he received a degree in drama from Bennington College and began his career. His exquisite theatre work that expresses brilliantly the unique range of his acting qualities, includes remarkable performances full of profoundness, charisma, intelligence, sensation and insights in plays such as "The Killing Act", "Imperfect Love", Ivan Turgenev''s "A Month in the Country" as well as the title roles in William Shakespeare''s "Richard III" and in Anton Chekhov''s "Uncle Vanya".','72');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('64','test',to_date('29-03-2018','DD-MM-RRRR'),'test','test','74');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('65','test1',to_date('29-03-2018','DD-MM-RRRR'),'test','test','75');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('66','test2',to_date('21-03-2018','DD-MM-RRRR'),'test','test','76');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('67','test4',to_date('23-03-2018','DD-MM-RRRR'),'test','test','77');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('68','test6',to_date('29-03-2018','DD-MM-RRRR'),'test','test','78');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('69','test5',to_date('09-03-2018','DD-MM-RRRR'),'test','test','79');
Insert into ACTOR (ID,NUME,DT_NASTERE,LOC_NASTERE,DESCRIERE,ID_DOCUMENT) values ('70','qwe',to_date('15-03-2018','DD-MM-RRRR'),null,null,'80');
REM INSERTING into ACTOR_FILM
SET DEFINE OFF;
Insert into ACTOR_FILM (ID,ID_ACTOR,ID_FILM,PERSONAJ) values ('23','61','21','Bruce Wayne');
Insert into ACTOR_FILM (ID,ID_ACTOR,ID_FILM,PERSONAJ) values ('28','70','21','qwe');
Insert into ACTOR_FILM (ID,ID_ACTOR,ID_FILM,PERSONAJ) values ('24','62','21','Joker');
Insert into ACTOR_FILM (ID,ID_ACTOR,ID_FILM,PERSONAJ) values ('26','63','22','Tyrion Lannister');
Insert into ACTOR_FILM (ID,ID_ACTOR,ID_FILM,PERSONAJ) values ('27','63','23','Dr. Bolivar Trask');
REM INSERTING into ATASAMENT
SET DEFINE OFF;
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('15','4','1000',to_date('15-03-2018','DD-MM-RRRR'),'508084da-991f-4cef-96cf-f6c85d6a6cf2.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('21','21','2',to_date('17-03-2018','DD-MM-RRRR'),'b1ce2ac6-e10a-436f-a9e3-7adcfab3c9cc.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('41','41','2',to_date('18-03-2018','DD-MM-RRRR'),'7c249589-0fa2-4a1f-8083-9404a7f9655d.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('16','4','2',to_date('15-03-2018','DD-MM-RRRR'),'2fa188f1-0037-45d8-b0fd-c4960c019963.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('61','21','2',to_date('25-03-2018','DD-MM-RRRR'),'ef46e9db-3ab3-4d2d-ae7b-949279bd5d1c.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('62','21','2',to_date('26-03-2018','DD-MM-RRRR'),'65ecaa27-1d94-42d7-9d11-1095ab2eac86.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('63','21','2',to_date('29-03-2018','DD-MM-RRRR'),'8e5cb32a-da0a-4ef2-bf49-d1d28554b90f.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('64','21','2',to_date('29-03-2018','DD-MM-RRRR'),'a2042eee-1ecd-41ad-aa70-97158ae8f72d.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('65','21','2',to_date('29-03-2018','DD-MM-RRRR'),'1f46c7ab-f3c0-4e9d-82f1-597ed358b08b.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('66','21','2',to_date('29-03-2018','DD-MM-RRRR'),'d854a7f8-9551-4b89-87be-a793f51d184c.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('67','41','2',to_date('29-03-2018','DD-MM-RRRR'),'afcfda1a-616a-4d53-a721-d6b6d5072ad2.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('68','68','2',to_date('29-03-2018','DD-MM-RRRR'),'2de2c539-85d2-4e85-b729-e3a044d9f6e5.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('69','68','2',to_date('29-03-2018','DD-MM-RRRR'),'b5bb1f72-ddf8-4d0b-a450-abdd143603f9.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('70','68','2',to_date('29-03-2018','DD-MM-RRRR'),'b09ae442-3eb2-4a02-93f1-76abd829fbc3.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('71','68','2',to_date('29-03-2018','DD-MM-RRRR'),'e265b3b8-0b56-48cd-bd30-5da6d1f905b0.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('72','68','2',to_date('29-03-2018','DD-MM-RRRR'),'a2946344-51cf-491f-8ce9-cbc9fb9cd5c6.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('73','69','2',to_date('29-03-2018','DD-MM-RRRR'),'2c1a1aa0-6266-4feb-a87c-3dff1dad81cf.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('74','69','2',to_date('29-03-2018','DD-MM-RRRR'),'1b166633-e489-4f56-a5c0-e86e96af8dcf.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('75','69','2',to_date('29-03-2018','DD-MM-RRRR'),'1433a2fb-9787-476c-bcda-5a47b6c10353.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('76','69','2',to_date('29-03-2018','DD-MM-RRRR'),'3e104edc-30a6-430c-bf72-0d5ee8b4e35a.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('77','70','2',to_date('29-03-2018','DD-MM-RRRR'),'1e52f49a-ec76-4472-9702-6569be8b11c1.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('78','70','2',to_date('29-03-2018','DD-MM-RRRR'),'05bcd73e-8026-4904-b9f4-8a509b02de0f.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('79','70','2',to_date('29-03-2018','DD-MM-RRRR'),'27391718-e7a5-481b-b012-adc2d2d7f7f9.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('80','70','2',to_date('29-03-2018','DD-MM-RRRR'),'59a9187a-cc41-4346-8455-d287dcf84870.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('81','70','2',to_date('29-03-2018','DD-MM-RRRR'),'8785a4a7-1243-4592-b71d-adbdc83f85c6.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('82','70','2',to_date('29-03-2018','DD-MM-RRRR'),'d7936c41-1052-4e86-a065-f9c85a63f916.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('83','70','2',to_date('29-03-2018','DD-MM-RRRR'),'a416f147-c20d-43f8-93ec-b781b0fa5ddc.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('84','71','2',to_date('29-03-2018','DD-MM-RRRR'),'f819c86b-c3b6-459c-ae03-babeda240c6a.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('85','71','2',to_date('29-03-2018','DD-MM-RRRR'),'75661be5-1e08-4375-bf82-87d55b9eed24.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('86','71','2',to_date('29-03-2018','DD-MM-RRRR'),'c6d01135-48c1-4a0f-bfe6-82aa2896200c.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('87','71','2',to_date('29-03-2018','DD-MM-RRRR'),'c15f0247-8301-4bab-9295-e034ffc7fd30.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('88','71','2',to_date('29-03-2018','DD-MM-RRRR'),'658f830e-09c2-4f6c-8eb9-3b1924d444be.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('89','72','2',to_date('29-03-2018','DD-MM-RRRR'),'60514ec1-08f8-4495-8aa3-5ddc82a667cc.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('90','72','2',to_date('29-03-2018','DD-MM-RRRR'),'02b23d06-4932-40ab-92bd-997761498e6e.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('91','72','2',to_date('29-03-2018','DD-MM-RRRR'),'4b88fc14-2d67-4059-9005-d678a9ecaed3.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('92','73','2',to_date('29-03-2018','DD-MM-RRRR'),'7a4fce1b-aa7d-4614-827f-4ac0d0487c98.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('93','73','2',to_date('29-03-2018','DD-MM-RRRR'),'705b1392-148c-46d0-ae00-f8b5145e22e0.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('94','73','2',to_date('29-03-2018','DD-MM-RRRR'),'b0a36302-964b-4276-906c-d00229bdae75.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('95','73','2',to_date('29-03-2018','DD-MM-RRRR'),'abca8233-d6fa-4cd6-af7e-3811c1e89c02.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('96','73','2',to_date('29-03-2018','DD-MM-RRRR'),'224621e5-8ae9-47d0-a9e7-b8257ec17c40.jpg',null);
Insert into ATASAMENT (ID,ID_DOCUMENT,ID_UTILIZATOR,DT_UPLOAD,URL,ID_ACTOR) values ('97','80','2',to_date('30-03-2018','DD-MM-RRRR'),'a2c6831d-a082-48f0-8fa6-bd724709ecc7.png',null);
REM INSERTING into DOCUMENT
SET DEFINE OFF;
Insert into DOCUMENT (ID,TIP) values ('61','UTI');
Insert into DOCUMENT (ID,TIP) values ('62','UTI');
Insert into DOCUMENT (ID,TIP) values ('63','UTI');
Insert into DOCUMENT (ID,TIP) values ('68','ACT');
Insert into DOCUMENT (ID,TIP) values ('70','ACT');
Insert into DOCUMENT (ID,TIP) values ('69','ACT');
Insert into DOCUMENT (ID,TIP) values ('71','ACT');
Insert into DOCUMENT (ID,TIP) values ('72','ACT');
Insert into DOCUMENT (ID,TIP) values ('73','ACT');
Insert into DOCUMENT (ID,TIP) values ('67','UTI');
Insert into DOCUMENT (ID,TIP) values ('74','ACT');
Insert into DOCUMENT (ID,TIP) values ('75','ACT');
Insert into DOCUMENT (ID,TIP) values ('76','ACT');
Insert into DOCUMENT (ID,TIP) values ('77','ACT');
Insert into DOCUMENT (ID,TIP) values ('78','ACT');
Insert into DOCUMENT (ID,TIP) values ('79','ACT');
Insert into DOCUMENT (ID,TIP) values ('80','ACT');
Insert into DOCUMENT (ID,TIP) values ('81','ACT');
REM INSERTING into DREPT
SET DEFINE OFF;
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('1','read','rol','Poate vedea toate rolurile.');
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('2','write','rol','Poate modifica toate rolurile.');
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('3','read','utilizator','Poate vedea toti utilizatorii.');
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('4','write','utilizator','Poate modifica toti utilizatorii.');
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('5','write','actor','Poate modifica toti actorii.');
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('6','write','film','Poate modifica toate filmele.');
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('7','write','atasament','Poate modifica toate atasamentele.');
Insert into DREPT (ID,COD,ENTITATE,DESCRIERE) values ('8','write','recenzie','Poate modifica toate recenziile.');
REM INSERTING into FAVORIT
SET DEFINE OFF;
Insert into FAVORIT (ID,ID_FILM,ID_USER) values ('13','22','2');
REM INSERTING into FILM
SET DEFINE OFF;
Insert into FILM (ID,NUME,DESCRIERE,DT,ID_DOCUMENT,GENURI) values ('22','Game of Thrones','Nine noble families fight for control over the mythical lands of Westeros, while an ancient enemy returns after being dormant for thousands of years.',to_date('17-04-2011','DD-MM-RRRR'),'71','Action, Adventure, Drama');
Insert into FILM (ID,NUME,DESCRIERE,DT,ID_DOCUMENT,GENURI) values ('21','The Dark Knight','When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham, the Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.',to_date('18-07-2008','DD-MM-RRRR'),'70','Action, Crime, Thriller');
Insert into FILM (ID,NUME,DESCRIERE,DT,ID_DOCUMENT,GENURI) values ('23','X-Men: Days of Future Past','The X-Men send Wolverine to the past in a desperate effort to change history and prevent an event that results in doom for both humans and mutants.',to_date('23-05-2014','DD-MM-RRRR'),'73','Action, Adventure, Sci-Fi');
Insert into FILM (ID,NUME,DESCRIERE,DT,ID_DOCUMENT,GENURI) values ('24','film',null,null,'81',null);
REM INSERTING into RECENZIE
SET DEFINE OFF;
Insert into RECENZIE (ID,DT,NOTA,TEXT,ID_FILM,ID_USER) values ('1',to_date('12-05-2018','DD-MM-RRRR'),'10','rwe','21','1000');
Insert into RECENZIE (ID,DT,NOTA,TEXT,ID_FILM,ID_USER) values ('2',to_date('12-05-2018','DD-MM-RRRR'),'3','qw','24','1000');
Insert into RECENZIE (ID,DT,NOTA,TEXT,ID_FILM,ID_USER) values ('4',to_date('12-05-2018','DD-MM-RRRR'),'10','test','24','3');
REM INSERTING into ROL
SET DEFINE OFF;
Insert into ROL (ID,COD,NUME,MEMO) values ('1','admin','Administrator',null);
Insert into ROL (ID,COD,NUME,MEMO) values ('2','mod','Moderator',null);
Insert into ROL (ID,COD,NUME,MEMO) values ('3','user','Utilizator',null);
REM INSERTING into ROL_DREPT
SET DEFINE OFF;
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('43','1','1');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('44','1','2');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('48','2','6');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('45','1','8');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('41','1','3');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('49','2','5');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('46','3','8');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('50','2','8');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('42','1','4');
Insert into ROL_DREPT (ID,ID_ROL,ID_DREPT) values ('47','2','7');
REM INSERTING into UTILIZATOR
SET DEFINE OFF;
Insert into UTILIZATOR (ID,NUME,USERNAME,PAROLA,EMAIL,ID_DOCUMENT) values ('1000','Dan','dan','JZHl9G8o0wP53AJ9R1pcYNjeoXo=','dmaxim@yahoo.com','61');
Insert into UTILIZATOR (ID,NUME,USERNAME,PAROLA,EMAIL,ID_DOCUMENT) values ('2','moderator','mod','fdMPCpXVIr/AWL5OdYR/i23592s=','mod@mod.com','62');
Insert into UTILIZATOR (ID,NUME,USERNAME,PAROLA,EMAIL,ID_DOCUMENT) values ('3','test','test','qUqP5cyxm6YcTAhz05Hph5gvu9M=','test@test.te','63');
Insert into UTILIZATOR (ID,NUME,USERNAME,PAROLA,EMAIL,ID_DOCUMENT) values ('25','test21','test21','R85HXs7Ss6QsSgs4GbdKUCR89sw=','qwe@qwe.qwe','67');
REM INSERTING into UTILIZATOR_ROL
SET DEFINE OFF;
Insert into UTILIZATOR_ROL (ID,ID_ROL,ID_UTILIZATOR) values ('6','3','3');
Insert into UTILIZATOR_ROL (ID,ID_ROL,ID_UTILIZATOR) values ('4','1','1000');
Insert into UTILIZATOR_ROL (ID,ID_ROL,ID_UTILIZATOR) values ('5','2','2');
Insert into UTILIZATOR_ROL (ID,ID_ROL,ID_UTILIZATOR) values ('21','3','21');
Insert into UTILIZATOR_ROL (ID,ID_ROL,ID_UTILIZATOR) values ('25','3','25');
Insert into UTILIZATOR_ROL (ID,ID_ROL,ID_UTILIZATOR) values ('23','3','22');
Insert into UTILIZATOR_ROL (ID,ID_ROL,ID_UTILIZATOR) values ('24','3','24');
--------------------------------------------------------
--  DDL for Index RECENZIE_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "RECENZIE_UK1" ON "RECENZIE" ("ID_FILM", "ID_USER") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ATASAMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATASAMENT_PK" ON "ATASAMENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index UTILIZATOR_ROL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "UTILIZATOR_ROL_PK" ON "UTILIZATOR_ROL" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE1_PK" ON "UTILIZATOR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DREPT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DREPT_PK" ON "DREPT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index DOCUMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "DOCUMENT_PK" ON "DOCUMENT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ACTORI_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACTORI_PK" ON "ACTOR" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index RECENZII_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RECENZII_PK" ON "RECENZIE" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ACTOR_FILM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ACTOR_FILM_PK" ON "ACTOR_FILM" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index FAVORITE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FAVORITE_PK" ON "FAVORIT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ROL_DREPT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROL_DREPT_PK" ON "ROL_DREPT" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index FILM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "FILM_PK" ON "FILM" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ROL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ROL_PK" ON "ROL" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table DREPT
--------------------------------------------------------

  ALTER TABLE "DREPT" ADD CONSTRAINT "DREPT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "DREPT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROL
--------------------------------------------------------

  ALTER TABLE "ROL" ADD CONSTRAINT "ROL_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UTILIZATOR_ROL
--------------------------------------------------------

  ALTER TABLE "UTILIZATOR_ROL" ADD CONSTRAINT "UTILIZATOR_ROL_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UTILIZATOR_ROL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table UTILIZATOR
--------------------------------------------------------

  ALTER TABLE "UTILIZATOR" MODIFY ("PAROLA" NOT NULL ENABLE);
  ALTER TABLE "UTILIZATOR" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "UTILIZATOR" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "UTILIZATOR" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RECENZIE
--------------------------------------------------------

  ALTER TABLE "RECENZIE" ADD CONSTRAINT "RECENZIE_UK1" UNIQUE ("ID_FILM", "ID_USER")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECENZIE" ADD CONSTRAINT "RECENZII_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "RECENZIE" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACTOR
--------------------------------------------------------

  ALTER TABLE "ACTOR" ADD CONSTRAINT "ACTORI_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ACTOR" MODIFY ("NUME" NOT NULL ENABLE);
  ALTER TABLE "ACTOR" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ROL_DREPT
--------------------------------------------------------

  ALTER TABLE "ROL_DREPT" ADD CONSTRAINT "ROL_DREPT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ROL_DREPT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DOCUMENT
--------------------------------------------------------

  ALTER TABLE "DOCUMENT" ADD CONSTRAINT "DOCUMENT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "DOCUMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ATASAMENT
--------------------------------------------------------

  ALTER TABLE "ATASAMENT" ADD CONSTRAINT "ATASAMENT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ATASAMENT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ACTOR_FILM
--------------------------------------------------------

  ALTER TABLE "ACTOR_FILM" MODIFY ("ID_FILM" NOT NULL ENABLE);
  ALTER TABLE "ACTOR_FILM" MODIFY ("ID_ACTOR" NOT NULL ENABLE);
  ALTER TABLE "ACTOR_FILM" ADD CONSTRAINT "ACTOR_FILM_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "ACTOR_FILM" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAVORIT
--------------------------------------------------------

  ALTER TABLE "FAVORIT" ADD CONSTRAINT "FAVORITE_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FAVORIT" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "FILM" ADD CONSTRAINT "FILM_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "FILM" MODIFY ("NUME" NOT NULL ENABLE);
  ALTER TABLE "FILM" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ACTOR_FILM
--------------------------------------------------------

  ALTER TABLE "ACTOR_FILM" ADD CONSTRAINT "ACTOR_FILM_FK1" FOREIGN KEY ("ID_ACTOR")
	  REFERENCES "ACTOR" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "ACTOR_FILM" ADD CONSTRAINT "ACTOR_FILM_FK2" FOREIGN KEY ("ID_FILM")
	  REFERENCES "FILM" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FAVORIT
--------------------------------------------------------

  ALTER TABLE "FAVORIT" ADD CONSTRAINT "FAVORIT_FK1" FOREIGN KEY ("ID_FILM")
	  REFERENCES "FILM" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "FAVORIT" ADD CONSTRAINT "FAVORIT_FK2" FOREIGN KEY ("ID_USER")
	  REFERENCES "UTILIZATOR" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECENZIE
--------------------------------------------------------

  ALTER TABLE "RECENZIE" ADD CONSTRAINT "FK_RECENZIE_FILM" FOREIGN KEY ("ID_FILM")
	  REFERENCES "FILM" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "RECENZIE" ADD CONSTRAINT "FK_RECENZIE_USER" FOREIGN KEY ("ID_USER")
	  REFERENCES "UTILIZATOR" ("ID") ON DELETE CASCADE ENABLE;
