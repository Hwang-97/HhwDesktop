--ex03_select

select * from tblCountry;

-- 테이블 (스키마)구조 > 테이블명
desc tblCountry;
-- 정식 방식을 해당 태이블을 생성할때 사용한 설계도를 보는것이다.

select name from tblCountry;

select capital from tblCountry;

select population from tblCountry;

select bookname from book;

SELECT publisher from book;

select name from tblCountry;
select name,capital from tblCountry;
select name,capital,population from tblCountry;
select name,capital,population,continent from tblCountry;
select name,capital,population,continent,area from tblCountry;
select * from tblCountry;
-- ORA-00904: "NAME2": invalid identifier
select name2 from tblCountry; -- 속성명 틀림
-- ORA-00942: table or view does not exist
select name from tblCountry2; -- 테이블명 틀림

select name , capital from tblCountry;
select capital , name from tblCountry;

select name,name from tblCountry;

select name , name || 'ㅋㅋㅋ' from tblCountry;

--여러가지 정보를 보고싶을때
--1. 사용자 정보
select * from sys.dba_users;
select * from sys.dba_tables where owner = 'HR';
--2. 특정 테이블의 컬럼정보 > 스키마
select * from sys.dba_tab_columns where owner = 'HR' and table_name = 'TBLCOUNTRY';
-- 오라클은 객체 식별자 (계정 , 테이블이름 , 컬럼명 등) 는 대문자로 저장한다.
-- 사용자가 SQL 에서 객체 식별자를 사용할 때는 대소문자를 구분하지 않는다.
















