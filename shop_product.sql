### 상품 테이블 생성 #############
create table shop_product (
 p_no int(5) not null primary key auto_increment, #상품 번호 
 p_name varchar(20), #상품 이름
 p_price int, #상품 가격
 p_detail text, #상품 상세정보
 p_date datetime, #상품 등록날짜
 p_stock int, #상품 재고
 p_image varchar(20) #상품 이미지명
) engine=innodb default charset=euckr;


drop table shop_product;

#####################################################
select * from shop_product;
delete from shop_product;
desc shop_product;
select * from shop_product order by p_date asc;
select * from shop_product order by p_price asc