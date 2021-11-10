--ex05_where

SELECT * FROM tblCountry;
SELECT * FROM tblCountry WHERE continent ='AS';
SELECT NAME FROM tblCountry WHERE CONTINENT = 'AS';
SELECT NAME FROM tblCountry WHERE CONTINENT not in 'AS';

select * from tblInsa;
select name,buseo,basicpay from tblInsa;
select name,buseo,basicpay from tblInsa WHERE buseo = '영업부';
select name,buseo,basicpay,CITY from tblInsa WHERE buseo = '영업부' AND city = '서울';
select name,buseo,basicpay,CITY,jikwi from tblInsa WHERE buseo = '영업부' AND city = '서울' AND (JIKWI = '사원' OR JIKWI = '대리');
SELECT * FROM tblInsa where basicpay >=1500000;
SELECT * FROM tblInsa where basicpay >=1500000 and basicpay<=2000000;
select * from book where publisher = '대한미디어';


--1. 몸무게 60 이상 키 170 미만
--2. 여자
--3. 개발부서 150이상
--4. 급여(basicpay) + 수당(subang) 200이상
select * from tblComedian where weight>=60 and height<170;
select * from tblComedian where gender = 'f';
select * from tblInsa where buseo = '개발부' and basicpay>=1500000;
select name,ssn,ibsadate,city,tel,buseo,jikwi,(basicpay+sudang) as totalPay from tblInsa where (basicpay + sudang)>=200;

--tblComedian . 몸무게 60~70
SELECT last||first as name , weight 
from tblComedian 
where weight between 60 and 70;

select * from tblInsa where basicpay between 1500000 and 2000000;
select * from tblInsa where name between '김' and '이';

select * from tblInsa where ibsadate between '2010-01-01' and '2010-12-31';

select * from tblInsa where buseo = '홍보부';
select * from tblInsa where buseo in ('홍보부','개발부','총무부','영업부');

select * from tblInsa where jikwi in ('부장','과장') and city in ('서울','인천') and basicpay between 2500000 and 2600000;

select name from tblInsa where name like '___'; -- 3글자를 찾아라
select name from tblInsa where name like '김__'; -- 김으로 시작하는 3글자를 찾아라
select name from tblInsa where name like '__수'; -- 수로 끝나는 3글자를 찾아라
select name,tel from tblInsa where tel like '016-____-____'; -- 016으로 시작하는 번호를 가진 사람을 찾아라
select name as 남자 , ssn from tblInsa where ssn like '______-1______'; -- 주민번호를 이용하여 남자만
select name as 여자 , ssn from tblInsa where ssn like '______-2______'; -- 주민번호를 이용하여 여자만
select name from tblInsa where name like '김%'; -- 김으로 시작하는 이름
select name from tblInsa where name like '%수'; -- 수로 끝나는 글자를 찾아라
select name from tblInsa where name like '김%수';
select name,tel from tblInsa where tel like '016%4242';
select name as 남자 , ssn from tblInsa where ssn like '%-1%';
select name as 여자 , ssn from tblInsa where ssn like '%-2%';

select * from tblTODO;
select title as notcomplet , adddate ,completedate from tblTODO where completedate is null;
select title as complet , adddate ,completedate from tblTODO where completedate is not null;
