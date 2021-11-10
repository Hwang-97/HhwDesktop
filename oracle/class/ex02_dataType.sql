/*


1. 숫자형
    - 정수 , 실수
    a. number
        - (유효자리) 38자리 이하의 숫자를 표현하는 자료형
        - 5~22byte
        - 1x10^130 ~ 9.99999x10^125
        - number
        - number(precision)
        - number(precision, scale)
            1.precision => 소수정 이하를 표함한 전체 자릿수(1~38)
            2.scal => 소수점 이하 자리수 (0~127자리)
        ex) number      38자리 표현 가능한 모든숫자(정수,실수 포함)
        ex) number(3)   3자리 정수
        ex) number(4,2) 4자리 전체 4정수 ,소수이하 2자리, 실수(-99.99~99.99)
        ex) number(10,3)-9999999.999~9999999.999
        
        - 숫자형 리터럴(상수 표현법)
            1. 정수:10
            2. 실수 3.14

2. 문자형
    - 문자 + 문자열
    - 자바의 String과 유사
    - char vs nchar => n의 차이?
    - char vs varchar => 차이?
    - 문자 리터럴
        1.'문자열'
    a. char
        - 고정 자릿수 문자열
        - char(n):n자리 문자열
        - 최소크기: 1바이트
        - 최대크기: 2000바이트
        - 주어진 공간을 데이터가 채우지 못하면 나머지 자리를 스페이스가 채움
        - 장점 : 속도가 빠름
        - 단점 : 데이터를 정해진 만큼 무조건 사용함.
        - 정보의 크기가 대부분 일정한 경우 유리함.
        ex) char(3): 최대 3바이트 짜리 문자열 저장
        ex) char(10): 최대 10바이트 짜리 문자열 저장
        ex) char(10): 영어 몇글자(10자), 한글 몇글자(3글자)
    b. nchar
        - n : national > UTF-16 (한글 2 바이트) 동작 
        - 고정 자리수 문자열
        - nchar(n):n자리 문자열, n(문자수)
        - 최소크기 : 1글자 (2바이트)
        - 최대크기 : 1000글자(2000바이트)
    c. varchar2
        - 가변 자릿수 문자열
        - varchar2(n): n자리 문자열, n(바이트)
        - 최소크기: 1바이트
        - 최대크기: 4000바이트
        - 데이터의 크기만큼만 공간을 차지함.. 빈공간의 경우 해당 공간을 삭제함.
        - 장점 : 공간을 효율적으로 사용함.
        - 단점 : 속도가 느림..
        - 정보의 크기가 일정하지 않고 변화가 많은경우 유리함.
    d. nvarchar2 > nvarchar
        - 가변 자릿수 문자열
        - varchar2(n):n자리 문자열 , n(문자수)
        - 최소크기 : 1글자(2바이트)
        - 최대크기 : 2000글자(4000바이트)
    e.clob, nclob
        - 대용량 텍스트
        - 128TB
        - 잘 사용 안함. 참조형

3. 날짜/시간형
    -자바의 Calendar , Date , Time
    a.DATE ***
        - 년월일시분초
        - 7바이트
        - 기원전 4712년 1월 1일 ~ 9999년 12월 31일
    b.TIMESTAMP
        - 년월일시분초 + 밀리초(나노초)
    a.INTERVAL > number를 대신 사용
        - 시간
        - 틱값 저장용

4.이진 데이터형
    - 비 텍스트 데이터
    - 이미지 , 영상, 음악 , 파일 등..
    특별한 경우 이외에 잘 사용 안함
    a. blob
        - 최대 128TB
        
결론 ****************************
    1. 숫자 > number
    2. 문자 > varchar2
    3. 날짜 > date



*/
--------------------------------------------------------------------------------
-- 테이블 선언(생성)
create table 테이블명(
    속성(컬럼) 선언
    컬럼 자료형(도메인) 제약사항
);
create table tblType(
   -- num number
   -- num number(3)
   -- num number(4,2)
   -- txt char(3)
   
   txt1 char(10),
   txt2 varchar2(10)
   
);
--------------------------------------------------------------------------------
-- 테이블 삭제
drop table 테이블명;
drop table tblType;
--------------------------------------------------------------------------------
--테이블에서 데이터 가져오기
select * from tblType;
--------------------------------------------------------------------------------
--테이블 데이터 추가하기
/*
insert into tblType (num) values (99.99);
insert into tblType (num) values (99.999);
insert into tblType (num) values (100);
insert into tblType (num) values (200);
insert into tblType (num) values (300);
insert into tblType (num) values (3.14);
insert into tblType (num) values (3.123456);
insert into tblType (num) values (12345678901234567890123456789012345678);
insert into tblType (num) values (-12345678901234567890123456789012345678);
insert into tblType (num) values (12345678901234567890123456789012345678901234567890);
*/


insert into tblType (txt) values ('ABC');
insert into tblType (txt) values ('A');
insert into tblType (txt) values ('');

insert into tblType (txt1,txt2) values ('ABC','abc');
insert into tblType (txt1,txt2) values ('ABCDEFGHIG','abcdefghij');
insert into tblType (txt1,txt2) values ('홍길동','홍길동');




--테스트용
select * from tblType;
--테스트용
select * from diary;
--commit;





















