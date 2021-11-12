--questions21-11-12.sql

--sum()
--1. 유럽과 아프리카에 속한 나라의 인구 수 합? tblCountry > 14,198
select
    sum(population) as "유럽 아프리카"
from tblcountry
where continent in('EU','AF');
--2. 매니저(108)이 관리하고 있는 직원들의 급여 총합? hr.employees > 39,600
select
    sum(salary) as "급여 총 합"
from employees
where manager_id = 108;
--3. 직업(ST_CLERK, SH_CLERK)을 가지는 직원들의 급여 합? hr.employees > 120,000
select
    sum(salary) as "급여 총 합"
from employees
where job_id in ('ST_CLERK', 'SH_CLERK');
--4. 서울에 있는 직원들의 급여 합(급여 + 수당)? tblInsa > 33,812,400
select
    sum(basicpay+sudang) as "서울 직원 총 급여"
from tblInsa
where city = '서울';
--5. 장급(부장+과장)들의 급여 합? tblInsa > 36,289,000
select
    sum(basicpay) as "부장 , 과장 총 급여"
from tblInsa
where jikwi in('과장','부장');
--
--avg()
--1. 아시아에 속한 국가의 평균 인구수? tblCountry > 39,165
select
    avg(population) as "아시아 평균 인구수"
from tblcountry
where continent = 'AS';
--2. 이름(first_name)에 'AN'이 포함된 직원들의 평균 급여?(대소문자 구분없이) hr.employees > 6,270.4
select
    avg(salary) as "평균급여"
from employees
where first_name like '%AN%' or first_name like '%aN%' or first_name like '%An%' or first_name like '%an%';
--3. 장급(부장+과장)의 평균 급여? tblInsa > 2,419,266.66
select
    avg(basicpay) as "부장 , 과장 평균 급여"
from tblInsa
where jikwi in('과장','부장');
--4. 사원급(대리+사원)의 평균 급여? tblInsa > 1,268,946.66
select
    avg(basicpay) as "사원 , 대리 평균 급여"
from tblInsa
where jikwi in('사원','대리');
--5. 장급(부장,과장)의 평균 급여와 사원급(대리,사원)의 평균 급여의 차액? tblInsa > 1,150,320
select
    avg(
        case
            when jikwi in ('과장','부장') then basicpay
        end
    ) -
     avg(
        case
            when jikwi in ('사원','대리') then basicpay
        end
    ) as "차액"
from tblInsa;
--
--max(),min()
--1. 면적이 가장 넓은 나라의 면적은? tblCountry > 959
select
    max(area) as "가장 넓은 나라의 면적"
from tblCountry;
--2. 급여(급여+수당)가 가장 적은 직원은 총 얼마를 받고 있는가? tblInsa > 988,000
select
    min(basicpay+sudang) as "급여가 가장 적은 직원"
from tblInsa;
--------------------------------------------------------------------------------
-- employees
-- 1.전체이름 (first_name + last_name) 이 가장 긴 -> 짧은사람 순으로 정렬
--  컬럼 리스트 > fullname,length
select
    first_name ||' '|| last_name as fullname
    , length(first_name ||last_name) as 길이
from employees
order by (length(first_name || last_name)) desc;
-- 2.전체이름 (first_name + last_name) 이 가장 긴사람 은 몇글자? 짧은 사람은 몇글자 ? 평균
-- 컬럼 > 숫자3개 정렬
select
    max(length(first_name ||last_name)) as max,
    min(length(first_name ||last_name)) as min,
    avg(length(first_name ||last_name)) as avg
from employees;
--3.last_name 이 4글자인 사람등릐 first_name 가져오기
-- 컬럼 > first_name ,lasg_name
-- 정ㄹ렬 (first_name, 오름차순)
select
    first_name, last_name
from employees
    where length(last_name) = 4 order by length(first_name) asc;
----------------------------------------------------------------------------
-- tblInsa. 부장 몇명? 과장 몇명? 대리 몇명? 사원 몇명?
select 
    count(decode(jikwi,'부장','check')) as 부장,
    count(decode(jikwi,'과장','check')) as 과장,
    count(decode(jikwi,'대리','check')) as 대리,
    count(decode(jikwi,'사원','check')) as 사원
from tblInsa;
-- tblInsa. 간부(부장, 과장) 몇명? 사원(대리, 사원) 몇명?
select 
    count(decode(jikwi,'부장','check','과장','check')) as 간부,
    count(decode(jikwi,'대리','check','사원','check')) as 사원
from tblInsa;
-- tblInsa. 기획부, 영업부, 총무부, 개발부의 각각 평균 급여?
select
    floor(avg(case
        when instr(buseo,'기획부')<>0 then basicpay
    end)) as 기획부,
    floor( avg(case
        when instr(buseo,'영업부')<>0 then basicpay
    end)) as 영업부,
    floor( avg(case
        when instr(buseo,'총무부')<>0 then basicpay
    end)) as 총무부,
     floor(avg(case
        when instr(buseo,'개발부')<>0 then basicpay
    end)) as 개발부
from tblInsa;
-- tblInsa. 남자 직원 가장 나이가 많은 사람이 몇년도 태생? 여자 직원 가장 나이가 어린 사람이 몇년도 태생?
select
    min(case
        when substr(ssn,8,1)=1 then substr(ssn,1,2)
    end) as q1,
    max(case
        when substr(ssn,8,1)=2 then substr(ssn,1,2)
    end) as q2
from tblInsa;
-- tblAddressBook. 학생 몇명? 건물주 몇명?
select
    count(decode(job,'학생','check')) as 햑생,
    count(decode(job,'건물주','check')) as 건물주
from tblAddressBook;
-- tblAddressBook. 강동구 몇명? 마포구 몇명?
select
    count(case
        when instr(address , '강동구') <> 0 then 'check'
    end) as 강동구,
     count(case
        when instr(address , '마포구') <> 0 then 'check'
    end) as 마포구
from tblAddressBook;
