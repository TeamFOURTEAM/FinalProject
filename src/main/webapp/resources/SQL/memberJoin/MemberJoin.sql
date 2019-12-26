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

insert into MEMBERJOIN (user_id, user_pwd, user_name, user_birthday, user_gender, user_email, user_phone)
values('aaaaaa','aaaaaa','name','birthday','gender','email','phone');