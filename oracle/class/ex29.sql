--ex29.sql

--출석
drop table tblDate;
create table tblDate (
    seq number primary key,
    state VARCHAR2(6) not null,
    regdate date not null
);
insert into tblDate (seq, state, regdate) values (1, '정상', '2019-10-01');
insert into tblDate (seq, state, regdate) values (2, '정상', '2019-10-02');
-- 10-03 : 공휴일
-- 10-04 : 결석
insert into tblDate (seq, state, regdate) values (3, '지각', '2019-10-07');
insert into tblDate (seq, state, regdate) values (4, '정상', '2019-10-08');
-- 10-09 : 공휴일
insert into tblDate (seq, state, regdate) values (5, '정상', '2019-10-10');
insert into tblDate (seq, state, regdate) values (6, '조퇴', '2019-10-11');
-- 10-12 : 토요일
-- 10-13 : 일요일
insert into tblDate (seq, state, regdate) values (7, '정상', '2019-10-14');
insert into tblDate (seq, state, regdate) values (8, '정상', '2019-10-15');
insert into tblDate (seq, state, regdate) values (9, '지각', '2019-10-16');
insert into tblDate (seq, state, regdate) values (10, '정상', '2019-10-17');
insert into tblDate (seq, state, regdate) values (11, '정상', '2019-10-18');
-- 10-19 : 토요일
-- 10-20 : 일요일
insert into tblDate (seq, state, regdate) values (12, '정상', '2019-10-21');
insert into tblDate (seq, state, regdate) values (13, '지각', '2019-10-22');
-- 10-23 : 결석
insert into tblDate (seq, state, regdate) values (14, '조퇴', '2019-10-24');
insert into tblDate (seq, state, regdate) values (15, '정상', '2019-10-25');
-- 10-26 : 토요일
-- 10-27 : 일요일
insert into tblDate (seq, state, regdate) values (16, '정상', '2019-10-28');
insert into tblDate (seq, state, regdate) values (17, '정상', '2019-10-29');
insert into tblDate (seq, state, regdate) values (18, '지각', '2019-10-30');
insert into tblDate (seq, state, regdate) values (19, '정상', '2019-10-31');

select * from tblDate;

select 
    * 
from tblComputer
    start with pseq is null
        connect by pseq = prior seq;
drop view vwDate;
create or replace view vwDate
as
select 
    to_date('20191031','yyyymmdd') + level -1 as regdate
from dual
    connect by level <= (to_date('20191031','yyyymmdd') - to_date('20191001','yyyymmdd'));

select 
    * 
from vwDate v
    left outer join tblDate t on v.regdate = t.regdate 
        order by v.regdate asc;



select 
    v.regdate,
    case
        when to_char(v.regdate, 'd') in ('1','7') then '토,일'
    end
from vwDate v
    left outer join tblDate t on v.regdate = t.regdate 
        order by v.regdate asc;

create table tblHoliday (
    seq number primary key,
    regdate date not null,
    name varchar2(30) not null
);

insert into tblHoliday values (1, '2019-10-03', '개천절');
insert into tblHoliday values (2, '2019-10-09', '한글날');
select * from tblHoliday;
select * from vwDate;
select 
    v.regdate,
    h.name,
    case
        when to_char(v.regdate, 'd') in ('1','7') then '토,일'
        when h.name is null and t.state in null then '결석'
        when h.name is not null and t.state in null then h.name
        else t.state
    end as state
from vwDate v
    left outer join tblDate t on v.regdate = t.regdate 
    left outer join tblHoliday h on  h.regdate = v.regdate
        order by v.regdate asc;





















