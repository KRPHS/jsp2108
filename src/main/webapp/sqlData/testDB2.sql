/* testDB2 */
/* 책 정보 테이블(books) */
/* 책 고유번호, 책 이름, 출판사명, 책 가격(정가) */
create table books (
	bookId 		int					not null			auto_increment			primary key,
	bookName	varchar(20)	not null,
	publisher	varchar(20)	not null,
	price			int
	/* primary key(bookId, bookName) */
);

INSERT INTO books VALUES (1,'축구의 역사','굿스포츠',7000);
INSERT INTO books VALUES (2,'축구아는 여자','나무수',13000);
INSERT INTO books VALUES (3,'축구의 이해','대한미디어',22000);
INSERT INTO books VALUES (4,'골프 바이블','대한미디어',35000);
INSERT INTO books VALUES (5,'피겨 교본','굿스포츠',8000);
INSERT INTO books VALUES (6,'역도 단계별기술','굿스포츠',6000);
INSERT INTO books VALUES (7,'야구의 추억','이상미디어',20000);
INSERT INTO books VALUES (8,'야구를 부탁해','이상미디어',13000);
INSERT INTO books VALUES (9,'올림픽 이야기','삼성당',7500);
INSERT INTO books VALUES (10,'Olympic Champions','Pearson',13000);
INSERT INTO books VALUES (11,'자바의 정석','도우출판사',30000);
INSERT INTO books VALUES (12,'포토샵 CS6','제우미디어',25000);
INSERT INTO books VALUES (13,'노인과 바다','이상미디어',13000);
INSERT INTO books VALUES (14,'C#','삼성당',22000);
INSERT INTO books VALUES (15,'전산세무2급','제우미디어',15000);
INSERT INTO books VALUES (16,'반응형웹','ICOX',28000);
INSERT INTO books VALUES (17,'파이썬따라잡기','이상미디어',22000);
INSERT INTO books VALUES (18,'이젠나도자바','삼성당',19000);
INSERT INTO books VALUES (19,'구기종목 정복','굿스포츠',9900);
INSERT INTO books VALUES (20,'컬러리스트길잡이','나무수',31000);

SELECT * FROM books;

/* 갯수를 구하는 함수? count() */
-- 전체 책의 권수는?
SELECT count(*) FROM books;

-- 전체 책의 권수는(단, 열이름을 '총권수'라고 지정하시오.)
SELECT count(*) '총권수' FROM books;

-- 삼성당 출판사의 개수는?
SELECT count(*) '삼성당 출판사개수' FROM books WHERE publisher='삼성당';

-- 전체 책의 가격합계
SELECT sum(price) '총가격' FROM books;
SELECT format(sum(price),0) '총가격' FROM books;

-- '삼성당' 출판사의 전체 책 평균? (열이름 : 삼성당책평균가격) 소수이하 한자리까지
SELECT format(avg(price),1) 총가격 FROM books WHERE publisher='삼성당';

-- 책가격이 2만원 이상인 책 가격의 전체 금액 합계?
SELECT format(sum(price),0) FROM books WHERE price>=20000;

-- 가장 비싼책과 가장 저렴한 책의 가격을 출력하시오?
SELECT max(price), min(price) FROM books;

-- 출판사가 '굿스포츠' 혹은 '대한미디어' 도서를 검색하시오(2가지 방법 사용)
SELECT * FROM books WHERE publisher="굿스포츠" OR publisher="대한미디어"; 
SELECT * FROM books WHERE publisher IN ("굿스포츠","대한미디어");

-- 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색하시오?
SELECT * FROM books WHERE publisher NOT IN ("굿스포츠","대한미디어");

-- 도서이름중에서 '축구'가 포함된 출판사를 검색하시오
SELECT publisher, bookName FROM books WHERE bookName LIKE '%축%';

-- 도서이름의 왼쪽 두번째 위치에 '구'라는 문자열을 갖는 도서를 모두 검색하시오
SELECT publisher, bookName FROM books WHERE bookName LIKE '_구%';

-- '축구'에 관한 도서중에서 가격이 2만원 이상인 도서만 검색하시오
SELECT * FROM books WHERE bookname LIKE '%축구%' AND price>=20000

-- 도서를 가격순으로 검색하되 가격이 같으면 이름순으로 내림차순 검색하시오.
SELECT * FROM books ORDER BY price, bookname DESC;

-- 도서테이블에서 모든 출판사를 검색하시오(중복허용) - 출판사필드만 검색
SELECT publisher FROM books;

-- 도서테이블에서 모든 출판사를 검색하시오(중복불허) - 출판사필드만 검색
SELECT DISTINCT publisher FROM books;

/* 그룹으로 묶어서 작업처리 : GROUP BY ~ HAVING(조건) 
 * group by뒤의 검색조건필드를 select절의 필드로 적어준다.
 * 또 한, select절에선 group by뒤의 검색조건필드를 집계함수와 함게 사용할수 있다.
 * */
