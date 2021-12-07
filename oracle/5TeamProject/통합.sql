--통합
-- B01~B02

-- 회원 확인 > 로그인 > 1(로그인 성공), 0(로그인 실패)
select count(*) as cnt from tblmanager where id = 'ssangyong1' and password = '1024982';

create or replace procedure procMLogin(
    pid varchar2,
    ppassword varchar2
)
is
    vrow tblmanager%rowtype;
    cursor vcursor is
        select * into vrow from tblManager;
    vnum number;
begin
    vnum := 0;
    open vcursor;
        loop
            fetch vcursor into vrow;
            exit when vcursor%notfound;
            if vrow.id = pid and vrow.password = ppassword
                then vnum := vnum + 1;
            end if;
        end loop;
    close vcursor;
    
    if vnum = 1 then
        dbms_output.put_line('로그인 성공');
    else
        dbms_output.put_line('로그인 실패');
    end if;
    
end;

set serveroutput on;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMLogin('ssangyong1', '1024982');
end;
--기초 정보 출력
-- 기초 정보 열람 procedure ------------------------------------------------------------------------------------------------------------------------------------
create or replace procedure procMbasicinfo
is
    cname tblclass.name%type;
    sname tblsubject.name%type;
    clname tblclassroom.name%type;
    bname tblbookname.name%type;
    cursor vcursor is 
select
    c.name, s.name, cl.name, b.name as name
from tbllclass lc
    inner join tblclass c
        on lc.class_Seq = c.class_seq
            inner join tblclassroom cl
                on lc.classroom_seq = cl.classroom_seq
                    inner join tbllsubject ls
                        on ls.lclass_seq = lc.class_seq
                            inner join tblsubject s
                                on ls.subject_seq = s.subject_seq
                                    inner join tblbookname b
                                        on ls.bookname_seq = b.bookname_seq;    
begin
    open vcursor; 
        loop
            fetch vcursor into cname, sname, clname, bname;
            exit when vcursor%notfound;  
            dbms_output.put_line('==============================================================================================');
            dbms_output.put_line('과정이름: ' || cname || '  과목명: ' || sname || '  강의실명: ' || clname || '  과제명: ' || bname);        
            
        end loop;
    close vcursor;
        dbms_output.put_line('==============================================================================================');
end;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMbasicinfo;
end;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 기초 정보 입력, 수정, 삭제 -----------------------------------------------------------------------------------------------------------------------------------
-- class 추가 프로시저 ------------------------------------------------------------------------------------------------------------------------------------------

create or replace procedure procMAddclass(
    pname varchar2   
)
is
begin
    insert into tblClass (Class_Seq, name) values ((select max(class_Seq) + 1 from tblclass), pname);
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');       
end procMAddclass;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMAddclass('추가 과정');
end;
select * from tblclass;
commit;
--------------------------------------------------------------------------------------------------------------------------------
-- update 프로시져----------------------------------------------------------------------------------------------------------
create or replace procedure procMUpdateclass(
    pnum number,
    pname varchar2   
)
is
begin
    update tblclass set name = pname where class_seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');   
end procMUpdateclass;
commit;
--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
   procMUpdateclass(102, '수정');
end;
select * from tblclass;
rollback;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 삭제 프로시져----------------------------------------------------------------------------------------------------------------------------------------------------------
create or replace procedure procMDeleteclass(
    pnum number
)
is
begin
    delete from tblclass where class_Seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMDeleteclass;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMdeleteclass(102);
end;
commit;
---------------------------------------------------------------------------------------------------------------------------------------------
--2. subject---------------------------------------------------------------------------------------------------------------------------------
-- subject 추가 프로시저 ------------------------------------------------------------------------------------------------------------------ss
create or replace procedure procMAddsubject(
    pname varchar2   
)
is
begin
    insert into tblsubject (subject_Seq, name) values ((select max(subject_Seq) + 1 from tblsubject), pname);
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMAddsubject;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMAddsubject('ㅇㄴㅇㄴㅇ');
end;
--------------------------------------------------------------------------------------------------------------------------------
-- update 프로시져----------------------------------------------------------------------------------------------------------
create or replace procedure procMUpdatesubject(
    pnum number,
    pname varchar2   
)
is
begin
    update tblsubject set name = pname where subject_seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMUpdatesubject;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMupdatesubject(33, '수정');
end;
select * from tblsubject;
----------------------------------------------------------------------------------------------------------------------------------------
-- 삭제 프로시져-----------------------------------------------------------------------------------------------------------------------
create or replace procedure procMDeletesubject(
    pnum number
)
is
begin
    delete from tblsubject where subject_Seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMDeletesubject;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMdeletesubject(33);
end;
---------------------------------------------------------------------------------------------------------------------------------------------
-- classroom
create or replace procedure procMAddclassroom(
    pname varchar2,
    ptotalnum number
)
is
begin
    insert into tblclassroom (classroom_Seq, name, totalNum) values ((select max(classroom_Seq) + 1 from tblclassroom), pname, ptotalnum);
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMAddclassroom;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMAddclassroom('추가 강의실', 30);
end;
--------------------------------------------------------------------------------------------------------------------------------
-- update 프로시져----------------------------------------------------------------------------------------------------------
create or replace procedure procMUpdateclassroom(
    pnum number,
    pname varchar2,
    ptotalnum number
)
is
begin
    update tblclassroom set name = pname, totalnum = ptotalnum where classroom_seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMUpdateclassroom;
select * from tblclassroom;
--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMupdateclassroom(7, 'F 강의실', 26);
end;
----------------------------------------------------------------------------------------------------------------------------------------
-- 삭제 프로시져-----------------------------------------------------------------------------------------------------------------------
create or replace procedure procMDeleteclassroom(
    pnum number
)
is
begin
    delete from tblclassroom where classroom_Seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMDeleteclassroom;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMdeleteclassroom(7);
end;
--------------------------------------------------------------------------------------------------------------------------------------------------
-- bookname------------------------------------------------------------------------------------------------------------------------------
commit;
create or replace procedure procMAddBookName(
    pname varchar2,
    ppublisher varchar2
)
is
begin
    insert into tblBookName (bookname_seq, name, publisher) values ((select max(bookname_Seq) + 1 from tblbookname), pname, ppublisher);
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMAddbookname;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMAddbookname('추가 책이름', '추가 책 출판사');
end;
--------------------------------------------------------------------------------------------------------------------------------
-- update 프로시져----------------------------------------------------------------------------------------------------------
create or replace procedure procMUpdatebookname(
    pnum number,
    pname varchar2,
    ppublisher varchar2
)
is
begin
    update tblbookname set name = pname, publisher = ppublisher where bookname_seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMUpdatebookname;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMupdatebookname(131, '수정된 책이름', '수정출판사');
end;
----------------------------------------------------------------------------------------------------------------------------------------
-- 삭제 프로시져-----------------------------------------------------------------------------------------------------------------------
create or replace procedure procMDeletebookname(
    pnum number
)
is
begin
    delete from tblbookname where bookname_Seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMDeletebookname;

begin
    procMdeletebookname(131);
end;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--B03
--교사 계정관리-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--1. 전체 교사 정보 조회 -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create or replace procedure procMTeacherInfo
is
    cursor vcursor is
        select * from tblteacher;
    vrow tblteacher%rowtype;
begin 
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        dbms_output.put_line('==============================================================================================');
        dbms_output.put_line('교사번호: ' || vrow.teacher_Seq || '  교사이름: ' || vrow.name || '  교사아이디: ' || vrow.id ||' 교사비밀번호: ' || vrow.jumin || '  교사전화번호: ' || vrow.tel || ' 가능과목: ' || vrow.possibleLecture);
        --Teacher_Seq, name, id, jumin, tel, possibleLecture, now, Subject_Seq, Manager_Seq
    end loop;
    close vcursor;
    dbms_output.put_line('==============================================================================================');
end;
--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMteacherinfo;
end;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 교사 계정 추가------------------------------------------------------------------------------------------------------------------------------------------------------------

create or replace procedure procMAddTeacher(
    pname varchar2,
    pid varchar2,
    pjumin number,
    ptel varchar2,
    ppossibleLecture varchar2,
    pnow varchar2,
    psubject_name varchar2,
    pmanager_seq number    
)
is
    vsubject_seq number;
begin
   select subject_Seq into vsubject_Seq from tblsubject where name = psubject_name;
    
    INSERT INTO tblTeacher(Teacher_Seq, name, id, jumin, tel, possibleLecture, now, Subject_Seq, Manager_Seq)
        Values ((select max(teacher_Seq) + 1 from tblteacher), pname, pid, pjumin, ptel, ppossibleLecture, pnow, vsubject_Seq, pmanager_seq);
        exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMAddteacher;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMAddteacher('추가', 'tttt22', 2231233, '010-5454-5663', '추가 가능과목','N', 'C', 1);
end;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--교사 계정 조회-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create or replace procedure procMTeacherFind(
    pname varchar2
)
is
    vrow tblteacher%rowtype;
    vstate varchar2(30);
    vsubject_name varchar2(30);
begin 
    select * into vrow from tblteacher where name = pname;
    select name into vsubject_name from tblsubject where subject_seq = vrow.subject_seq;
    
    if
        vrow.now = 'Y' then vstate := '수강중';
        else vstate := '수강중 아님';
    end if;
    dbms_output.put_line('==============================================================================================');

    dbms_output.put_line('교사이름: ' ||vrow.name || '  아이디: ' || vrow.id || '  비밀번호: ' || vrow.jumin || '  전화번호: ' || vrow.tel || ' 강의가능과목: ' || vrow.possibleLecture || '  강의 상태: ' || vstate || '  추가과목: ' || vsubject_name || '  매니저번호: ' || vrow.manager_Seq);
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMteacherFind('추가');
end;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--교사 계정 수정, 삭제 --------------------------------------------------------------------------------------------------------------------
-- id 수정 ---------------------------------------------------------------------------------------------------------------------------------

create or replace procedure procMUpdateteacherid(
    pnum number,
    pid varchar2   
)
is
begin
    update tblteacher set id = pid where teacher_seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMUpdateteacherid;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMupdateteacherid(12, '수정');
end;

select * from tblteacher;
---------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. 전화번호 수정------------------------------------------------------------------------------------------------------------------------------
create or replace procedure procMUpdateteachertel(
    pnum number,
    ptel varchar2   
)
is
begin
    update tblteacher set tel = ptel where teacher_seq = pnum;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMUpdateteachertel;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMupdateteachertel(12, '010-1234-4567');
end;
---------------------------------------------------------------------------------------------------------------------------------------
-- 계정 삭제
create or replace procedure procMDeleteTeacher(
    pseq number
)
is
begin
    delete from tblteacher where teacher_Seq = pseq;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMDeleteTeacher;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMDeleteTeacher(12);
end;
------------------------------------------------------------------------------------------------------------------------------------------------
--배정된 개설 과목명, 개설 과목 기간, 과정명, 개설과정기간, 교재명, 강의실, 강의 진행여부를 확인할 수 있어야 한다. 
select * from tbllclass;
create or replace view vwMLclass
as
select 
    ls.start_date as "개설시작날",
    ls.end_date as "개설끝날",
    s.name as "개설과목명",
    c.name as "개설과정명",
    lc.startclassdate as "과정시작일",
    lc.finishclassdate as "과정종료일",
    cl.name as "강의실",
    b.name as "교재명",
    t.name as "교사이름",
    t.now as "강의진행여부"
from tbllclass lc
    inner join tblclass c
        on lc.class_Seq = c.class_seq
            inner join tblclassroom cl
                on lc.classroom_seq = cl.classroom_seq
                    inner join tbllsubject ls
                        on ls.lclass_seq = lc.class_seq
                            inner join tblsubject s
                                on ls.subject_seq = s.subject_seq
                                    inner join tblbookname b
                                        on ls.bookname_seq = b.bookname_seq
                                            inner join tblteacher t 
                                                on ls.teacher_seq = t.teacher_seq;
select * from vwMLclass;
                                 select * from tbllsubject;    
                                 select * from tbllclass;
                                 
                                 
-- 선생님이 강의하고 있는 과목 정보
create or replace procedure procMTeacherSubject(
    pname varchar2
)
is
    vrow vwMLclass%rowtype;
    cursor vcursor
        is select * from vwMLclass where 교사이름 = pname;
begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line('==============================================================================================');
    dbms_output.put_line('시작일: ' || vrow.개설시작날 || '  종료일: ' || vrow.개설끝날 || '  개설과목명: ' || vrow.개설과목명 || '  강의실: ' || vrow.강의실 || ' 교재명: ' || vrow.교재명 || '  교사이름: ' || vrow.교사이름 || ' 강의진행여부: ' || vrow.강의진행여부);
    end loop;
    close vcursor;
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMTeacherSubject;

begin
    procMteachersubject('박세인');
end;


-- 선생님이 강의하고잇는 과정 정보
create or replace procedure procMTeacherClass(
    pname varchar2
)
is
    vrow vwMLclass%rowtype;
    cursor vcursor
        is select * from vwMLclass where 교사이름 = pname;
begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
    dbms_output.put_line('==============================================================================================');
    dbms_output.put_line('시작일: ' || vrow.개설시작날 || '  종료일: ' || vrow.개설끝날 || '  개설과목명: ' || vrow.개설과목명 || '  개설과정명: ' || vrow.개설과정명 || '  과정시작일: ' || vrow.과정시작일 || '  과정종료일: ' || vrow.과정종료일 || '  강의실: ' || vrow.강의실 || ' 교재명: ' || vrow.교재명 || '  교사이름: ' || vrow.교사이름 || ' 강의진행여부: ' || vrow.강의진행여부);
    end loop;
    close vcursor;
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMTeacherClass;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMTeacherClass('박세인');
end;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

commit;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--B04
--B04 개설 과정 관리
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--수료날짜 지정 -> lclass finishclassdate 조절

create or replace procedure procMFixFinishClass(
    pseq number,
    pdate date
)
is
begin
    update tbllclass set finishclassdate = pdate where lclass_seq = pseq;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMFixFinishClass;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMFixFinishClass(1, '22/12/15');
end;
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--강의실 정보 수정
create or replace procedure procMFixLClassClassRoom(
    pseq number,
    pcseq number
)
is
begin
    update tbllclass set classroom_Seq = pcseq where lclass_seq = pseq;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMFixLClassClassRoom;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMFixLClassClassRoom(1, 5);
end;

--개설 과정 정보에 대한 입력, 출력, 수정, 삭제 기능을 사용할 수 있어야 한다.
-- 개설 과정 정보 출력
create or replace procedure procMLClassInfo
is          
    vrow vwMLclass%rowtype;
    cursor vcursor
        is select * from vwMLClass;
begin
    open vcursor;
    loop
    fetch vcursor into vrow;
    exit when vcursor%notfound;
    dbms_output.put_line('==============================================================================================');

    dbms_output.put_line('시작일: ' || vrow.개설시작날 || '  종료일: ' || vrow.개설끝날 || '  개설과목명: ' || vrow.개설과목명 || '  개설과정명: ' || vrow.개설과정명 || '  과정시작일: ' || vrow.과정시작일 || '  과정종료일: ' || vrow.과정종료일 || '  강의실: ' || vrow.강의실 || ' 교재명: ' || vrow.교재명 || '  교사이름: ' || vrow.교사이름 || ' 강의진행여부: ' || vrow.강의진행여부);
    
    end loop;
    close vcursor;
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end;
--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMLClassInfo;
end;
commit;
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- B05
--B5 개설 과목 관리.
------------------------------- 개설 과목 출력시 -----------------------------------------------------------------------------
create or replace view vwMLsubject
as
select
    ls.lsubject_Seq vwSubject_Seq,
    c.name as classname,
    lc.startclassdate as classSD,
    lc.finishclassdate as ClassFD,
    cl.name as CRname,
    s.name as subjectName,
    ls.start_date as subjectSD,
    ls.end_date as subjectED,
    b.name as BookName,
    t.name as teacherName    
from tbllclass lc
    inner join tblclass c
        on lc.class_Seq = c.class_seq
            inner join tblclassroom cl
                on lc.classroom_seq = cl.classroom_seq
                    inner join tbllsubject ls
                        on ls.lclass_seq = lc.class_seq
                            inner join tblsubject s
                                on ls.subject_seq = s.subject_seq
                                    inner join tblbookname b
                                        on ls.bookname_seq = b.bookname_seq
                                            inner join tblteacher t
                                                on ls.teacher_seq = t.teacher_seq order by vwSubject_Seq;

create or replace procedure procMLSubjectInfo(
 pseq number
)
is
    vrow vwMlsubject%rowtype;
begin

    select * into vrow from vwMlsubject where vwsubject_seq = pseq;
    dbms_output.put_line('==============================================================================================');
    dbms_output.put_line('과정명: ' || vrow.classname || '  과정시작일: ' || vrow.classSD || '  과정종료일: ' || vrow.ClassFD || '  강의실: ' || vrow.CRname || '  과목명: ' || vrow.subjectName || '  과목시작일: ' || vrow.subjectSD || ' 과목종료일: ' || vrow.subjectED || '  교재명: ' || vrow.BookName || '  교사명: ' || vrow.teacherName);
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMLSubjectInfo;
    
--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000              
begin
    procMLsubjectInfo(1);
end;

--교사 명단은 현재 과목과 강의 기능 과목이 일치하는 교사 명단만 보여야 한다.

--개설 과목 정보에 대한 입력, 출력, 수정 삭제 기능을 사용할 수 있어야 한다.

