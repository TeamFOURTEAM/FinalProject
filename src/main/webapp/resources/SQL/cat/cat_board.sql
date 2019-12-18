--cat_board 자료실 테이블 생성
create table cat_board(
 cat_no int primary key -- 게시물 번호
 ,cat_title varchar2(200) not null -- 고양이 종류(제목)
 ,cat_cont varchar2(4000) not null -- 내용
 ,cat_file varchar2(200) not null -- 첨부파일
);

--cat_no_seq 시퀀스 생성
create sequence cat_no_seq
start with 1
increment by 1
nocache;

--bbs_no_seq 시퀀스 다음번호값 확인
select cat_no_seq.nextval from dual;

select * from cat_board 

select * from CAT_BOARD where cat_title='먼치킨'

delete from cat_board where cat_no=4

insert into cat_board (cat_no,cat_title,cat_cont,cat_file) 
		values(cat_no_seq.nextval,'123','4444','dfsdff');