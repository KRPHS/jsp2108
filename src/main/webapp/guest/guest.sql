/* guest.sql(방명록) */
create table guest (
	idx				int					not null				auto_increment		primary key, /* 방명록 고유번호 */
	name			varchar(20)	not null,				/* 방문자 성명 */
	email			varchar(20),								/* 이메일 주소 */
	homepage	varchar(60),								/* 홈페이지(블로그)주소 */
	vDate			datetime		default now(),	/* 방문일자 */
	hostIp		varchar(50)	not null, 			/* 방문자 아이피 */
	content		text				not null				/* 방문소감 */
)

desc guest;
--drop table guest;

insert into guest values (default, '관리자', 'qgt0310@naver.com', 'http://www.naver.com/', default, '218.236.203.165', '방명록 서비스를 시작합니다람쥐구멍');
insert into guest values (default, '홍길동', 'hkd1234@naver.com', '', default, '192.168.0.10', '잠시 방문해 봅니다.');

select * from guest;

select count(*) from guest;