/** pay_ok.sql(주문,결제 확인된 장바구니 상품 테이블) **/

create table pay_ok(
	payCom_no number(38) primary key --장바구니 번호
	,payCom_id varchar2(100) not null --유저 아이디(회원테이블 참조)
	,product_no number(38) not null --상품번호
	,basket_count number(38) not null --담은 상품 개수
	,product_page number(38) not null --해당상품의 페이지 값. 장바구니에서 해당상품클릭했을때 이동하기 위함.
	,pay_no number(38) not null --주문 번호
);


select * from pay_ok order by payCom_no desc;

--payCom_no_seq 시퀀스 생성
create sequence payCom_no_seq
start with 1
increment by 1
nocache;

--pay의 주문번호를 참조
alter table pay_ok
add constraint pay_no_confirm_fk
foreign key (pay_no) references pay(pay_no) on delete cascade;

--pay_ok테이블 컬럼 product_page명을 basket_page로 변경
ALTER TABLE pay_ok RENAME COLUMN product_page TO basket_page;


/**********************************/
insert into pay_ok (payCom_no,payCom_id,product_no,basket_count,basket_page)
select basket_no,basket_id,product_no,basket_count,basket_page from shopBasket 
where pay_no=2;




/*************************/
drop table pay_ok;
drop sequence payCom_no_seq;
delete from pay_ok;

