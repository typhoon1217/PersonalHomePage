
����� 1 �࿡�� �����ϴ� �� ���� �߻� -
drop TABLE USERS
���� ���� -
ORA-00942: ���̺� �Ǵ� �䰡 �������� �ʽ��ϴ�
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:

Table USERS��(��) �����Ǿ����ϴ�.


1 �� ��(��) ���ԵǾ����ϴ�.


����� 3 �࿡�� �����ϴ� �� ���� �߻� -
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
���� ���� -
ORA-00955: ������ ��ü�� �̸��� ����ϰ� �ֽ��ϴ�.
00955. 00000 -  "name is already used by an existing object"
*Cause:    
*Action:

Table USERS��(��) �����Ǿ����ϴ�.


Table USERS��(��) �����Ǿ����ϴ�.


1 �� ��(��) ���ԵǾ����ϴ�.

