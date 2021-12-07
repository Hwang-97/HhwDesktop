-- B01 로그인 시도
commit;
begin
	--procMLogin('아이디', '패스워드');
    procMLogin('ssangyong1', '1024982');
end;

-- B02 기초 정보관리

--과정 조회@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--과정이름,과목명,강의실명,과제명
    procMbasicinfo();
end;

--과정 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMAddclass('과정명');
    procMAddclass('추가 과정');
end;

select * from tblclass;
rollback;
commit;

--과정 업데이트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
   --procMUpdateclass(과정번호, '과정명');
   procMUpdateclass(101, '수정');
end;

select * from tblclass;
rollback;
commit;

--과정 삭제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMdeleteclass(과정번호);
    procMdeleteclass(102);
end;

rollback;
commit;

--과목 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMAddsubject('과목명');
    procMAddsubject('ㅇㄴㅇㄴㅇ');
end;

select * from tblsubject;
rollback;
commit;

--과목 업데이트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMupdatesubject(과목번호, '과목명');
    procMupdatesubject(33, '수정');
end;

select * from tblsubject;
rollback;
commit;

--과목 삭제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
--	procMdeletesubject(과목번호);
    procMdeletesubject(33);
end;

select * from tblsubject;
rollback;
commit;

--강의실 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMAddclassroom('강의실명', 인원);
    procMAddclassroom('추가 강의실', 30);
end;
select * from tblclassroom;
--강의실 업데이트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMupdateclassroom(강의실번호, '강의실명', 인원);	
    procMupdateclassroom(7, 'F 강의실', 26);
end;

--강의실 삭제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --procMdeleteclassroom(강의실번호);
	procMdeleteclassroom(7);
end;
select * from tblclassroom;
--교재 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMAddbookname('교재명', '출판사');
    procMAddbookname('추가 책이름', '추가 책 출판사');
end;

--교재 업데이트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMupdatebookname(교재번호, '교재명', '출판사');
    procMupdatebookname(131, '수정된 책이름', '수정출판사');
end;

--교재 삭제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --procMdeletebookname(교재번호);
    procMdeletebookname(131);
end;
select * from tblbookname;
--B03 교사 계정관리

--교사 전체 정보 조회@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    procMteacherinfo;
end;

--교사 계정 추가@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
--	procMAddteacher('교사명', '아이디', 패스워드, '전화번호', '강의가능과목','현역여부', '추가과목', 관리자번호);
    procMAddteacher('추가', 'tttt22', 2231233, '010-5454-5663', '가능과목','N', 'C', 1);
end;

--교사 계정 조회@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMteacherFind('교사이름');
    procMteacherFind('박세인');
end;

--교사 id 업데이트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
--	procMupdateteacherid(교사번호, '교사이름');
    procMupdateteacherid(12, '수정');
end;

--교사 전화번호 업데이트@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMupdateteachertel(교사번호, '전화번호');
    procMupdateteachertel(12, '010-1234-4567');
end;
select * from tblteacher;
--교사 삭제@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMDeleteTeacher(교사번호);
    procMDeleteTeacher(12);
end;

--선생님 강의과정 정보 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMTeacherClass('이름');
    procMTeacherClass('박세인');
end;

--B04 개설 과정 관리

--과정 종료날짜 지정 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
--	procMFixFinishClass(개설과정번호, '날짜');
    procMFixFinishClass(1, '22/12/15');
end;
select * from tbllclass;
--강의실 정보 수정 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procMFixLClassClassRoom(과정번호, 강의실번호);
    procMFixLClassClassRoom(1, 5);
end;
select * from tbllclass;

-- 개설 과정 정보 출력 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    procMLClassInfo;
end;

--B5 개설 과목 관리.

--개설 과목 출력 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
--	procMLsubjectInfo(과목번호);
    procMLsubjectInfo(1);
end;
rollback;
--개설 과목 수정 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --procMFixLsubjectdate(과목번호, 시작날짜, 종료날짜);
	procMFixLsubjectdate(7,sysdate, sysdate+30);
end;
select * from tbllsubject;

