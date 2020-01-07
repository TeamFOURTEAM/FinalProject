-- auto-generated definition
create table MEMBERVO
(
    USER_ID       VARCHAR2(40)  not null
        primary key,
    USER_PWD      VARCHAR2(40)  not null,
    USER_NAME     VARCHAR2(40),
    USER_BIRTHDAY VARCHAR2(40)  not null,
    USER_GENDER   VARCHAR2(10)  not null,
    USER_EMAIL    VARCHAR2(100) not null,
    USER_PHONE    VARCHAR2(50)  not null
)

insert into membervo values('dlrudgns90','1234','이경훈','5월','남','dlrudgns1004@gmail.com','010-8570-2108')
insert into membervo values('lkh','1234','이경훈','5월','남','dlrudgns1004@gmail.com','010-8570-2108')
insert into membervo values('pebble','1234','이경훈','5월','남','dlrudgns1004@gmail.com','010-8570-2108')
insert into membervo values('admin','1234','이경훈','5월','남','dlrudgns1004@gmail.com','010-8570-2108')

insert into membervo values('admin','1234','관리자','5월','남','dlrudgns1004@gmail.com','010-8570-2108')

select * from membervo
