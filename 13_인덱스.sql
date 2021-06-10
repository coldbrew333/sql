--인덱스 확인
--인덱스는 자동으로 기본키,유니크 열은 생성된다.
SELECT 

      TABLE_NAME                테이블명,

      INDEX_NAME                인덱스이름,

      COLUMN_NAME            컬럼이름

FROM ALL_IND_COLUMNS 

WHERE TABLE_NAME ='EMPLOYEES';
--외래키는 다른 테이블 기본키를 참조

--인덱스 실습용 테이블 작성
DROP TABLE MEMBERS;
CREATE TABLE MEMBERS(
member_id NUMBER PRIMARY KEY,
first_name VARCHAR2(100) NOT NULL,
last_name VARCHAR2(100)NOT NULL,
gender VARCHAR2(1) NOT NULL,
dob     DATE                NOT NULL,
email   VARCHAR2(255) NOT NULL
);

SELECT*FROM MEMBERS ORDER BY member_id;
DELETE FROM MEMBERS;

SELECT 

      TABLE_NAME                테이블명,

      INDEX_NAME                인덱스이름,

      COLUMN_NAME            컬럼이름

FROM ALL_IND_COLUMNS 

WHERE TABLE_NAME= 'MEMBERS';

--SQL문의 실행에 대한 보고서 만들기

EXPLAIN PLAN FOR--아래의 셀렉트문 결과를 보고서로 저장한다.
SELECT*FROM  MEMBERS
WHERE LAST_NAME='Harse';

--저장된 보고서 읽기
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY());

--인덱스 만들기 멤버 테이블의 last_name에 인덱스저장
CREATE INDEX  members_last_name_i--인덱스 이름
ON members(last_name);