--개설 과목 삭제 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
INSERT INTO tblLsubject(LSubject_Seq, start_date, end_date, subject_Seq, BookName_seq, Teacher_Seq, LClass_Seq) Values (30, '21-12-30', '22-01-31', 5, 6, 3, 87);
begin
	--procMdeleteLsubject(과목번호);
    procMdeleteLsubject(30);
end;
select * from tbllsubject;
--개설 과목 정보 출력 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    procMLsubjectList;
end;


--B06

--교육생 추가 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --procMAddstudentInfo('교육생이름','아이디','주민번호','전화번호',관리자번호);
	procMAddstudentInfo('추가임','zsg808','6902211773839','010-4277-5565',1);
end;
select * from tblstudent;

--교육생 정보 출력 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    procMStudentInfo;
end;

--교육생 검색 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	procMfindStudent('교육생이름');
    procMfindStudent('윤한빈');
end;

--중도 탈락 처리 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
--	procMOutDate('교육생이름', 중도탈락날짜);
    procMOutDate('이한형', sysdate);
end;
--B-07 시험 관련 업무

--개설 과정 출력 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--특정 개설 과정을 선택하는 경우 등록된 개설 과목 정보를 출력하고, 개설 과목 별로 성적 등록 여부, 시험 문제 파일 등록 여부를 확인할 수 있어야한다.
begin
	--proTestinfo('개설과정명');
    proTestinfo();
end;	

--과목별 출력시 개설 과정명, 개설 과정기간, 강의실명, 개설 과목명, 교사명 교재명 등을 출력하고, 해당 개설 과목을 수강한 모든 교육생들의
--성적 정보(교육생 이름, 주민번호 뒷자리,필기,실기)를 같이 출력한다
begin
	--proTestscoreinfo('과목명');
    proTestscoreinfo();
end;

-- 교육생 개인별 출력시 교육생 이름, 주민번호 뒷자리, 개설 과정명, 개설 과정기간, 교사명, 출력, 필기, 실기)를 같이 출력한다.  
begin
	--procStestscoreinfo('교육생');
    procStestscoreinfo();
end;

--B-08 출결 관리 업무

--교육생 출석 확인(년월일단위) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--proAttendenceinfo('과정명','교육생','시작날짜','종료일자');
    proAttendenceinfo('','','20211130','20211231');
end;

--B-09 졸업생 멘티 멘토	

--졸업생 조회 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --proGraduateinfo('졸업생');
    proGraduateinfo('김멘토');
end;

--멘토 조회 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    -- proMentoringinfo('졸업생','교육생');
    proMentoringinfo('','김규석');
end;

--멘토 배정 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--proMentoringAdd('졸업생이름','교육생이름');
    proMentoringAdd('조마나','김규석');
end;

rollback;
--B-10 교육 지원금 및 월급 배부 현황
--교육생 정보(이름, 과정명, 수강 일수)를 조회하고 교육 지원금 계산이 된 값과 입금 예정날짜를 조회하고 입금 확인을 조회할 수 있어야 한다.


--학생 지원금 현황 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
	--procsASubsidyinfo('교육생이름');
    procsASubsidyinfo('김규석');
end;

--교사 정보(이름, 월급, 월급날짜, 수강중인 강좌)를 조회하고 월급 날짜에 맞춰 지급 되었는지 확인할 수 있어야 한다.
--교사 지원금 현황 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

begin
	--procsTcASubsidyinfo('교사이름');
    procsTcASubsidyinfo('박세인');
end;


--B-11 코로나 대면 비대면 여부 확인

--학생 비대면 여부 확인 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --procCovidsinfo('교육생')
    procCovidsinfo('김규석');
end;

--교사 비대면 여부 확인 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --procTcCovidtinfo('교사')
    procTcCovidtinfo('');
end;

--B-12 졸업생 취업현황

--졸업생 취업 현황 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
begin
    --proGraduateinfo('졸업생','과정명')
    proGraduateJobinfo('','자바');
end;

