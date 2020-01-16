create table MemberJoin (
	user_id varchar2(1000) unique not null
	,user_pwd varchar2(1000) not null
	,user_name varchar2(1000) not null
	,user_birthday varchar2(1000) not null
	,user_gender varchar2(1000) not null
	,user_email varchar2(1000) not null
	,user_phone varchar2(1000) unique not null
	,join_date date
);

drop table cat_board

select * from all_tables

select * from MemberJoin;

delete from MemberJoin where user_id='dlrudgns90'

SELECT USER_ID, USER_PHONE FROM MEMBERJOIN WHERE USER_ID = 'aaaaaa';

update MemberJoin set USER_EMAIL = '123213@naver.com' WHERE USER_ID = 'aaaaaa';

insert into MEMBERJOIN (user_id, user_pwd, user_name, user_birthday, user_gender, user_email, user_phone, join_date)
