--발표
set serveroutput on;
rollback;
commit;
---------------------------------------------------------------------관리자------------------------------------------------------------
-- 관리자 로그인
begin
	--procMLogin('아이디', '패스워드');
    procMLogin('ssangyong1', '1024982');
end;
--1 B-09. 관리자는 1인당 멘토 1명씩 배정할 수 있다.
--졸업생 조회 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --proGraduateinfo('졸업생');
    proGraduateinfo('');
end;
begin
	--proMentoringAdd('졸업생이름','교육생이름');
    proMentoringAdd('','김규석');
end;
--멘토 조회 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    -- proMentoringinfo('졸업생','교육생');
    proMentoringinfo('','김규석');
end;
--멘토 배정 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
rollback;
--2 B-10 관리자는 교육생과 교사의 교육 지원금 및 월급 배부 현황을 확인할 수 있다.

--교육생 정보(이름, 과정명, 수강 일수)를 조회하고 교육 지원금 계산이 된 값과 입금 예정날짜를 조회하고 입금 확인을 조회할 수 있어야 한다.
-- 관리자 학생 지원금 조회 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procsASubsidyinfo('교육생이름');
    procsASubsidyinfo('김규석');
end;

--교사 정보(이름, 월급, 월급날짜, 수강중인 강좌)를 조회하고 월급 날짜에 맞춰 지급 되었는지 확인할 수 있어야 한다.
--관리자 교사 지원금 조회 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

begin
	--procsTcASubsidyinfo('교사이름');
    procsTcASubsidyinfo('박세인');
end;
---------------------------------------------------------------------관리자------------------------------------------------------------


---------------------------------------------------------------------교사------------------------------------------------------------
-- C06 교사가 Q&A를 조회 및 답변 할 수 있다.

-- 3 C06 교사 학생 질문 조회
begin
    --proctFindStudentQuestion(교사 아이디, 교사 비밀번호, 학생이름, 검색 범위 지정);
    proctFindStudentQuestion('tpdls1990',1234927,'황현우','20210908','20211207');
end;
-- C06 교사 학생 질문 답변

begin
    --proctAnswerStudentQuestion(교사 아이디, 교사 비밀번호, 답변, 질문번호);
    proctAnswerStudentQuestion('tpdls1990',1234927,'지금이 조금 어려운 파트입니다.. 조금만 버티고 따라오세요!!','100');
end;

select  
    q.question_seq
    ,a.answerdate
    ,q.question
    ,a.answer  
from tblanswer  a inner join tblquestion q on a.question_seq = q.question_seq where q.question_seq =100 ;
ROLLBACK;
-- 4_C08  교사가 본인의 월급 을 조회 할 수 있다.
begin
    --proctFindSalary(교사 아이디, 교사 비밀번호, 시작 월,종료 월);
    proctFindSalary('tpdls1990',1234927,'1','11');
end;

-- 5 C010 교사가  교육생의 희망 취업 정보를 확인할 수 있다.
begin
    --proctFindStudentWishJob(학생이름, 희망 취업처);
    proctFindStudentWishJob('','');
end;

--6 C-11.교사가 교육생의 팀을 조작할 수 있다.
-- 조회
begin
 --                             ID         PW     
    proTTeamFormationSearch('tpdls1990',1234927);
end;
-- 수정
begin
 --                             ID         PW     팀  학생 번호
    proTTeamFormationChange('tpdls1990',1234927, 10 ,1,2,3,4,5,6);
end;
-- 삭제
begin
 --                             ID         PW    학생 번호
    proTTeamFormationremove('tpdls1990',1234927,1,2,3,4,5,6);
end;
-- 추가
begin
 --                          ID         PW   팀  학생 번호
    proTTeamFormationAdd('tpdls1990',1234927,5,1,2,3,4,5,6);
end;
---------------------------------------------------------------------교사------------------------------------------------------------
rollback;
---------------------------------------------------------------------교육생------------------------------------------------------------
--7 D-02. 교육생이 본인의 성적을 조회할 수 있다.
--현재 수강중인 데이터 조회
begin
    ProSGradeCheckclassSearch('qrs102','2325740');
end;
-- 과목명으로 검색 및 전체 조회
begin
    ProSGradeCheckclassSelSearch('qrs102','2325740','');
end;

--8 D-03. 교육생이 본인의 출결을 조회 할 수 있다.    
-- 조회(날짜 지정 가능)
begin
    ProSAttendSelSearch('qrs102','2325740','2021-12');
end;
-- 출근
begin
    ProSGoTowork('qrs102','2325740');
end;
-- 퇴근
begin
    ProSOffWork('qrs102','2325740');
end;
rollback;
--9 D-04. 교육생이 질문을 남기고 , 조회 할 수 있다. Q&A  
-- 질문 남기기
begin
    ProSQuesrionadd('qrs102','2325740','저희 혹시 웹 관련된 프로젝트는 언제 하는지 알 수 있나요???');
end;
-- 남긴 질문 확인
begin
    ProSQuestionSearch('qrs102','2325740');
end;
--10 D-09. 교육생이 본인이 수강중인 교육과정에서 등수를 확인할 수 있다
begin
    procSRankOfClass('qrs102', '2325740');
end;
---------------------------------------------------------------------교육생------------------------------------------------------------
rollback;