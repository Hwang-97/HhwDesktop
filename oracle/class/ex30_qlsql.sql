--qlsql.sql



create or replace PROCEDURE procBuseo(
    pbuseo varchar2,
    presult out SYS_REFCURSOR -- 반환값으로 사용할때 커서의 자료형
)
is
begin
    open presult
        for select * from tblInsa where buseo = pbuseo;
end;

DECLARE
    vbuseo varchar2(15) :='영업부';
    vresult SYS_REFCURSOR;
    vrow tblIn%rowtype;
begin
    probuseo(vrow,vresult);
    loop
        fetch vresult into vrow;
        exit when vresult%notfound;
        dbms_output.put_line(vrow.vbuseo);
    end loop;
end;








































