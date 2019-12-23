/** shop.sql **/

create table shopList(
	item_no number(38) primary key --shop item 번호
	,item_name varchar2(100) not null --상품명
	,item_sub varchar2(300) not null --상품 세부 설명
	,item_price varchar2(200) not null --가격
	,item_stockCount varchar2(200) not null --상품 재고
	,item_cont varchar2(4000) not null--상품 설명(에디터)
	,item_img varchar2(200) not null --상품리스트 출력 이미지(자료실)
	,item_likeCount number(38) default 0 --추천수
);

select * from shopList order by item_no desc;


--item_no_seq 시퀀스 생성
create sequence item_no_seq
start with 1
increment by 1
nocache;






/***********************/
drop table shopList;
drop sequence item_no_seq;



