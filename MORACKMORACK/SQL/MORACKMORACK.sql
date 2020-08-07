DROP TABLE likes;
DROP TABLE comments;
DROP TABLE files;
DROP TABLE communites;
DROP TABLE meetmem_offmeet;
DROP TABLE menu;
DROP TABLE reserveable;
DROP TABLE pay;
DROP TABLE notify;
DROP TABLE friend;
DROP TABLE meetmem;
DROP TABLE wishmeet;
DROP TABLE meet_hashtag;
DROP TABLE hashtag;
DROP TABLE users_category;
DROP TABLE offmeet;
DROP TABLE business;
DROP TABLE meet;
DROP TABLE users;
DROP TABLE category;


DROP SEQUENCE seq_category_category_no;
DROP SEQUENCE seq_users_category_category_no;
DROP SEQUENCE seq_hashtag_hash_no;
DROP SEQUENCE seq_meet_hashtag_meet_hash_no;
DROP SEQUENCE seq_wishmeet_wish_no;
DROP SEQUENCE seq_meetmem_mem_no;
DROP SEQUENCE seq_notify_notify_no;
DROP SEQUENCE seq_friend_friend_no;
DROP SEQUENCE seq_offmeet_off_no;
DROP SEQUENCE seq_meetmem_offmeet_no;
DROP SEQUENCE seq_pay_pay_no;
DROP SEQUENCE seq_reserve_able_no;
DROP SEQUENCE seq_menu_menu_no;

 

CREATE SEQUENCE seq_category_category_no				INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_users_category_category_no			INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_hashtag_hash_no				INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_meet_hashtag_meet_hash_no			INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_wishmeet_wish_no				INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_meetmem_mem_no				INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_notify_notify_no					INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_friend_friend_no 				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_offmeet_off_no	 		  		INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_meetmem_offmeet_no     				INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_pay_pay_no                                           			INCREMENT BY 1 START WITH 10000;
CREATE SEQUENCE seq_reserve_able_no		 			INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE seq_menu_menu_no		 			INCREMENT BY 1 START WITH 1;
 
 

CREATE TABLE category(
	category_no	NUMBER(2)	NOT NULL,	
	category_name	VARCHAR2(20) 	NOT NULL,
	PRIMARY KEY(category_no)
);
 

INSERT INTO category VALUES (1, '����'); 
INSERT INTO category VALUES (2, '����'); 
INSERT INTO category VALUES (3, '����'); 
INSERT INTO category VALUES (4, '��ȭ'); 
INSERT INTO category VALUES (5, '����'); 
INSERT INTO category VALUES (6, '����'); 
INSERT INTO category VALUES (7, '���,�ڱ���'); 
INSERT INTO category VALUES (8, '��Ƽ��Ƽ'); 
INSERT INTO category VALUES (9, '����,��ȭ'); 
INSERT INTO category VALUES (10, '��'); 
INSERT INTO category VALUES (11, '����'); 
INSERT INTO category VALUES (12, '�ݷ�����'); 
INSERT INTO category VALUES (13, '�丮'); 
INSERT INTO category VALUES (14, '��'); 
INSERT INTO category VALUES (15, '������'); 
INSERT INTO category VALUES (16, '����'); 
INSERT INTO category VALUES (17, '��Ÿ'); 
 

CREATE TABLE hashtag(
	hash_no		NUMBER(20) 	NOT NULL,
	hash_name	VARCHAR2(100) 	NOT NULL,
	PRIMARY KEY(hash_no)
);

 

INSERT  INTO hashtag VALUES (seq_hashtag_hash_no.nextval, '����'); 

 

CREATE TABLE users( 
	user_id 			VARCHAR2(20)	NOT NULL,
	password			VARCHAR2(16)	NOT NULL,	
	user_name 			VARCHAR2(50)	NOT NULL,
	email			VARCHAR2(50)	NOT NULL,
	phone_number		VARCHAR2(14)	NOT NULL,
	birthday			DATE,
	nick_name		VARCHAR2(50)	NOT NULL	UNIQUE,
	image_file		VARCHAR2(100),
	address			VARCHAR2(100)	NOT NULL,
	gender			CHAR(1)		NOT NULL,
	user_state		CHAR(1)		DEFAULT 0,
	naver_id			VARCHAR2(50),
	kakao_id			VARCHAR2(50),
	google_id		VARCHAR2(50),
	join_meet_count		NUMBER(10)	DEFAULT 0,
	role 			VARCHAR2(5) 	DEFAULT 'user',
	PRIMARY KEY(user_id)
);

 

