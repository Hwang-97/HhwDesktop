--ex22_alter.sql

create table tblEdit(
    seq number,
    data varchar2(20),
    COLOR VARCHAR2(30)
);

insert into tblEdit values (1,'마우스');
insert into tblEdit values (2,'키보드');
insert into tblEdit values (3,'모니터');

drop table tblEdit;

select * from tblEdit;

alter table tblEdit
    add (price number(5) null);
alter table tblEdit
    add (memo varchar2(100) DEFAULT '메모 없음' not null);
    
alter table tblEdit
    drop column memo;

alter table tblEdit
    drop column seq; -- primary key 도 삭제 가능하지만 절대 하면 안됨.!!

alter table tblEdit
    modify(data varchar2(100) not null);
alter table tblEdit
    modify(data varchar2(20));
delete from tblEdit where seq =4;
insert into tblEdit values (4,'2021년 출시된 최신형 노트북');
insert into tblEdit values (4,null);

alter TABLE tblEdit
    rename column data to name; -- 데이터 상의 문제는 없지만 sql 쿼리에 문제가 생김.
-- 제약사항 추가
drop table tblEdit;

create table tblEdit(
    seq number,
    data varchar2(20),
    COLOR VARCHAR2(30)
);

ALTER TABLE tblEdit
    add CONSTRAINT tbledit_seq_pk PRIMARY key(seq);
ALTER TABLE tblEdit
    add CONSTRAINT tbledit_color_ck check (color in ('red','yellow','blue'));
    
insert into tblEdit values (1,'마우스','red');
insert into tblEdit values (1,'키보드','blue');
insert into tblEdit values (3,'모니터','green');

alter table tblEdit
    drop CONSTRAINT tbledit_color_ck;
select * from tblEdit;

--ANSI : 















