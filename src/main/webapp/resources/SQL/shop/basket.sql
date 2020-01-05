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
	,pay_no number(38) default 0 --주문 번호. 기본값은 0으로 장바구니에 담으면 0, 결제처리가 되면 바뀐다. 
);

select * from shopBasket order by basket_no desc;


/** shopBasket 참조키 제약조건 생성 **/

--shopList의 상품 번호를 참조
alter table shopBasket
add constraint product_no_fk
foreign key (product_no) references shopList(item_no) on delete cascade;

--pay의 결제정보 번호를 참조
alter table shopBasket
add constraint pay_no_fk
foreign key (pay_no) references pay(pay_no) on delete cascade;

--basket_no_seq 시퀀스 생성
create sequence basket_no_seq
start with 1
increment by 1
nocache;

/*********** test ************/
update shopBasket set validity=2,pay_no= 
(select pay_no from (select pay_no from pay order by pay_no desc) where rownum = 1)
where basket_id='pebble' and validity=1;

--상품명만 가져오기
select 
	LISTAGG(item_name,',') 
	WITHIN GROUP (ORDER BY b.basket_no desc) 
	AS product_name
from shopList l, shopBasket b 
where 
	l.item_no = b.product_no
	and pay_no=17
order by b.basket_no desc

/*********** test ************/


/*************************/
drop table shopBasket;
drop sequence basket_no_seq;
delete from shopBasket;















