#지번 우편번호, 현재는 사용되지 않지만 수업용
create table zipcode(
	zipcode char(7) not null,
	area1 char(10) null,
	area2 char(20) null,
	area3 char(40) null,
	area4 char(20) null
) engine=myisam default charset=euckr;

# engine=myisam : 입출력 속도 빠름 
# varchar보다 char가 검색속도가 빠르다.

#확인
desc zipcode;

# 우편번호는 cmd 창에서 입력(txt파일 추가)
select count(*) from zipcode ; #전체 행갯수
select * from zipcode limit 100; #100개만 가져오기 #MySQL전용

select * from zipcode where area3 like '관철동%';