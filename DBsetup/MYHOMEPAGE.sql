
명령의 1 행에서 시작하는 중 오류 발생 -
drop TABLE USERS
오류 보고 -
ORA-00942: 테이블 또는 뷰가 존재하지 않습니다
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Table USERS이(가) 생성되었습니다.


1 행 이(가) 삽입되었습니다.


명령의 3 행에서 시작하는 중 오류 발생 -
CREATE TABLE USERS (
 "USER_USERNAME" VARCHAR2(50) NOT NULL,
 "USER_PW" VARCHAR2(50) NOT NULL,
 "USER_EMAIL" VARCHAR2(255) NOT NULL,
 
 "USER_NAME" VARCHAR2(50),
 "USER_GENDER" VARCHAR2(50),
 "USER_PHONE1" VARCHAR2(50),
 "USER_PHONE2" VARCHAR2(50),
 
 "USER_ZIPCODE" VARCHAR2(50),
 "USER_ADDRESS1" VARCHAR2(300),
 "USER_ADDRESS2" VARCHAR2(300),
 
 "USER_THEME" VARCHAR2(50), 
 "USER_MODE" VARCHAR2(10), 
 "USER_PICTURE" VARCHAR2(300),
 "USER_WALLPAPER" VARCHAR2(300),
 "USER_ROLE" VARCHAR2(10),
 CONSTRAINT USER_PK PRIMARY KEY (USER_USERNAME)
)
오류 보고 -
ORA-00955: 기존의 객체가 이름을 사용하고 있습니다.
00955. 00000 -  "name is already used by an existing object"
*Cause:    
*Action:

Table USERS이(가) 삭제되었습니다.


Table USERS이(가) 생성되었습니다.


1 행 이(가) 삽입되었습니다.