-- 도서테이블에서 모든 출판사를 검색하시오(중복불허 : GROUP BY사용) - 출판사필드만 검색
SELECT publisher FROM books GROUP BY publisher;

-- 책을 납품한 출판사의 납품한 책의 총 권수는?
SELECT publisher, count(publisher) FROM books GROUP BY publisher;

-- 출판사별로 책 가격의 전체 합계와 평균?
SELECT publisher, sum(price), avg(price) FROM books GROUP BY publisher;

-- 출판사별로 책 가격중 최고가격과 최저가격의 책을 출력
SELECT publisher, max(price), min(price) FROM books GROUP BY publisher;

-- 책 1권의가격이 2만원 이상인 책을 납품한 출판사는?(출판사명은 중복불허)
SELECT publisher, price FROM books where price>=20000 GROUP BY publisher;
SELECT publisher, price FROM books GROUP BY publisher having price>=20000; /* 틀림 : having절에는 집계함수가 없어야한다 */

-- 책을 납품한 횟수가 2회 이상인 출판사와 납품횟수를 출력하시오
SELECT publisher, count(publisher) FROM books GROUP BY publisher having count(publisher)>=2;

-- 책을 2번이상 납품한 출판사의 책중 최고가격인 출판사명을 출력하시오?
SELECT publisher, max(price) FROM books GROUP BY publisher having count(publisher)>=2;

/* 한계치를 적용한 출력? (limit 처음인덱스위치, 개수) */
-- 처음부터 10권의 책을 보여주시오
SELECT * from books limit 10;

-- 책자료중 2번째부터 5건을 보여주시오
SELECT * from books limit 2, 5;

-- 책가격이 가장 높은순으로 5건만 출력하시오.
SELECT * from books order by price desc limit 5;


/* -------------------다중 테이블 활용하기-------------------------------- */
CREATE TABLE customer (
	custId		int						not null		auto_increment			primary key,	고객아이디
	name			varchar(20)		not null,	고객명
	address		varchar(20)		not null,	고객주소
	phone			varchar(15)							고객연락처
);

-- customer(고객정보 등록)
INSERT INTO customer VALUES (1, '박지성', '영국 맨체스타', '000-5000-0001');	
INSERT INTO customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');  
INSERT INTO customer VALUES (3, '김말숙', '대한민국 강원도', '000-7000-0001');
INSERT INTO customer VALUES (4, '손흥민', '영국 토트넘', '000-8000-0001');
INSERT INTO customer VALUES (5, '박세리', '대한민국 대전',  null);
INSERT INTO customer VALUES (6, '이순신', '대한민국 아산',  '');


/* 주문테이블(orders) 외래키테이블연동테이블키연결커넥*/
-- on update cascade : 원본테이블의 변경시 참조테이블이 영향을 받는다.
-- on delete restrict : 원본테이블의 데이터를 삭제시 참조테이블이 영향을 받는다.
CREATE TABLE orders (
	orderId		int		not null	auto_increment, 주문고객번호
	custId 		int		not null, 고객 아이디
	bookId		int		not null, 책 고유번호
	salePrice	int		not null, 책 할인 가격
	orderDate	timestamp,책 주문날짜
	primary key(orderId),
	foreign key(custId) references customer(custId) on update cascade on delete restrict,
	foreign key(bookId) references books(bookId) on update cascade on delete restrict
);


-- orders(주문정보) 데이터 생성
INSERT INTO orders VALUES (1, 1, 1, 6000, '2009-07-01'); 
INSERT INTO orders VALUES (2, 1, 3, 21000, '2018-02-03');
INSERT INTO orders VALUES (3, 2, 5, 8000, '2021-05-03'); 
INSERT INTO orders VALUES (4, 3, 6, 6000, '2020-06-04'); 
INSERT INTO orders VALUES (5, 4, 7, 20000, '2019-11-05');
INSERT INTO orders VALUES (6, 1, 2, 12000, '2021-09-07');
INSERT INTO orders VALUES (7, 4, 8, 13000, '2019-03-07');
INSERT INTO orders VALUES (8, 3, 10, 12000, '2018-07-08'); 
INSERT INTO orders VALUES (9, 2, 10, 9000, '2019-05-09'); 
INSERT INTO orders VALUES (10, 3, 11, 27000, '2020-06-15');
INSERT INTO orders VALUES (11, 2, 13, 11000, '2021-06-18');
INSERT INTO orders VALUES (12, 3, 15, 13000, '2021-08-20');
INSERT INTO orders VALUES (13, 6, 18, 19000, '2021-10-10');
INSERT INTO orders VALUES (14, 6, 16, 27000, '2021-11-20');
INSERT INTO orders VALUES (15, 3, 20, 30000, '2021-11-20');
INSERT INTO orders VALUES (16, 4, 16, 26000, '2021-11-25');
INSERT INTO orders VALUES (17, 4, 8, 13000, '2021-06-10');
INSERT INTO orders VALUES (18, 6, 8, 12000, '2021-06-10');
INSERT INTO orders VALUES (19, 2, 15, 13000, '2021-07-12');
INSERT INTO orders VALUES (20, 2, 17, 22000, '2021-10-15');