--B13 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
--교육생 희망 취업처 조회@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
begin
    dbms_output.put_line('====================================================================================');
    proMWishjobOutput('');-- ''시 전체 조회
end;
----2. 학생(상담 + 희망 취업처 + 희망 연봉) @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@2
begin
    dbms_output.put_line('====================================================================================');
    proMCounselWishjobOutput('이정현'); -- ''시 전체 조회    
end;

--B14
--교육생 조 편성
-- 조회
begin
    dbms_output.put_line('====================================================================================');
    proMTotalTeamOutput('1', '황현우'); -- ''시 전체 조회
end;

-- 특정 팀 조회
begin
    dbms_output.put_line('====================================================================================');
    proMClassandTeamOutput('1', '(디지털컨버전스) Java 기반 임베디드 플랫폼 연동 융합 개발자 양성 과정'); -- 지정 강의+ 팀 조회(강의이름 + 조번호)        
end;

--B15
--교육생 상담조회
begin
proMTotalcounselOutput('황현우',''); -- ''시 전체조회
end;
select * from tblcounsel where sugang_seq = 6;
----------------------------------------------------------------------------------------------------------

-- C01
-- 교사 계정 조회
begin
    --ProTAccountSearch(교사 아이디, 교사 비밀번호);
    ProTAccountSearch('tpdls1990',1234927);
end;

----------------------------------------------------------------------------------------------------------

-- C02.1
-- 강의 스케쥴 조회


begin
    --proTClassSearch(과정번호); 
    dbms_output.put_line('====================================================================================');        
    proTClassSearch(11); 
end;


-- C02.2
-- 과정별 과목 스케쥴
begin
    --proTEachClassSearch(교사 아이디, 교사 비밀번호);
    dbms_output.put_line('====================================================================================');    
    proTEachClassSearch('tpdls1990', 1234927);
end;

-- C02.3
-- 교육생 강의 정보 확인
begin
    --proTTotalStudentClassInfo(교사 아이디, 교사 비밀번호);
    dbms_output.put_line('====================================================================================');  
    proTTotalStudentClassInfo('tpdls1990',1234927);    
end;

-- C02.4
-- 과정번호 + 강의 진행중 학생만 + 본인 담당 학생만 선택 쿼리
begin
    --proTEachStudentINGSearch(과정번호, 교사 아이디, 교사 비밀번호);
    proTEachStudentINGSearch(101, 'tpdls1990', 1234927);
    dbms_output.put_line('====================================================================================');    
end;


-- C02.5
-- 특정과목을 과목번호로 선택시 해당 과정에 등록된 교육생 정보를 조회
begin
    --proTEachStudentSearchSubseq(과목번호, 교사 아이디, 교사 비밀번호);
    proTEachStudentSearchSubseq(1, 'tpdls1990', 1234927);
end;

----------------------------------------------------------------------------------------------------------

-- C03

-- C03.1 배점 입력(추가)
declare
    vresult number;
begin
    --proTPointsInput(교사 아이디, 교사 비밀번호, 필기배점, 실기배점, 출결, 총점, vresult);
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
select * from tblpoints;
commit;
rollback;
-- C03.2 배점 수정 
begin
    --proTPointsUpdate(교사 아이디, 교사 비밀번호, 필기배점, 실기배점, 출결, 배점번호);
    dbms_output.put_line('====================================================================================');
    proTPointsUpdate('tpdls1990', 1234927, 20, 50, 30, 104);
end;

-- C03.3 특정 과목을 조회(조건 : 강의를 마친 과목)
begin
    --proTSearchSubjectOutput(교사 아이디, 교사 비밀번호);
    dbms_output.put_line('====================================================================================');
    proTSearchSubjectOutput('tpdls1990', 1234927);
end;


-- C03.4 배점번호로 해당 강의중 종료된 과목 배점 정보 출력
begin
    --proTEachSubjectPointsOutput(교사 아이디, 교사 비밀번호, 배점번호);
    dbms_output.put_line('====================================================================================');
    proTEachSubjectPointsOutput('tpdls1990', 1234927, 100);