--------- 개설과목정보 수정-----------------------------------------------------------------------------
create or replace procedure procMFixLsubjectDate(
    pseq number,
    pSdate date,
    pEdate date
)
is
begin    
    update tbllsubject set Start_Date = pSdate, End_Date = pEdate where lsubject_Seq = pseq;
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMFixLsubjectdate(7,sysdate, sysdate);
end;
select * from tbllsubject;
-------------------------------------------------------------------------------------------------------------
--------- 개설과목정보 삭제-----------------------------------------------------------------------------
create or replace procedure procMDeleteLsubject(
    pseq number
)
is
begin    
    delete from tbllsubject where lsubject_Seq = pseq;
--    exception
--    when others then
--    dbms_output.put_line('===================================================');           
--    dbms_output.put_line('              잘못 입력하였습니다.');
--    dbms_output.put_line('===================================================');  
end;

begin
    procMdeleteLsubject(2);
end;
rollback;
-------------------------------------------------------------------------------------------------------------
--------- 개설과목정보 출력-----------------------------------------------------------------------------
create or replace procedure procMLsubjectList
is
    vrow tbllsubject%rowtype;
    cursor vcursor
        is select * from tbllsubject;
    vsubjectname varchar2(30);
    vBookName varchar2(100);
    vteacherName varchar2(15);
    vclassname varchar2(100);
begin
    
    open vcursor;
    loop
         fetch vcursor into vrow;
         exit when vcursor%notfound;
         select name into vsubjectname from tblsubject where subject_Seq = vrow.subject_seq;
        select name into vBookname from tblbookname where bookname_Seq = vrow.bookname_Seq;
        select name into vteachername from tblteacher where teacher_seq = vrow.teacher_Seq;  
        select name into vclassname from tblclass c inner join tbllclass lc on lc.class_seq = c.class_seq where lc.lclass_seq = vrow.lclass_Seq;
        dbms_output.put_line('==============================================================================================');
        dbms_output.put_line('개설과목 번호: ' || vrow.lsubject_Seq || '  시작일: ' || vrow.start_date || '  종료일: ' || vrow.end_Date || '  과목명: ' || vsubjectname || '  교재명: ' || vbookname || '  교사명: ' || vteachername || '  과정명: ' || vclassname);
    
    end loop;
    close vcursor;
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMLsubjectList;
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--B06

--B06
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--교육생 정보 입력시 교육생 이름, 주민번호 뒷자리, 전화번호를 기본으로 등록하고, 주민번호 뒷자리는 교육생 본인이 로그인 시 패스워드로 사용된다. 등록일은 자동으로 입력되도록 한다.

create or REPLACE procedure procMAddstudentInfo(
    pname varchar2,
    pid varchar2,
    pssn varchar2,
    ptel varchar2,
    pmanager_Seq number
)
is
    vnum number;
begin
    INSERT INTO TBLSTUDENT (STUDENT_SEQ, NAME, ID, SSN, TEL, ATTENDDATE, MANAGER_SEQ) 
    VALUES ((select max(student_seq) + 1 from tblstudent), pname, pid, pssn, ptel, sysdate, pmanager_seq);
    exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMAddstudentInfo;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMAddstudentInfo('추가임','zsg808','6902211773839','010-4277-5565',1);
end;
select * from tblstudent;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--교육생 정보 출력시 교육생 이름, 주민번호 뒷자리,전화번호, 등록일을 출력한다.
create or replace procedure procMStudentInfo
is
    vrow tblstudent%rowtype;
 cursor vcursor is
        select * from tblstudent;
    vpassword varchar2(8);
begin
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        vpassword := substr(vrow.ssn, 7);
        dbms_output.put_line('==============================================================================================');
        dbms_output.put_line('학생 번호: ' || vrow.student_Seq || '  학생이름: ' || vrow.name || '  비밀번호: ' || vpassword || '  전화번호: ' || vrow.tel || '  등록일: ' || vrow.attenddate);
    end loop;
    close vcursor;
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMStudentInfo;
end;

commit;
--특정 교육생 선택시 교육생이 수강신청한 또는 수강중인, 수강했던 개설 과정 정보(과정명, 과정기간(시작 년월일, 끝 년월일), 강의실, 수료 및 중도탈락 여부, 수료 및 중도탈락 날짜) 를 출력한다.

create or replace VIEW vwMStudentInfo
as
select
    st.name as stname,
    c.name as classname,
    lc.startclassdate as classSD,
    lc.finishclassdate as classFD,
    cl.name as CRName,
    ss.whether as SugangState,
    ss.sugangstate_Date as OutDate
from tblstudent st
    inner join tblsugang su
        on st.student_seq = su.student_seq
            inner join tbllclass lc
                on lc.class_seq = su.lclass_seq
                    inner join tblclass c
                        on lc.class_Seq = c.class_seq
                            inner join tblclassroom cl
                                on lc.classroom_Seq = cl.classroom_seq
                                    inner join tblsugangstate ss
                                        on ss.sugang_seq = su.sugang_seq;
                                           
commit;
--교육생 정보를 쉽게 확인하기 위한 검색 기능을 사용할 수 있어야 한다.

create or replace procedure procMFindStudent(
    pname varchar2
)
is
    vrow vwMStudentinfo%rowtype;
    vstate varchar2(10);
begin

    select * into vrow from vwMStudentInfo where STname = pname;
    if vrow.outdate is null then vstate := '수강중';
    else vstate := '중도포기';
    end if;
    dbms_output.put_line('==============================================================================================');
    dbms_output.put_line('학생이름: ' || vrow.stname || '  과정이름: ' || vrow.classname || '  시작일: ' || vrow.classSD || '  종료일: ' || vrow.classFD || '  강의실: ' || vrow.CRName || '  수강상태: ' || vrow.SugangState || '  중도포기: ' || vstate);
    dbms_output.put_line('==============================================================================================');
exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end procMFindStudent;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000s
begin
    procMfindStudent('윤한빈');
end;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 교육생에 대한 수료 및 중도 탈락 처리를 할 수 있어야 한다. 수료 또는 중도탈락 날짜를 입력할 수 있어야 한다.
--중도탈락처리
create or replace procedure procMOutDate(
    pname varchar2,
    pdate date
)
is
begin
    update tblsugangstate set sugangstate_date = pdate, whether = 'Y' where sugang_seq = (select tblstudent.student_seq from tblstudent inner join tblsugang on tblsugang.student_seq = tblstudent.student_seq where name = pname);

exception
    when others then
    dbms_output.put_line('===================================================');           
    dbms_output.put_line('              잘못 입력하였습니다.');
    dbms_output.put_line('===================================================');  
end;

--000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
begin
    procMOutDate('이한형', sysdate);
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

B-07 시험 관련 업무

--특정 개설 과정을 선택하는 경우 등록된 개설 과목 정보를 출력하고, 개설 과목 별로 성적 등록 여부, 시험 문제 파일 등록 여부를 확인할 수 있어야한다.

--프로시저
create or replace procedure proTestinfo(
    mclassname varchar2 := ''
)
is
    jname tblsubject.name%type;
    hstart_date tbllsubject.start_date%type;
    hend_date tbllsubject.end_date%type;
    a1 varchar2(1);
    a2 varchar2(1);
    fname tblclass.name%type;
    cursor vcursor is 
select
    DISTINCT j.name as 과목,
    h.start_date as 시작일,
    h.end_date as 종료일,
    (case when d.score is not null then 'Y' else 'N' end) as 성적등록여부,
    (case when i.question is not null then 'Y' else 'N' end) as 시험문제등록여부,
    f.name as 과정명
from tblsugang a
    inner join tblstudent b on a.student_seq = b.student_seq
    inner join tbltestscore d on a.sugang_seq = d.sugang_seq
    inner join tbllclass e on a.lclass_seq = e.lclass_seq
    inner join tblclass f on e.class_seq = f.class_seq
    inner join tblclassroom g on e.classroom_seq = g.classroom_seq
    inner join tbllsubject h on e.lclass_seq = h.lclass_seq
    inner join tbltest i on h.lsubject_seq = i.lsubject_seq and d.test_seq = i.test_seq  
    inner join tblsubject j on h.subject_seq = j.subject_seq
 
where f.name like '%'||mclassname||'%'
order by h.start_date ;

begin         
    open vcursor; 
        loop
            fetch vcursor into jname, hstart_date, hend_date, a1, a2, fname;
            exit when vcursor%notfound;
			
			dbms_output.put_line('====================================================================================');
			dbms_output.put_line('과정명:'|| fname || '   과목:'|| jname || '   과목시작일:'|| hstart_date ||
								 '   과목종료일:'|| hend_date || '   성적등록여부:'|| a1 || '   시험문제등록여부:'|| a2);

        end loop;
    close vcursor;
            dbms_output.put_line('====================================================================================');

end;

begin
	--proTestinfo('개설과정명');
    proTestinfo();
end;

--과목별 출력시 개설 과정명, 개설 과정기간, 강의실명, 개설 과목명, 교사명 교재명 등을 출력하고, 해당 개설 과목을 수강한 모든 교육생들의 성적 정보(교육생 이름, 주민번호 뒷자리,필기,실기)를 같이 출력한다

--프로시저
create or replace procedure proTestscoreinfo(
    msubjectname VARCHAR2 :=''
)
is
    ename tblclass.name%type;
    dstartclassdate tbllclass.startclassdate%type;
    dfinishclassdate tbllclass.finishclassdate%type;
    jname tblclassroom.name%type;
    gname tblsubject.name%type;
    iname tblteacher.name%type;
    hname tblBookName.name%type;
    aname tblstudent.name%type;
    assn tblstudent.ssn%type;
    pscore tbltestscore.score%type;  
    sscore tbltestscore.score%type; 
    cursor vcursor is 
select
    e.name as 과정명,
    d.startclassdate as 과정시작일,
    d.finishclassdate as 과정종료일,
    j.name as 강의실명,
    g.name as 과목,
    i.name as 교사명,
    h.name as 교재명,
    a.name as 교육생,
    a.ssn as 주민번호뒷자리,
    (select score from vwscore where sugang_seq = b.sugang_seq and kind_of = '필기' and subjectName = g.name and rownum<=1) as "필기점수",
    (select score from vwscore where sugang_seq = b.sugang_seq and kind_of = '실기' and subjectName = g.name and rownum<=1) as "실기점수"
from tblstudent a
    inner join tblsugang b on a.student_seq = b.student_seq
    inner join tbllclass d on b.lclass_seq = d.lclass_seq
    inner join tblclass e on d.class_seq = e.class_seq
    inner join tbllsubject f on d.lclass_seq = f.lclass_seq
    inner join tblsubject g on f.subject_seq = g.subject_seq
    inner join tblbookname h on f.bookname_seq = h.bookname_seq
    inner join tblteacher i on f.teacher_seq = i.teacher_seq
    inner join tblclassroom j on d.classroom_seq = j.classroom_seq
    
where g.name like '%'||msubjectname||'%'
order by d.startclassdate ;

begin         
    open vcursor; 
        loop
            fetch vcursor into ename, dstartclassdate, dfinishclassdate, jname,
                  gname, iname, hname, aname, assn, pscore, sscore  ;
            exit when vcursor%notfound;
 
            dbms_output.put_line('====================================================================================');   
            dbms_output.put_line('과정명:'|| gname || '   과정시작일:'|| dstartclassdate || '   과정종료일:'|| dfinishclassdate ||
                                 '   강의실명:'|| jname || '   과목명:'|| gname || '   교사명:'|| iname || '   교재명:'|| hname ||
                                 '   교육생:'|| aname || '   주민번호뒷자리:'|| substr(assn,7) || '   필기:'|| pscore ||'점' ||
                                 '   실기:'|| sscore ||'점');
        end loop;
    close vcursor;
end;


begin
	--proTestscoreinfo('과목명');
    proTestscoreinfo();
end;

-- 교육생 개인별 출력시 교육생 이름, 주민번호 뒷자리, 개설 과정명, 개설 과정기간, 교사명, 출력, 필기, 실기)를 같이 출력한다.                                                 
--프로시저
create or replace procedure procStestscoreinfo(
    bstudentname varchar2 := ''
)
is
    bname tblstudent.name%type;
    bssn tblstudent.ssn%type;
    fname tblclass.name%type;
    estartclassdate tbllclass.startclassdate%type;
    efinishclassdate tbllclass.finishclassdate%type;
    kname tblteacher.name%type;
    pscore tbltestscore.score%type;  
    sscore tbltestscore.score%type;
    cursor vcursor is 
select
    a.name as 교육생,
    a.ssn as 주민번호뒷자리,
    e.name as 과정명,
    d.startclassdate as 과정시작일,
    d.finishclassdate as 과정종료일,
    i.name as 교사이름,
    (select score from vwscore where sugang_seq = b.sugang_seq and kind_of = '필기' and subjectName = g.name and rownum<=1) as "필기점수",
    (select score from vwscore where sugang_seq = b.sugang_seq and kind_of = '실기' and subjectName = g.name and rownum<=1) as "실기점수"
from tblstudent a
    inner join tblsugang b on a.student_seq = b.student_seq
    inner join tbllclass d on b.lclass_seq = d.lclass_seq
    inner join tblclass e on d.class_seq = e.class_seq
    inner join tbllsubject f on d.lclass_seq = f.lclass_seq
    inner join tblsubject g on f.subject_seq = g.subject_seq
    inner join tblbookname h on f.bookname_seq = h.bookname_seq
    inner join tblteacher i on f.teacher_seq = i.teacher_seq
    
where a.name like '%'||bstudentname||'%' ;

begin         
    open vcursor; 
        loop
            fetch vcursor into bname, bssn, fname, estartclassdate, efinishclassdate,kname,
                  pscore, sscore ;
            exit when vcursor%notfound;

                        
            dbms_output.put_line('====================================================================================');     
            dbms_output.put_line('교육생:'|| bname || '   주민번호뒷자리:'|| substr(bssn,7) || '   과정명:'|| fname ||
                                 '   과정시작일:'|| estartclassdate || '   과정종료일:'|| efinishclassdate ||
                                 '   교사명:'|| kname || '   필기:'|| pscore ||'점' || '   실기:'|| sscore ||'점');

        end loop;
    close vcursor;
end;

begin
	--procStestscoreinfo('교육생');
    procStestscoreinfo();
end;

--view

CREATE OR REPLACE VIEW vwScore
as
(select 
    su.sugang_seq as sugang_seq,
    s.name as subjectName,
    test.kind_of as kind_of,
    ts.score as score,
    ts.testdate as testDate,
    test.question
from tblstudent stu inner join tblsugang su on stu.student_seq = su.student_seq
                    inner join tbllclass lc on lc.lclass_seq = su.lclass_seq
                    inner join tblclass c on c.class_seq = lc.class_seq
                    inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                    inner join tblsubject s on s.subject_seq = ls.subject_seq
                    inner join tblbookname B on b.bookname_seq = ls.bookname_seq
                    inner join tblteacher T on t.teacher_seq = ls.teacher_seq
                    inner join tbltest test on test.lsubject_seq = ls.lsubject_seq
                    left outer join tbltestscore ts on ts.test_seq=test.test_seq and ts.sugang_seq = su.sugang_seq);
                    
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--B-08 출결 관리 업무
--프로시저
--년월일단위
create or replace procedure proAttendenceinfo(
     mclassname varchar2 := '',
     mstudentname varchar2 := '',
     mstartdate varchar2 := '0001-01-01',
     menddate varchar2 := '9999-12-31'
     
)
is
    dname tblclass.name%type;
    etotalnum tblclassroom.totalnum%type;
    fname tblstudent.name%type;
    babsence_type tblAttendence.absence_type%type;
    battendence_date tblAttendence.attendence_date%type;
    cursor vcursor is 
select
    d.name,
    e.totalnum,
    f.name,
    b.absence_type,
    b.attendence_date
from (tblSugang a
    inner join tblAttendence b on a.sugang_seq = b.sugang_seq
    inner join tblLClass c on a.lclass_seq = c.lclass_seq
    inner join tblclass d on c.class_seq = d.class_seq
    inner join tblclassroom e on c.classroom_seq = e.classroom_seq
    inner join tblstudent f on a.student_seq = f.student_seq )
where b.attendence_date between to_date(mstartdate,'yyyy-mm-dd') AND to_date(menddate,'yyyy-mm-dd')
        and d.name like '%'||mclassname||'%' and f.name like '%'||mstudentname||'%'
order by b.attendence_date;

begin         
    open vcursor; 
        loop
            fetch vcursor into dname, etotalnum, fname, babsence_type,battendence_date;
            exit when vcursor%notfound;
 
            dbms_output.put_line('====================================================================================');   
            dbms_output.put_line('과정명:'|| dname || '   교육생:'|| fname || '   근태:'|| babsence_type || '   날짜:'|| battendence_date);           

        end loop;

    close vcursor;
end;

begin
	--proAttendenceinfo('과정명','교육생','시작날짜','종료일자');
    proAttendenceinfo('','','20211130','20211231');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
B-09 졸업생 멘티 멘토	 
졸업생 정보를 조회할 수 있어야 한다.
관리자는 현재 수강중인 과정의 1인당 멘토 1명씩 배정하게 한다.
 
--프로시저
--졸업생조회
create or replace procedure proGraduateinfo(
    mtblGraduatename varchar2 := ''
)
is
    aGraduate_seq tblGraduate.Graduate_seq%type;
    aname tblGraduate.name%type;
    aid tblGraduate.id%type;
    alast_ssn tblGraduate.last_ssn%type;
    aphoneNumber tblGraduate.phoneNumber%type;
    acomplationdate tblGraduate.complationdate%type;
    aemployment tblGraduate.employment%type;
    asalary tblGraduate.salary%type;
    asugang_Seq tblGraduate.sugang_Seq%type;
    cursor vcursor is 
select
    a.Graduate_seq,
    a.name,
    a.id,
    a.last_ssn,
    a.phoneNumber,
    a.complationdate,
    a.employment,
    a.salary,
    a.sugang_Seq
