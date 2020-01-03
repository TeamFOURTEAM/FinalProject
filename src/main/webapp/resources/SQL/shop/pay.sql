/** pay.sql  -> 주문 테이블  **/
create table pay(
	pay_no number(38) primary key --주문 내역 번호
	,user_id varchar2(100) not null--구매자 아이디
	,pay_price number(38) not null--총 구매금액
 	,pay_date date --구매날짜
 	,validity number(38) default 1 --판매승인 여부. 판매승인전 -> 1, 판매승인후 -> 2, 발송처리후 -> 3
);

--pay_no_seq 시퀀스 생성
create sequence pay_no_seq
start with 1
increment by 1
nocache;

select * from pay order by pay_no desc;


/*********** test ************/
select pay_no from (select pay_no from pay order by pay_no desc) where rownum = 1;
insert into pay (pay_no,user_id,pay_price,pay_date,validity) 
values(pay_no_seq.nextval,'pebble',12500,sysdate,1)
/*********** test ************/





/*************************/
drop table pay;
drop sequence pay_no_seq;
delete from pay;
delete from pay where pay_no = 2;














