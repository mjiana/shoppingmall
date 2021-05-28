### ��ǰ ���̺� ���� #############
create table shop_product (
 p_no int(5) not null primary key auto_increment, #��ǰ ��ȣ 
 p_name varchar(20), #��ǰ �̸�
 p_price varchar(10), #��ǰ ����
 p_detail text, #��ǰ ������
 p_date varchar(20), #��ǰ ��ϳ�¥
 p_stock varchar(10), #��ǰ ���
 p_image varchar(20) #��ǰ �̹�����
) engine=innodb default charset=euckr;

### �ֹ� ���̺� ���� #############
create table shop_order (
 o_no int(5) not null primary key auto_increment, #�ֹ� ��ȣ 
 p_no varchar(5), #��ǰ ��ȣ 
 o_quantity varchar(10),  #�ֹ� ����
 o_date varchar(20),  #�ֹ� ����
 o_state varchar(10),  #�ֹ� ����
 o_id varchar(10) #ȸ�����̵� 
) engine=innodb default charset=euckr;

### ������ ���̺� ���� #############
create table admin (
 admin_id varchar(20) not null primary key, #������ ���̵�
 admin_pw varchar(20) # ������ ��й�ȣ
) engine=innodb default charset=euckr;

#####################################################
drop table shop_product;
drop table shop_order;
drop table admin;
#####################################################
select * from shop_product;