from tblGraduate a
where a.name like '%'||mtblGraduatename||'%';

begin   
    open vcursor; 
        loop
            fetch vcursor into aGraduate_seq, aname, aid, alast_ssn,aphoneNumber,acomplationdate,
                   aemployment, asalary, asugang_Seq ;
            exit when vcursor%notfound;
          
            dbms_output.put_line('====================================================================================');   
            dbms_output.put_line('졸업생번호:' || aGraduate_seq || '   이름:' || aname || '   아이디:' || aid || '   주민번호뒷자리:' || alast_ssn ||
                                 '   전화번호:' || aphoneNumber || '   수료날짜:' || acomplationdate || '   취업처:' || aemployment ||
                                 '   연봉:' || asalary || '   수강신청번호:' || asugang_Seq);        
            
        end loop;
    close vcursor;
end;

begin
    --proGraduateinfo('졸업생');
    proGraduateinfo('김멘토');
end;

drop procedure proGraduateinfo;




--멘토조회
create or replace procedure proMentoringinfo(
    mGraduatename varchar2 := '',
    mstudentname varchar2 := ''
)
is
    fname tblgraduate.name%type;
    bname tblstudent.name%type;
    dname tblclass.name%type;
   
    cursor vcursor is 
select
    f.name ,
    b.name ,
    d.name 
from (tblSugang a
        inner join tblstudent b on a.student_seq = b.student_seq
        inner join tblLClass c on a.lclass_seq = c.lclass_seq
        inner join tblclass d on c.class_seq = d.class_seq
        inner join tblclassroom e on c.classroom_seq = e.classroom_seq)
        inner join tblmentoring g on b.student_seq = g.student_seq
        inner join tblgraduate f on g.graduate_seq = f.graduate_seq
where f.name like '%'||mGraduatename||'%' and b.name like '%'||mstudentname||'%' ;

begin
           
    open vcursor; 
        loop
            fetch vcursor into fname, bname, dname;
            exit when vcursor%notfound;
            
            dbms_output.put_line('====================================================================================');   
            dbms_output.put_line('졸업생:' || fname || '   교육생: ' || bname || '   과정명:' || dname );        
            
        end loop;
    close vcursor;
end;

begin
    -- proMentoringinfo('졸업생','교육생');
    proMentoringinfo('','김규석');
end;

drop procedure proMentoringinfo;




--관리자는 현재 수강중인 과정의 1인당 멘토 1명씩 배정하게 한다.

create or replace procedure proMentoringAdd(
    mgname VARCHAR2,   
    msname VARCHAR2
)
is
begin
    insert into tblmentoring a (a.mento_seq, a.graduate_seq,a.student_seq)
    values (
        (SELECT NVL(MAX(mento_seq)+1,0) from tblmentoring),
        (select vg.graduate_seq from vGraduateseq vg where vg.name = mgname),
        (select vs.student_seq from vStudentseq vs where vs.name =msname) );        
end;

commit;
rollback;

begin
    proMentoringAdd('조마나','김규석');
end;

]
-- view
CREATE OR REPLACE VIEW vStudentseq AS
select
    g.student_seq,
    b.name
from (tblSugang a
        inner join tblstudent b on a.student_seq = b.student_seq
        inner join tblLClass c on a.lclass_seq = c.lclass_seq
        inner join tblclass d on c.class_seq = d.class_seq
        inner join tblclassroom e on c.classroom_seq = e.classroom_seq)
        inner join tblmentoring g on b.student_seq = g.student_seq
        inner join tblgraduate f on g.graduate_seq = f.graduate_seq;
		

CREATE OR REPLACE VIEW vGraduateseq AS
select
    f.graduate_seq,
    f.name
from (tblSugang a
        inner join tblstudent b on a.student_seq = b.student_seq
        inner join tblLClass c on a.lclass_seq = c.lclass_seq
        inner join tblclass d on c.class_seq = d.class_seq
        inner join tblclassroom e on c.classroom_seq = e.classroom_seq)
        inner join tblmentoring g on b.student_seq = g.student_seq
        inner join tblgraduate f on g.graduate_seq = f.graduate_seq;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

B-10 교육 지원금 및 월급 배부 현황

--교육생 정보(이름, 과정명, 수강 일수)를 조회하고 교육 지원금 계산이 된 값과 입금 예정날짜를 조회하고 입금 확인을 조회할 수 있어야 한다.

--학생
--프로시저
create or replace procedure procsASubsidyinfo(
    mstudentname varchar2 :=''
)
is
    cname tblstudent.name%type;
    ename tblclass.name%type;
    acount number;
    aacount number;
    aaacount date;
    cursor vcursor is 
select
    c.name,
    e.name,
    count(a.attendence_date),
    count(a.attendence_date)*13000,
    to_char(a.attendence_date,'YYYY-mm') || '-28'
from tblAttendence a
        inner join tblSugang b on a.sugang_seq = b.sugang_seq
        inner join tblstudent c on b.student_seq = c.student_seq
        inner join tblLClass d on b.lclass_seq = d.lclass_seq
        inner join tblclass e on d.class_seq = e.class_seq
        inner join tblclassroom f on d.classroom_seq = f.classroom_seq
group by to_char(a.attendence_date,'YYYY-mm'),c.name,e.name
having c.name like '%'||mstudentname||'%'
order by to_char(a.attendence_date,'YYYY-mm') ;
begin         
    open vcursor; 
        loop
            fetch vcursor into cname, ename, acount, aacount, aaacount;
            exit when vcursor%notfound;
            
            dbms_output.put_line('교육생:' || cname || '   과정명:' || ename || '   출석일:' || acount || '일   지원금:' || aacount || '원   지급일:' || aaacount );        

        end loop;
    close vcursor;
end;

begin
    procsASubsidyinfo('김규석');
end;

drop procedure procsASubsidyinfo;



--교사 정보(이름, 월급, 월급날짜, 수강중인 강좌)를 조회하고 월급 날짜에 맞춰 지급 되었는지 확인할 수 있어야 한다.
--교사
--프로시저
create or replace procedure procsTcASubsidyinfo(
    mteacher varchar2 :=''
)
is
    bname tblTeacher.name%type;
    acount number;
    aacount number;
    aaacount date;
    ename tblclass.name%type;
    cursor vcursor is 
select
    b.name as 이름,
    count(a.TcAttendanceDate) as 근무일,
    count(a.TcAttendanceDate)*130000 as 월급,
    to_char(a.TcAttendanceDate,'YYYY-mm') || '-28' as 월급날짜,
    e.name as 과정명
from tblTcAttendance a
        inner join tblTeacher b on a.teacher_seq = b.teacher_seq
        inner join (select distinct Teacher_Seq, lclass_seq from tbllsubject) c on b.teacher_seq = c.teacher_seq
        inner join tbllclass d on c.lclass_seq = d.lclass_seq
        inner join tblclass e on d.class_seq = e.class_seq
group by to_char(a.TcAttendanceDate,'YYYY-mm'), b.name , e.name
having b.name like '%'||mteacher||'%'
order by to_char(a.TcAttendanceDate,'YYYY-mm');
begin         
    open vcursor; 
        loop
            fetch vcursor into bname, acount, aacount, aaacount, ename;
            exit when vcursor%notfound;
            dbms_output.put_line('교사이름:' || bname || '   월급:' || TO_CHAR(aacount, '9,999,999') ||
                                 '원   출석일:' || acount ||'일   지급일:' || aaacount || '   과정명:' || ename );        

        end loop;
    close vcursor;
end;

begin
    procsTcASubsidyinfo('박세인');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--B-11 코로나 대면 비대면 여부 확인
--관리자는 선생님과 학생들의 대면 비대면 여부를 확인할 수 있다.
--학생
--프로시저
B-11 코로나 대면 비대면 여부 확인
--관리자는 선생님과 학생들의 대면 비대면 여부를 확인할 수 있다.
--학생
--프로시저
create or replace procedure procCovidsinfo(
    mstudent varchar :=''
)

is
    cname tblstudent.name%type;
    afacetoface tblcovids.facetoface%type;
    aattendance tblcovids.attendance%type;
    ename tblclass.name%type;
    cursor vcursor is 
select
    c.name as 이름,
    a.facetoface as 대면여부,
    a.attendance as 출석날짜,
    e.name as 과정명
from tblCovids a
        inner join tblsugang b on a.sugang_seq = b.sugang_seq
		inner join tblstudent c on b.student_seq = c.student_seq
        inner join tblLClass d on b.lclass_seq = d.lclass_seq
        inner join tblclass e on e.class_seq = d.class_seq
        inner join tblclassroom f on d.classroom_seq = f.classroom_seq
where c.name like '%'||mstudent||'%';
begin         
    open vcursor; 
        loop
            fetch vcursor into cname, afacetoface , aattendance, ename;
            exit when vcursor%notfound;

            dbms_output.put_line('교육생:' || cname || '   대면여부:' || afacetoface || '   날짜:' || aattendance || '   과정명:' || ename);        

        end loop;
    close vcursor;
end;

begin
    --procCovidsinfo('교육생')
    procCovidsinfo('김규석');
end;

--교사
--프로시저
create or replace procedure procTcCovidtinfo(
    mteacher varchar2 := ''
)

is
    bname tblteacher.name%type;
    afacetoface tblcovids.facetoface%type;
    aattendance tblcovids.attendance%type;
    ename tblclass.name%type;
    cursor vcursor is 
select
    b.name as 이름,
    a.facetoface as 대면여부,
    a.attendance as 출석날짜,
    e.name as 과정명
from tblCovidt a
        inner join tblteacher b on a.teacher_seq = b.teacher_seq
        inner join (select distinct Teacher_Seq, lclass_seq from tbllsubject) c on b.teacher_seq = c.teacher_seq
        inner join tbllclass d on c.lclass_seq = d.lclass_seq
        inner join tblclass e on d.class_seq = e.class_seq
where b.name like '%'||mteacher||'%';
begin         
    open vcursor; 
        loop
            fetch vcursor into bname, afacetoface, aattendance, ename;
            exit when vcursor%notfound;

            dbms_output.put_line('교사이름:' || bname || '   대면여부:' || afacetoface || '   날짜:' || aattendance ||
                                 '   과정명:'|| ename);        

        end loop;
    close vcursor;
end;

begin
    --procTcCovidtinfo('교사')
    procTcCovidtinfo();
end;

commit;
===========================================================================================
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--B12
--B-12 졸업생 취업현황
--관리자는 졸업생의 취업 현황을 조회할 수 있다.
--관리자는 해당 자료를 교육생의 취업 지원 보조 용도로 활용할 수 있다.
B-12 졸업생 취업현황
--관리자는 졸업생의 취업 현황을 조회할 수 있다.
--관리자는 해당 자료를 교육생의 취업 지원 보조 용도로 활용할 수 있다.

--프로시저									  
create or replace procedure proGraduateJobinfo(
    mstudent varchar2 := '',
    mclassname varchar2 :=''
)
is
    aname tblGraduate.name%type;
    acomplationdate tblGraduate.complationdate%type;
    aemployment tblGraduate.employment%type;
    dname tblclass.name%type;
    cursor vcursor is 
select
    a.name as 이름,
    a.complationdate as 수료날짜,
    a.employment as 취업처,
    d.name 과정명
from tblGraduate a
    inner join tblsugang b on a.sugang_seq = b.sugang_seq
    inner join tblLClass c on b.lclass_seq = c.lclass_seq
    inner join tblclass d on c.class_seq = d.class_seq
    inner join tblclassroom e on c.classroom_seq = e.classroom_seq
where a.name like '%'||mstudent||'%' and d.name like '%'||mclassname||'%';

begin         
    open vcursor; 
        loop
            fetch vcursor into aname, acomplationdate, aemployment, dname;
            exit when vcursor%notfound;

            dbms_output.put_line('===================================================');  
            dbms_output.put_line('졸업생:' || aname || '   수료날짜:' || acomplationdate || '   취업처:' || aemployment || '   과정명:' || dname);        

        end loop;
    close vcursor;
end;

begin
    --proGraduateinfo('졸업생','과정명')
    proGraduateJobinfo('','자바');
end;


--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--PROCEDURE=====================================================================
-- <관리자>
--B-13. 희망 취업처 및 연봉 조회

--[학생들의 희망 취업처 및 희망 연봉 조회]-----------------------------------------
create or replace procedure proMWishjobOutput
(
    pstudent varchar2 := ''    
)
is
    vname tblstudent.name%type;
    vcity tblwishjob.city%type;
    vbasicpay tblwishjob.basicpay%type;
    vseq number := 0;
    
    cursor vcursor is 
select 
    s.name as "교육생명", 
    w.city as "희망 지역", 
    w.basicpay as "희망 연봉"
from tblwishjob w
    inner join tblStudent s
        on w.student_seq = s.student_seq
    where s.name like '%'||pstudent||'%';
begin
    open vcursor;
        loop
            vseq := vseq + 1;
            fetch vcursor into vname, vcity, vbasicpay;
            exit when vcursor%notfound;
            dbms_output.put_line( ' 번호:' ||to_char(vseq, '000') ||'  교육생이름: ' || vname || '  희망지역: ' || vcity || '  희망연봉: ' || vbasicpay);
            dbms_output.put_line('====================================================================================');       
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('잘못된 입력');
    dbms_output.put_line('====================================================================================');
end proMWishjobOutput;


---------------------------------------

-- 2. 학생(상담내용 + 희망 취업처 + 희망 연봉) 조회 

create or replace procedure proMCounselWishjobOutput
(
    pstudent varchar2 := ''
)
is
    vname tblstudent.name%type;
    vpurpose tblcounsel.purpose%type;
    vtarget tblcounsel.target%type;
    vcounsel_date tblcounsel.counsel_date%type;
    vcity tblwishjob.city%type;
    vbasicpay tblwishjob.basicpay%type;
    vseq number := 0;

    cursor vcursor is 
select
    s.name,
    c.purpose,
    c.target,
    c.counsel_date,
    w.city,
    w.basicpay
    
from tblStudent s
    inner join tblwishjob w
        on s.student_seq = w.student_seq
            inner join tblsugang s
                on s.student_seq = s.sugang_seq
                    inner join tblcounsel c
                        on s.sugang_seq = c.sugang_seq
        where s.name like '%'||pstudent||'%'
            order by c.counsel_date desc;