INSERT INTO users ( user_id, password, user_name , email, phone_number, birthday, nick_name, image_file, address, gender, user_state, naver_id, kakao_id, google_id, join_meet_count, role) 
VALUES ( 'admin', '1234', '������', 'admin@mvc.com', '01011112222', sysdate, '�����հ�����', NULL, '������ �Ǽ���', '0', '0', NULL, NULL, NULL, 0, 'user'); 
INSERT INTO users VALUES ( 'user01', '1111', '���Ȱ�', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������2', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');       
INSERT INTO users VALUES ( 'user02', '2222', '���Ȱ�1', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������3', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');
INSERT INTO users VALUES ( 'user03', '3333', '���Ȱ�2', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������4', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');
INSERT INTO users VALUES ( 'user04', '4444', '���Ȱ�3', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������5', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user'); 
INSERT INTO users VALUES ( 'user05', '5555', '���Ȱ�5', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������6', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');
INSERT INTO users VALUES ( 'user06', '5555', '���Ȱ�6', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������7', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');
INSERT INTO users VALUES ( 'user07', '5555', '���Ȱ�7', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������8', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');
INSERT INTO users VALUES ( 'user08', '5555', '���Ȱ�8', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������9', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');
INSERT INTO users VALUES ( 'user09', '5555', '���Ȱ�9', 'chikichiki@mvc.com', '01033334444', sysdate, '�����̸������10', NULL, '����� ���ʱ�', '0', '0', 1, 1, 1, 0, 'user');

CREATE TABLE meet( 
	meet_id 			VARCHAR2(20)		NOT NULL,
	leader_id 			VARCHAR2(20)		NOT NULL	 REFERENCES users(user_id),
	meet_name 		VARCHAR2(50)		NOT NULL,		
	meet_loc			VARCHAR2(20)		NOT NULL,
	max_num 		NUMBER(10)		NOT NULL,
	mem_num 		NUMBER(10)		NOT NULL,
	meet_img 		VARCHAR2(100),
	s_intro 			VARCHAR2(20),
	l_intro			VARCHAR2(100),
	reg_date			DATE,
	meet_star			NUMBER(1),
	bank			VARCHAR2(20),
	accNum			VARCHAR(20),
	category			NUMBER(2)		NOT NULL REFERENCES category(category_no),
	meet_appr		char(1)			CONSTRAINT boolean_verified_ck_appr CHECK(meet_appr = '0' OR meet_appr = '1'),
	meet_type		char(1)			CONSTRAINT boolean_verified_ck_type CHECK(meet_type = '0' OR meet_type = '1'),
	PRIMARY KEY(meet_id)
);

 

INSERT  INTO meet VALUES ('meet01', 'user01', '����1', '����� ������', 20, 0, '', 'ȯ���մϴ�', '������ ��ſ���', sysdate, 0, '��������', '71530201211299', 5, 0, 0); 
INSERT  INTO meet VALUES ('meet02', 'user02', '����2', '����� ������', 20, 0, '', 'ȯ���մϴ�', '������ ��ſ���', sysdate, 0, '��������', '71530201211299', 5, 0, 0); 
INSERT  INTO meet VALUES ('meet03', 'user03', '����3', '����� ������', 20, 0, '', 'ȯ���մϴ�', '������ ��ſ���', sysdate, 0, '��������', '71530201211299', 5, 0, 0); 
INSERT  INTO meet VALUES ('meet04', 'user04', '����4', '����� ������', 20, 0, '', 'ȯ���մϴ�', '������ ��ſ���', sysdate, 0, '��������', '71530201211299', 5, 0, 0); 
INSERT  INTO meet VALUES ('meet05', 'user05', '����5', '����� ������', 20, 0, '', 'ȯ���մϴ�', '������ ��ſ���', sysdate, 0, '��������', '71530201211299', 5, 0, 0); 
 

