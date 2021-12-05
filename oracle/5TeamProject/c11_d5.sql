--c11 ~ d5

commit;
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
--1  
select 
    DISTINCT(s.name),
    su.sugang_seq,
    team.team
from tbllsubject lsub inner join tblteacher t on lsub.teacher_seq = t.teacher_seq
                        inner join tbllclass lc on lsub.lclass_seq = lc.class_seq
                        inner join tblsugang su on su.lclass_seq = lc.class_seq
                        inner join tblstudent s on s.student_seq = su.student_seq
                        left outer join tblteam team on team.sugang_seq = su.sugang_seq
    where t.teacher_seq = (select teacher_seq from tblteacher where id = 'tpdls1990' and jumin = '1234927'); -- 현재 로그인된 교사의 개설 과정을 수강 중인 학생중 팀 구성이 완료된 학생정보
--1 번에 존재하지만 2 번에 존재하지 않으면 팀 편성이 안된 학생임. 번호를 참고해서 팀편성
-- 수정    
UPDATE tblteam set team = 10 WHERE sugang_seq in(3,4,5,6,1,2);
-- 삭제
delete from tblteam where sugang_seq in(3,4,5,6,1,2);
-- 5명 10번팀으로 추가
insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),10,1);
insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),10,2);
insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),10,3);
insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),10,4);
insert into tblTeam VALUES ((select team_seq+1 from(select team_seq from tblteam order by team_seq desc) where rownum = 1),10,5);
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
select 
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
          t.teacher_seq = (select teacher_seq from tblteacher where id = 'tpdls1990' and jumin = '1234927')
    order by con.counsel_date ; -- 현재 로그인된 교사의 개설 과정을 수강 중인 학생의 상담내역 확인
--------------------------------------------------C-12 상담 신청자 조회--------------------------------------------------------
commit;
-------------------------------------------------------D-01 계정-------------------------------------------------------------
--업무영역
--교육생
--요구사항 명
--D-01 교육생 계정
--개요
--교육생 계정
--
--상세설명
---	교육생은 시스템의 일부 기능을 로그인 과정을 거친후에 사용할 수 있다.
---	교육생은 성적 조회 기능을 이용할 수 있다.
--
--
--     제약사항
---	사전에 관리자에 의해 데이터베이스에 등록된 것으로 간주한다.
-- ID : qrs102
-- PW : 2325740
--1. 기본 정보 조회
select 
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
                                    where id = 'qrs102' and substr(ssn,7) = '2325740');
-- 현재 수강중인 과정 및 과정명 ,담당 교사 ,기간 등 확인.
select
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
                                    where id = 'qrs102' and substr(ssn,7) = '2325740');
-------------------------------------------------------D-01 계정-------------------------------------------------------------
commit;

-----------------------------------------------------D-02 성적 조회-----------------------------------------------------------
--업무영역
--교육생
--요구사항 명
--D-02 교육생 성적 조회
--개요
--교육생의 성적을 조회할 수 있다.
--
--상세설명
---	교육생이 로그인 한 후 과정명, 과정기간 (시작 연월일 ~ 끝 연월일), 강의실이 출력된다.
---	과정을 클릭하면 교육생의 성적을 확인할 수 있다.
--
--     제약사항
---	교육생은 한 개의 과정만을 등록해서 수강한다.
---	한 개의 과정 내에는 여러개의 과목을 수강한다. (과정 기간이 끝나지 않은 교육생 또는 중도탈락 처리된 교육생의 경우 일부 과목만 수강했다고 가정한다.)
---	과목번호, 과목명, 과목기간 (시작 연월일 ~ 끝 연월일), 교재명, 교사명, 과목별 배점정보(출결, 필기, 실기 배점), 과목별 성적 정보(출결, 필기, 실기 점수), 과목별 시험날짜, 시험문제가 출력되어야 한다.
---	//성적 정보는 과목별 목록 형태로 출력한다.
---	성적이 등록되지 않은 과목이 있는 경우 과목 정보는 출력되고 점수는 null 값으로 출력되도록 한다.
-- ID : qrs102
-- PW : 2325740

-- 1.현재 수강중인 과정명과 과목명 , 과목별 기간을 출력
select 
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
    where stu.student_seq = (select student_seq from tblstudent where id = 'qrs102' and substr(ssn,7) = '2325740');

