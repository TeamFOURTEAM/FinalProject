create table BOARD
(
    BACK_END_LIST_NO NUMBER(38)         not null
        primary key,
    BACK_END_LIST_IMG   VARCHAR2(4000) not null,
    BACK_END_LIST_TITLE VARCHAR2(400)  not null,
    BACK_END_LIST_CONT  VARCHAR2(4000) not null,
    BACK_END_LIST_ID    VARCHAR2(100)  not null
        constraint MV_ID_B
            references MEMBERVO,
    BACK_END_LIST_DATE  DATE,
    STEP                NUMBER,
    REF                 NUMBER
);

delete from BOARD where BACK_END_LIST_ID='dlrudgns90'

alter table BOARD drop constraint FOUR.MEMVER_ID_Q

select * from board

create sequence back_end_list_no_seq
start with 1
increment by 1
nocache;


