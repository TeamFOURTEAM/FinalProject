create table NormalBoard(
   normal_no number(38) primary key,
   normal_id varchar2(400) constraint B_ID_N references MEMBERVO(user_id) on delete cascade ,
   normal_title varchar2(400),
   normal_hit number(38) default 0,
   normal_cont CLOB not null,
   normal_date date,
   normal_ref number(38),
   normal_step number(38)
);

alter table NormalBoard drop constraint B_ID_N

create sequence seq_normal_no
start with 1
increment by 1
nocache;