/** basket.sql  -> 장바구니 테이블  **/

create table shopBasket(
	basket_no number(38) primary key --장바구니 번호
	,basket_user_id varchar2(100) not null --유저 아이디(회원테이블 참조)
	,product_no number(38) not null --상품번호(shop테이블 참조)
	,basket_count number(38) not null --담은 상품 개수
	,validity number(38) not null 
	--장바구니에 담은 상품의 상태. 1 -> 담긴 상품 // 2 -> 주문완료 된 상품
);

select * from shopBasket order by basket_no desc;

--basket_no_seq 시퀀스 생성
create sequence basket_no_seq
start with 1
increment by 1
nocache;