begin
    open vcursor;
        loop
            vseq := vseq + 1;
            fetch vcursor into vname, vpurpose, vtarget, vcounsel_date, vcity, vbasicpay;
            exit when vcursor%notfound;
            dbms_output.put_line
            ( ' 번호:'|| to_char(vseq, '0000') || '  교육생이름: ' || vname || '  상담목적: '|| vpurpose || '  상담사: ' || vtarget || '  상담날짜: ' || vcounsel_date || '  희망연봉: ' || vcity || '   ' || vbasicpay);     
            dbms_output.put_line('====================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('잘못된 입력');
    dbms_output.put_line('====================================================================================');
end proMCounselWishjobOutput;

--실행***************************************************************************
--1. 학생(희망 취업처 + 희망 연봉)
begin
    dbms_output.put_line('====================================================================================');
    proMWishjobOutput();-- 전체 조회
    --proMWishjobOutput('이정현'); -- 지정 조회
end;


--2. 학생(상담 + 희망 취업처 + 희망 연봉) 
begin
    dbms_output.put_line('====================================================================================');
    --proMCounselWishjobOutput(''); -- 전체 조회
    proMCounselWishjobOutput('이정현'); -- 지정 조회    
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--PROCEDURE=====================================================================
-- <관리자>
--B-14. 교육생 팀 편성 조회
--=============================================================================--------------------------------------------------------------------------------
-- 1. 팀 전체 조회
create or replace procedure proMTotalTeamOutput
(
    pteam varchar2 := '',
    pname varchar2 := ''
)
is
    vclass_seq tbllclass.class_seq%type;
    vteam tblteam.team%type;
    vname tblstudent.name%type;
    cursor vcursor is 
select
    lc.class_seq as "과정번호",
    t.team as "팀",
    st.name as "교육생명"
from tblStudent st
    inner join tblsugang sg
        on sg.student_seq = st.student_seq
            inner join tblTeam t
                on t.sugang_seq = sg.sugang_seq
                    inner join tbllclass lc
                        on lc.lclass_seq = sg.lclass_seq
                   where t.team like '%'||pteam||'%' and st.name like '%'||pname||'%'
                        order by lc.class_seq;
begin
    open vcursor;
        loop
            fetch vcursor into vclass_seq, vteam, vname;
            exit when vcursor%notfound;         
            dbms_output.put_line( ' '||'과정번호: ' || vclass_seq || '  ' || '조: ' || vteam || '  교육생 이름:' || vname);
    dbms_output.put_line('====================================================================================');
            
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end proMTotalTeamOutput;


-- 2. 특정 강의 and 특정 팀 조회
create or replace procedure proMClassandTeamOutput
(
    pteam varchar2 := '',
    plecture varchar2 := ''
)
is
    cname tblclass.name%type;  
    vteam tblteam.team%type;
    vname tblstudent.name%type;
     cursor vcursor is 
select
    c.name as "과정이름",
    t.team as "팀",
    st.name as "교육생명"
from tblStudent st
    inner join tblsugang sg
        on sg.student_seq = st.student_seq
            inner join tblTeam t
                on t.sugang_seq = sg.sugang_seq
                    inner join tbllclass lc
                        on lc.lclass_seq = sg.lclass_seq
                            inner join tblclass c
                                on c.class_seq = lc.class_seq
                                    where t.team like '%'||pteam||'%' and c.name like '%'||plecture||'%'
            order by c.name, st.name;
begin
    open vcursor;
        loop
            fetch vcursor into cname, vteam, vname;
            exit when vcursor%notfound; 
            dbms_output.put_line( ' '||'과정이름: ' || cname || '  ' || vteam || '조: ' || vname);      
            dbms_output.put_line('====================================================================================');       
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end proMClassandTeamOutput;

--1. 전체 수강새의 팀 조회
begin
    dbms_output.put_line('====================================================================================');
    proMTotalTeamOutput(''); -- 전체 조회
    --proMTotalTeamOutput('','이정현'); -- 지정 조회(이름)
    --proMTotalTeamOutput('1'); -- 지정 조회(조번호)   
end;
-- 2. 특정 강의 and 특정 팀 조회
begin
    dbms_output.put_line('====================================================================================');
    --proMClassandTeamOutput('', ''); -- 전체 조회
    --proMClassandTeamOutput('1', ''); -- 지정 팀 조회(조번호)
    --proMClassandTeamOutput('', '임베디드'); -- 지정 강의 조회(강의이름)
    proMClassandTeamOutput('1', '임베디드'); -- 지정 강의+ 팀 조회(강의이름 + 조번호)        
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--PROCEDURE=====================================================================================================
-- <관리자>
----B-15. 교육생 상담 조회  
--==============================================================================================================

--1. 전체 조회
create or replace procedure proMTotalcounselOutput
(
    pname varchar2 := '',
    ppurpose varchar2 := ''
)
is
    vname tblstudent.name%type;
    vpurpose tblcounsel.purpose%type;
    vtarget tblcounsel.target%type;
    vcounsel_date tblcounsel.counsel_date%type;
    
    cursor vcursor is
select
    st.name as "교육생명",
    c.purpose as "상담목적",
    c.target as "상담사",
    c.counsel_date as "신청날짜"
from tblStudent st
        inner join tblsugang sg
             on st.student_seq = sg.sugang_seq
                  inner join tblcounsel c
                       on sg.sugang_seq = c.sugang_seq
                            inner join tblmanager m
                                on m.manager_seq = st.manager_seq
       where st.name like '%'||pname||'%' 
       and c.purpose like '%'||ppurpose||'%' and c.target = '관리자'
                           order by counsel_date desc;
begin 
    open vcursor;
        loop
            fetch vcursor into vname, vpurpose, vtarget, vcounsel_date;
            exit when vcursor%notfound;
            
            dbms_output.put_line(' '||'이름: ' || vname || '  목적: ' || vpurpose || '  상담사: ' || vtarget || '  상담날짜: ' || vcounsel_date);     
            dbms_output.put_line('====================================================================================');        
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proMTotalcounselOutput;

-- 실행********************************************************************************
--1. 상담 조회
begin
    dbms_output.put_line('====================================================================================');        
    --proMTotalcounselOutput();         -- 전체조회
    proMTotalcounselOutput('이정현','');    -- 지정 이름 조회
    --proMTotalcounselOutput('','개인');         -- 지정 사유 조회
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--PROCEDURE=====================================================================================================
-- <교사>
----C-01. 계정관리 
--==============================================================================================================
--[교사 본인 계정 조회] 
create or replace procedure ProTAccountSearch
( 
    pid in tblteacher.id%type,
    ppw in tblteacher.jumin%type
)
is
    vrow tblteacher%rowtype;
    cursor vcursor is
select * from tblteacher
    where teacher_seq = (select t.teacher_seq from tblteacher t where pid = t.id and ppw = t.jumin);
begin
    open vcursor;
        loop
            fetch vcursor into vrow;
            exit when vcursor%notfound;
            dbms_output.put_line(' 교사번호: '|| vrow.teacher_seq || '  교사이름: ' || vrow.name || '  ID: ' || vrow.id || '  PW: '|| vrow.jumin||'  전화번호: '|| vrow.tel);
            dbms_output.put_line(' 과목: ' || vrow.possiblelecture ||'  현재강의여부: '|| vrow.now || '  과목: ' || vrow.subject_seq || '  담당매니저: ' || vrow.manager_seq);
            dbms_output.put_line('====================================================================================');              
        end loop; 
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end ProTAccountSearch;


select * from tblTeacher;



--실행***************************************************************************
begin
    dbms_output.put_line('====================================================================================');              
    ProTAccountSearch('tpdls1990',1234927);
end;
--******************************************************************************

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--PROCEDURE=====================================================================================================
-- <교사>
----C-02. 강의 스케줄 조회 
--==============================================================================================================

-- [본인의 강의 스케줄 확인]-------------------------------------------------------
-- 1. 강의과정 스케줄 조회(교수 : 강의 = 1 : N)


create or replace procedure proTClassSearch
(
    pteacher_seq tblteacher.teacher_seq%type
    
)
is
    tname tblteacher.name%type;
    cname tblclass.name%type;
    vstartclassdate tbllclass.startclassdate%type;
    vfinishclassdate tbllclass.finishclassdate%type;
    crname tblclassroom.name%type;  
 
    vtotal tblsugang.lclass_seq%type;--- 총 등록 인원수
    lcstate varchar2(30); -- 강의 진행 상태
    
    vtotalnum number;
    
    cursor vcursor is
select 
    distinct t.name as "교사명", 
    c.name as "과정명", 
    lc.startclassdate as "개강", 
    lc.finishclassdate as "종강", 
    cr.name "강의실",
 (select 
    count(distinct(student_seq)) 
from tblteacher t inner join tbllsubject ls on t.teacher_seq = ls.teacher_seq
                  inner join tbllclass lc on lc.lclass_seq = ls.lclass_seq
                  inner join tblsugang su on su.lclass_seq = lc.lclass_seq
    where t.teacher_seq =pteacher_seq) as "등록인원수",
    case
        when lc.startclassdate <= sysdate and lc.finishclassdate >= sysdate then '진행중'
        when lc.startclassdate > sysdate then '예정'
        when lc.startclassdate < sysdate then '종료'
    end as "강의진행상태"
from tblclass c
    inner join tbllclass lc
        on c.class_seq = lc.class_seq
            inner join tbllsubject ls
                on ls.lclass_seq = lc.class_seq
                    inner join tblteacher t
                        on t.teacher_seq = ls.teacher_seq
                            inner join tblclassroom cr
                                on cr.classroom_seq = lc.classroom_seq                                    
                 where ls.teacher_seq = pteacher_seq
                    order by "개강" asc;
begin 
    open vcursor;
        loop
            fetch vcursor into tname, cname, vstartclassdate, vfinishclassdate, crname, vtotal, lcstate;
            exit when vcursor%notfound;           
            dbms_output.put_line(' '|| '교사이름: ' ||tname|| '  과정명: ' || cname);     
            dbms_output.put_line(' 개강: ' || vstartclassdate|| '  종강: ' || vfinishclassdate || ' 강의실명: ' || crname || '  등록인원: ' || vtotal || '  상태: ' || lcstate);
            dbms_output.put_line('====================================================================================');                
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end proTClassSearch;


--*********************************************************************
begin
    dbms_output.put_line('====================================================================================');        
    proTClassSearch(11); 
end;
--*********************************************************************




-- 2. 과정별 과목 스케줄(강의명 겹치지 X)

create or replace procedure proTEachClassSearch
(
    pid  in tblteacher.id%type,
    ppw  in tblteacher.jumin%type
)
is
    cname tblclass.name%type;
    sname tblsubject.name%type;
    snum tblsubject.subject_seq%type;
    lsstart tbllsubject.start_date%type;
    lsend tbllsubject.end_date%type;
    bbookname tblbookname.name%type;
    crname tblclassroom.name%type;
    --vstate tbllsubject.start_date%type; -- 강의 진행 상태
    vstate varchar2(30);
    cursor vcursor is

select
    c.name as "과정명",
    sb.name as "과목명",
    sb.subject_seq as "과목번호",
    ls.start_date as "과목시작날짜",
    ls.end_date as "과목종료날짜",
    b.name as "교재명",
    cr.name "강의실",
    case
        when ls.start_date <= sysdate and ls.end_date >= sysdate then '진행중'
        when ls.start_date > sysdate then '예정'
        when ls.start_date < sysdate then '종료'
    end as "강의진행상태"
    
from tbllsubject ls
    inner join tbllclass lc
        on lc.lclass_seq = ls.lclass_seq
            inner join tblsubject sb
                on sb.subject_seq = ls.subject_seq
                    inner join tblclass c
                        on c.class_seq = lc.class_seq
                            inner join tblbookname b
                                on b.bookname_seq = ls.bookname_seq
                                    inner join tblclassroom cr
                                        on cr.classroom_seq = lc.classroom_seq
                                             inner join tblteacher t
                                                on t.teacher_seq = ls.teacher_seq
                         where t.teacher_seq = (select teacher_seq from tblteacher t where pid = t.id and ppw = t.jumin)

                                            order by ls.start_date asc;
begin
    open vcursor;
        loop
            fetch vcursor into cname, sname, snum, lsstart, lsend, bbookname, crname, vstate;
            exit when vcursor%notfound;
            dbms_output.put_line(' ' || '과정명: ' || cname);
            dbms_output.put_line(' 과목명: ' || sname || '과목번호' || snum || '  과목시작: ' || lsstart || '  과목종료: ' || lsend );
            dbms_output.put_line(' 교재명: ' ||bbookname|| '  강의실:' ||crname || '  상태:' ||vstate);
            dbms_output.put_line('====================================================================================');    
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proTEachClassSearch;



--*********************************************************************
begin
    dbms_output.put_line('====================================================================================');    
    proTEachClassSearch('tpdls1990', 1234927);
end;
--************************************************************************************



-- [교육생 강의 정보 확인]-------------------------------------------------------------------------------


-- 1. 전체 출력
create or replace procedure proTTotalStudentClassInfo(
    pid  in tblteacher.id%type,
    ppw  in tblteacher.jumin%type
)
is
    vsubject_seq tblsubject.subject_seq%type;
    vname tblstudent.name%type;
    vtel tblstudent.tel%type;
    venroll tblstudent.attenddate%type;
    lcstate varchar2(30);
    cursor vcursor is
select
    distinct
    c.class_seq as "과정번호",
    st.name as "교육생명",
    st.tel as "전화번호",
    st.attenddate as "수강등록일",
    case
        when lc.startclassdate <= sysdate and lc.finishclassdate >= sysdate and sgs.whether = 'N' then '진행중'
        when sgs.whether = 'Y' then '중도탈락'
        when lc.finishclassdate < sysdate and sgs.whether = 'N' then '수료'
        when lc.startclassdate > sysdate then '진행예정' 
    end as "강의진행상태"
from tblsugang sg
    inner join tblstudent st
        on st.student_seq = sg.student_seq
            inner join tbllclass lc
                on lc.lclass_seq = sg.lclass_seq
                    inner join tblclass c
                        on c.class_seq = lc.class_seq
                            inner join tblsugangstate sgs
                                on sgs.sugang_seq = sg.sugang_seq   
                                    inner join tbllsubject ls
                                        on ls.lclass_seq = lc.lclass_seq
                                            inner join tblteacher t
                                                 on t.teacher_seq = ls.teacher_seq
                            where t.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
                                    order by attenddate asc;

begin
    open vcursor;
        loop
            fetch vcursor into vsubject_seq, vname , vtel, venroll, lcstate;
            exit when vcursor%notfound;
            dbms_output.put_line(' 과목번호: ' || vsubject_seq || '  이름: '|| vname || '  전화번호: ' || vtel || '  등록일: ' || venroll || '  수강상태: ' || lcstate );
            dbms_output.put_line('====================================================================================');    

        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proTTotalStudentClassInfo;


--****************************************************
begin
    proTTotalStudentClassInfo('tpdls1990',1234927);    
end;
--****************************************************





-- 2. 과정번호 + 강의 진행중 학생만 + 본인 담당 학생만 선택 쿼리

create or replace procedure proTEachStudentINGSearch(
    pcseq in tblclass.class_seq%type,
    pid  in tblteacher.id % type,
    ppw  in tblteacher.jumin % type
)
is
    vcalss_seq tbllclass.class_seq%type;
    vname tblstudent.name%type;
    vtel tblstudent.tel%type;
    venroll tblstudent.attenddate%type;
    lcstate varchar2(30);
    cursor vcursor is
select
    distinct
    c.class_seq as "과정번호",
    st.name as "교육생명",
    st.tel as "전화번호",
    st.attenddate as "등록일",
    case
        when lc.startclassdate <= sysdate and lc.finishclassdate >= sysdate and sgs.whether = 'N' then '진행중'
        when sgs.whether = 'Y' then '중도탈락'
        when lc.finishclassdate < sysdate and sgs.whether = 'N' then '수료'
        when lc.startclassdate > sysdate then '진행예정'
    end as "진행상태"
from tblsugang sg
    inner join tblstudent st
        on st.student_seq = sg.student_seq
            inner join tbllclass lc
                on lc.lclass_seq = sg.lclass_seq
                    inner join tblclass c
                        on c.class_seq = lc.class_seq
                            inner join tblsugangstate sgs
                                on sgs.sugang_seq = sg.sugang_seq
                                    inner join tbllsubject ls
                                        on ls.lclass_seq = lc.lclass_seq
                                            inner join tblteacher t
                                                on t.teacher_seq = ls.teacher_seq
            
        where c.class_seq = pcseq -- 과정번호 
            and lc.startclassdate <= sysdate 
            and lc.finishclassdate >= sysdate
            and ls.teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw) -- 선생님 
              order by attenddate asc;
begin
    open vcursor;
        loop
            fetch vcursor into vcalss_seq , vname , vtel, venroll, lcstate;
            exit when vcursor%notfound;
            dbms_output.put_line('====================================================================================');    
            dbms_output.put_line(' 과정번호: ' || vcalss_seq || '  교육생 이름: ' || vname || '  전화번호: '  || vtel || '  등록일: ' || venroll || ' 수강상태:' || lcstate);
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proTEachStudentINGSearch;

--****************************************************
begin
    proTEachStudentINGSearch( 101, 'tpdls1990', 1234927);
    dbms_output.put_line('====================================================================================');    
end;
--****************************************************




--3. 특정과목을 과목번호로 선택시 해당 과정에 등록된 교육생 정보를 조회
create or replace procedure proTEachStudentSearchSubseq
(
    psubesq in tblsubject.subject_seq%type,
    pid  in tblteacher.id % type,
    ppw  in tblteacher.jumin % type
)
is
    sname tblstudent.name%type;
    sid tblstudent.id%type;
    sssn tblstudent.ssn%type;
    stel tblstudent.tel%type;
    sattenddate tblstudent.attenddate%type;
    smanager_seq tblstudent.manager_seq%type;
    cursor vcursor is
select
    distinct st.name as "교육생명",
    st.id as "아이디",
    st.ssn as "주민번호",
    st.tel as "전화번호",
    st.attenddate as "등록일",
    st.manager_seq "매니저번호"
from tbllsubject ls
    inner join tbllclass lc
        on lc.lclass_seq = ls.lclass_seq
            inner join tblsugang sg
                on sg.lclass_seq = lc.lclass_seq
                    inner join tblstudent st
                        on st.student_seq = sg.student_seq
                            inner join tblclass c
                                on c.class_seq = lc.class_seq
                                    inner join tbllsubject ls
                                        on ls.lclass_seq = lc.lclass_seq
                                            inner join tblteacher t
                                                on t.teacher_seq = ls.teacher_seq                                
        where ls.subject_seq =  psubesq -- 과목번호 (선택)
            and ls.teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw ) -- 선생님 
                                    order by "교육생명";
begin
    open vcursor;
            dbms_output.put_line('');
        loop
            fetch vcursor into sname , sid , sssn, stel, sattenddate, smanager_seq;
            exit when vcursor%notfound;
            dbms_output.put_line(' 이름:'|| sname || '  ID: ' || sid || '  PW: ' || sssn || '  전화번호: ' || stel ||
                                '  등록일: ' || sattenddate || '  매니저번호: ' || smanager_seq);
            dbms_output.put_line('====================================================================================');    

        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proTEachStudentSearchSubseq;


--실행****************************************************************
begin
    proTEachStudentSearchSubseq(1, 'tpdls1990', 1234927);
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

--PROCEDURE=====================================================================================================
-- <교사>
----C-03. 배점 입출력
--[배점 입출력]---------------------------------------------------------------------

--1. 입력
create or replace procedure proTPointsInput
(
    -- 로그인 권한 
    pid  in tblteacher.id % type,
    ppw  in tblteacher.jumin % type,    
    
    --ppoints_seq number,
    pwritten number,
    ppractical number,
    ppattendance number,
    psubject_seq number,
    
    presult out number
)
is
    vteacher_seq number;
    vsum number := pwritten + ppractical + ppattendance;
begin
    select teacher_seq into vteacher_seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw);
        
        if (vsum = 100) and (ppattendance >= 20) then
            insert into tblpoints values ((select max(points_seq) +1 from tblPoints), pwritten, ppractical, ppattendance, psubject_seq);
            presult := 1;
        
        elsif pwritten is null and ppractical is null and ppattendance is null then
            insert into tblpoints values ((select max(points_seq) +1 from tblPoints), pwritten, ppractical, ppattendance, psubject_seq);
            presult := 2;     
        
        end if;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proTPointsInput;

--2. 수정
-- 과목명 or 과목번호(조건 : 강의마침), 필기 배점, 실기 배점, 출결 배점, *총합(100 계산식)

create or replace procedure proTPointsUpdate
(
    -- 로그인 권한 
    pid  in tblteacher.id % type,
    ppw  in tblteacher.jumin % type,
    
    -- 배점수정
    pwritten number,
    ppractical number,
    ppattendence number,
    ppoints_seq number
  
)
is
    vteacher_seq number;
    vsum number := pwritten + ppractical + ppattendence;
