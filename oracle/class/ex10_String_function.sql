--ex10_String_function.sql

select first_name, upper(first_name), lower(first_name), inticap('abc') from employees;
select INITCAP('String function sql') from dual;

select
    first_name || last_name,
    substr( first_name || last_name,3,4),
    substr( first_name || last_name,3)
from employees;
--직원등의 성이 뭐뭐 있는지?
select
    DISTINCT(substr(name,1,1))
from tblInsa;



select
    '안녕하세요. 홍길동님',
    instr('안녕하세요. 홍길동님','홍길동') as c1,
    instr('안녕하세요. 홍길동님','아무개') as c2,
    instr('안녕하세요. 홍길동님 반갑습니다. 홍길동님','홍길동',9) as c3
from dual;

select * from tblTodo order by instr(title,'기');

select
    'a',
    lpad('a',5,'b'),
    '1',
    lpad('1',3,'0')
from dual;

select
    '      홍길동          'as a,
    trim('      홍길동          ')as b,
    ltrim('      홍길동          ')as c,
    rtrim('      홍길동          ')as d
from dual;

select
    replace('홍길동','홍','김'),
    replace('홍길동','이','김')
from dual;

select name, ssn, substr(ssn,8,1)from tblInsa;

select decode(substr(ssn,8,1),'1','남자','2','여자') from tblInsa;

select continent,
    decode(continent,'AS','아시아','SA','아메리카','EU','유럽','AF','아프리카','AU','호주')
from tblCountry;

select
    count(
        case
            when substr(name,1,1) = '김' then name
        end) as 김,
   count(
        case
            when substr(name,1,1) = '이' then name
        end) as 이,
    count(
        case
            when substr(name,1,1) = '박' then name
        end) as 박,
    count(
        case
            when substr(name,1,1) = '최' then name
        end) as 최,
    count(
        case
            when substr(name,1,1) = '정' then name
        end) as 정,
     count(
        case
            when substr(name,1,1)not in ('김','이','박','최','정') then name
        end) as 나머지
from tblInsa;

select name , length(name) from tblCountry;

select * from tblAddressBook;

-- tbl































