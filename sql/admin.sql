### 관리자 테이블 생성 #############
create table admin (
 admin_id varchar(20) not null primary key, #관리자 아이디
 admin_pw varchar(20) # 관리자 비밀번호
) engine=innodb default charset=euckr;

drop table admin;