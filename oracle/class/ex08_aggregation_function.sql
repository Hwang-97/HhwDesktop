--ex08_aggregation_function.sql

select name from tblcountry;

select count(name) from tblcountry;

select name from tblInsa where city in('서울','경기','인천');
select count(name) from tblInsa where city in('서울','경기','인천');

select * from tblCountry;
select count(*) from tblCountry;

select name, capital from tblCountry;
select count(name, capital) from tblCountry;

select count(population) from tblCountry;

select 
    count(*) - count(completedate) as "안한일의 개수",
    count(completedate) as "한일의 개수"
from tblTODO;

select 
   count( *) as "총 직원수",
   count(tel) as "연락처가 있는 직원수",
   count( *)-count(tel) as "연락처가 없는 직원수"
from tblInsa;

select count(distinct buseo) from tblInsa;

select DISTINCT(name) from tblcomedian where gender in('m','f');

select 
    count(
        case
            when gender ='m' then '남자'
        end
        ) as 여자,
    count(
        case
            when gender ='f' then '여자'
        end
        ) as 남자   
from tblComedian;


SELECT
    count(
        case
            when ssn like '8%-1%' then '80'
        end
    ) as "80년대생 남자수",
     count(
        case
            when ssn like '9%-1%' then '90'
        end
    ) as "90년대생 남자수",
     count(
        case
            when ssn like '8%-2%' then '80'
        end
    ) as "80년대생 여자수",
     count(
        case
            when ssn like '9%-2%' then '90'
        end
    ) as "90년대생 여자수"
from tblInsa;





















