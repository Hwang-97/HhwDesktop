--jdbc

drop table tblJava;

Create table tblJava(
    id varchar2(30) primary key,
    name varchar2(30) not null,
    age number not null,
    regdate date default sysdate not null
);

insert into tblJava(id,name,age,regdate) values ('hong','홍길동',20,default);

select * from tblJAva;

commit;

create table tblAddress(
    seq number primary key,
    name varchar2(30) not null,
    age number(3) not null,
    tel varchar(15) not null,
    address VARCHAR2(300) not null
);

create sequence seqAddress;

insert into tblAddress (seq,name,age,tel,address) 
        values(seqAddress.nextval,'홍길동',20,'010-1234-5678','서울시 강남구 역삼동');
insert into tblAddress (seq,name,age,tel,address) 
        values(seqAddress.nextval,'홍홍동',21,'016-1234-5678','서울시 동작구 역삼동');
insert into tblAddress (seq,name,age,tel,address) 
        values(seqAddress.nextval,'홍홍헝',22,'019-1234-5678','서울시 강북구 역삼동');

update tblAddress set name = '호호호', age=27,tel='010-0000-0000',address='서울시 서대문구 불광동' where seq =3;

delete from tblAddress where seq =2;

select * from tblAddress;

commit;