end;
-- C03.5 테스트 문제 추가
begin
    --proTTestAdd(교사 아이디, 교사 비밀번호, 문제내용, 필기실기여부, 과목번호);
    dbms_output.put_line('====================================================================================');
    proTTestAdd('tpdls1990', 1234927, '테스ㄹㄴㅇㅇㄹ트', '필기', 1);
end;
select * from tbltest;
----------------------------------------------------------------------------------------------------------
rollback;
-- C04 성적 입출력

-- C04.1 종료된 과목 조회
begin
    --proctFindlsubjectscore(교사 아이디, 교사 비밀번호);
    proctFindlsubjectscore('tpdls1990',1234927);
end;

-- C04.2 성적 출력

begin
    --proctFindStudentscore(교사 아이디, 교사 비밀번호, 과정이름, 과목번호, 필기실기, 학생이름);
    proctFindStudentscore('tpdls1990',1234927,'','','','황현우');
end;

-- C04.3 성적 입력

begin
    --procTAddTestScore(점수, 날짜, 수강번호, 문제번호);
    procTAddTestScore(60, sysdate, 1, 101);
end;
select * from tbltestscore;

----------------------------------------------------------------------------------------------------------

-- C05 교육생 출결 조회

begin
    --proctFindStudentAttendence(교사 아이디, 교사 비밀번호, 이름, 시작날짜, 종료날짜, 교육과정);
    proctFindStudentAttendence('tpdls1990',1234927,'황현우','20210908','20211105','');
end;

----------------------------------------------------------------------------------------------------------

-- C06 Q&A 답변

-- C06.1 학생 질문 조회
begin
    --proctFindStudentQuestion(교사 아이디, 교사 비밀번호, 학생이름, 검색 범위 지정);
    proctFindStudentQuestion('tpdls1990',1234927,'황현우','20210908','20211207');
end;

-- C06.2 학생 질문 답변

begin
    --proctAnswerStudentQuestion(교사 아이디, 교사 비밀번호, 답변, 질문번호);
    proctAnswerStudentQuestion('tpdls1990',1234927,'그만들으세요','100');
end;
select * from tblquestion;
select * from tblanswer;
----------------------------------------------------------------------------------------------------------

-- C07 교육생 조회

begin
    --proctFindStudentSpec(학생이름);
    proctFindStudentSpec('황현우');
end;

----------------------------------------------------------------------------------------------------------

-- C08 월급 조회

begin
    --proctFindSalary(교사 아이디, 교사 비밀번호, 시작 월,종료 월);
    proctFindSalary('tpdls1990',1234927,'1','12');
end;

----------------------------------------------------------------------------------------------------------

-- C09 코로나 대면여부 등록 및 조회

-- C09.1 교사 대면여부 조회
begin
    --proctFindCovidTAttendance(교사 아이디, 교사 비밀번호);
    proctFindCovidTAttendance('tpdls1990',1234927);
end;

-- C09.2 교사 대면여부 변경

begin
    --proctChangeCovidTAttendance(교사 아이디, 교사 비밀번호, 대면여부, 날짜);
    proctChangeCovidTAttendance('tpdls1990',1234927, 'Y', '21/12/06');
end;

----------------------------------------------------------------------------------------------------------
rollback;
-- C010 교육생 취업관리


begin
    --proctFindStudentWishJob(학생이름, 희망 취업처);
    proctFindStudentWishJob('황현우','강서');
end;

---------------------------------------------------C-11 교육생 팀편성-------------------------------------------------------

-- 1. 검색
begin
--                               ID        PW
    proTTeamFormationSearch('tpdls1990',1234927);
end;
--2 수정
begin
--                               ID        PW    팀 학생번호 순차적으로
    proTTeamFormationChange('tpdls1990',1234927, 5 ,1,2,3,4,5,6);
end;
--3 삭제
begin
--                               ID        PW   학생번호 순차적으로
    proTTeamFormationremove('tpdls1990',1234927,1,2,3,4,5,6);
end;
--4 추가 
begin
--                               ID    PW     팀 학생번호 순차적으로
    proTTeamFormationAdd('tpdls1990',1234927,10  ,1,2,3,4,5,6);
