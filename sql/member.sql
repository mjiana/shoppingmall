#실행 단축키 블럭으로 잡고 alt+x
drop table member;
#테이블 생성
create table member(
	id varchar(20) primary key not null,
	passwd varchar(20),
	name varchar(20),
	birth varchar(6),
	email varchar(30),
	phone varchar(30),
	zipcode varchar(7),
	address varchar(60),
	job varchar(30),
	date datetime default now()
) engine=innodb default charset=euckr;

alter member add column mem_date datetime default now();
#alter table drop column mem_num2;

#테이블 확인
desc member;

#데이터 입력
insert into member(id, passwd, name) values ('LoverBoy','1234','홍길동');
insert into member(id, passwd, name) values ('LuckyBoy','1234','일지매');

#확인
select * from member;


select * from member where id='11';

update member set passwd = '111' where id= '111';


#데이터 추가
insert into member values ('aaa','1234','aaa', '123456','1234567',
	'aa@aa.aa', '123-1234-1234', '000', 'aaaaaa', 'worker');
update member set zipcode='987'where name='aaa';
insert into member values ('qqq','1234','qqq', '111111','1111111',
	'qq@q.q', '111-2222-3333', '852', 'q', 'qq');
insert into member values ('o12','1234','o12', '222222','2222222',
	'o12@oo.oooo', '111-2222-3333', '852', 'o12', 'o12');
insert into member values ('ccc','1234','ccc', '123456','1234567',
	'cccccc', '123-1111-2222', '123', 'ccccc', 'ccc');	
	