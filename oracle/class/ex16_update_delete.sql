--ex16_update_delete.sql

commit;
rollback;

select * from tblCountry;

update tblCountry set capital = '세종' where name = '대한민국'; 

update tblCountry set population = population*1.1;

delete from tblCountry where name = '중국';
  











