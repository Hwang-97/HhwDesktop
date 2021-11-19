--ex19_subquery.sql

SELECT
   NAME
FROM TBLCOUNTRY
    WHERE (SELECT MAX(POPULATION) FROM TBLCOUNTRY) = population;

SELECT
    LAST || FIRST
FROM tblcomedian
    WHERE (SELECT MAX(weight) FROM tblcomedian) = weight;

SELECT
   NAME
FROM tblinsa
    WHERE (SELECT MAX(basicpay) FROM tblinsa) = basicpay;

SELECT
    *
FROM TBLINSA
    WHERE city ='서울' AND (SELECT AVG(BASICPAY) FROM TBLINSA)< BASICPAY;

SELECT
    *
FROM TBLINSA
    WHERE BUSEO =(SELECT BUSEO FROM TBLINSA WHERE NAME = '홍길동');

select * from employees
    where department_id = (select department_id from departments
        where location_id = (select location_id from locations where city = 'Munich'));

-- 컬럼리스트 사용

select
    name,
    buseo,
    basicpay,
    case
        when (select round(avg(basicpay)) from tblInsa)>basicpay then '평균이하'
        when (select round(avg(basicpay)) from tblInsa)<basicpay then '평균이상'
        when (select round(avg(basicpay)) from tblInsa)=basicpay then '평균'
    end as "급여 평균 체크"
from tblInsa;

select
    a.name,
    a.height,
    a.couple,
    (select b.height from tblwomen b where b.name = a.COUPLE) as height
from tblMen a;

select
    name,
    buseo,
    (select round(avg(basicpay)) from tblInsa) as "전체 평균 급여",
    (select round(avg(basicpay)) from tblInsa where buseo = a.buseo) as "소속 부서 평균 급여"
from tblInsa a;

select
    employee_id, last_name ||' ' || first_name,
    department_id,
    (select department_name from departments where department_id = test.department_id)
from employees test;

select
    *
from (select name , jikwi , buseo from tblInsa) tblInsa
    where buseo = '기획부';






