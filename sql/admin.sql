### ������ ���̺� ���� #############
create table admin (
 admin_id varchar(20) not null primary key, #������ ���̵�
 admin_pw varchar(20) # ������ ��й�ȣ
) engine=innodb default charset=euckr;

drop table admin;