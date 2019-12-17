/** shop.sql **/

create table test_shop(
	item_no number(38) primary key --shop item 번호
	,item_name varchar2(100) not null --상품명
	,item_sub varchar2(300) not null --상품 세부 설명
	,item_price varchar2(200) not null --가격
	,item_cont varchar2(4000) not null--상품 설명(에디터)
);

select * from test_shop order by item_no desc;

insert into test_shop (item_no,item_name,item_sub,item_price,item_cont) 
		values(item_no_seq.nextval,'고양이','고양이',
		'고양이','고양이')


--item_no_seq 시퀀스 생성
create sequence item_no_seq
start with 1
increment by 1
nocache;











