--ex12_casting.sql

Select name , population from tblCountry;

select
    name,
    case
        when population is not null then population
        when population is null then -1
    end as "notnull"
from tblcountry;

select name, nvl(population,-1) from tblCountry;

--nvl2

select tel, name, nvl2(tel,'AAA','BBB') from tblInsa;

-- char to char(컬럼명 , 형식 문자열)

select 
    weight ,
    to_char(weight), --  좌측정렬(형변환 완료)
    to_char(weight *-1,'999'), -- 숫자 갯수 만큼 자리를 차지한 뒤 좌측정렬(형변환 완료) 음수로도 변형 가능
    to_char(weight ,'000') -- 숫자 갯수 만큼 자리를 차지한 뒤 빈자리는 0을 넣고 좌측정렬(형변환 완료) 음수로도 변형 가능
from tblComedian;

select
    100,
    to_char(100,'$999'),
    to_char(100,'L999'),
    to_char(100.123456,'999.999'),
    to_char(1000000,'L9,999,999'),
    '$' || to_char(100,'999')
from dual;

select
    to_char (sysdate,'yyyy'),
    to_char (sysdate,'yy'),
    to_char (sysdate,'month'),
    to_char (sysdate,'mm'),
    to_char (sysdate,'mon'),
    to_char (sysdate,'dy'),
    to_char (sysdate,'ddd'),
    to_char (sysdate,'dd'),
    to_char (sysdate,'d'),
    to_char (sysdate,'hh'),
    to_char (sysdate,'hh24'),
    to_char (sysdate,'mi'),
    to_char (sysdate,'ss'),
    to_char (sysdate,'am'),
    to_char (sysdate,'pm')
from dual;

select
    to_char(sysdate,'hh24:mi:ss'),
    to_char(sysdate,'yyyy-mm-dd'),
    to_char(sysdate,'yyyy-mm-dd hh24:di:ss'),
    to_char(sysdate,'day am hh:mi:ss') 
from dual;

select * from tblInsa where ibsadate > '2010-01-01';