begin

    select teacher_seq into vteacher_seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw);
        if (vsum = 100) and (ppattendence >= 20) then
            update tblPoints set written = pwritten, practical = ppractical, pattendance = ppattendence where points_seq = ppoints_seq;
            dbms_output.put_line('배점 변경이 완료되었습니다.');
            dbms_output.put_line('====================================================================================');    
        else
            dbms_output.put_line('잘못 입력했습니다. 다시입력하세요');
            dbms_output.put_line('(출결 20이상, 배점의 총합은 100)');
            dbms_output.put_line('====================================================================================');    
        end if;
exception
    when others then
    dbms_output.put_line('권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('====================================================================================');      
end proTPointsUpdate;


--[과목목록 출력]----------------------------------------------------------------(완)

-- 1. 특정 과목을 조회(조건 : 강의를 마친 과목)

create or replace procedure proTSearchSubjectOutput
(
    -- 권한 
    pid in tblteacher.id%type,
    ppw in tblteacher.jumin%type
)
is
    ssubject_seq tblsubject.subject_seq%type;
    sname tblsubject.name%type;
    lsstart_date tbllsubject.start_date%type;
    lsend_date tbllsubject.end_date%type;
    cname tblclass.name%type;
    lcstartclassdate tbllclass.startclassdate%type;
    lcfinishclassdate tbllclass.finishclassdate%type;
    bname tblbookname.name%type;
    crclassroom_seq tblclassroom.classroom_seq%type;
    pwritten tblpoints.written%type;
    ppractical tblpoints.practical%type;
    ppattendance tblpoints.pattendance%type;
     cursor vcursor is
select 
    sb.subject_seq as "과목번호",
    sb.name as "과목명",
    ls.start_date as "과목시작",
    ls.end_date as "과목종료",
    c.name as "과정명",
    lc.startclassdate as "개강",
    lc.finishclassdate as "종강",
    b.name as "교재명",
    cr.classroom_seq as "강의실",
    p.written as "필기배점",
    p.practical as "실기배점",
    p.pattendance as "출결배점"
     
from tblsubject sb
    inner join tbllsubject ls
        on ls.subject_seq = sb.subject_seq
            inner join tbllclass lc
                on lc.lclass_seq = ls.lclass_seq
                    inner join tblteacher t
                        on t.teacher_seq = ls.teacher_seq
                            inner join tblclass c
                                on c.class_seq = lc.class_seq
                                    inner join tblclassroom cr
                                        on cr.classroom_seq = lc.classroom_seq
                                            inner join tblbookname b
                                                on b.bookname_seq = ls.bookname_seq
                                                    inner join tblpoints p
                                                        on p.subject_seq = sb.subject_seq
    where ls.end_date < sysdate and t.id = pid and t.jumin = ppw;
begin
 open vcursor;
        loop
            fetch vcursor 
                into ssubject_seq, 
                     sname, 
                     lsstart_date, 
                     lsend_date, 
                     cname, 
                     lcstartclassdate, 
                     lcfinishclassdate, 
                     bname,
                     crclassroom_seq, 
                     pwritten, 
                     ppractical, 
                     ppattendance;
                     
            exit when vcursor%notfound;
            dbms_output.put_line
            (' 과목번호: '||ssubject_seq || '  과목명: ' || sname || '  과목시작일: ' || lsstart_date || '  과목종료일' || lsend_date || '  강의명: '  || cname ); 
            dbms_output.put_line('  개강: ' || lcstartclassdate || '  종강: ' || lcfinishclassdate || '  교재: ' || bname || '  강의실: ' || crclassroom_seq ||
            '  필기배점: ' || to_char(pwritten, '00')|| '  실기배점: ' || to_char(ppractical, '00') || '  출결배점: ' || to_char(ppattendance, '00'));
        dbms_output.put_line('====================================================================================');      
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proTSearchSubjectOutput;
--2. 배점번호로 해당 강의중 종료된 과목 배점 정보 출력
-- 교사는 자기가 설정한 배점정보를 배점번호로 구분한다.*****


create or replace procedure proTEachSubjectPointsOutput
(
    -- 권한 
    pid in tblteacher.id%type,
    ppw in tblteacher.jumin%type,
    
    -- 배점번호
    ppseq in tblpoints.points_seq%type
)
is
    ppoints_seq tblpoints.points_seq%type;
    lcclass_seq tbllclass.lclass_seq%type;
    sname tblsubject.name%type;
    pwritten tblpoints.written%type;
    ppractical tblpoints.practical%type;
    ppattendance tblpoints.pattendance%type;

    cursor vcursor is
select
    p.points_seq as "배점번호",
    lc.lclass_seq as "강의번호",
    sb.name as "과목명",
    p.written as "필기배점",
    p.practical as "실기배점",
    p.pattendance as "출결배점"
     
from tblsubject sb
    inner join tbllsubject ls
        on ls.subject_seq = sb.subject_seq
            inner join tbllclass lc
                on lc.lclass_seq = ls.lclass_seq
                    inner join tblteacher t
                        on t.teacher_seq = ls.teacher_seq
                            inner join tblpoints p
                                on p.subject_seq = sb.subject_seq
        where ls.end_date < sysdate 
        and t.id = pid 
        and t.jumin = ppw 
        and p.points_seq = ppseq;
begin
    open vcursor;
            loop
                fetch vcursor into ppoints_seq, lcclass_seq, sname, pwritten, ppractical, ppattendance;
                exit when vcursor%notfound;
                dbms_output.put_line(' 배점번호: ' || ppoints_seq || '  강의번호: ' || lcclass_seq || '  과목: ' || sname || '  필기: ' || pwritten || '  실기: ' || ppractical 
                                    || '  출석: ' || ppattendance);
                dbms_output.put_line('====================================================================================');
            end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end proTEachSubjectPointsOutput;


-- [시험에 관련된 값]--------------------------------------------------------------
--1. 테스트 문제 추가

create or replace procedure proTTestAdd
(
    -- 권한 
    pid in tblteacher.id%type,
    ppw in tblteacher.jumin%type,
    
    pquestion varchar2,
    pkind_of varchar2,
    plsubject_seq number
)
is
    vteacher_seq number := 0;
begin
    select teacher_seq into vteacher_seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw);
    
    if vteacher_seq > 0 then
        insert into tbltest values ((select max(test_seq) + 1 from tbltest), pquestion, pkind_of, plsubject_seq);
        dbms_output.put_line('테스트 추가가 완료되었습니다.');
        dbms_output.put_line('====================================================================================');    

    end if;   
exception
    when others then
        dbms_output.put_line('로그인 정보 및 테스트 정보가 올바른지 다시 확인해주세요.');
        dbms_output.put_line('====================================================================================');    
end proTTestAdd;


--*********************************************************************************
--------------------------------------------------------------------------------
--출력
--1. 배점 입력(추가)
declare
    vresult number;
begin
    proTPointsInput('tpdls1990', 1234927, 10, 30, 60, 20, vresult); -- 마지막 = 과목번호값    
    --proTPointsInput('tpdls1990', 1234927, null, null, null, 21, vresult); --null값 입력 허용(요구분석서) 단, 3개 배점 전부 null일경우만
    
    if vresult = 1 or vresult = 2 then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('입력이 완료됐습니다.');
        dbms_output.put_line('====================================================================================');
    else
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
    end if;

end;
commit;
--2. 배점 수정 
begin
    dbms_output.put_line('====================================================================================');
    proTPointsUpdate('tpdls1990', 1234927, 20, 50, 30, 104); -- 마지막 = 배점번호(points_seq)
end;

--3. 특정 과목을 조회(조건 : 강의를 마친 과목)
begin
    dbms_output.put_line('====================================================================================');
    proTSearchSubjectOutput('tpdls1990', 1234927);
end;


--4. 배점번호로 해당 강의중 종료된 과목 배점 정보 출력
begin
    dbms_output.put_line('====================================================================================');
    proTEachSubjectPointsOutput('tpdls1990', 1234927, 100); -- 마지막 = 배점번호
end;
--5. 테스트 문제 추가
begin
    dbms_output.put_line('====================================================================================');
    proTTestAdd('tpdls1990', 1234927, '테스ㄹㄴㅇㅇㄹ트', '필기', 1);  -- 마지막 = 과목 번호 
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- C-4

-- 과목 선택

create or replace procedure proctFindlsubjectscore(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type
)
is
    usubject_seq tblsubject.subject_seq%type;
    bname tblclass.name%type;
    llperiod varchar(100);
    rname tblClassroom.name%type;
    uname tblsubject.name%type;
    jjperiod varchar(100);
    nname tblbookname.name%type;
    cursor vcursor 
is 
SELECT 
    distinct
    u.subject_seq,
    b.name,
    l.startclassdate || '~' || l.finishclassdate as lperiod,
    r.name,
    u.name,
    j.start_date || '~' || j.end_date as jperiod,
    n.name    
    
FROM tblTestScore e
    INNER JOIN tblTest t
        ON t.test_seq = e.test_seq
            INNER JOIN tblLSubject j
                ON t.lsubject_seq = j.lsubject_seq
                    INNER JOIN tblSugang g
                        ON e.sugang_seq = g.sugang_seq
                            INNER JOIN tblStudent s
                                ON s.student_seq = g.student_seq
                                    INNER JOIN tblSubject u
                                        ON u.subject_seq = j.subject_seq
                                            INNER JOIN tblTeacher c
                                                ON c.teacher_seq = j.teacher_seq
                                                    INNER JOIN tbledu_subsidy y
                                                        ON y.sugang_seq = g.sugang_seq
                                                            INNER JOIN tblLClass l
                                                                ON l.lclass_seq = j.lclass_seq
                                                                    INNER JOIN tblClass b
                                                                        ON b.class_seq = l.class_seq
                                                                            INNER JOIN tblClassroom r
                                                                                ON r.classroom_seq = l.classroom_seq
                                                                                     INNER JOIN tblBookName n
                                                                                        ON n.Bookname_seq = j.bookname_seq
                                                                                        

WHERE 1=1
AND j.end_Date < Sysdate                        -- 강의를 마친 과목에 대해서만 성적처리를 할 수 있다.
AND c.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
ORDER BY u.subject_seq asc
;    
begin
    open vcursor; 
      dbms_output.put_line('====================================================================================================================================================================================================================================');
        loop
            fetch vcursor into usubject_seq, bname, llperiod, rname, uname, jjperiod, nname;
            exit when vcursor%notfound;

            dbms_output.put_line('과목번호' || ': ' || usubject_seq || ' 과정명' || ':  ' || bname || ' 과정기간' || ':  ' || llperiod || ' 강의실명' || ':  ' || rname || ' 과목명' || ':  ' || uname || ' 과목기간' || ':  ' || jjperiod || ' 교재명' || ':  ' || nname || ' 출결배점' || ':  ' || '20%' || ' 필기배점' || ':  ' || '40%' || ' 실기배점' || ':  ' || '40%');        
            
        end loop;
    close vcursor;
      dbms_output.put_line('====================================================================================================================================================================================================================================');

exception
    when others then
        dbms_output.put_line('잘못된 입력');
      dbms_output.put_line('====================================================================================================================================================================================================================================');
end;

begin
    proctFindlsubjectscore('tpdls1990',1234927);
end;

-- 성적 출력

create or replace procedure proctFindStudentscore(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type,
    mbname varchar2 := '',                     
    mjlsubject_seq varchar2 := '',                     
    mtkind_of varchar2 := '',                        
    msname varchar2 := ''                        

)
is
    uname tblsubject.name%type;
    jlsubject_seq tbllsubject.lsubject_seq%type;
    sname tblStudent.name%type;
    stel tblStudent.tel%type;
    awhether tblsugangstate.whether%type;
    awhetherdate varchar(3);
    escore tblTestScore.score%type;
    tquestion tblTest.question%type;
    tkind_of tblTest.kind_of%type;
    aattscore number;
    cursor vcursor 
is 
SELECT 
    distinct
    u.name,
    j.lsubject_seq,
    s.name,
    s.tel,
    a.whether,
    case
        when a.whether = 'Y' then a.sugangstate_date
    end as wheterdate,
    e.score,
    t.question,
    t.kind_of,
    ((SELECT count(*) FROM tblattendence
        WHERE tblattendence.attendence_date BETWEEN '21/09/08' AND '21/11/05' AND sugang_seq = 1) 
    * 0.1) as attscore
    
    
    
FROM tblTestScore e
    INNER JOIN tblTest t
        ON t.test_seq = e.test_seq
            INNER JOIN tblLSubject j
                ON t.lsubject_seq = j.lsubject_seq
                    INNER JOIN tblSugang g
                        ON e.sugang_seq = g.sugang_seq
                            INNER JOIN tblStudent s
                                ON s.student_seq = g.student_seq
                                    INNER JOIN tblSubject u
                                        ON u.subject_seq = j.subject_seq
                                            INNER JOIN tblTeacher c
                                                ON c.teacher_seq = j.teacher_seq
                                                    INNER JOIN tbledu_subsidy y
                                                        ON y.sugang_seq = g.sugang_seq
                                                            INNER JOIN tblLClass l
                                                                ON l.lclass_seq = j.lclass_seq
                                                                    INNER JOIN tblClass b
                                                                        ON b.class_seq = l.class_seq
                                                                            INNER JOIN tblClassroom r
                                                                                ON r.classroom_seq = l.classroom_seq
                                                                                     INNER JOIN tblBookName n
                                                                                        ON n.Bookname_seq = j.bookname_seq
                                                                                            INNER JOIN tblsugangstate a
                                                                                               ON a.sugang_seq = g.sugang_seq

WHERE 1=1
AND j.end_Date < Sysdate        -- 강의를 마친 과목에 대해서만 성적처리를 할 수 있다.
AND c.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
AND b.name like '%'||mbname||'%' 
AND j.lsubject_seq like '%'||mjlsubject_seq||'%' 
AND t.kind_of like '%'||mtkind_of||'%' 
AND s.name like '%'||msname||'%'      
ORDER BY s.name asc
;    
begin
    open vcursor; 
      dbms_output.put_line('=============================================================================================================================================');   
        loop
            fetch vcursor into uname, jlsubject_seq, sname, stel, awhether, awhetherdate, escore, tquestion, tkind_of, aattscore;
            exit when vcursor%notfound;

            dbms_output.put_line('과목명' || ':  ' || uname || ' 과목번호' || ':  ' || jlsubject_seq  || ' 이름' || ':  ' || sname || ' 전화번호' || ':  ' || stel || ' 중도탈락여부' || ':  ' || awhether || ' 중도탈락날짜' || ':  ' || awhetherdate || ' 점수' || ':  ' || escore || ' 문제' || ':  ' || tquestion || ' 실기/필기' || ':  ' || tkind_of || ' 점수' || ':  ' || aattscore);        
            
        end loop;
    close vcursor;
          dbms_output.put_line('=============================================================================================================================================');   

exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end;

begin
    --proctFindStudentscore('과정이름','과목번호','필기실기','학생이름');
    proctFindStudentscore('tpdls1990',1234927,'','','','황현우');
end;


-- 성적 입력

create or replace procedure procTAddTestScore(
    cscore tblTestScore.score%type,
    ctestdate tblTestScore.testdate%type,
    csugang_seq tblTestScore.sugang_seq%type,
    ctest_seq tblTestScore.test_seq%type
)
is

begin
  
    INSERT INTO tbltestscore (TestScore_Seq, Score, Testdate, Sugang_seq, Test_Seq)
        Values ((select max(TestScore_Seq) + 1 from tblTestScore), cscore, ctestdate, csugang_seq, ctest_seq);
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');

end;

begin
    procTAddTestScore(60, sysdate, 1, 101);
end;
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- C-5


create or replace procedure proctFindStudentAttendence(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type,
    msname varchar2 := '',                                         
    mstartdate varchar2 := '0001-01-01',
    menddate varchar2 := '9999-12-31',                       
    mcname varchar2 := ''  
)
is
    aattendencedate tblattendence.attendence_date%type;
    cname tblclass.name%type;
    sname tblstudent.name%type;
    aabsencetype tblattendence.absence_type%type;
    cursor vcursor 
is 
SELECT 
    distinct a.attendence_date,   
    c.name,
    s.name,
    a.absence_type
FROM tblattendence a
    LEFT JOIN tblSugang g
        ON a.sugang_Seq = g.sugang_Seq
            LEFT JOIN tblStudent s
                ON g.student_Seq =  s.student_Seq
                    LEFT JOIN tblLClass l
                        ON l.LClass_Seq = g.LClass_seq
                            LEFT JOIN tblLsubject j
                                ON j.LClass_Seq = l.Lclass_Seq
                                    LEFT JOIN tblTeacher t
                                        ON t.Teacher_Seq = j.Teacher_Seq
                                            LEFT JOIN tblClass c
                                                ON c.Class_Seq = l.Class_Seq
                        
WHERE 1=1
AND s.name like '%'||msname||'%' 
AND a.attendence_date between to_date(mstartdate,'yyyy/mm/dd') AND to_date(menddate,'yyyy/mm/dd')
AND c.name like '%'||mcname||'%'
AND t.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
ORDER BY a.attendence_date asc
;    
begin
    open vcursor;       
        loop
            fetch vcursor into aattendencedate, cname, sname, aabsencetype;
            exit when vcursor%notfound;   
            dbms_output.put_line('===================================================================================================================================');
            dbms_output.put_line('날짜' || ':  ' || aattendencedate || ' 교육과정' || ':  ' || cname || ' 이름' || ':  ' || sname || ' 근태' || ':  ' || aabsencetype);        

        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end;

begin
    --proctFindStudentAttendence(이름, 시작날짜, 종료날짜, 교육과정);
    proctFindStudentAttendence('tpdls1990',1234927,'황현우','20210908','20211105','');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
