-- Dump of table role
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE role';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;

CREATE TABLE role (
  role_id number(10) NOT NULL,
  role varchar2(255) DEFAULT NULL,
  PRIMARY KEY (role_id)
) ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE "OAUTH"."ROLE_SEQ"  MINVALUE 1 MAXVALUE 999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

CREATE OR REPLACE TRIGGER role_seq_tr
 BEFORE INSERT ON role FOR EACH ROW
 WHEN (NEW.role_id IS NULL)
BEGIN
 SELECT role_seq.NEXTVAL INTO :NEW.role_id FROM DUAL;
END;

INSERT INTO role (role_id, role)
VALUES(1,'ADMIN');


-- Dump of table user
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE user';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;

CREATE TABLE user_ora (
  user_id number(10) NOT NULL,
  active number(10) DEFAULT NULL,
  email varchar2(255) NOT NULL,
  last_name varchar2(255) NOT NULL,
  name varchar2(255) NOT NULL,
  password varchar2(255) NOT NULL,
  PRIMARY KEY (user_id)
) ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE user_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER user_seq_tr
 BEFORE INSERT ON user_ora FOR EACH ROW
 WHEN (NEW.user_id IS NULL)
BEGIN
 SELECT user_seq.NEXTVAL INTO :NEW.user_id FROM DUAL;
END;

INSERT INTO user_ora (user_id, active, email, last_name, name, password)
	 SELECT 1,1,'admin@gmail.com','s','Sam','sam' FROM dual UNION ALL 
	 SELECT 2,1,'admin@gmail.com','s','youtube','youtube' FROM dual;
   

-- Dump of table user_role   
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE user_role';
EXCEPTION
   WHEN OTHERS THEN NULL;
END;

CREATE TABLE user_role (
  user_id number(10) NOT NULL,
  role_id number(10) NOT NULL,
  PRIMARY KEY (user_id,role_id)
) ;

INSERT INTO user_role (user_id, role_id)
VALUES(1,1);
