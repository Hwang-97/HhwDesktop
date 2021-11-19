--ex13_ddl.sql

create table tblMemo
(   
    seq number(3),
    name varchar2(30),
    memo varchar2(1000),
    regdate date
);

select * from tabs;

insert into 테이블명(컬럼리스트) values (값리스트);

insert into tblMemo(seq,name,memo,regdate) values (1,'홍길동','메모입니다.',sysdate);
insert into tblMemo(seq,name,memo,regdate) values (1,'홍길동','메모입니다.',sysdate);
insert into tblMemo(seq,name,memo,regdate) values (2,null,null,null);
insert into tblMemo(seq,name,memo,regdate) values (null,null,null,null);
insert into tblMemo(seq,name,memo,regdate) values (3,'아무개','공부할것','2021-11-14');
insert into tblMemo(seq,name,memo,regdate) values (4,'호호호','메모장',to_date('2021-11-14 14:05:300','yyyy-mm-dd hh24:mi:ss'));
select * from tblMemo;

drop table tblMemo;
create table tblMemo
(   
    seq number (3) primary key ,
    name varchar2(30) UNIQUE,
    memo varchar2(1000),
    regdate date default sysdate
);
insert into tblMemo(seq,name,memo) values (3,null,null);
select * from tblMemo;

drop table tblMemo;
create table tblMemo
(   
    seq number (3) constraint tblmemo_seq_pk primary key ,
    name varchar2(30) constraint tblmemo_name_uq UNIQUE,
    memo varchar2(1000),
    regdate date default sysdate
);
insert into tblMemo(seq,name,memo,regdate) values (1,'홍길동','메모입니다.',sysdate);
insert into tblMemo(seq,name,memo,regdate) values (1,'홍길동','메모입니다.',sysdate);
select * from tblMemo;

drop table tblMemo;
create table tblMemo
(   
    seq number (3),
    name varchar2(30),
    memo varchar2(1000),
    regdate date,
    -- 제약사항 
    CONSTRAINT tblmemo_seq_pk PRIMARY KEY(seq),
    CONSTRAINT tblmemo_name_uq UNIQUE(name),
--    CONSTRAINT tblmemo_regdate_df default (regdate),
    CONSTRAINT tblmemo_regdate_ck check(memo.length=100)
);
























