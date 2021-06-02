### 주문 테이블 생성 #############
create table shop_order(
	o_no int(5) not null primary key auto_increment,#주문 번호 
	p_no int(5), #상품 번호 
	o_quantity int,  #주문 수량
	o_date datetime,  #주문 일자
	o_state int(2),  #주문 상태
	m_id varchar(20) #회원아이디 
) engine=innodb default charset=euckr;

drop table shop_order;

select * from member;
select * from shop_product;
select * from shop_order;
select * from shop_order where m_id='11' order by o_date desc;

insert into shop_order values(null, 2, 3, now(), 1, 'aaa');
insert into shop_order values(null, 6, 1, now(), 1, '111');
insert into shop_order values(null, 7, 10, now(), 1, 'aaa');
insert into shop_order values(null, 6, 10, now(), 1, '111');
