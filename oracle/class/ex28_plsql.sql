--ex28_plsql.sql

set SERVEROUT on;

DECLARE
    NUM NUMBER;
    name VARCHAR2(30);
    today date;
BEGIN
    
    NUM:=10;
    DBMS_OUTPUT.put_line(NUM);
    
    name :='홍길동';
    dbms_output.put_line(name);
    
    today := sysdate;
    dbms_output.put_line(today);
    
END;

DECLARE
    NUM NUMBER;
    num2 number;
    num3 number := 300;
    num4 number DEFAULT 400;
    num5 number not null :=2000;
BEGIN

    DBMS_OUTPUT.put_line(NUM);
    
    num2 := 200;
    dbms_output.put_line(num2);
    
    dbms_output.put_line(num3);
    
    dbms_output.put_line(num4);
   -- num5 :=2000; not null 은 구현부에서 선언 불가능
    dbms_output.put_line(num5);
    
END;

declare
    vbuseo varchar2(15);
    vname varchar2(15);
begin
    select buseo into vbuseo from tblInsa where name = '홍길동';
    dbms_output.put_line(vbuseo);
    select name into vname from tblInsa where buseo = vbuseo and jikwi = '대리' and rownum =1;
    dbms_output.put_line(vname);
end;

declare
    buseo varchar2(15);
    name varchar2(15);
    basicpay number;
begin
    name :='홍길동';
    select buseo into buseo from tblInsa where name = name;
    select basicpay into basicpay from tblInsa where name = name and buseo = buseo;
    dbms_output.put_line(buseo,name,basicpay);
end;

drop table tblname;
create table tblname(
    name VARCHAR2(15)
);

declare
    vname VARCHAR2(15);
begin
    select name into vname from tblInsa where buseo = '개발부' and jikwi = '부장';
    insert into tblName (name) VALUES (vname);
end;

select * from tblname;

DECLARE
    vname varchar2(15);
    vbuseo varchar2(15);
    vjikwi varchar2(15);
begin
    select name,buseo,jikwi into vname,vbuseo,vjikwi from tblInsa where num = '1001';
    dbms_output.put_line(vname);
    dbms_output.put_line(vbuseo);
    dbms_output.put_line(vjikwi);
end;

declare
    vbuseo tblinsa.buseo%TYPE;
begin
    select buseo into vbuseo from tblInsa where name ='홍길동';
    dbms_output.put_line(vbuseo);
end;

DECLARE
    vname tblInsa.name%type;
    vcity tblinsa.city%type;
    vbasicpay tblinsa.basicpay%type;
    vibsadate tblinsa.ibsadate%type;
begin
    select name,city,basicpay,ibsadate into vname,vcity,vbasicpay,vibsadate from tblInsa where num ='1001';
    dbms_output.put_line(vname);
    dbms_output.put_line(vcity);
    dbms_output.put_line(vbasicpay);
    dbms_output.put_line(vibsadate);
end;


--직원중 일부에게 보너스를 지급 > 내역 저장
create table tblbonus(
    seq number primary key,
    num NUMBER(5) not null REFERENCES tblInsa(num),
    bonus number not null
);

select * from tblInsa where city = '서울' and jikwi = '부장' and buseo = '영업부';

declare
    vnum tblInsa.num%TYPE;
    vbasicpay tblinsa.basicpay%type;
begin
    select num,basicpay into vnum,vbasicpay from tblInsa where city = '서울' and jikwi = '부장' and buseo = '영업부';
    insert into tblbonus(seq,num,bonus) values(1,vnum,vbasicpay*1.5);
end;

select * from tblbonus b inner join tblinsa i on b.num = i.num;

select * from tblMen;

DECLARE
    vname tblMen.name%type;
    vage tblMen.age%type;
    vheight tblMen.height%type;
    vweight tblMen.weight%type;
    vcouple tblMen.couple%type;
begin
    select name,age,height,weight,couple 
    into vname,vage,vheight,vweight,vcouple 
    from tblMen where name = '무명씨';
    dbms_output.put_line(vname);
    dbms_output.put_line(vage);
    dbms_output.put_line(vheight);
    dbms_output.put_line(vweight);
    dbms_output.put_line(vcouple);
end;


DECLARE
      vrow tblMen%rowtype;
begin
        
      select * into vrow from tblMen where name ='무명씨';
      insert into tblWomen values (vrow.name,vrow.age,vrow.height,vrow.weight,vrow.couple);
      
      delete from tblMen where name = vrow.name;
