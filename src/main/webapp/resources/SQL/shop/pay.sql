/** pay.sql  -> 결제 정보 테이블  **/
create table pay(
	pay_no number(38) primary key --구매 내역 번호
	,user_id varchar2(100) not null--구매자 아이디
	,pay_price number(38) not null--총 구매금액
 	,pay_date date --구매날짜
);

--pay_no_seq 시퀀스 생성
create sequence pay_no_seq
start with 1
increment by 1
nocache;

select * from pay order by pay_no desc;
















