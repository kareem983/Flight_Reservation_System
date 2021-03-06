--Drop Tables if Exist
drop table PRO_AIRPORT cascade constraints;
drop table PRO_CUSTOMER cascade constraints;
drop table PRO_CUSTOMER_PHONES cascade constraints;
drop table PRO_FLIGHT cascade constraints;
drop table PRO_SEAT cascade constraints;
drop table PRO_CUST_BOOK_FLIGHT cascade constraints;



--Create Project Tables with Relationship
  CREATE TABLE "PRO_AIRPORT" 
   (	"CITY" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"AIRPORT_NUM" NUMBER NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE), 
	 CONSTRAINT "PRO_AIRPORT_PK" PRIMARY KEY ("CITY", "AIRPORT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "PRO_CUSTOMER" 
   (	"FIRST_NAME" VARCHAR2(50 BYTE), 
	"LAST_NAME" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"PASSWORD" VARCHAR2(50 BYTE), 
	"ADDRESS" VARCHAR2(50 BYTE), 
	"PASSPORT_NUM" NUMBER, 
	"CREDIT_NUM" VARCHAR2(20 BYTE), 
	 CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("EMAIL")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


  CREATE TABLE "PRO_CUSTOMER_PHONES" 
   (	"CUSTOMER_PHONE" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"EMAIL_CPN" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "PRO_CUSTOMER_PHONES_PK" PRIMARY KEY ("CUSTOMER_PHONE", "EMAIL_CPN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "PRO_CUSTOMER_PHONES_PRO_C_FK1" FOREIGN KEY ("EMAIL_CPN")
	  REFERENCES "PRO_CUSTOMER" ("EMAIL") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "PRO_FLIGHT" 
   (	"FLIGHT_NUM" NUMBER NOT NULL ENABLE, 
	"LAUNCH_TIME" DATE, 
	"DES_TIME" DATE, 
	"DATE" DATE, 
	"AIRPORT_TSSN1" NUMBER, 
	"AIRPORT_FSSN1" NUMBER, 
	"SOURCE_PLACE" VARCHAR2(20 BYTE), 
	"DES_PLACE" VARCHAR2(20 BYTE), 
	"AIRPORT_TSSN2" VARCHAR2(20 BYTE), 
	"AIRPORT_FSSN2" VARCHAR2(20 BYTE), 
	 CONSTRAINT "PRO_FLIGHT_PK" PRIMARY KEY ("FLIGHT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "PRO_FLIGHT_PRO_AIRPORT_FK1" FOREIGN KEY ("AIRPORT_TSSN2", "AIRPORT_TSSN1")
	  REFERENCES "PRO_AIRPORT" ("CITY", "AIRPORT_NUM") ENABLE, 
	 CONSTRAINT "PRO_FLIGHT_PRO_AIRPORT_FK2" FOREIGN KEY ("AIRPORT_FSSN2", "AIRPORT_FSSN1")
	  REFERENCES "PRO_AIRPORT" ("CITY", "AIRPORT_NUM") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

  CREATE TABLE "PRO_SEAT" 
   (	"SEAT_NUM" NUMBER NOT NULL ENABLE, 
	"STATUS" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PRICE" NUMBER, 
	"NUM_OF_SEATS" NUMBER NOT NULL ENABLE, 
	"F_SEAT" NUMBER, 
	 CONSTRAINT "PRO_SEAT_PK" PRIMARY KEY ("SEAT_NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "PRO_SEAT_PRO_FLIGHT_FK1" FOREIGN KEY ("F_SEAT")
	  REFERENCES "PRO_FLIGHT" ("FLIGHT_NUM") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
 

CREATE TABLE "PRO_CUST_BOOK_FLIGHT" 
   (	"EMAIL_CSSN" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"FLIGHT_NUM_FSSN" NUMBER NOT NULL ENABLE, 
	"NUM_OF_FLIGHTS" NUMBER, 
	 CONSTRAINT "CUST_BOOK_FLIGHT_PK" PRIMARY KEY ("EMAIL_CSSN", "FLIGHT_NUM_FSSN")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "PRO_CUST_BOOK_FLIGHT_PRO__FK2" FOREIGN KEY ("FLIGHT_NUM_FSSN")
	  REFERENCES "PRO_FLIGHT" ("FLIGHT_NUM") ENABLE, 
	 CONSTRAINT "PRO_CUST_BOOK_FLIGHT_PRO__FK1" FOREIGN KEY ("EMAIL_CSSN")
	  REFERENCES "PRO_CUSTOMER" ("EMAIL") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;




--Insert Initial Data in Airport Table
INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Egypt', '1', 'Cairo');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Egypt', '2', 'Alexandria');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Egypt', '3', 'Ismalia');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Europe', '1', 'France');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Europe', '2', 'Irland');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Europe', '3', 'Spain');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Asia', '1', 'Iran');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Asia', '2', 'Iraq');

INSERT INTO "PRO_AIRPORT" (CITY, AIRPORT_NUM, NAME) VALUES ('Asia', '3', 'Kuwait');



--Insert Initial Data in Flight Table
INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('1', TO_DATE('01-AUG-21', 'DD-MON-RR'), TO_DATE('01-AUG-21', 'DD-MON-RR'), TO_DATE('01-AUG-21', 'DD-MON-RR'), '1', '2', 'Cairo', 'Alexandria', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('2', TO_DATE('15-JUN-21', 'DD-MON-RR'), TO_DATE('15-JUN-21', 'DD-MON-RR'), TO_DATE('15-JUN-21', 'DD-MON-RR'), '1', '2', 'Cairo', 'Alexandria', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('3', TO_DATE('22-MAY-21', 'DD-MON-RR'), TO_DATE('22-MAY-21', 'DD-MON-RR'), TO_DATE('22-MAY-21', 'DD-MON-RR'), '3', '1', 'Ismalia', 'Cairo', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('4', TO_DATE('25-MAY-21', 'DD-MON-RR'), TO_DATE('25-MAY-21', 'DD-MON-RR'), TO_DATE('25-MAY-21', 'DD-MON-RR'), '3', '1', 'Ismalia', 'Cairo', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('5', TO_DATE('25-SEP-21', 'DD-MON-RR'), TO_DATE('25-SEP-21', 'DD-MON-RR'), TO_DATE('25-SEP-21', 'DD-MON-RR'), '1', '3', 'Cairo', 'Ismalia', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('6', TO_DATE('12-SEP-21', 'DD-MON-RR'), TO_DATE('12-SEP-21', 'DD-MON-RR'), TO_DATE('12-SEP-21', 'DD-MON-RR'), '1', '3', 'Cairo', 'Ismalia', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('7', TO_DATE('25-MAY-21', 'DD-MON-RR'), TO_DATE('25-MAY-21', 'DD-MON-RR'), TO_DATE('25-MAY-21', 'DD-MON-RR'), '3', '2', 'Ismalia', 'Alexandria', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('8', TO_DATE('20-MAY-21', 'DD-MON-RR'), TO_DATE('20-MAY-21', 'DD-MON-RR'), TO_DATE('20-MAY-21', 'DD-MON-RR'), '3', '2', 'Ismalia', 'Alexandria', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('9', TO_DATE('25-JAN-21', 'DD-MON-RR'), TO_DATE('25-JAN-21', 'DD-MON-RR'), TO_DATE('25-JAN-21', 'DD-MON-RR'), '2', '3', 'Alexandria', 'Ismalia', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('10', TO_DATE('25-FEB-21', 'DD-MON-RR'), TO_DATE('25-FEB-21', 'DD-MON-RR'), TO_DATE('25-FEB-21', 'DD-MON-RR'), '2', '3', 'Alexandria', 'Ismalia', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('11', TO_DATE('12-SEP-21', 'DD-MON-RR'), TO_DATE('12-SEP-21', 'DD-MON-RR'), TO_DATE('12-SEP-21', 'DD-MON-RR'), '2', '1', 'Alexandria', 'Cairo', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('12', TO_DATE('25-SEP-21', 'DD-MON-RR'), TO_DATE('25-SEP-21', 'DD-MON-RR'), TO_DATE('25-SEP-21', 'DD-MON-RR'), '2', '1', 'Alexandria', 'Cairo', 'Egypt', 'Egypt');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('13', TO_DATE('10-JAN-21', 'DD-MON-RR'), TO_DATE('10-JAN-21', 'DD-MON-RR'), TO_DATE('10-JAN-21', 'DD-MON-RR'), '1', '2', 'France', 'Irland', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('14', TO_DATE('15-JAN-21', 'DD-MON-RR'), TO_DATE('15-JAN-21', 'DD-MON-RR'), TO_DATE('15-JAN-21', 'DD-MON-RR'), '1', '2', 'France', 'Irland', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('15', TO_DATE('10-FEB-21', 'DD-MON-RR'), TO_DATE('10-FEB-21', 'DD-MON-RR'), TO_DATE('10-FEB-21', 'DD-MON-RR'), '2', '1', 'Irland', 'France', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('16', TO_DATE('25-FEB-21', 'DD-MON-RR'), TO_DATE('25-FEB-21', 'DD-MON-RR'), TO_DATE('25-FEB-21', 'DD-MON-RR'), '2', '1', 'Irland', 'France', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('17', TO_DATE('10-NOV-21', 'DD-MON-RR'), TO_DATE('10-NOV-21', 'DD-MON-RR'), TO_DATE('10-NOV-21', 'DD-MON-RR'), '1', '3', 'France', 'Spain', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('18', TO_DATE('17-NOV-21', 'DD-MON-RR'), TO_DATE('17-NOV-21', 'DD-MON-RR'), TO_DATE('17-NOV-21', 'DD-MON-RR'), '1', '3', 'France', 'Spain', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('19', TO_DATE('10-DEC-21', 'DD-MON-RR'), TO_DATE('10-DEC-21', 'DD-MON-RR'), TO_DATE('10-DEC-21', 'DD-MON-RR'), '3', '1', 'Spain', 'France', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('20', TO_DATE('29-DEC-21', 'DD-MON-RR'), TO_DATE('29-DEC-21', 'DD-MON-RR'), TO_DATE('29-DEC-21', 'DD-MON-RR'), '3', '1', 'Spain', 'France', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('21', TO_DATE('10-MAY-21', 'DD-MON-RR'), TO_DATE('10-MAY-21', 'DD-MON-RR'), TO_DATE('10-MAY-21', 'DD-MON-RR'), '2', '3', 'Irland', 'Spain', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('22', TO_DATE('26-MAY-21', 'DD-MON-RR'), TO_DATE('26-MAY-21', 'DD-MON-RR'), TO_DATE('26-MAY-21', 'DD-MON-RR'), '2', '3', 'Irland', 'Spain', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('23', TO_DATE('10-AUG-21', 'DD-MON-RR'), TO_DATE('10-AUG-21', 'DD-MON-RR'), TO_DATE('10-AUG-21', 'DD-MON-RR'), '3', '2', 'Spain', 'Irland', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('24', TO_DATE('18-AUG-21', 'DD-MON-RR'), TO_DATE('18-AUG-21', 'DD-MON-RR'), TO_DATE('18-AUG-21', 'DD-MON-RR'), '3', '2', 'Spain', 'Irland', 'Europe', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('25', TO_DATE('24-FEB-21', 'DD-MON-RR'), TO_DATE('24-FEB-21', 'DD-MON-RR'), TO_DATE('24-FEB-21', 'DD-MON-RR'), '1', '2', 'Iran', 'Iraq', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('26', TO_DATE('24-MAR-21', 'DD-MON-RR'), TO_DATE('24-MAR-21', 'DD-MON-RR'), TO_DATE('24-MAR-21', 'DD-MON-RR'), '1', '2', 'Iran', 'Iraq', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('27', TO_DATE('14-MAR-21', 'DD-MON-RR'), TO_DATE('14-MAR-21', 'DD-MON-RR'), TO_DATE('14-MAR-21', 'DD-MON-RR'), '2', '1', 'Iraq', 'Iran', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('28', TO_DATE('27-MAR-21', 'DD-MON-RR'), TO_DATE('27-MAR-21', 'DD-MON-RR'), TO_DATE('27-MAR-21', 'DD-MON-RR'), '2', '1', 'Iraq', 'Iran', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('29', TO_DATE('24-APr-21', 'DD-MON-RR'), TO_DATE('24-APr-21', 'DD-MON-RR'), TO_DATE('24-APr-21', 'DD-MON-RR'), '1', '3', 'Iran', 'Kuwait', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('30', TO_DATE('27-APr-21', 'DD-MON-RR'), TO_DATE('27-APr-21', 'DD-MON-RR'), TO_DATE('27-APr-21', 'DD-MON-RR'), '1', '3', 'Iran', 'Kuwait', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('31', TO_DATE('3-MAY-21', 'DD-MON-RR'), TO_DATE('3-MAY-21', 'DD-MON-RR'), TO_DATE('3-MAY-21', 'DD-MON-RR'), '3', '1', 'Kuwait', 'Iran', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('32', TO_DATE('7-MAY-21', 'DD-MON-RR'), TO_DATE('7-MAY-21', 'DD-MON-RR'), TO_DATE('7-MAY-21', 'DD-MON-RR'), '3', '1', 'Kuwait', 'Iran', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('33', TO_DATE('15-JUL-21', 'DD-MON-RR'), TO_DATE('15-JUL-21', 'DD-MON-RR'), TO_DATE('15-JUL-21', 'DD-MON-RR'), '2', '3', 'Iraq', 'Kuwait', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('34', TO_DATE('23-JUL-21', 'DD-MON-RR'), TO_DATE('23-JUL-21', 'DD-MON-RR'), TO_DATE('23-JUL-21', 'DD-MON-RR'), '2', '3', 'Iraq', 'Kuwait', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('35', TO_DATE('23-AUG-21', 'DD-MON-RR'), TO_DATE('23-AUG-21', 'DD-MON-RR'), TO_DATE('23-AUG-21', 'DD-MON-RR'), '3', '2', 'Kuwait', 'Iraq', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('36', TO_DATE('21-AUG-21', 'DD-MON-RR'), TO_DATE('21-AUG-21', 'DD-MON-RR'), TO_DATE('21-AUG-21', 'DD-MON-RR'), '3', '2', 'Kuwait', 'Iraq', 'Asia', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('37', TO_DATE('24-MAR-21', 'DD-MON-RR'), TO_DATE('24-MAR-21', 'DD-MON-RR'), TO_DATE('24-MAR-21', 'DD-MON-RR'), '1', '1', 'Cairo', 'France', 'Egypt', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('38', TO_DATE('28-MAR-21', 'DD-MON-RR'), TO_DATE('28-MAR-21', 'DD-MON-RR'), TO_DATE('28-MAR-21', 'DD-MON-RR'), '2', '1', 'Alexandria', 'Iran', 'Egypt', 'Asia');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('39', TO_DATE('22-FEB-21', 'DD-MON-RR'), TO_DATE('22-FEB-21', 'DD-MON-RR'), TO_DATE('22-FEB-21', 'DD-MON-RR'), '2', '3', 'Iraq', 'Spain', 'Asia', 'Europe');

INSERT INTO "PRO_FLIGHT" (FLIGHT_NUM, LAUNCH_TIME, DES_TIME, "DATE", AIRPORT_TSSN1, AIRPORT_FSSN1, SOURCE_PLACE, DES_PLACE, AIRPORT_TSSN2, AIRPORT_FSSN2) VALUES ('40', TO_DATE('27-JAN-21', 'DD-MON-RR'), TO_DATE('27-JAN-21', 'DD-MON-RR'), TO_DATE('27-JAN-21', 'DD-MON-RR'), '2', '1', 'Iraq', 'Cairo', 'Asia', 'Egypt');



--Insert Initial Data in Seat Table
INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('1', 'n', '250', '60', '1');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('2', 'n', '250', '60', '2');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('3', 'n', '100', '40', '3');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('4', 'n', '100', '40', '4');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('5', 'n', '230', '80', '5');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('6', 'n', '230', '80', '8');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('7', 'n', '100', '40', '6');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('8', 'n', '100', '40', '7');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('9', 'n', '230', '80', '9');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('10', 'n', '230', '80', '10');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('11', 'n', '250', '60', '11');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('12', 'n', '250', '60', '12');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('13', 'n', '120', '50', '13');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('14', 'n', '120', '50', '14');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('15', 'n', '120', '50', '15');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('16', 'n', '120', '50', '16');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('17', 'n', '190', '90', '17');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('18', 'n', '190', '90', '18');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('19', 'n', '190', '90', '19');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('20', 'n', '190', '90', '20');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('21', 'n', '250', '60', '21');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('22', 'n', '250', '60', '22');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('23', 'n', '250', '60', '23');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('24', 'n', '250', '60', '24');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('25', 'n', '140', '80', '25');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('26', 'n', '140', '80', '26');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('27', 'n', '140', '80', '27');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('28', 'n', '140', '80', '28');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('29', 'n', '170', '100', '29');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('30', 'n', '170', '100', '30');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('31', 'n', '170', '100', '31');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('32', 'n', '170', '100', '32');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('33', 'n', '120', '40', '33');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('34', 'n', '120', '40', '34');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('35', 'n', '120', '40', '35');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('36', 'n', '120', '40', '36');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('37', 'n', '500', '60', '37');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('38', 'n', '400', '80', '38');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('39', 'n', '900', '50', '39');

INSERT INTO "PRO_SEAT" (SEAT_NUM, STATUS, PRICE, NUM_OF_SEATS, F_SEAT) VALUES ('40', 'n', '460', '55', '40');


-- Commit Changes
commit;
