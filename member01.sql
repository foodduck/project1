
select * from member1
/*회원*/
create table member1 (id varchar2(40) primary key, pw varchar2(40) not null, 
name varchar2(40) not null, email varchar2(100) unique, question varchar2(400) not null,
answer varchar2(400) not null, address1 varchar2(300) not null, address2 varchar2(300) not null,
regdate date default sysdate)
select * from member1;
/*address1은 우편번호로 하고, address2는 상세주소가 아닌 주소입니다.*/
insert into member1 values ('admin', '1234', '관리자', 'admin@naver.com', '비밀번호 찾기 서비스',
'답', '10446', '흰돌마을 3단지 한진아파트', sysdate)
insert into member1 values ('asdf1234', 'asdf1234', '곽', 'kbfb@naver.com', '기르던 개의 이름은?',
'진돌', '10446', '흰돌마을 3단지 한진아파트', sysdate)
alter table member1 add regdate date default sysdate
update member1 set regdate = '2010-03-10' where id='asdfasdf'
select * from member1


/*게시글*/ b_ aaa.nextval() 을 no에 추가한다.
create table board1 (no int primary key, writer varchar2(40), title varchar2(100), 
content varchar2(1000), delpw number(4), regdate date default sysdate)
/*공지*/ n_
create table notice1 (no number(1) primary key, title varchar2(100), content varchar2(1000), img varchar2(300))
/*제품*/ p_
create table product1 (id varchar2(20) primary key, name varchar2(80), description varchar2(1000), 
standard varchar2(80), price int, img varchar(500))
insert into product1 values ('A01', 'star', '경차', 'KR-01', 20000000, './img/a001.jpg')
drop table product1
/*관리자*/ a_
create table admin (id varchar2(40) primary key, pw varchar2(40) not null)
insert into admin values ('admin', '1234')
select * from member1

create sequence aaa start with 1 increment by 1 maxvalue 10000 cycle nocache;


select * from board1

insert into board1 values (aaa.nextval, 'asd15', '제목', '내용', '1234', sysdate)
insert into notice1 values (1, '변경알림', '내용1134', './img/a001.jpg')
select * from notice1
select substr(id, 2,3) as a1 from product1 where idx in (select max(idx) from product1)
select * from product2

delete from NOTICE
