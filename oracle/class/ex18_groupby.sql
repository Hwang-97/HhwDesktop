--ex18_groupby.sql
select
    buseo,
    count(*) as cnt
from tblInsa
    where jikwi in ('부장','과장')
    group by buseo
    HAVING count(*)>=3;


-- tblCountry 대륙별 최대 인구 최소 인구 평균 인구
select
    continent,
    max(population),
    min(population),
    avg(population)
from tblcountry
    group by continent;
-- employees 직업별 직원수
SELECT
    job_id,
    count(*)
from employees
    group by job_id;
-- tbladdressBook 시도별 인원수 
SELECT
    substr(address,1,instr(address,' ')-1) as a,
    count(*)
from tbladdressBook
    group by substr(address,1,instr(address,' ')-1);
--------------------------------------------------------------------------------
-- tblInsa 부서별 지원 급여 총함 , 인원수 최고급여 최저 급여 평균;;
--  [부서명]   [총인원]       [부장]    [과장]    [대리]        [사원]
SELECT
    buseo as 부서명,
    count(*) as 총인원,
    count(decode(jikwi,'부장',1)) as 부장,
    count(decode(jikwi,'과장',1)) as 과장,
    count(decode(jikwi,'대리',1)) as 대리,
    count(decode(jikwi,'사원',1)) as 사원
from tblInsa
    group by buseo;

SELECT
    buseo as 부서명,
    jikwi as 직위,
    count(*)
from tblInsa
    group by buseo,jikwi;
--------------------------------------------------------------------------------

select
    buseo,
    count(*),
    sum(basicpay),
    round(avg(basicpay)),        -- 평균의 평균
    max(basicpay)
from tblInsa
    group by rollup(buseo);

SELECT
    buseo as 부서명,
    jikwi as 직위,
    count(*)
from tblInsa
    group by rollup(buseo,jikwi);
    
SELECT
    buseo as 부서명,
    jikwi as 직위,
    count(*)
from tblInsa
    group by rollup(buseo),jikwi;
    
SELECT
    buseo as 부서명,
    jikwi as 직위,
    count(*)
from tblInsa
    group by buseo,rollup(jikwi);

SELECT
    buseo as 부서명,
    jikwi as 직위,
    count(*)
from tblInsa
    group by cube(buseo,jikwi);

