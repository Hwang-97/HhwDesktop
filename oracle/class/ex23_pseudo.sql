--ex23_pseudo.sql

select name,buseo , rownum from tblInsa where ROWNUM <3;

create or replace view vwInsa
as
select
    *
from (select * from tblInsa order by tblinsa.basicpay desc)
    where rownum < 10;



select vwInsa.*,rownum from vwInsa where ROWNUM < 5;


select
    * 
from (select a.*,rownum as rnum from (select * from tbladdressBook order by name asc) a)
    where rnum BETWEEN 21 and 40;
































