#���� �����ȣ, ����� ������ ������ ������
create table zipcode(
	zipcode char(7) not null,
	area1 char(10) null,
	area2 char(20) null,
	area3 char(40) null,
	area4 char(20) null
) engine=myisam default charset=euckr;

# engine=myisam : ����� �ӵ� ���� 
# varchar���� char�� �˻��ӵ��� ������.

#Ȯ��
desc zipcode;

# �����ȣ�� cmd â���� �Է�(txt���� �߰�)
select count(*) from zipcode ; #��ü �హ��
select * from zipcode limit 100; #100���� �������� #MySQL����

select * from zipcode where area3 like '��ö��%';