/* drop table orders; */
select * from orders;
select * from books;
desc orders;

-- * 원본테이블의 5번자료는 참조테이블에 없기에 삭제가능
delete from customer where custId = 5;
-- * 원본테이블의 6번자료는 참조테이블에 있기에 삭제안됨
delete from customer where custId = 6;

delete from books where bookId = 4;
delete from books where bookId = 5;

-- 원본테이블의 20번자료는 참조테이블에 있기에 원본에서 수정처리하면 참조테이블도 반영된다. (on update casecade)
update books set bookid = 20 where bookid=21;

-- customer테이블의 전화번호가 null인 자료
select * from customer where phone is null;

-- 고객별로 주문한 도서의 총수량과 총판매액을 구하시오. 이때 고객아이디도 출력하시오
select count(*) from orders where custId = 1 group by custId;

-- 도서가격이 8천원 이상인 도서를 구매한 고객에 대하여 주문도서의 총수량을 구하시오. 단, 4권이상 구매한 고객만 대상으로한다.(고객아이디 출력)
select custId,count(*) 
from orders 
where salePrice>=8000 group by custId having count(*)>=4;

/* ----------------------Join(조인) - 다중테이블 으용--------------------------------------------- */
/* 고객테이블과 주문테이블을 조건없이 연결하여 출력해 보자? */
select * from customer, orders;
select * from customer cc, orders oo;

-- 제약조건없이, 고객테이블과 주문테이블을 검색하되, 고객아이디는 문테이블에서, 성명은 고객테이블에서 출력하시
select oo.custId, cc.name from customer cc, orders oo;

-- 고객명과 해당고객이 주문한 사항을 모두 출력시켜보시오.
select * from customer cc, orders oo where cc.custId = oo.custId;

-- 고객과 해당고객이 주문한 정보에 대한자료를 출력하되 고객번호순으로 출력하시오.
select * from customer cc, orders oo where cc.custId = oo.custId order by cc.custId desc

-- 고객명과 해당고객이 주문한 도서의 판매가격을 검색하시오(출력: 고객명, 도서실제판매가격)
select name, saleprice from customer cc, orders oo where cc.custId = oo.custId;

-- 고객명과 고객이 주문한 도서의 이름을 출력하시오(3개 테이블 Join)
select name, bb.bookName from books bb, customer cc, orders oo
where oo.custId = cc.custId and oo.bookId = bb.bookId;

-- 실제 판매가격이 2만원이상인 도서를 주문한 고객명과 도서명과 도서판매정가를 구하시오
select cc.name, bb.bookName, bb.price from books bb, customer cc, orders oo
where oo.custId = cc.custId and oo.bookId = bb.bookId and oo.salePrice >= 20000;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하여 출력하시오.(출력:고객명, 총판매액)
select cc.name, sum(oo.salePrice) from customer cc, orders oo
where cc.custId = oo.custId group by cc.name order by cc.name;

select cc.name 고객명, sum(oo.salePrice) 총판매액, avg(oo.salePrice) 평균금액 from customer cc, orders oo
where cc.custId = oo.custId group by cc.name order by cc.name;

/* 고객 모두에 대하여 책을 주문한 내역을 출력?(단, 책을 구매하지 않은회원도 출력하시오) - Left Join(왼쪽테이블 우선) */
select cc.name, oo.bookId from customer cc left join orders oo
on cc.custId = oo.custId;

/* 구매한 책에 대하여 책을 주문한 고객의 내역을 출력하십시오.(단, 구매된 정보는 모두 출력하시오) - Right Join(오른쪽테이블 우선) */
select cc.name, oo.bookId from customer cc right join orders oo
on cc.custId = oo.custId;

/* Outer Join : 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서판매가격을 출력? */
select cc.name, oo.salePrice
from customer cc left outer join orders oo
on cc.custId = oo.custId;

/* ---------------------부속질의(Sub Query) -------------------------------- */
-- 가장 비싼 도서의 이름과 정가격을 출력?
select bookname, max(price) from books;
select bookname, price from books where price = (select max(price) from books);

-- 도서를 구매한 적이 있는 고객의 이름을 출력하세요?
select name from customer where custid in (select custid from orders);

-- '대한미디어'출판사 책을 구매한 고객의 이름을 출력해 보시오
select name from customer where custid in 
(select custid from orders 
where bookid in (select bookid from books where publisher='대한미디어'));

/* 도서를 구매하지 않은 고객의 이름을 출력하십시오 */
select distinct cc.name from customer cc, orders oo where cc.custid not in (select custid from orders);
select name from customer where custId not in (select custid from orders);

















