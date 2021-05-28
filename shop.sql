### 상품 테이블 생성 #############
create table shop_product (
 p_no int(5) not null primary key auto_increment, #상품 번호 
 p_name varchar(20), #상품 이름
 p_price varchar(10), #상품 가격
 p_detail text, #상품 상세정보
 p_date varchar(20), #상품 등록날짜
 p_stock varchar(10), #상품 재고
 p_image varchar(20) #상품 이미지명
) engine=innodb default charset=euckr;

### 주문 테이블 생성 #############
create table shop_order (
 o_no int(5) not null primary key auto_increment, #주문 번호 
 p_no varchar(5), #상품 번호 
 o_quantity varchar(10),  #주문 수량
 o_date varchar(20),  #주문 일자
 o_state varchar(10),  #주문 상태
 o_id varchar(10) #회원아이디 
) engine=innodb default charset=euckr;

### 관리자 테이블 생성 #############
create table admin (
 admin_id varchar(20) not null primary key, #관리자 아이디
 admin_pw varchar(20) # 관리자 비밀번호
) engine=innodb default charset=euckr;

#####################################################
drop table shop_product;
drop table shop_order;
drop table admin;
#####################################################
select * from shop_product;