### ��ǰ ���̺� ���� #############
create table shop_product (
 p_no int(5) not null primary key auto_increment, #��ǰ ��ȣ 
 p_name varchar(20), #��ǰ �̸�
 p_price int, #��ǰ ����
 p_detail text, #��ǰ ������
 p_date datetime, #��ǰ ��ϳ�¥
 p_stock int, #��ǰ ���
 p_image varchar(20) #��ǰ �̹�����
) engine=innodb default charset=euckr;


drop table shop_product;
#####################################################
delete from shop_product;
desc shop_product;

select * from shop_product order by p_date asc;
select * from shop_product order by p_price asc
select * from shop_product;
update shop_product set p_stock=200
select * from shop_product where p_no=13
update shop_product set p_stock=50 where p_no=13 
update shop_product set p_stock = p_stock-5 where p_no=13 
update shop_product set p_stock=(50-20) where p_no=13 