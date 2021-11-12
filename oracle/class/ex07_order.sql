--ex07_order.sql

select * from tblCountry ORDER BY AREA ASC;
select * from tblCountry ORDER BY AREA DESC;

select  name , jikwi
from tblInsa 
where buseo = '기획부' 
order by name asc;

select name , buseo , jikwi , basicpay from tblInsa order by buseo ASC ,basicpay asc , name desc;
select name , buseo , jikwi , basicpay from tblInsa order by 1 ASC;
select name , buseo , jikwi , basicpay from tblInsa order by 2 ASC ,3 asc , 4 desc;

select * from tblInsa order by basicpay + sudang desc;

select name, jikwi,
    case
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end as jikwiseq
from tblInsa
    order by jikwiseq asc;

select name, jikwi,
    case
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end
from tblInsa
    order by 3 asc;

select name, jikwi
from tblInsa
    order by case
        when jikwi = '부장' then 4
        when jikwi = '과장' then 3
        when jikwi = '대리' then 2
        when jikwi = '사원' then 1
    end desc;

select * from tblInsa 
    where buseo = '기획부' 
        order by case
                when ssn like '%-1%' then 1
                when ssn like '%-2%' then 2
            end asc;









