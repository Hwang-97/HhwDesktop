-- ex15_insert


DROP SEQUENCE seqmemo;
CREATE SEQUENCE seqmemo;

DROP TABLE tblmemo;
CREATE TABLE tblmemo(
    seq NUMBER PRIMARY KEY,
    NAME VARCHAR(30) DEFAULT '익명' NOT NULL,
    memo VARCHAR(1000) NULL ,
    regdate DATE DEFAULT sysdate NULL
);

INSERT INTO tblmemo(seq,NAME,memo,regdate)
    VALUES (seqmemo.NEXTVAL ,DEFAULT,'메모입니다.' ,DEFAULT);
SELECT * FROM tblmemo;

INSERT INTO tblmemo
    VALUES (seqmemo.NEXTVAL ,'홍길동','컬럼 리스트 생략.' ,sysdate);

INSERT INTO tblmemo
    VALUES (seqmemo.NEXTVAL ,'홍길동','컬럼 리스트 생략.'); --"not enough values"

-- 복사 테이블
CREATE TABLE tblmemocopy(
    seq NUMBER PRIMARY KEY,
    NAME VARCHAR(30) DEFAULT '익명' NOT NULL,
    memo VARCHAR(1000) NULL ,
    regdate DATE DEFAULT sysdate NULL
);

INSERT INTO tblmemocopy SELECT * FROM tblmemo;

SELECT * FROM tblmemo;
SELECT * FROM tblmemocopy;

CREATE TABLE tblmemocopy2(
    seq NUMBER PRIMARY KEY,
    NAME VARCHAR(30) DEFAULT '익명' NOT NULL,
    memo VARCHAR(1000) NULL ,
    regdate DATE DEFAULT sysdate NULL
);

INSERT INTO tblmemocopy SELECT * FROM tblmemo;









