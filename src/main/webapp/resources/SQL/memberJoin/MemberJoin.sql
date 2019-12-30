create table MemberJoin (
	user_id varchar2(100) primary key
	,user_pwd varchar2(1000) not null
	,user_name varchar2(100) not null
	,user_birthday varchar2(100) not null
	,user_gender varchar2(100) not null
	,user_email varchar2(50) not null
	,user_phone varchar2(30) not null
);

select * from MemberJoin;

SELECT USER_ID FROM MEMBERJOIN WHERE USER_ID = 'aaaaaa';


insert into MEMBERJOIN (user_id, user_pwd, user_name, user_birthday, user_gender, user_email, user_phone)
values('aaaaaaa','aaaaaaa','name1','birthday1','gender1','email1','phone1');