--ex06_column.sql

select distinct continent from tblCountry ;

select distinct buseo from tblInsa;

select distinct jikwi from tblInsa;

select distinct continent , name from tblCountry ;


--case

select last || first as name,
case 
    when gender ='m' then '남자'
    when gender ='f' then '여자'
end as gender
from tblComedian;

select name,
    continent ,
    case
        when continent = 'AS' then '아시아'
        when continent = 'SA' then '아메리카'
        when continent = 'EU' then '유럽'
        else continent
    end as 대륙
from tblCountry;

select 
    last || first as name,
    weight,
    case
        when weight >100 then '과체중'
        when weight >50 then '정상체중'
        when weight >0 then '저체중'
    else as "state",
    case
        when weight >50 and weight <100 then
    end
from tblComedian;
--입사일 (근무년차)
-- 5년 미만 주니어
--5~10시니아
-- 10이상 익스퍼트
select 
    name,
    ibsadate,
    case
        when ibsadate >'2016-11-11' then '주니어'
        when ibsadate <= '2016-11-11' and ibsadate>'2011-11-11'then '시니어'
        when ibsadate <= '2011-11-11' then '익스퍼트'
    end
from tblInsa;


select 
    title,
    case
        when completedate is not null then '완료된일'
        when completedate is null then '해야할일'
    end as state
from tblTodo;

select * from tblMen;
select * from tblWomen;

select 
    name,
    case
        when couple is not null then '여자친구 있음'
        when couple is null then '여자친구 없음'
    end as state
from tblMen;
select * from tblInsa;
select
    name,jikwi,sudang,
    case
       -- when jikwi = '부장' then sudang * 2
       -- when jikwi = '과장' then sudang * 2
       -- when jikwi = '대리' then sudang * 1.5
       -- when jikwi = '사원' then sudang * 1.3
       when jikwi in('부장','과장') then sudang *2 
       when jikwi in('사원','대리') then sudang *1.5     
    end as state
from tblInsa;














