--ex14_sequence.sql

create sequence seqNum;
drop sequence seqNum;
select seqNum.nextVal from dual; -- 호툴 할때마다 1 증가됨.

drop table tblMemo;
create table tblMemo
(
    seq number(3) primary key,
    name varchar2(30),
    memo varchar2(1000),
    regdate date
);
drop sequence seqMemo;
create sequence seqMemo;

select seqMemo.nextval from dual;

create sequence seqTest
    increment by 1      --증감치 지정
    start with 1        -- 시작값
    maxvalue 30         -- 최대값
    --minvalue --30     -- 최소값
    cycle               -- maxvalue 이후 start with으로 다시 이동함.
    cache 20            -- 하드 저장 사이클
    ;
select seqTest.nextval from dual;

drop sequence seqTest;






