end;
--------------------------------------------------C-12 상담 신청자 조회--------------------------------------------------------
rollback;
--1 . 조회
begin
--                      ID          PW
    ProTCounselSearch('tpdls1990',1234927);
end;


--D01
-------------------------------------------------------D-01 계정-------------------------------------------------------------
--1. 기본 정보 조회
begin
    ProSAccountBasicSearch('qrs102','2325740');
end;
--2. 현재 수강중인 과정 및 과정명 ,담당 교사 ,기간 등 확인.
begin
    ProSAccountSugangSearch('qrs102','2325740');
end;
-----------------------------------------------------D-02 성적 조회-----------------------------------------------------------
-- 1.현재 수강중인 과정명과 과목명 , 과목별 기간을 출력
begin
    ProSGradeCheckclassSearch('qrs102','2325740');
end;
-- 2.전체 or 과목 선택 후 시험 정보 조회
begin
    ProSGradeCheckclassSelSearch('qrs102','2325740','자바');
end;
-------------------------------------------------------D-03 출결-------------------------------------------------------------
-- 1. 본인 출결 전체 및 날짜별 조회
begin
    ProSAttendSelSearch('qrs102','2325740','2021-12-06');
end;
-- 2. 출결 입력
-------2-1. 출근
begin
    ProSGoTowork('qrs102','2325740');
end;
-------2-2. 퇴근
begin
    ProSOffWork('qrs102','2325740');
end;
---------------------------------------------------D-04 Q&A 작성------------------------------------------------------
rollback;
-- 1. 작성
begin
    ProSQuesrionadd('qrs102','2325740','질문 한번 해보겠습니다!!');
end;
-- 2. 조회
begin
    ProSQuestionSearch('qrs102','2325740');
end;
---------------------------------------------------D-05 상담 신청-------------------------------------------------------\
rollback;
-- 1. 선생님 or 관리자 상담신청
begin
    ProSCounselAdd('qrs102','2325740','관리자','상담 신청 해요!');
end;
-- 확인용
select * from tblCounsel where sugang_seq =6 and teacher_seq =11 and target = '선생님';
select * from tblCounsel where sugang_seq =6 and manager_seq =1 and target = '관리자';
---------------------------------------------------------------------------------------------------------------------------
rollback;
--D06
--학생이 교사 평가 조회
begin
    procSTeacherAssessMentCheck('qrs102', '2325740');
end;
-- 교사 평가
begin
    procSTeacherAssessMentWrite('qrs102', '2325740', '평가평가평가평가'); 
end;
select * from tblAssessMent;
----------------------------------------------------------------------------------------------------------------------------
--D07
-- 코로나 대면/비대면
begin
    procScovidIsFacetoFaceCheck('qrs102', '2325740');
end;
-- 코로나 대면 비대면 변경(프로시저 생성)
begin
    procScovidIsFacetoFaceChange('qrs102', '2325740', 'Y', '2021-12-07');
end;
------------------------------------------------------------------------------------------------------------------------------
--D08
-- 교육지원금 조회
begin
    procSsubsidy('qrs102', '2325740', 1);
end;
------------------------------------------------------------------------------------------------------------------------------
--D09
-- 등수 조회
begin
     procSRankOfClass('qrs102', '2325740');
end;
---------------------------------------------------------------------------------------------------------------------------------
--D10
-- 프로젝트 공고계시판 프로젝트 찾기
begin
    procSSerchProject;
end;    
-- 프로젝트 등록하기    
begin
    procProjectWrite('qrs102', '2325740', '테스트 프로젝트', '테스트 테스트', '2021-12-31', 3, 'abc@naver.com');
end;
select * from tblproboard ;
rollback;
--------------------------------------------------------------------------------------------------------------------------------
--D11 기수계시판
-- 기수 계시판 조회
begin
    procSGisuBoardSerch('qrs102', '2325740');
end;
-- 기수 계시간 개시
begin
    procGisuBoardWrite('qrs102', '2325740', '테스트테스트테스트');
end;
rollback;
