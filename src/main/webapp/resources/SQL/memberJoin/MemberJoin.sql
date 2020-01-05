create table MemberJoin (
	user_id varchar2(100) primary key
	,user_pwd varchar2(1000) not null
	,user_name varchar2(100) not null
	,user_birthday varchar2(100) not null
	,user_gender varchar2(100) not null
	,user_email varchar2(50) not null
	,user_phone varchar2(30) not null
	,join_date date
);

select * from MemberJoin;

SELECT USER_ID, USER_PHONE FROM MEMBERJOIN WHERE USER_ID = 'aaaaaa';

update MemberJoin set USER_EMAIL = '123213@naver.com' WHERE USER_ID = 'aaaaaa';

insert into MEMBERJOIN (user_id, user_pwd, user_name, user_birthday, user_gender, user_email, user_phone, join_date)
values('aaaaaa','aaaaaa','name1','birthday1','gender1','email1','phone1',sysdate);