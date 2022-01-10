--jdbc

Create table tblJava(
    id varchar2(30) primary key,
    name varchar2(30) not null,
    age number not null,
    regdata data default systate not null
);