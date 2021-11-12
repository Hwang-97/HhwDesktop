--questions21-11-11(2).sql

--Q01
select
    count(
        case
            when continent = 'AS' then 'a'
            when continent = 'EU' then 'a'
        end
    ) as "아시아 유럽"
from tblCountry;

--Q02
select
    count(name) as "7000~20000"
from tblCountry
where population between 7000 and 20000;
    
--Q03
select
    count(employee_id) as "IT_PROG 5000"
from hr.employees
where job_id = 'IT_PROG' and salary >5000;
    
--Q04
select
    count(*)-
    count(
        case
            when tel like '010%' then '010'
        end
    ) as "NOT010"
from tblInsa
where tel is not null;

--Q05
select 
    count(*)-
    count(
        case
            when city in('서울','경기','인천') then 'check'
        end
    ) as "not서울겅기인천"
from tblInsa;

--Q06
select
    count(
        case
            when ssn like '__07%-2%' then 'check'
            when ssn like '__08%-2%' then 'check'
            when ssn like '__09%-2%' then 'check'
        end
    ) as "여름 태생 여자직원"
from tblInsa;

--Q07
select
    count(
        case
            when jikwi = '부장' then 'check'
        end
    ) as 부장,
    count(
        case
            when jikwi = '과장' then 'check'
        end
    ) as 과장,
     count(
        case
            when jikwi = '대리' then 'check'
        end
    ) as 대리,
     count(
        case
            when jikwi = '사원' then 'check'
        end
    ) as 사원
from tblInsa
where buseo ='개발부';




