-- 2.전체 시험 정보 조회
select
    stu.name as "이름",
    c.name as "과정명",
    s.name as "과목명",
    ls.start_date as "과목 시작 날짜",
    ls.end_date as "과목 종료 날짜",
    b.name as "책 이름",
    t.name as "선생님 이름",
    test.kind_of as "시험 종류",
    ts.score  as "점수",
    (select (select count(distinct attendence_date) from tblattendence where sugang_seq = su.sugang_seq and absence_type = '정상')/
    (select count(attendence_date) from tblattendence where sugang_seq = su.sugang_seq) * 20
    from dual)as "출석 점수",
    ts.testdate as "시험 날짜",
    test.question as "시험 문제"
from tblstudent stu inner join tblsugang su on stu.student_seq = su.student_seq
                    inner join tbllclass lc on lc.lclass_seq = su.lclass_seq
                    inner join tblclass c on c.class_seq = lc.class_seq
                    inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                    inner join tblsubject s on s.subject_seq = ls.subject_seq
                    inner join tblbookname B on b.bookname_seq = ls.bookname_seq
                    inner join tblteacher T on t.teacher_seq = ls.teacher_seq
                    inner join tbltest test on test.lsubject_seq = ls.lsubject_seq
                    left outer join tbltestscore ts on ts.test_seq=test.test_seq and ts.sugang_seq = su.sugang_seq
    where su.sugang_seq = (select student_seq from tblstudent where id = 'qrs102' and substr(ssn,7) = '2325740');
    
-- 3.과목 선택 후 점수 조회시
select
    stu.name as "이름",
    c.name as "과정명",
    s.name as "과목명",
    ls.start_date as "과목 시작 날짜",
    ls.end_date as "과목 종료 날짜",
    b.name as "책 이름",
    t.name as "선생님 이름",
    test.kind_of as "시험 종류",
    ts.score  as "점수",
    (select (select count(distinct attendence_date) from tblattendence where sugang_seq = su.sugang_seq and absence_type = '정상')/
    (select count(attendence_date) from tblattendence where sugang_seq = su.sugang_seq) * 20
    from dual)as "출석 점수",
    ts.testdate as "시험 날짜",
    test.question as "시험 문제"
from tblstudent stu inner join tblsugang su on stu.student_seq = su.student_seq
                    inner join tbllclass lc on lc.lclass_seq = su.lclass_seq
                    inner join tblclass c on c.class_seq = lc.class_seq
                    inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                    inner join tblsubject s on s.subject_seq = ls.subject_seq
                    inner join tblbookname B on b.bookname_seq = ls.bookname_seq
                    inner join tblteacher T on t.teacher_seq = ls.teacher_seq
                    inner join tbltest test on test.lsubject_seq = ls.lsubject_seq
                    left outer join tbltestscore ts on ts.test_seq=test.test_seq and ts.sugang_seq = su.sugang_seq
    where su.sugang_seq = (select student_seq from tblstudent where id = 'qrs102' and substr(ssn,7) = '2325740')
           and s.name = '자바';

-----------------------------------------------------D-02 성적 조회-----------------------------------------------------------
commit;
-------------------------------------------------------D-03 출결-------------------------------------------------------------
--업무영역
--교육생
--요구사항 명
--D-03 교육생 출결 관리
--개요
--교육생이 본인의 출결을 관리할 수있다.
--상세설명
--매일 근태 관리를 기록할 수 있어야 한다.
---본인의 출결 현황을 기간별(전체,월,일) 조회할 수 있어야 한다.
--
--제약사항
--	-	다른 교육생의 현황은 조회할 수 없다.
---	모든 출결 조회는 상황을 구분할 수 있어야 한다.(정상,지각,조퇴,외출,병가,기타)
-- ID : qrs102
-- PW : 2325740

-- 1. 본인 출결 전체조회
select 
    stu.name,
    at.attendence_date,
    at.absence_type,
    to_char(at.gotowork , 'HH24:mi') as gotowork,
    to_char(at.offwork , 'HH24:mi') as offwork
from tblstudent stu inner join tblsugang su on stu.student_seq =su.student_seq
                    inner join tblattendence at on at.sugang_seq = su.sugang_seq
    where stu.student_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740'); -- 로그인 후 학생 번호를 돌려주는 쿼리
-- 2. 본인 출결 년도별조회
select 
    stu.name,
    at.attendence_date,
    at.absence_type,
    to_char(at.gotowork , 'HH24:mi') as gotowork,
    to_char(at.offwork , 'HH24:mi') as offwork
from tblstudent stu inner join tblsugang su on stu.student_seq =su.student_seq
                    inner join tblattendence at on at.sugang_seq = su.sugang_seq
    where   TO_char(at.attendence_date,'yyyy') = '2021'and
            stu.student_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740'); -- 로그인 후 학생 번호를 돌려주는 쿼리
-- 3. 본인 출결 월조회
select 
    stu.name,
    at.attendence_date,
    at.absence_type,
    to_char(at.gotowork , 'HH24:mi') as gotowork,
    to_char(at.offwork , 'HH24:mi') as offwork
