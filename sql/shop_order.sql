### �ֹ� ���̺� ���� #############
create table shop_order(
	o_no int(5) not null primary key auto_increment,#�ֹ� ��ȣ 
	p_no int(5), #��ǰ ��ȣ 
	o_quantity int,  #�ֹ� ����
	o_date datetime,  #�ֹ� ����
	o_state int(2),  #�ֹ� ����
	m_id varchar(20) #ȸ�����̵� 
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