end;
select * from tblMen;
select * from tblwomen;

--제어문

DECLARE
    vnum number :=10;
begin
    if vnum > 0 then
        dbms_output.put_line('양수');
    end if;
end;

DECLARE
    vnum number :=-10;
begin
    if vnum > 0 then
        dbms_output.put_line('양수');
    elsif vnum < 0 then
        dbms_output.put_line('음수');
    else
        dbms_output.put_line('음수');
    end if;
end;

DECLARE
    vgender char(1);
begin
    select substr(ssn , 8 , 1) into vgender from tblInsa where num = '1003';
    if vgender = '1' then
        dbms_output.put_line('남자 업무 진행');
    elsif vgender = '2' then
        dbms_output.put_line('여자 업무 진행');
    end if;
end;

-- 직원1명 선택 > 보너스 지급 > 간부 (basicpay * 1.5), 사원(basicpay * 2 )
DECLARE
    vnum tblInsa.num%type;
    vbasicpay tblInsa.basicpay%type;
    vjikwi tblInsa.jikwi%type;
    vbonus number;
begin
    select num,basicpay,jikwi into vnum,vbasicpay,vjikwi from tblInsa where name = '홍길동';
    if vjikwi in ('부장','과장') then
        vbonus:=vbasicpay*1.5;
    elsif vjikwi = '대리' or vjikwi = '사원' then
        vbonus := vbasicpay *2;
    end if;
    insert into tblbonus values (3,vnum,vbonus);
end;

select i.num,i.jikwi,i.basicpay,b.bonus 
from tblbonus b inner join tblinsa i on b.num = i.num;


DECLARE
    vcontinent tblcountry.continent%type;
    vresult varchar2(30);
begin
    select continent into vcontinent from tblCountry where name ='영국';
    
    case vcontinent
        when 'AS' then vresult:='아시아';
        when 'EU' then vresult:='유럽';
        when 'AF' then vresult:='아프리카';
        else vresult:='기타';
    end case;
    dbms_output.put_line(vresult);
     case 
        when vcontinent='AS' then vresult:='아시아';
        when vcontinent='EU' then vresult:='유럽';
        when vcontinent='AF' then vresult:='아프리카';
        else vresult:='기타';
    end case;
    dbms_output.put_line(vresult);
end; 
set SERVEROUT on;
set SERVEROUT off;
DECLARE
    n number;
begin
    loop
        n:=n+1;
        dbms_output.put_line(to_char(sysdate,'hh24:mi:ss'));
        exit when n>5;
    end loop;
end;

create table tblloop(
    seq number primary key,
    data varchar2(30) not null
);

create sequence seqLoop;

create or REPLACE view vwloop as select..

declare
    vnum number :=1;
begin
    loop
        insert into tblLoop values (seqLoop.nextVal, '데이터' || vnum);
        vnum:=vnum+1;
        exit when vnum >1000;
    end loop;
end;

select * from tblloop;









drop table tblGugudan;
create table tblGugudan(
    dan number not null,
    num number not null,
    result number not null,
    constraint tblGugudan_dan_num_pk primary key (dan,num)
);
begin
    for i in 2..9 loop
        for j in 1..9 loop
            insert into tblGugudan values(i,j,i*j);
        end loop;
    end loop;
    
end;
select * from tblGugudan;

begin
    select * into from tblGugudan;
end;

declare
    vnum number :=1;
begin
    while vnum <=10 loop
        dbms_output.put_line(vnum);
        vnum:=vnum+1;
    end loop;
end;

declare
    vname tblInsa.name%type;
begin
    select name from tblInsa where num ='1001';
end;


declare
    vname tblInsa.name%type;
    cursor vcursor is select name from tblInsa order by name asc;
begin
    open vcursor;
        for i in 1..10 loop 
            fetch vcursor into vname;
            dbms_output.put_line(vname);
        end for;
    close vcursor;
end;


declare
    vname tblInsa.name%type;
    cursor vcursor is select name from tblInsa order by name asc;
begin
    open vcursor;
        loop 
            fetch vcursor into vname;
            exit when vcursor%notfound;
            dbms_output.put_line(vname);
        end loop;
    close vcursor;
end;

declare
    cursor vcursor
        is select name, jikwi, basicpay from tblInsa where buseo = '기획부' order by num asc;
    vname tblInsa.name%type;
    vjikwi tblInsa.jikwi%type;
    vbasicpay tblInsa.basicpay%type;