CREATE TABLE meet_hashtag(
	meet_hash_no			NUMBER(20)		NOT NULL,
	meet_id				VARCHAR2(20)		REFERENCES meet(meet_id),
	hash_no				NUMBER(20)		REFERENCES hashtag(hash_no),
	PRIMARY KEY(meet_hash_no)
);

 

 

CREATE TABLE users_category(
	users_category_no			NUMBER(2)	NOT NULL,
	user_id				VARCHAR2(20) 	NOT NULL REFERENCES users(user_id),
	category_no			NUMBER(2)	NOT NULL REFERENCES category(category_no),
	PRIMARY KEY(users_category_no)
);

CREATE TABLE wishmeet(
	wish_no		NUMBER(20)	NOT NULL,
	user_id		VARCHAR2(20)	NOT NULL REFERENCES users(user_id),
	meet_id		VARCHAR2(20)	NOT NULL REFERENCES meet(meet_id),
	wish_date	DATE,
 	PRIMARY KEY(wish_no)
);
 
 insert into wishmeet values(seq_wishmeet_wish_no.nextval, 'user02', 'meet01', sysdate);

 

CREATE TABLE meetmem( 
	mem_no 			NUMBER(30)		NOT NULL,
	user_id 			VARCHAR2(20)		NOT NULL REFERENCES users(user_id),
	meet_id	 		VARCHAR2(20)		NOT NULL REFERENCES meet(meet_id),		
	join_code 			CHAR(1)			CONSTRAINT boolean_verified_ck_join_code CHECK(join_code = '0' OR join_code  = '1'),		
	meet_role 		CHAR(1)			CONSTRAINT boolean_verified_ck_meet_rold CHECK(meet_role = '0' OR meet_role = '1' OR meet_role = '2'),			
	join_req_date 		DATE,
	join_date 			DATE,
	intro			VARCHAR2(100),
	notify_count		NUMBER(20),
	PRIMARY KEY(mem_no)
);

 insert into meetmem values(seq_meetmem_mem_no.nextval, 'user01', 'meet01', '1', '0', sysdate, sysdate, '����', 0);
 insert into meetmem values(seq_meetmem_mem_no.nextval, 'user02', 'meet01', '1', '2', sysdate, sysdate, '����', 0);


CREATE TABLE notify( 
	notify_no			NUMBER			NOT NULL,
	notify_user		VARCHAR2(20)		NOT NULL REFERENCES USERS(user_id),
	req_notify_user		VARCHAR2(20)		NOT NULL REFERENCES USERS(user_id),
	notify_type		CHAR(1)			NOT NULL,
	notify_detail		VARCHAR2(100),	
	notify_date		DATE,
	notify_mang		CHAR(1)			NOT NULL,
	PRIMARY KEY(notify_no)
);

 

insert into notify values(seq_NOTIFY_notify_no.nextval,'user01','user02','0','�̻��� ���ۻ���',sysdate,'0');

 

CREATE TABLE FRIEND(
	friend_no			NUMBER			NOT NULL,
	req_friend_id		VARCHAR2(20)		NOT NULL REFERENCES	USERS(user_id),
	recv_friend_id		VARCHAR2(20)		NOT NULL REFERENCES	USERS(user_id),
	friend_code		CHAR(1)			NOT NULL,
	req_friend_date		DATE			NOT NULL,
	friend_date		DATE,
	PRIMARY KEY(friend_no)
);

 

insert into friend values(seq_friend_friend_no.nextval,'user01','user02','0',sysdate,sysdate);

 
CREATE TABLE offmeet( 
	off_no 				NUMBER(20) 		NOT NULL,
	user_id 				VARCHAR2(16)		NOT NULL REFERENCES users(user_id),
	meet_id 				VARCHAR2(20)               	NOT NULL REFERENCES meet(meet_id),
	off_name              			VARCHAR2(50),
	off_loc 			          	 VARCHAR2(100),
	off_max 				NUMBER(10),
	off_mem 				NUMBER(10),
	amount				NUMBER(10)                    DEFAULT 0,
	off_date 		                  	 	VARCHAR2(20),
	off_time		                    	VARCHAR2(20),
	reg_date 					DATE,	
	image_file 		            VARCHAR2(100)
	PRIMARY KEY(off_no)
);



