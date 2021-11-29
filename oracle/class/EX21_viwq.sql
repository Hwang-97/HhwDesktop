--EX21_view.sql
    
-- 엑셀 파일 전환
drop table tblMovie;
create table tblMovie(

    seq number PRIMARY key,
    title varchar2(200) not null,
    title_en varchar2(100) null,
    year varchar2(4) null,
    country varchar2(100) not null,
    type varchar2(20) not null,
    genre varchar2(100) null,
    status varchar2(20) not null,
    director varchar2(300) null,
    company varchar2(500) null
);

select * from tblMovie;

create view vwInsa
as
select * from tblInsa;

create or replace view vwSeoul
as
select * from tblinsa where city = '서울';

select * from (select * from tblInsa where city = '서울');
select * from vwSeoul;

create or replace view vwComedian
as 
select * from tblcomedian;

insert into tblComedian values ('나미','오','f',165,60,'오나미');
insert into tblComedian values ('나미2','오','f',165,60,'오나미2');

select * from tblcomedian;
select * from vwComedian;

delete from vwComedian where first = '민상';

insert into vwcomedian values ('나미','오','f',165,60,'오나미');
update vwcomedian set first = '나비' where first = '나미';
delete from vwcomedian where first = '나미';

create or REPLACE view vwSales
as
select name, item from tblcustomer c
    inner join tblSales s
        on c.seq = s.cseq;
insert into vwsales (name,item) values ('유재석','마우스패드');

















