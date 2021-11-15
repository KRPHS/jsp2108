show tables;

create table user (
	idx		int 				not null auto_increment primary key,
	name	varchar(20) not null,
	age		int 				default 20
);

insert into user values (default, '관리자', 45);
insert into user values (default, '홍길동', 25);
insert into user values (default, '김말숙', default);
insert into user values (default, '관장자', 21);
insert into user values (default, '홍이동', 49);
insert into user values (default, '김말이', default);

-- drop table user;

select * from user;