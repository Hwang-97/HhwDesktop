--ex11_date_time_function.sql

select sysdate-100 from dual;

select
    ibsadate,
    round((sysdate-ibsadate)/365),
    round((sysdate-ibsadate)*24), -- 날수
    round((sysdate-ibsadate)*24*60) --시간
from tblInsa;

select
    name,
    ibsadate,
    
from tblInsa;

































