

CREATE table "USER" (
 "USERNAME" VARCHAR2(50) NOT NULL,
 "PW" VARCHAR2(50) NOT NULL,
 "EMAIL" VARCHAR2(255) NOT NULL,
 
 "NAME" VARCHAR2(50),
 "GENDER" VARCHAR2(50),
 "PHONE1" VARCHAR2(50),
 "PHONE2" VARCHAR2(50),

 "ZIPCODE" VARCHAR2(50) NOT NULL,
 "ADDRESS1" VARCHAR2(300) NOT NULL,
 "ADDRESS2" VARCHAR2(300) NOT NULL,
 constraint "USER_PK" primary key ("USERNAME")
);


create table zipcode (
 seq NUMBER(10) not null,
 zipcode VARCHAR2(60),
 sido VARCHAR2(60),
 gugun VARCHAR2(60),
 dong VARCHAR2(60),
 bunji VARCHAR2(60),
 constraint PK_ZIPCODE primary key (seq)
);



drop table zipcode;