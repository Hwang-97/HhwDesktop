--ex25_transaction.sql
create table tblTrans
as 
select name, buseo, jikwi from tblInsa where city = '서울';

commit;
SAVEPOINT a;
delete from tblTrans where name = '홍길동';
SAVEPOINT b;
delete from tblTrans;
select * from tblTrans;
commit;
-- 수정된 트랜젝션을 DB에 반영후 새로운 트랜젝션이 시작됨.
rollback;
rollback to a;
rollback to b;



































