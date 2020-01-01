/** basket.sql  -> 장바구니 테이블  **/

--shopBasket 테이블 생성
create table shopBasket(
	basket_no number(38) primary key --장바구니 번호
	,basket_id varchar2(100) not null --유저 아이디(회원테이블 참조)
	,product_no number(38) not null --상품번호(shop테이블 참조)
	,basket_count number(38) not null --담은 상품 개수
	,validity number(38) default 1 
	--장바구니에 담은 상품의 상태. 1 -> 담긴 상품 // 2 -> 결제완료 된 상품(구매 목록) // 3-> 판매 승인된 상품
	,basket_page number(38) not null --해당상품의 페이지 값. 장바구니에서 해당상품클릭했을때 이동하기 위함.
);

select * from shopBasket order by basket_no desc;


--shopBasket 참조키 제약조건 생성
alter table shopBasket
add constraint product_no_fk
foreign key (product_no) references shopList(item_no) on delete cascade;


--basket_no_seq 시퀀스 생성
create sequence basket_no_seq
start with 1
increment by 1
nocache;






/*************************/
drop table shopBasket;
drop sequence basket_no_seq;
delete from shopBasket;