INSERT 
INTO offmeet
VALUES (seq_offmeet_off_no.nextval, 'user01', 'meet01', '�𿩶� �����ǽ�', '�����̽��������� ����2ȣ��', 20, 5, 10000, to_date('2020/07/14', 'YYYY/MM/DD'), '13'); 

INSERT 
INTO offmeet
VALUES (seq_offmeet_off_no.nextval, 'user02', 'meet02', '�𿩶� �����ǽ�', '�����̽��������� ����3ȣ��', 15, 1, 11000, to_date('2020/07/15', 'YYYY/MM/DD'), '14'); 

INSERT 
INTO offmeet
VALUES (seq_offmeet_off_no.nextval, 'user03', 'meet03', '�𿩶� �����ǽ�', '�����̽��������� ����4ȣ��', 15, 2, NULL, to_date('2020/07/11', 'YYYY/MM/DD'), '15'); 

 

CREATE TABLE meetmem_offmeet(
	meetmem_offmeet_no 		       NUMBER(20) 			NOT NULL,
	mem_id 			                   NUMBER(20)			NOT NULL REFERENCES meetmem(mem_no),
	off_no 				       NUMBER(20)               	NOT NULL REFERENCES offmeet(off_no),
	PRIMARY KEY(meetmem_offmeet_no)
);

 

CREATE TABLE business( 
	business_id 				VARCHAR2(20) 			NOT NULL,
	business_pass 				VARCHAR2(16)			NOT NULL,
	business_name 				VARCHAR2(50)			NOT NULL,
	business_loc				VARCHAR2(100)			NOT NULL,
	category_no 				NUMBER(2)			NOT NULL REFERENCES category(category_no),
	business_phone				VARCHAR2(13)			NOT NULL,
	business_img 				VARCHAR2(100),
	business_num 				VARCHAR2(50)			NOT NULL UNIQUE,
	business_owner				VARCHAR2(50)			NOT NULL,
	reg_date 					DATE				DEFAULT SYSDATE,
	bank 					VARCHAR2(50)			NOT NULL,
	deposit_acc_num				VARCHAR2(50)			NOT NULL UNIQUE,
	business_star				NUMBER(1)			DEFAULT 0,
	business_start_time				CHAR(5),
	business_end_time				CHAR(5),
	PRIMARY KEY(business_id)
);

CREATE TABLE reserveable(
	reserve_able_no				NUMBER(20)				NOT NULL,
	business_id 				VARCHAR2(20) 			NOT NULL REFERENCES business(business_id),
	reserve_able_start_time			CHAR(5)					NOT NULL,
	reserve_able_end_time			CHAR(5)					NOT NULL,
	PRIMARY KEY(reserve_able_no)
);



CREATE TABLE menu (
	menu_no						NUMBER(20)			NOT NULL,
	business_id 					VARCHAR2(20) 			NOT NULL REFERENCES business(business_id),
	BUSINESS_MENU					VARCHAR2(50)			NOT NULL,
	BUSINESS_MENU_FEE				NUMBER(10)			NOT NULL,
	BUSINESS_MENU_IMG				VARCHAR2(100),
	PRIMARY KEY(menu_no)
);



INSERT 
INTO business ( business_id, business_pass, business_name, business_loc, category_no, business_phone, business_img, business_num, business_owner, reg_date, bank, deposit_acc_num, business_star, business_start_time, business_end_time ) 
VALUES ( 'bus01', '1111', '����� ��ȭ��', '��⵵ ������ ��ȱ�', 1, '010-9625-8155', NULL, '0123456789', '������', to_date(SYSDATE, 'YYYY/MM/DD'), '��������', '110-437-123456', NULL, NULL, NULL);