-- C-6
-- 학생의 질문 조회
create or replace procedure proctFindStudentQuestion(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type,
    msname varchar2 := '',
    mstartdate varchar2 := '0001-01-01',
    menddate varchar2 := '4444-12-31'
)
is
    sname tblstudent.name%type;
    qquestion tblquestion.question%type;
    qquestiondate tblquestion.questiondate%type;
    tname tblTeacher.name%type;
    aanswer tblanswer.answer%type;
    aanswerdate tblanswer.answerdate%type;
    cursor vcursor 
is 
SELECT 
    s.name,
    q.question,
    q.questiondate,
    t.name,
    a.answer,
    a.answerdate
    
FROM tblanswer a
    INNER JOIN tblquestion q
        ON a.question_Seq = q.question_seq
            INNER JOIN tblTeacher t
                ON t.teacher_Seq = a.teacher_seq
                    INNER JOIN tblsugang g
                        ON g.sugang_seq = q.sugang_seq
                            INNER JOIN tblStudent s
                                ON s.student_Seq = g.student_Seq

WHERE 1=1
AND t.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
AND a.answerdate between to_date(mstartdate,'yyyy-mm-dd') AND to_date(menddate,'yyyy-mm-dd')
AND s.name like '%'||msname||'%' 
;    
begin
    open vcursor; 
      dbms_output.put_line('===================================================================================================================================');
        loop
            fetch vcursor into sname, qquestion, qquestiondate, tname, aanswer, aanswerdate;
            exit when vcursor%notfound; 
            dbms_output.put_line('이름' || ':  ' || sname || ' 질문내용' || ':  ' || qquestion || ' 질문날짜' || ':  ' || qquestiondate || ' 교사' || ':  ' || tname || ' 답변내용' || ':  ' || aanswer || ' 답변날짜' || ':  ' || aanswerdate);        
            
        end loop;
    close vcursor;
          dbms_output.put_line('===================================================================================================================================');

end;

begin
    --proctFindStudentQuestion(학생이름, 시작날짜, 종료날짜);
    proctFindStudentQuestion('tpdls1990',1234927,'황현우','20210908','20211205');
end;

-- 답변 작성

create or replace procedure proctAnswerStudentQuestion(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type,
    aanswer tblanswer.answer%type,
    aquestion_seq tblanswer.question_seq%type
)
is
    cursor vcursor 
is 
SELECT
    t.name
FROM tblteacher t
WHERE 1=1
AND t.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw);
begin
    open vcursor;
    INSERT INTO tblanswer (answer_seq, answer, answerdate, Teacher_Seq, question_seq)
        Values ((select max(answer_seq) + 1 from tblanswer), aanswer, sysdate, (select teacher_seq from tblteacher where pid = id and jumin = ppw), aquestion_seq);
    close vcursor;
end;

begin
    --proctAnswerStudentQuestion(답변, 질문번호);
    proctAnswerStudentQuestion('tpdls1990',1234927,'그만들으세요','100');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- C-7

create or replace procedure proctFindStudentSpec(
    msname varchar2 := ''
)
is
    sname tblstudent.name%type;
    peducation tblstudentspec.education%type;
    pcertificate tblstudentspec.certificate%type;
    cursor vcursor 
is 
SELECT 
    s.name,
    p.Education,
    p.Certificate
    
FROM tblStudentSpec p                           
    LEFT JOIN tblStudent s                          
        ON p.student_Seq = s.student_Seq       
WHERE 1=1
AND s.name like '%'||msname||'%'
;    
begin
    open vcursor; 
         dbms_output.put_line('===================================================================================================================================');
        loop
            fetch vcursor into sname, peducation, pcertificate;
            exit when vcursor%notfound;     
            dbms_output.put_line('이름' || ':  ' || sname || ' 학력' || ':  ' || peducation || ' 보유자격증' || ':  ' || pcertificate);
        end loop;
    close vcursor;
 dbms_output.put_line('===================================================================================================================================');

exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end;

begin
    --proctFindStudentSpec(학생이름);
    proctFindStudentSpec('황현우');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- C-8

create or replace procedure proctFindSalary(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type,
    mstartmonth number := '',
    mendmonth number := ''
)
is
    tname tblTeacher.name%type;
    speriod tblsalary.period%type;
    ssalary tblsalary.salary%type;
    cursor vcursor
is 
SELECT 
    t.Name,
    s.Period,
    s.Salary
    
FROM tblsalary s
LEFT JOIN tblTeacher t
ON s.Teacher_Seq = t.Teacher_Seq

WHERE 1=1
AND s.Period BETWEEN mstartmonth AND mendmonth
AND t.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
;    
begin
    open vcursor; 
  dbms_output.put_line('===================================================================================================================================');
        loop
            fetch vcursor into tname, speriod, ssalary;
            exit when vcursor%notfound;
            
      
            dbms_output.put_line('이름' || ':  ' || tname || ' 월' || ':  ' || speriod || ' 월급' || ':  ' || ssalary);
        end loop;
    close vcursor;
      dbms_output.put_line('===================================================================================================================================');

exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end;

begin
    --proctFindSalary(시작 월,종료 월);
    proctFindSalary('tpdls1990',1234927,'1','12');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- C-9

-- 코로나 대면여부 조회

create or replace procedure proctFindCovidTAttendance(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type
)
is
    cattendance tblcovidt.attendance%type;
    tname tblteacher.name%type;
    cfacetoface tblcovidt.facetoface%type;
    resultAttend1 varchar2(100);
    resultAttend2 varchar2(100);
    resultAttend3 varchar2(100);
    cursor vcursor 
is 
SELECT 
     c.attendance,
     t.name,
     c.facetoface
     
FROM tblCovidT c
    LEFT JOIN tblTeacher t
        ON c.Teacher_Seq = t.Teacher_Seq
        
WHERE 1=1
AND t.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
AND c.attendance between sysdate and sysdate+7;

begin
    dbms_output.put_line('====================================================================================');
    
  open vcursor;
    loop
      fetch vcursor into cAttendance, tname, cFacetoFace;
      exit when vcursor%notfound;
      resultAttend1 := substr(to_char(cAttendance), 1, 2);
      resultAttend2 := substr(to_char(cAttendance), 4, 2);
      resultAttend3 := substr(to_char(cAttendance), 7, 2);
      dbms_output.put_line('20' ||resultAttend1 || '년 ' || resultAttend2 || '월 ' || resultAttend3 || '일 : ' || cFacetoFace || ' 이름 : ' || tname);

    end loop;
    close vcursor;
        dbms_output.put_line('====================================================================================');

exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');        
        
end;

begin
    proctFindCovidTAttendance('tpdls1990',1234927);
end;


-- 대면여부 변경

create or replace procedure proctChangeCovidTAttendance(
    pid tblteacher.id % type,
    ppw tblteacher.jumin % type,
    pftf in tblcovidt.facetoface%type,
    pAt in tblcovidt.attendance%type
)
is 
    seq number:= 0;
begin
    select teacher_seq into seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher t where id = pid and jumin = ppw);
    if seq>0 then
        update tblcovidt set facetoface = pftf where teacher_seq = seq and attendance = pAt;
        dbms_output.put_line('완료');
    else
        dbms_output.put_line('ID 또는 패스워드가 틀립니다.');
    end if;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end;

begin
    --proctChangeCovidTAttendance(대면여부, 날짜);
    proctChangeCovidTAttendance('tpdls1990',1234927, 'Y', '21/12/09');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- C-10

create or replace procedure proctFindStudentWishJob(
    msname varchar2 := '',
    mwcity varchar2 := ''
)
is
    sname tblstudent.name%type;
    wbasicpay tblwishjob.basicpay%type;
    wcity tblwishjob.city%type;
    cursor vcursor 
is 
SELECT 
    s.name, 
    w.basicpay * 12, 
    w.city 
FROM tblWishJob w
    LEFT JOIN tblstudent s
        ON w.student_Seq = s.Student_Seq
WHERE 1=1
AND w.city like '%'||mwcity||'%'
AND s.name like '%'||msname||'%'
;    
begin
    open vcursor; 
         
        loop
            fetch vcursor into sname, wbasicpay, wcity;
            exit when vcursor%notfound;

            dbms_output.put_line('이름' || ':  ' || sname || ' 희망연봉' || ':  ' || wbasicpay || ' 희망 취업처' || ':  ' || wcity);
            
        end loop;
    close vcursor;
exception
    when others then
        dbms_output.put_line('잘못된 입력');
        dbms_output.put_line('====================================================================================');
end;

begin
    --proctFindStudentWishJob(학생이름, 희망 취업처);
    proctFindStudentWishJob('황현우','');
end;

---------------------------------------------------C-11 교육생 팀편성-------------------------------------------------------
--업무영역
--교육생 팀편성 등록
--요구사항 명
--C-13. 교육생 팀편성 
--개요
--교사가 팀 편성에 관한 업무를 볼 수 있다.
--
--상세설명
--
--- 교사는 교육생들의 팀을 편성 하고 등록 할 수 있다.
--
--
--제약사항
--
--- 교사는 등록, 수정, 삭제 가능하다.
--ID : tpdls1990
--PW : 1234927
-- 삭제

-- 5명 10번팀으로 추가

-- 1. pl/sql
-- 1. 검색
create or replace procedure proTTeamFormationSearch(
    pid  in tblteacher.id % type,
    ppw  in tblteacher.jumin % type
)
is
    name tblstudent.name%type;
    seq number;
    team number null;
    vcheck number;
    cursor vcursor is select 
                            DISTINCT(s.name),
                            su.sugang_seq,
                            team.team
                        from tbllsubject lsub inner join tblteacher t on lsub.teacher_seq = t.teacher_seq
                                                inner join tbllclass lc on lsub.lclass_seq = lc.class_seq
                                                inner join tblsugang su on su.lclass_seq = lc.class_seq
                                                inner join tblstudent s on s.student_seq = su.student_seq
                                                left outer join tblteam team on team.sugang_seq = su.sugang_seq
                            where t.teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw)
                            order by sugang_seq asc;
begin
    select teacher_seq into vcheck from tblteacher where teacher_seq = (select teacher_seq from tblteacher where pid = id and jumin = ppw);
    open vcursor;
        loop
            fetch vcursor into name , seq , team;
            exit when vcursor%notfound;
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('이름:'||name || '  수강 번호: ' || seq || '  팀: ' || team);
        end loop;
    close vcursor;
    dbms_output.put_line('=========================================================================================================================================================================================');
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;

--2 수정
create or replace procedure proTTeamFormationChange(
   pid  in tblteacher.id % type,
   ppw  in tblteacher.jumin % type,
   t    in number,
   student1 in number,
   student2 in number,
   student3 in number,
   student4 in number,
   student5 in number,
   student6 in number
)
is
    seq number:=0;
begin
    select teacher_seq into seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw);
    if seq>0 then
        UPDATE tblteam set team = t WHERE sugang_seq in(student1,student2,student3,student4,student5,student6);
        dbms_output.put_line('=========================================================================================================================================================================================');
        dbms_output.put_line('완료');
        dbms_output.put_line('=========================================================================================================================================================================================');
    end if;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;
--3 삭제
create or replace procedure proTTeamFormationRemove(
   pid  in tblteacher.id % type,
   ppw  in tblteacher.jumin % type,
   student1 in number,
   student2 in number,
   student3 in number,
   student4 in number,
   student5 in number,
   student6 in number
)
is
    seq number:=0;
begin
    
    select teacher_seq into seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw);
    if seq>0 then
        delete from tblteam where sugang_seq in(student1,student2,student3,student4,student5,student6);
        dbms_output.put_line('=========================================================================================================================================================================================');
        dbms_output.put_line('완료');
        dbms_output.put_line('=========================================================================================================================================================================================');
   end if;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;
--4 추가 
create or replace procedure proTTeamFormationAdd(
   pid  in tblteacher.id % type,
   ppw  in tblteacher.jumin % type,
   t    in number,
   student1 in number,
   student2 in number,
   student3 in number,
   student4 in number,
   student5 in number,
   student6 in number
)
is
    seq number:=0;
    vcheck1 number:=0;
    vcheck2 number:=0;
    vcheck3 number:=0;
    vcheck4 number:=0;
    vcheck5 number:=0;
    vcheck6 number:=0;
begin
    select teacher_seq into seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw);
    select count(*) into vcheck1 from tblteam where sugang_seq = student1;
    select count(*) into vcheck2 from tblteam where sugang_seq = student2;
    select count(*) into vcheck3 from tblteam where sugang_seq = student3;
    select count(*) into vcheck4 from tblteam where sugang_seq = student4;
    select count(*) into vcheck5 from tblteam where sugang_seq = student5;
    select count(*) into vcheck6 from tblteam where sugang_seq = student6;
    if seq>0 then
        if vcheck1 = 0 then
            insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),t,student1);
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student1||' 학생 추가 완료');
            dbms_output.put_line('=========================================================================================================================================================================================');
        else
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student1||' 학생 은 이미 팀이 구성되어 있습니다.');
            dbms_output.put_line('=========================================================================================================================================================================================');
        end if;
        if vcheck2 = 0 then
            insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),t,student2);
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student2||' 학생 추가 완료');
            dbms_output.put_line('=========================================================================================================================================================================================');
        else
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student2||' 학생 은 이미 팀이 구성되어 있습니다.');
            dbms_output.put_line('=========================================================================================================================================================================================');
        
        end if;
        if vcheck3 = 0 then
            insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),t,student3);
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student3||' 학생 추가 완료');
            dbms_output.put_line('=========================================================================================================================================================================================');
        else
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student3||' 학생 은 이미 팀이 구성되어 있습니다.');
            dbms_output.put_line('=========================================================================================================================================================================================');
        
        end if;
        if vcheck4 = 0 then
            insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),t,student4);
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student4||' 학생 추가 완료');
            dbms_output.put_line('=========================================================================================================================================================================================');
        else
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student4||' 학생 은 이미 팀이 구성되어 있습니다.');
            dbms_output.put_line('=========================================================================================================================================================================================');
        
        end if;
        if vcheck5 = 0 then
            insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),t,student5);
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student5||' 학생 추가 완료');
            dbms_output.put_line('=========================================================================================================================================================================================');
        else
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student5||' 학생 은 이미 팀이 구성되어 있습니다.');
            dbms_output.put_line('=========================================================================================================================================================================================');
        
        end if;
        if vcheck6 = 0 then
            insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),t,student6);
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student6||' 학생 추가 완료');
            dbms_output.put_line('=========================================================================================================================================================================================');
        else
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('sugang_seq : '||student6||' 학생 은 이미 팀이 구성되어 있습니다.');
            dbms_output.put_line('=========================================================================================================================================================================================');
        
        end if;
    end if;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;
-- 실행
begin
    proTTeamFormationSearch('tpdls1990',1234927);
end;
begin
    proTTeamFormationChange('tpdls1990',1234927, 10 ,1,2,3,4,5,6);
end;
begin
    proTTeamFormationremove('tpdls1990',1234927,1,2,3,4,5,6);
end;
begin
    proTTeamFormationAdd('tpdls1990',1234927,10,1,2,3,4,5,6);
end;
select * from tblteam;
---------------------------------------------------C-11 교육생 팀편성-------------------------------------------------------
rollback;
commit;
--------------------------------------------------C-12 상담 신청자 조회--------------------------------------------------------
--업무영역
--교사
--요구사항 명
--C-14, 상담 신청자 조회
--개요
--교육생의 상담 신청 현황을 확인한다.
--	교육생의 상담 신청 여부를 확인할 수 있다.
---	교육생의 이름, 과정명, 강의실 등을 확인할 수 있다.

--pl/Sql
--1 . 조회
create or replace procedure ProTCounselSearch(
    pid  in tblteacher.id % type,
    ppw  in tblteacher.jumin % type
)
is
    seq number;
    d date;
    name tblstudent.name%type;
    class tblclass.name%type;
    room number;
    counsel tblcounsel.purpose%type;
    cursor vcursor is select 
                            DISTINCT(con.counsel_date),
                            s.name as "이름",
                            c.name as "과정명",
                            lc.classroom_seq as "강의실",
                            con.purpose as "상담 신청 내용"
                        from tbllsubject lsub inner join tblteacher t on lsub.teacher_seq = t.teacher_seq
                                                inner join tbllclass lc on lsub.lclass_seq = lc.class_seq
                                                inner join tblsugang su on su.lclass_seq = lc.class_seq
                                                inner join tblstudent s on s.student_seq = su.student_seq
                                                inner join tblCounsel con on con.sugang_seq = su.sugang_seq
                                                inner join tblClass c on c.class_seq = lc.class_seq
                            where con.target = '선생님' and
                                  t.teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw)
                            order by con.counsel_date ; -- 현재 로그인된 교사의 개설 과정을 수강 중인 학생의 상담내역 확인