from tblstudent stu inner join tblsugang su on stu.student_seq =su.student_seq
                    inner join tblattendence at on at.sugang_seq = su.sugang_seq
    where   TO_char(at.attendence_date,'mm') = '09'and
            stu.student_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740'); -- 로그인 후 학생 번호를 돌려주는 쿼리   
-- 4. 본인 출결 특정 일 조회
select 
    stu.name,
    at.attendence_date,
    at.absence_type,
    to_char(at.gotowork , 'HH24:mi') as gotowork,
    to_char(at.offwork , 'HH24:mi') as offwork
from tblstudent stu inner join tblsugang su on stu.student_seq =su.student_seq
                    inner join tblattendence at on at.sugang_seq = su.sugang_seq
    where   TO_char(at.attendence_date,'yyyy-mm-dd') = '2021-12-03'and
            stu.student_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740'); -- 로그인 후 학생 번호를 돌려주는 쿼리  
-- 5 출결 입력

--'정상', '지각', '조퇴', '외출', '병가', '기타'

-- 출근 쿼리 
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
        where su.student_seq = ( select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740') ;
-- 퇴근 쿼리 
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
                                                                                                        where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740') 
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
                                                                                                        where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740') 
                                                                              order by attendence_seq desc) 
                                                                        where rownum =1); -- 로그인 한 학생이 마지막에 남김 정보
-----------------------------------------------------D-03 출결-------------------------------------------------------------
rollback;
commit;

---------------------------------------------------D-04 Q&A 작성------------------------------------------------------
--업무영역
--교육생
--요구사항 명
--D-04 Q&A 작성
--개요
--교육생이 질문을 남기고, 조회할 수 있다.
--상세설명
---	교육생이 교육과정 진로 등 주제에 구애 받지 않고 질문을 남길 수 있다.
---	관리자 또는 선생님이 해당 Q&A에 답변을 남겼을 경우 해당 답변을 확인 할 수 있다.
--제약사항
---	해당 Q&A 에 답변이 없을 경우 답변을 확인할 수 없다.
---	본인이 남긴 Q&A만 조회할 수 있다.
---	작성날짜 
-- ID : qrs102
-- PW : 2325740
-- 1. 작성
insert into tblquestion (question_seq,question,sugang_seq) 
                                select
                                        (select question_SEQ from (select question_SEQ from tblquestion order by question_seq desc) where rownum =1)+1,
                                        '질문이 있어요!!!!!!!!!!!!!!!!!!!',
                                        su.sugang_seq
                                   from tblsugang su
                                        where sugang_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740');
-- 2. 조회
select 
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
    where sugang.student_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740'); -- 로그인 후 학생 번호를 돌려주는 쿼리
---------------------------------------------------D-04 Q&A 작성------------------------------------------------------
rollback;
commit;

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
-- 1. 선생님 상담신청
insert into tblCounsel
select 
    (select counsel_seq from(select * from tblCounsel order by counsel_seq desc) where rownum = 1)+1,
    '선생님',
    '테스트 상담 테스트',
    sysdate,
    su.sugang_seq ,
    t.teacher_seq,
    m.manager_seq
from tblsugang su inner join tbllclass lc on su.lclass_seq = lc.lclass_seq
                  inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                  inner join tblteacher t on t.teacher_seq = ls.teacher_seq
                  inner join tblstudent stu on stu.student_seq = su.student_seq
                  inner join tblmanager m on m.manager_seq = stu.manager_seq
    where rownum =1 and su.student_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740');
-- 2. 관리자 상담신청
insert into tblCounsel
select 
    (select counsel_seq from(select * from tblCounsel order by counsel_seq desc) where rownum = 1)+1,
    '관리자',
    '테스트 상담 테스트',
    sysdate,
    su.sugang_seq ,
    t.teacher_seq,
    m.manager_seq
from tblsugang su inner join tbllclass lc on su.lclass_seq = lc.lclass_seq
                  inner join tbllsubject ls on ls.lclass_seq = lc.lclass_seq
                  inner join tblteacher t on t.teacher_seq = ls.teacher_seq
                  inner join tblstudent stu on stu.student_seq = su.student_seq
                  inner join tblmanager m on m.manager_seq = stu.manager_seq
    where rownum =1 and su.student_seq = (select stu.student_seq from tblstudent stu where stu.id = 'qrs102' and substr(stu.ssn,7) = '2325740');    
select * from tblCounsel where sugang_seq = 6;--test
--------------------------------------------------D-05 상담 신청-------------------------------------------------------
rollback;
commit;




set serveroutput on;

