INSERT 
INTO business ( business_id, business_pass, business_name, business_loc, category_no, business_phone, business_img, business_num, business_owner, reg_date, bank, deposit_acc_num, business_star, business_start_time, business_end_time ) 
VALUES ( 'bus02', '2222', '�����̳� �¿���', '����� ������ ��Ʈķ��', 2, '010-1234-5678', NULL, '987654321', '�����', to_date(SYSDATE, 'YYYY/MM/DD'), '�츮����', '110-437-987654', NULL, NULL, NULL);


 
CREATE TABLE pay( 
	pay_no 				NUMBER(20) 			NOT NULL,
	user_id 				VARCHAR2(16)			NOT NULL REFERENCES users(user_id),
	meet_id 				VARCHAR2(20)               		NOT NULL REFERENCES meet(meet_id),
	off_no 				NUMBER(20)       			NOT NULL REFERENCES offmeet(off_no),
	business_id			VARCHAR(20) 	          		REFERENCES business(business_id),
	reserve_mem_num		           	 NUMBER(3),
	reserve_start_time			VARCHAR(20), 
	reserve_end_time 			VARCHAR(20), 
	reserve_date              		VARCHAR(20), 
	total_amount 			NUMBER(10),
	pay_status			CHAR(1)                                     DEFAULT 0,
      	pay_date				DATE,
	pay_method 			CHAR(1),
	PRIMARY KEY(pay_no)
);

INSERT 
INTO pay
VALUES (seq_pay_pay_no.nextval,  'user01', 'meet01' , 10001, null, 20, to_date('14:00', 'HH24:MI'), to_date('15:00', 'HH24:MI'), to_date('2020/07/11', 'YYYY/MM/DD'), 400000, '1',SYSDATE,  '0'); 

INSERT 
INTO pay
VALUES (seq_pay_pay_no.nextval, 'user02', 'meet02' , 10001, 'bus01', 10, to_date('11:00', 'HH24:MI'), to_date('12:00', 'HH24:MI'), to_date('2020/07/14', 'YYYY/MM/DD'), 300000, '1', SYSDATE,  '1'); 

INSERT 
INTO pay
VALUES (seq_pay_pay_no.nextval, 'user02', 'meet03', 10002, 'bus01', 5, to_date('10:00', 'HH24:MI'), to_date('11:00', 'HH24:MI'), to_date('2020/07/16', 'YYYY/MM/DD'), 50000, '1' , SYSDATE,  '2'); 

		

CREATE TABLE communites( 
	post_no 		NUMBER(20)		NOT NULL,
	communites_name 	CHAR(1)			NOT NULL,
	user_id		VARCHAR2(20)		NOT NULL	REFERENCES USERS(user_id),
	meet_id		VARCHAR2(20)		NOT NULL	REFERENCES MEET(meet_id),
	off_no		NUMBER(20)		REFERENCES OFFMEET(off_no),
	business_id	VARCHAR2(20)		REFERENCES BUSINESS(business_id),
	title		VARCHAR2(50)		NOT NULL,
	content		VARCHAR2(2000)		NOT NULL,
	reg_date		DATE			NOT NULL,
	mod_date	DATE,		
	view_count	NUMBER(10)		DEFAULT 0,
	like_count	NUMBER(10)		DEFAULT 0,
	rvstar		NUMBER(1)		DEFAULT 0,
	PRIMARY KEY(post_no)
);

CREATE TABLE files( 
	file_no		NUMBER(20)		NOT NULL,
	post_no		NUMBER(20)		NOT NULL	REFERENCES communites(post_no),
	meet_id		VARCHAR2(20)		NOT NULL	REFERENCES MEET(meet_id),
	file_name		VARCHAR2(100)		NOT NULL,
	file_extension	VARCHAR2(5),
	file_size		NUMBER(10),
	PRIMARY KEY(file_no)
);

CREATE TABLE comments( 
	comment_no 		NUMBER(20)		NOT NULL,
	post_no			NUMBER(20)		NOT NULL	REFERENCES communites(post_no),
	user_id			VARCHAR2(20)		NOT NULL	REFERENCES USERS(user_id),
	parent_comment_no	NUMBER(20)		REFERENCES comments(comment_no),
	comment_content		VARCHAR2(100),
	reg_date			DATE			NOT NULL,
	PRIMARY KEY(comment_no)
);

CREATE TABLE likes( 
	like_no		NUMBER(20)	NOT NULL,
	user_id		VARCHAR2(20)	NOT NULL	REFERENCES USERS(user_id),
	post_no		NUMBER(20)	NOT NULL	REFERENCES communites(post_no),
	PRIMARY KEY(like_no)
);


commit;