begin
    select teacher_seq into seq from tblteacher where teacher_seq = (select teacher_seq from tblteacher where id = pid and jumin = ppw);
    open vcursor;
        LOOP
            fetch vcursor into d,name,class,room,counsel;
            exit when vcursor%notfound;
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('날짜 : ' || to_char(d,'yyyy-mm-dd')||' 이름: '||name||' 과정명 : '||class||' 강의실: '||room||' 상담 신청 내용: '|| counsel );
            dbms_output.put_line('=========================================================================================================================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;
-- 실행
begin
    ProTCounselSearch('tpdls1990',1234927);
end;
--------------------------------------------------C-12 상담 신청자 조회--------------------------------------------------------
commit;
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-------------------------------------------------------D-01 계정-------------------------------------------------------------

--pl/sql
--1. 기본 정보 조회
create or replace procedure ProSAccountBasicSearch(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type
)
is  
    vcheck number;
    vname tblstudent.name%type;
    vid tblStudent.id%type;
    vssn tblstudent.ssn%type;
    vtel tblstudent.tel%type;
    vd tblstudent.attenddate%type;
    vedu tblstudentspec.EDUCATION%type;
    vcer tblstudentspec.certificate%type;
    vcity tblwishjob.city%type;
    vpay tblwishjob.basicpay%type;
    cursor vcursor is select
                            student.name as "이름",
                            student.id as "아이디",
                            student.ssn as "주민번호",
                            student.tel as "전화번호",
                            student.attenddate as "회원가입일",
                            stuspec.education as "최종 학력",
                            stuspec.certificate as "자격증",
                            wish.city as "희망 지역",
                            wish.basicpay as "희망 월급"
                        from tblstudent student inner join tblstudentspec stuSpec on student.student_seq = stuspec.student_seq
                                                inner join tblwishjob wish on wish.student_seq = student.student_seq
                            where student.student_seq = (select 
                                                            student_seq 
                                                        from tblstudent 
                                                            where id = pid and substr(ssn,7) = ppw);
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    open vcursor;
        loop
            fetch vcursor into vname,vid,vssn,vtel,vd,vedu,vcer,vcity,vpay;
            exit when vcursor%notfound;
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('이름 : '||vname||' |아이디 : '||vid||' |주민번호 : ' ||vssn||' |전화번호 : '||vtel||' |회원가입일 : '||vd
                                    || ' |최종학력 : '||vedu||' |자격증 : '||vcer|| ' |희망 지역 : '||vcity||' |희망 월급 : '||vpay);
            dbms_output.put_line('=========================================================================================================================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;

-- 현재 수강중인 과정 및 과정명 ,담당 교사 ,기간 등 확인.
create or replace procedure ProSAccountSugangSearch(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type
)
is
    vcheck number;
    vsname tblstudent.name%type;
    vclassName tblclass.name%type;
    vsubjectName tblsubject.name%type;
    vbook tblbookname.name%type;
    vsd tbllclass.startclassdate%type;
    ved tbllclass.finishclassdate%type;
    vroom tblclassroom.name % type;
    vtName tblteacher.name % type;
    cursor vcursor is select
                            student.name as "이름",
                            class.name as "과정명",
                            sub.name as "과목명",
                            book.name as "교재명",
                            lsub.start_date as "과목 시작날짜",
                            lsub.end_date as "과목 종료날짜",
                            room.name as "강의실",
                            teacher.name as "담당 선생님 이름"
                        from tblstudent student  
                            inner join  tblsugang sugang    on student.student_seq = sugang.student_seq
                            inner join tbllclass lclass     on lclass.lclass_seq = sugang.lclass_seq
                            inner join tblclass class       on class.class_seq = lclass.class_seq
                            inner join tbllsubject lsub     on lsub.lclass_seq = lclass.lclass_seq
                            inner join tblsubject sub       on sub.subject_seq = lsub.subject_seq
                            inner join tblbookname book     on book.bookname_seq = lsub.bookname_seq
                            inner join tblclassroom room    on room.classroom_seq = lclass.classroom_seq
                            inner join tblteacher teacher   on teacher.teacher_seq = lsub.teacher_seq
                                where student.student_seq = (select 
                                                            student_seq 
                                                        from tblstudent 
                                                            where id = pid and substr(ssn,7) = ppw);
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    open vcursor;
        loop
            fetch vcursor into vsname,vclassName,vsubjectName,vbook,vsd,ved,vroom,vtName;
            exit when vcursor%notfound;
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('이름 : '||vsname||' 과정명 : '||vclassName||' 과목명 :    '||vsubjectName||' 책 이름 : '||vbook );
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('시작 날짜 : '|| vsd||' 강의실 : '||vroom||' 종료 날짜 : '||ved||' 선생님 : '||vtName);
            dbms_output.put_line('=========================================================================================================================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;
                                    
-- 실행
begin
    ProSAccountBasicSearch('qrs102','2325740');
end;

begin
    ProSAccountSugangSearch('qrs102','2325740');
end;
-------------------------------------------------------D-01 계정-------------------------------------------------------------

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-----------------------------------------------------D-02 성적 조회-----------------------------------------------------------
-- 점수 출력 view 생성 쿼리 
CREATE OR REPLACE VIEW vwAttendenceScore
as
(select
    Asu.sugang_seq as sugang_seq,
    (select  --현재까지 정상 출석일
            count(distinct att.attendence_date) 
        from tblattendence att inner join tblsugang su on att.sugang_seq = su.sugang_seq  
            where att.sugang_seq = Asu.sugang_seq
                and att.absence_type = '정상')/
    (select --개강 후 총 날짜
            count(att.attendence_date) 
        from tblattendence att inner join tblsugang su on att.sugang_seq = su.sugang_seq  
            where att.sugang_seq = Asu.sugang_seq)*20 as score
from tblsugang Asu);


CREATE OR REPLACE VIEW vwScore
as
(select 
    su.sugang_seq as sugang_seq,
    s.name as subjectName,
    test.kind_of as kind_of,
    ts.score as score,
    ts.testdate as testDate,
    test.question
from tblstudent stu inner join tblsugang su on stu.student_seq = su.student_seq
                    inner join tbllclass lc on lc.lclass_seq = su.lclass_seq
                    inner join tblclass c on c.class_seq = lc.class_seq
                    inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                    inner join tblsubject s on s.subject_seq = ls.subject_seq
                    inner join tblbookname B on b.bookname_seq = ls.bookname_seq
                    inner join tblteacher T on t.teacher_seq = ls.teacher_seq
                    inner join tbltest test on test.lsubject_seq = ls.lsubject_seq
                    left outer join tbltestscore ts on ts.test_seq=test.test_seq and ts.sugang_seq = su.sugang_seq);
--업무영역
--교육생
--요구사항 명
--D-02 교육생 성적 조회
-- ID : qrs102
-- PW : 2325740

-- pl/sql
-- 1.현재 수강중인 과정명과 과목명 , 과목별 기간을 출력

create or replace procedure ProSGradeCheckclassSearch(
    pid in tblstudent.id%TYPE,
    ppw in tblstudent.ssn%type
)
is  
    vcheck NUMBER;
    vclassName tblclass.name%type;
    vsubjectName tblSubject.name%type;
    vsd tbllsubject.start_date%type;
    ved tbllsubject.end_date%type;
    vroom tblclassroom.name%type;
    cursor vcursor is select 
                        c.name as "과정명",
                        s.name as "과목명",
                        ls.start_date as "과목 시작 날짜",
                        ls.end_date as "과목 종료 날짜",
                        room.name as "강의실"
                    from tblstudent stu inner join tblsugang su on stu.student_seq = su.student_seq
                                        inner join tbllclass lc on lc.lclass_seq = su.lclass_seq
                                        inner join tblclass c on c.class_seq = lc.class_seq
                                        inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                                        inner join tblsubject s on s.subject_seq = ls.subject_seq
                                        inner join tblclassroom room on room.classroom_seq = lc.classroom_seq
                        where stu.student_seq = (select student_seq from tblstudent where id = pid and substr(ssn,7) = ppw);
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    open vcursor;
        loop
            fetch vcursor into vclassName ,vsubjectName ,vsd ,ved, vroom;
            exit when vcursor%notfound;
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('과정명 : '||vclassName||'    과목명 : '||vsubjectName||'    시작 날짜 : '||vsd||' 종료 날짜 : '||ved||' 강의실 : '||vroom);
            dbms_output.put_line('=========================================================================================================================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');    
end;


-- 2.전체 or 과목 선택시 시험 정보 조회
create or replace procedure ProSGradeCheckclassSelSearch(
    pid in tblstudent.id%TYPE,
    ppw in tblstudent.ssn%type,
    pclassName in tblclass.name%type
)
is    
    studentName tblstudent.name%type;
    className tblclass.name%type;
    subjectName tblsubject.name%type;
    startDate tbllsubject.start_date%type;
    endDate tbllsubject.end_date%type;
    bookName tblbookName.name%type;
    teacherName tblteacher.name%type;
    pQuestion tbltest.question%type;
    pTestDate tbltestscore.testdate%type;
    pTestScore tbltestscore.score%type;
    sQuestion tbltest.question%type;
    sTestDate tbltestscore.testdate%type;
    stestScore tbltestscore.score%type;
    attend number;
    cursor vcursor is select 
                        stu.name as 학생명,
                        c.name as "과정명",
                        s.name as "과목명",
                        ls.start_date as "과목 시작 날짜",
                        ls.end_date as "과목 종료 날짜",
                        b.name as "책 이름",
                        t.name as "선생님 이름",
                        (select question from vwscore where sugang_seq = su.sugang_seq and kind_of = '필기' and subjectName = s.name) as "필기 문제",
                        (select testdate from vwscore where sugang_seq = su.sugang_seq and kind_of = '필기' and subjectName = s.name) as "필기 시험 날짜",
                        CASE WHEN (select score from vwscore where sugang_seq = su.sugang_seq and kind_of = '필기' and subjectName = s.name) <> 0 THEN (select score from vwscore where sugang_seq = su.sugang_seq and kind_of = '필기' and subjectName = s.name) 
                             ELSE 0 END as "필기점수",
                        (select question from vwscore where sugang_seq = su.sugang_seq and kind_of = '실기' and subjectName = s.name) as "실기 문제",
                        (select testdate from vwscore where sugang_seq = su.sugang_seq and kind_of = '실기' and subjectName = s.name) as "실기 시험 날짜",
                        CASE WHEN (select score from vwscore where sugang_seq = su.sugang_seq and kind_of = '실기' and subjectName = s.name) <> 0 THEN (select score from vwscore where sugang_seq = su.sugang_seq and kind_of = '실기' and subjectName = s.name)
                             ELSE 0 END as "실기점수",
                        (select score from vwattendencescore where sugang_seq = su.sugang_seq) as "출석"
                    from tblstudent stu inner join tblsugang su on stu.student_seq = su.student_seq
                                        inner join tbllclass lc on lc.lclass_seq = su.lclass_seq
                                        inner join tblclass c on c.class_seq = lc.class_seq
                                        inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                                        inner join tblsubject s on s.subject_seq = ls.subject_seq
                                        inner join tblbookname B on b.bookname_seq = ls.bookname_seq
                                        inner join tblteacher T on t.teacher_seq = ls.teacher_seq
                        where su.sugang_seq  = (select student_seq from tblstudent where id = pid and substr(ssn,7) = ppw) and s.name like '%'||pclassName;
begin
    open vcursor;
        loop
            fetch vcursor into studentName, className ,subjectName ,startDate ,endDate ,bookName ,teacherName ,pQuestion ,pTestDate ,pTestScore ,sQuestion ,sTestDate ,stestScore ,attend;
            exit when vcursor%notfound;
                dbms_output.put_line('=========================================================================================================================================================================================');
                dbms_output.put_line('이름 : '||studentName||' 과정명 : '||className ||' 과목명 : '||subjectName ||' 과목 시작 날짜 : '||startDate ||' 과목 종료 날짜 : '||endDate 
                );
                dbms_output.put_line('=========================================================================================================================================================================================');
                dbms_output.put_line('      교재 이름 : '||bookName ||' 교사 이름 : '||teacherName );
                dbms_output.put_line('=========================================================================================================================================================================================');
                dbms_output.put_line('      필기 문제 : '||pQuestion ||' 필기 시험 날짜 : '||pTestDate ||' 필기 점수 : '||pTestScore ||' 점');
                dbms_output.put_line('=========================================================================================================================================================================================');
                dbms_output.put_line('      실기 문제 : '||sQuestion ||' 실기 시험 날짜 : '||sTestDate ||' 실기 점수 : '||stestScore ||' 점');
                dbms_output.put_line('=========================================================================================================================================================================================');
                dbms_output.put_line('      현재 출석 점수 : '||attend);
                dbms_output.put_line('=========================================================================================================================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');  
end;
           
-- 실행
begin
    ProSGradeCheckclassSearch('qrs102','2325740');
end;
begin
    ProSGradeCheckclassSelSearch('qrs102','2325740','');
end;
-----------------------------------------------------D-02 성적 조회-----------------------------------------------------------
commit;
rollback;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
-------------------------------------------------------D-03 출결-------------------------------------------------------------
-- ID : qrs102
-- PW : 2325740

-- 1. 본인 출결 전체 및 날짜별 조회
create or replace procedure ProSAttendSelSearch(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type,
    psel in varchar2
)
is  
    vcheck NUMBER;
    studentName tblstudent.name%type;
    attendDate tblattendence.attendence_date%type;
    absenceType tblattendence.absence_type%type;
    vGoToWork varchar2(6);
    vOffWork varchar2(6);
    cursor vcursor is select 
                            stu.name,
                            at.attendence_date,
                            at.absence_type,
                            to_char(at.gotowork , 'HH24:mi') as gotowork,
                            to_char(at.offwork , 'HH24:mi') as offwork
                        from tblstudent stu inner join tblsugang su on stu.student_seq =su.student_seq
                                            inner join tblattendence at on at.sugang_seq = su.sugang_seq
                            where   to_char(at.attendence_date ,'yyyy-mm-dd')like (psel||'%') and
                                    stu.student_seq = (select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw); -- 로그인 후 학생 번호를 돌려주는 쿼리
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    open vcursor;
        LOOP
            fetch vcursor into studentName ,attendDate  ,absenceType ,vGoToWork ,vOffWork;
            exit when vcursor%notfound;
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line(' 이름 : '||studentName||' | 출석 '||attendDate||' | 출결 종류 : '||absenceType||' | 입실 시간 : '||vGoToWork||' | 퇴실 시간 : '||vOffWork);
            dbms_output.put_line('=========================================================================================================================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');  
end;

-- 3. 출결 입력
-------1. 출근
create or replace procedure ProSGoTowork(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type
)
is
    vcheck number:=0;
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    if vcheck <> 0 then
        insert into tblAttendence(Attendence_Seq, absence_type, Attendence_Date, Sugang_Seq , GoTowork)
        select 
            (select * from (select attendence_seq from tblAttendence order by attendence_seq desc) where rownum =1)+1,
            case
                when to_char(sysdate , 'HH24:MM')> '09:00' then '지각'
                when to_char(sysdate , 'HH24:MM')< '09:00' then '기타'
            end,
            to_char(sysdate , 'yyyy-mm-dd'),
            su.sugang_seq,
            sysdate
        from tblsugang su
            where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw) ;
        dbms_output.put_line('=========================================================================================================================================================================================');
        dbms_output.put_line('출근완료');
        dbms_output.put_line('=========================================================================================================================================================================================');
    end if;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');  
end;

-------2. 퇴근
create or replace procedure ProSOffWork(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type
)
is
    vcheck number:=0;
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    if vcheck <> 0 then
        update tblAttendence set offwork = sysdate, 
                         absence_type = ( select 
                                                case
                                                    when  ABSENCE_TYPE = '지각' then '지각'
                                                    when  to_char(sysdate , 'HH24:MM')< '18:00' then '조퇴'
                                                    when  to_char(sysdate , 'HH24:MM')> '18:00' then '정상'
                                                end
                                            from tblAttendence 
                                                where ATTENDENCE_SEQ = (select 
                                                                            * 
                                                                        from (select 
                                                                                ATTENDENCE_SEQ 
                                                                              from tblsugang s inner join tblAttendence a on s.sugang_seq = a.sugang_seq 
                                                                              where student_seq  = ( select 
                                                                                                        stu.student_seq 
                                                                                                     from tblstudent stu 
                                                                                                        where stu.id = pid and substr(stu.ssn,7) = ppw) 
                                                                              order by attendence_seq desc) 
                                                                        where rownum =1)) -- 수정해야될 행의 출근시간 참조
                                                where ATTENDENCE_SEQ = (select 
                                                                            * 
                                                                        from (select 
                                                                                ATTENDENCE_SEQ 
                                                                              from tblsugang s inner join tblAttendence a on s.sugang_seq = a.sugang_seq 
                                                                              where student_seq  = ( select 
                                                                                                        stu.student_seq 
                                                                                                     from tblstudent stu 
                                                                                                        where stu.id = pid and substr(stu.ssn,7) = ppw) 
                                                                              order by attendence_seq desc) 
                                                                       where rownum =1); -- 로그인 한 학생이 마지막에 남김 정보
        dbms_output.put_line('=========================================================================================================================================================================================');
        dbms_output.put_line('퇴근완료');
        dbms_output.put_line('=========================================================================================================================================================================================');
    end if;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;


-- 실행                                                                     
begin
    ProSAttendSelSearch('qrs102','2325740','2021-12');
end;
begin
    ProSGoTowork('qrs102','2325740');
end;
begin
    ProSOffWork('qrs102','2325740');
end;
-----------------------------------------------------D-03 출결-------------------------------------------------------------
commit;
rollback;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
---------------------------------------------------D-04 Q&A 작성------------------------------------------------------
-- ID : qrs102
-- PW : 2325740
-- 1. 작성

create or replace PROCEDURE ProSQuesrionadd(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type,
    pQuestion in tblquestion.question%type
)
is
    vcheck number:=0;
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    if vcheck <> 0 then
            insert into tblquestion (question_seq,question,sugang_seq) 
            select
            (select question_SEQ from (select question_SEQ from tblquestion order by question_seq desc) where rownum =1)+1,
            pQuestion,
            su.sugang_seq
            from tblsugang su
            where sugang_seq = (select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
        dbms_output.put_line('=========================================================================================================================================================================================');
        dbms_output.put_line('완료');
        dbms_output.put_line('=========================================================================================================================================================================================');
    end if;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;

-- 2. 조회
create or replace procedure ProSQuestionSearch(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type
)
is
    vcheck NUMBER;
    vQDate tblquestion.questiondate%type;
    vquestion tblquestion.question%type;
    vADate varchar2(10)null;
    vAnswer tblanswer.answer%type;
    cursor vcursor is select 
                            q.questiondate as "질문 날짜",
                            q.question as "질문",
                            case
                                when a.answerdate is null then 'null'
                                when a.answerdate is not null then to_char(a.answerdate,'yyyy-mm-dd')
                            end as "답변 날짜",
                            case
                                when a.answerdate is null then '답변이 등록되지 않은 질문 입니다.'
                                else a.answer 
                            end as "답변"
                        from tblSugang sugang inner join tblquestion Q on sugang.sugang_seq = q.sugang_seq
                                              left outer join tblanswer A on q.question_seq = A.question_seq
                            where sugang.student_seq = (select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw); -- 로그인 후 학생 번호를 돌려주는 쿼리
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    open vcursor;
        loop
            fetch vcursor into vQDate ,vquestion, vADate ,vAnswer;
            exit when vcursor%notfound;
            dbms_output.put_line('=========================================================================================================================================================================================');
            dbms_output.put_line('질문 날짜 : '||vQDate||' | 질문 : '||vquestion||' | 답변 날짜 : '||vADate||' | 답변 : '||vAnswer);
            dbms_output.put_line('=========================================================================================================================================================================================');
        end loop;
    close vcursor;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;

    
    
    
-- 실행                                                                     
begin
    ProSQuesrionadd('qrs102','2325740','프로시저 질문 가능한지 테스트');
end;
begin
    ProSQuestionSearch('qrs102','2325740');
end;
---------------------------------------------------D-04 Q&A 작성------------------------------------------------------
rollback;
commit;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
---------------------------------------------------D-05 상담 신청-------------------------------------------------------
--업무영역
--교육생
--요구사항 명
--D-05 상담 신청
--개요
--교육생이 관리자 또는 선생님에게 상담을 신청할 수 있다.
--
--상세설명
---	교육생이 관리자 또는 선생님에게 상담을 신청할 수 있다.
---	상담신청이 수락 되었을 경우 관리자 또는 선생님과 상담을 할 수 있다.
--    제약사항
-- 1. 관리자 & 선생님 상담신청

create or replace PROCEDURE ProSCounselAdd(
    pid in tblstudent.id%type,
    ppw in tblstudent.ssn%type,
    PTARGET in tblCounsel.TARGET%type,
    PPURPOSE in tblCounsel.PURPOSE%type
)
is
    vcheck number:=0;
begin
    select 1 into vcheck  from tblsugang su where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
    if vcheck <> 0 then
        insert into tblCounsel
        select 
            (select counsel_seq from(select * from tblCounsel order by counsel_seq desc) where rownum = 1)+1,
            PTARGET,
            PPURPOSE,
            sysdate,
            su.sugang_seq ,
            t.teacher_seq,
            m.manager_seq
        from tblsugang su inner join tbllclass lc on su.lclass_seq = lc.lclass_seq
                          inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                          inner join tblteacher t on t.teacher_seq = ls.teacher_seq
                          inner join tblstudent stu on stu.student_seq = su.student_seq
                          inner join tblmanager m on m.manager_seq = stu.manager_seq
            where rownum =1 and su.student_seq = (select stu.student_seq from tblstudent stu where stu.id = pid and substr(stu.ssn,7) = ppw);
        dbms_output.put_line('=========================================================================================================================================================================================');
        dbms_output.put_line('완료');
        dbms_output.put_line('=========================================================================================================================================================================================');
    end if;
exception
    when others then
    dbms_output.put_line('              권한이 없습니다. 로그인 정보를 다시 확인하세요');
    dbms_output.put_line('');
    dbms_output.put_line('          ================================================');
end;
-- 실행 
begin
    ProSCounselAdd('qrs102','2325740','선생님','프로시저 테스트 중 입니다.');
end;
-- 확인용
select * from tblCounsel where sugang_seq =6 and teacher_seq =11 and target = '선생님';
select * from tblCounsel where sugang_seq =6 and manager_seq =1 and target = '관리자';
--------------------------------------------------D-05 상담 신청-------------------------------------------------------
rollback;
commit;


--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--D06
-- 교사 평가 조회 (프로시저 생성)
delete from tblassessment where assessment_Seq = 9;

create or replace procedure procSTeacherAssessMentCheck(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type
)
is
    pContents tblassessment.contents%type;
    pregdate tblassessment.regdate%type;
    resultContents varchar2(500);
    resultDate varchar2(100);
    seq number := 0;
    cursor vcursor is select
                        a.contents,
                        a.regdate
from tblsugang s
    inner join tblassessment a on a.sugang_seq = s.sugang_seq
            where a.teacher_seq = (select distinct teacher_seq from tblassessment a inner join tblsugang s on a.sugang_seq = s.sugang_seq
                                                 where s.sugang_seq = 
                                                    (select sugang_seq from tblsugang 
                                                            where student_seq =
                                                                    (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw)and rownum<=1)and rownum<=1)and rownum<=1 
                        and
                         a.regdate > (select student.attenddate from tblsugang sugang
                                                inner join tblstudent student on sugang.student_seq = student.student_seq
                                                         where sugang.sugang_seq = 
                                                            (select sugang_seq from tblsugang
                                                                where student_seq = 
                                                                    (select sugang_seq from tblsugang
                                                                        where student_seq = 
                                                                            (select student_seq from tblstudent stu
                                                                                where id = pId and substr(stu.ssn,7) = pPw))));
begin
    dbms_output.put_line('==================================교사 평가===========================================');
  open vcursor;
    loop
      fetch vcursor into pContents, pregdate;
      exit when vcursor%notfound;
      dbms_output.put_line('평가내용: '||pContents||'  날짜: '||pregdate);
      
      dbms_output.put_line('====================================================================================');
    end loop;
    close vcursor;
end;

-- 교사 평가 조회 (프로시저 사용)
begin
    procSTeacherAssessMentCheck('abc007', '1115158');
end;


-- 교사 평가 작성
create or replace procedure procSTeacherAssessMentWrite(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type,
    pInput in tblassessment.contents%type
)
is 
    seq number:= 0;
begin
    select sugang_seq into seq from tblsugang where student_seq = (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw);
    if seq>0 then
        insert into tblassessment values((select max(assessment_seq)+1 from tblassessment),
        pInput,
        sysdate,
        seq,
        (select distinct teacher_seq from tblassessment a inner join tblsugang s on a.sugang_seq = s.sugang_seq 
                where s.sugang_seq =
                    (select sugang_seq from tblsugang 
                        where student_seq = 
                             (select student_seq from tblstudent stu
                                where id = pId and substr(stu.ssn,7) = pPw))));
        dbms_output.put_line('교사 평가 작성이 완료되었습니다.');
    else
        dbms_output.put_line('ID 또는 PW 워드가  틀립니다.');
    end if;
end;


begin
    procSTeacherAssessMentWrite('abc007', '1115158', '호호호'); -- 아이디, 비밀번호, 평가내용
end;



commit;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- 적용 필요사항
delete from tblcovids where covids_seq = 455;
delete from tblcovids where covids_seq = 457;

insert into tblcovids values (455, '21/12/08', 'N', 1);
insert into tblcovids values (456, '21/12/09','N', 1);
insert into tblcovids values (457, '21/12/10','N', 1);
insert into tblcovids values (458, '21/12/13','N', 1);

-- 코로나 대면, 비대면 조회(프로시저 생성)
create or replace procedure procScovidIsFacetoFaceCheck(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type
)
is
    pAttendance tblcovids.attendance%type;
    pFacetoFace tblcovids.facetoface%type;
    resultAttend1 varchar2(100);
    resultAttend2 varchar2(100);
    resultAttend3 varchar2(100);
    cursor vcursor is select
                        attendance,
                        facetoface
                    from tblcovids 
                    where sugang_seq = (select sugang_seq from tblsugang where student_seq = (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw))
                                        and attendance between sysdate and sysdate+7;
begin
    
  open vcursor;
  dbms_output.put_line('====================================================================================');
    loop
      fetch vcursor into pAttendance, pFacetoFace;
      exit when vcursor%notfound;
      resultAttend1 := substr(to_char(pAttendance), 1, 2);
      resultAttend2 := substr(to_char(pAttendance), 4, 2);
      resultAttend3 := substr(to_char(pAttendance), 7, 2);
      dbms_output.put_line('                          20' ||resultAttend1 || '년 ' || resultAttend2 || '월 ' || resultAttend3 || '일 : ' || pFacetoFace);
    end loop;
    dbms_output.put_line('====================================================================================');
    close vcursor;
        
            exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('ID, PASSWORD 오류입니다.');
        dbms_output.put_line('====================================================================================');
end;


-- 코로나 대면, 비대면 조회(프로시저 사용)
set serverout on;
begin
    procScovidIsFacetoFaceCheck('abc007', '1115158');
end;


-- 코로나 대면 비대면 변경(프로시저 생성)
create or replace procedure procScovidIsFacetoFaceChange(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type,
    pftf in tblcovids.facetoface%type,
    pAt in tblcovids.attendance%type
)
is 
    seq number:= 0;
begin
    select sugang_seq into seq from tblsugang where student_seq = (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw);
    dbms_output.put_line('====================================================================================');
    if seq>0 then
        update tblcovids set facetoface = pftf where sugang_seq = seq and attendance = pAt;
        dbms_output.put_line('20'||
        substr(pAT, 1, 2) ||
        '년 ' ||
        substr(pAT, 4, 2) ||
        '월 ' ||
        substr(pAT, 7, 2) ||
        '일의 대면 여부가 "' ||
        pftf ||
        '" 로 변경 되었습니다.');
    
    end if;
    dbms_output.put_line('====================================================================================');
    exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('ID, PASSWORD 오류입니다.');
        dbms_output.put_line('====================================================================================');
end;
    

-- 코로나 대면 비대면 변경(프로시저 사용)
begin
    procScovidIsFacetoFaceChange('abc007', '1115158', 'Y', '21/12/09');
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

create or replace procedure procSsubsidy(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type,
    pPeriod in tbledu_subsidy.period%type
)is 
    pname tblstudent.name%type;
    pPrice number(10);
    pRePeriod number(10);
cursor vcursor is select 
    st.name, -- 이름
    es.period, -- 단위기간
    es.edu_subsidy_date*18000 -- 교육 지원금
        from tblEdu_Subsidy es
    inner join tblsugang su on es.sugang_seq = su.sugang_seq
    inner join tblstudent st on su.student_seq = st.student_seq
    where su.sugang_seq = (select sugang_seq from tblsugang where student_seq = 
    (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw)) and
          es.period = pPeriod;
begin
    dbms_output.put_line('====================================================================================');
    
  open vcursor;
    loop
    fetch vcursor into pname, pRePeriod, pRePeriod;
    exit when vcursor%notfound;
    
    dbms_output.put_line('                   '||'이름: '||pname||'/'||'단위기간: '|| pPeriod || '차' || '/' || '교육지원금: ' || pRePeriod || '원');
    end loop;
    close vcursor;
    
    dbms_output.put_line('====================================================================================');
        exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('ID, PASSWORD 오류입니다.');
        dbms_output.put_line('====================================================================================');
    
end;

begin
    procSsubsidy('abc007', '1115158', 1);
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

create or replace procedure procSRankOfClass(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type
) is
    prank varchar2(100);
cursor vcursor is select
    rownum||'등' as 등수
        from (select * from (select
            a.sugang_seq,
            floor(sum(b.score) / 4 * 0.8 / count(distinct c.attendence_date))  
            + (select (select count(distinct attendence_date) from tblattendence where sugang_seq = (select sugang_seq from tblsugang where student_seq = 
                (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw)) and absence_type = '정상')/
                (select count(attendence_date) from tblattendence where sugang_seq = (select sugang_seq from tblsugang where student_seq = 
                (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw))) * 20 from dual) as lastScore
                        from tblsugang a
                            inner join tbltestscore b on a.sugang_seq = b.sugang_seq
                            inner join tblattendence c on a.sugang_seq = c.sugang_seq
                                group by a.sugang_seq
                                   having a.sugang_seq between 1 and 6)
                                   order by lastScore)
                                        where sugang_seq = (select sugang_seq from tblsugang where student_seq = 
                                            (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw));
                                
begin
    dbms_output.put_line('====================================================================================');
    
  open vcursor;
    loop
    fetch vcursor into prank;
    exit when vcursor%notfound;
    dbms_output.put_line('                    당신의 등수는 "' ||prank|| '" 입니다.');
    end loop;
    close vcursor;
    
    dbms_output.put_line('====================================================================================');
    exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('ID, PASSWORD 오류입니다.');
        dbms_output.put_line('====================================================================================');
end;


begin
    procSRankOfClass('abc007', '1115158');
end;

create or replace view viewRank as
select rownum||'등' as 등수
from (select * from (select
    a.sugang_seq,
    floor(sum(b.score) / 4 * 0.8 / count(distinct c.attendence_date))  
    + (select (select count(distinct attendence_date) from tblattendence where sugang_seq = 1 and absence_type = '정상')/
        (select count(attendence_date) from tblattendence where sugang_seq = 1) * 20 from dual) as lastScore
                from tblsugang a
                    inner join tbltestscore b on a.sugang_seq = b.sugang_seq
                    inner join tblattendence c on a.sugang_seq = c.sugang_seq
                        group by a.sugang_seq
                           having a.sugang_seq between 1 and 6)
                           order by lastScore)
                                where sugang_seq = 1;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

create or replace procedure procSSerchProject
is
    cursor vcursor is select * from tblproboard;
    vrow tblproboard%rowtype;
begin
    dbms_output.put_line('====================================================================================================================================================');
    open vcursor;
    loop
        fetch vcursor into vrow;
        exit when vcursor%notfound;
        dbms_output.put_line('프로젝트 명: ' || vrow.project_name ||
        '   내용: ' ||vrow.content ||
        '   프로젝트 마감 기한: ' ||vrow.period ||
        '   인원 수: ' || vrow.limit ||
        '   이메일: ' || vrow.email );
        dbms_output.put_line('====================================================================================================================================================');
    end loop;
    close vcursor;
        exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('잘못된 접근으로 발생한 오류입니다.');
        dbms_output.put_line('====================================================================================');
end;

begin
    procSSerchProject;
end;

-- 프로젝트 등록
create or replace procedure procProjectWrite(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type,
    pProjectName in tblproboard.project_name%type,
    pContent in tblproboard.content%type,
    pPeriod in tblproboard.period % type,
    pLimit in tblproboard.limit%type,
    pEmail in tblproboard.Email%type
)
is seq number := 0;
begin
    select sugang_seq into seq from tblsugang where student_seq = (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw);
    dbms_output.put_line('====================================================================================');
    
    if seq>0 then
        insert into tblproboard values (
        (select max(proboard_seq+1) from tblproboard),
        pProjectName,
        pContent,
        pPeriod,
        pLimit,
        pEmail,
        seq);
        
        dbms_output.put_line('                           프로젝트 등록이 완료되었습니다.');
        
        dbms_output.put_line('====================================================================================');
    
    end if;
        exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('ID, PASSWORD 오류입니다.');
        dbms_output.put_line('====================================================================================');
end;

select * from tblproboard;

begin
procProjectWrite('abc007',
'1115158',
'자바의 왕', -- 프로젝트 명
'값진 시간ㄹㄹㄹㄹ이 될겁니다.', -- 프로젝트 내용
'22/05/01', -- 프로젝트 종료일자
5, -- 인원수
'lh0156@nave.com'); -- 이메일
end;

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- 기수보드 조회(프로시저 등록)
create or replace procedure procSGisuBoardSerch (
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type
)
is
    pTitle varchar2(200);
    pDate varchar2(200);
cursor vcursor is select
                    title,
                    gisuboard_date 
    from tblgisuboard
    where sugang_seq between (select min(sugang_seq) from tblsugang
    where lclass_seq = (select lclass_seq from tblsugang
    where sugang_seq = (select student_seq from tblstudent stu
        where id = pId and substr(stu.ssn,7) = pPw ))) and
                            (select max(sugang_seq) from tblsugang
    where lclass_seq = (select lclass_seq from tblsugang
    where sugang_seq = (select student_seq from tblstudent stu
        where id = pId and substr(stu.ssn,7) = pPw)));
    
begin
dbms_output.put_line('====================================================================================================================================================');
    open vcursor;
    loop
    fetch vcursor into pTitle, pDate;
    dbms_output.put_line('게시글 명: ' || pTitle ||
        '   게시일자: ' || pDate);
        dbms_output.put_line('====================================================================================================================================================');
    exit when vcursor%notfound;
    
    end loop;
    close vcursor;
    
    exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('ID, PASSWORD 오류입니다.');
        dbms_output.put_line('====================================================================================');
    
end;

-- 기수보드 조회(프로시저 사용)
begin
    procSGisuBoardSerch('abc007', '1115158');
end;

create or replace procedure procGisuBoardWrite(
    pId in tblstudent.id%type,
    pPw in tblstudent.ssn%type,
    pTitle in tblgisuboard.title%type
)
    is
    seq number := 0;
begin
    dbms_output.put_line('====================================================================================');
    select sugang_seq into seq from tblsugang where student_seq = (select student_seq from tblstudent stu where id = pId and substr(stu.ssn,7) = pPw);
    if seq>0 then
        
        insert into tblgisuboard values ((select max(gisuboard_seq+1) from tblgisuboard),
        pTitle,
        sysdate,
        seq);
        dbms_output.put_line('                        게시글 작성이 완료되었습니다.');
        dbms_output.put_line('====================================================================================');
    else
        dbms_output.put_line('ID 또는 패스워드가 틀립니다.');
        
        dbms_output.put_line('====================================================================================');
    end if;
        exception
    when others then
        dbms_output.put_line('====================================================================================');
        dbms_output.put_line('ID, PASSWORD 오류입니다.');
        dbms_output.put_line('====================================================================================');
end;
    
begin
    procGisuBoardWrite('abc007', '1115158', '테스트 1234');
end;

select * from tblgisuboard;

commit;