begin
    open vcursor;
        fetch vcursor into vname,vjikwi,vbasicpay;
        exit when vcursor%notfound;
        dbms_output.put_line(vname || '_' || vjikwi || '_' || vbasicpay);
    close vcursor;
    
end;
select * from tblbonus;
drop sequence seqBonus;
create sequence seqBonus start with 4;
declare
    cursor vcursor is select * from tblInsa;
    vrow tblInsa%rowtype;
begin
    open vcursor;
        loop
            fetch vcursor into vrow;
            exit when vcursor%notfound;
            if vrow.jikwi in ('과장','부장') then
                insert into tblBonus values (seqBonus.nextVal,vrow.num,vrow.basicpay*1.5);
            elsif vrow.jikwi in ('사원','대리') then
                insert into tblBonus values (seqBonus.nextVal,vrow.num,vrow.basicpay*2);
            end if;
        end loop;
    close vcursor;
end;

declare
    cursor vcursor
        is select * from tblInsa;
    --vrow tblInsa%rowtype;
begin
    --loop
    for vrow in vcursor loop -- loop + fetch + vrow + exit when
    dbms_output.put_line(vrow.name);
    end loop;
    --end loop;
end;

begin
    for vrow in (select * from tblInsa) loop
    dbms_output.put_line(vrow.name);
    end loop;
end;


declare
    vname number(15);
begin
    dbms_output.put_line('시작');
    select name into vname from tblInsa where num = '1001';
    dbms_output.put_line('끝');
exception
    when others then
        dbms_output.put_line('예외처리');
end;

create table tbllog(
    seq number primary key,
    code varchar2(7) not null check(code in ('A001','B001','B002','C001')),
    message varchar2(1000) not null,
    regdata date default sysdate not null
);
create sequence seqLog;

checkpoint a;
commit;
delete from tblcountry;
delete from tblInsa where num = '1001';
rollback;
declare
    vcnt number;
    vname tblInsa.name%type;
begin
    select count(*) into vcnt from tblCountry;
    select name into vname from tblInsa where num ='1001';
    
    dbms_output.put_line(100/vcnt);
exception
    when ZERO_DIVIDE then
        insert into tblLog values (seqlog.nextval,'A001','tblCountry가 비어있습니다.',default);
    when others then
        dbms_output.put_line('예외');
end;

select * from tbllog;
select * from tblcountry;
select * from tblInsa;

set serveroutput on;

declare
    vnum number
begin
    vnum :=100;
    dbms_output.put_line('num:'||vnum);
end;

create or replace procedure proNum
is
    vnum number;
begin
    vnum :=100;
    dbms_output.put_line('num:'||vnum);
end proNum;


begin
    proNum;
end;

create or replace procedure proTest
is
begin
    proNum;
    proNum;
end proTest;

begin
    proTest;
end ;


execute proNum;
exec proNum;
call proNum();

create or replace procedure ptoTest(pnum number)
is
    vsum number :=0;
begin
    vsum :=pnum + 100;
    dbms_output.put_line(vsum);
end ptoTest;


execute ptoTest(1000);

create or replace procedure procTest(
    pwidth number 
    ,pheight number
)
is
    varea number;
begin
    varea := pwith * pheight;
    dbms_output.put_line(varea);
end procTest;


create or replace procedure procTest(
    pnum1 in number,
    pnum2 in number,
    presult out number
)
is
begin
    presult := pnum1 + pnum2;
end procTest;

call procTest(10,20,0);


declare
    vresult number;
begin
    procTest(100,200,vresult);
    dbms_output.put_line(vresult);
end;

create or replace procedure procGeInsa(
    pnum in number --일반 변수처럼 타입 길이 저장 불가능
    pname out varchar2,
    page out varchar2,
    pbuseo out varchar2,
    pjikwi out varchar2
)
is
begin
    select
        name,
        substr(ssn,1,2),
        buseo,
        jikwi into pname , page,pbuseo, pjikwi 
    from tblInsa
    where num = pnum;
end procInsa;

select * from tblBonus;

create or replace function fGender(
    pssn varchar2
    )return varchar2;
    is
begin
    if(substr(pssn,0,1))='1' then
       return '남자';
    else return '여자';
    end if;
end fGender;

select * from tblInsa;
-----------------------------------------------------------------------------



























































