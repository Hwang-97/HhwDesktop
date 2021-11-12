--ex09_numerical_function.sql

select round( height / weight ) , height/ weight from tblComedian; -- 반올림 위치 미지정

select 
    round( height / weight ,1 ) ,
    round( height / weight ,2 ) ,
    round( height / weight ,3 ) ,
    round( height / weight ,0 ) ,
    height/ weight 
from tblComedian;

select round(avg(basicpay)) from tblInsa;

select
    height/weight,
    floor(height/weight),
    trunc(height/weight,1),
    trunc(height/weight,2),
    trunc(height/weight,3)
from tblComedian;

select
    height/weight,
    round(height/weight,1),
    floor(height/weight),
    ceil(height/weight)
from tblComedian;

select
    mod(10,3)
from tblComedian; -- 레코드 개수 만큼 출력됨

select
    mod(10,3)
from dual; -- 1개 출력됨

select
    floor(100/60) as 시,
    mod(100,60) as 분
from dual; -- 1개 출력됨


















