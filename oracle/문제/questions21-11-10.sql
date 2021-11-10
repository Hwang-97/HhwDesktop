-- Questions 
-- Q01 
select * from tblCountry;
--Q02
select name,capital from tblcountry;
--Q03
select name as 국가명,capital as 수도명,population as 인구수,area as 면적,continent as 대륙 from tblcountry;
--Q04
select ('국가명:' || name || ', 수도명:'|| capital || ', 인구수: '||population) as 국가정보 from tblCountry;
--Q05
select (first_name || last_name) as 이름 , (email || '@GMAIL.COM') as 이메일 , phone_number as 연락처 , ('$' || SALARY) AS 봉급  from employees;
--Q06
select * from tblCountry where area <= 100;
--Q07
select * from tblCountry where continent in ('EU','AS');
--Q08
select (first_name || last_name) as 이름 , phone_number as 연락처 from employees where job_id = 'IT_PROG';
--Q09
select (first_name || last_name) as 이름 , phone_number as 연락처 , hire_date as 고용날짜 from employees where last_name = 'Grant';
--Q10
select (first_name || last_name) as 이름 ,('$' || SALARY) AS 봉급 , phone_number as 연락처 from employees where manager_id = 102;
--Q11
select (first_name || last_name) as 이름 , phone_number as 연락처 , (email || '@GMAIL.COM') as 이메일 , department_id as 부서ID from employees where department_id in (60,80,100);
--Q12
select * from tblInsa where buseo = '기획부';
--Q13
select name as 이름 , jikwi as 직위 , tel as 전화번호 from tblInsa where city = '서울';
--Q14
select * from tblInsa where (basicpay + sudang)>=1500000 ;
--Q15
select * from tblInsa where sudang<=150000 and city = '서울';

















