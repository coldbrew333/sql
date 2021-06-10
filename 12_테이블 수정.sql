--열의 추가/수정

--추가 add

--90번부서 직원들의 테이블 EMP90
CREATE TABLE EMP90
AS
SELECT employee_id,first_name,last_name,salary,department_id
FROM employees
WHERE department_id=90;

DESC EMP90;--CREATE TABLE AS로 복사한 테이블은 NOT NULL외의 제약조건은 복사 안된다.

--GENDER열을 추가
ALTER  TABLE EMP90
ADD (GENDER VARCHAR2(1));--젠더 열 추가

DESC EMP90;
SELECT*FROM EMP90;--젠더 열 추가 확인 ,데이터가 있을 경우에는 그 값이 NULL로 자동 입력된다.


--COM1열 추가 디폴트0,NOT NULL
ALTER TABLE EMP90
ADD(COM1 NUMBER DEFAULT 0 NOT NULL);--COM1열 추가

--날짜 열 (컬럼) 추가
ALTER TABLE EMP90
ADD (CREATED_DATE DATE DEFAULT SYSDATE);--CREATED_DATE 열 추가

DESC EMP90;
-- GENDER 열의 크기 1 =>100으로
ALTER TABLE EMP90
MODIFY(GENDER VARCHAR2(100));--열의 크기 수정

--열(컬럼)의 삭제
ALTER TABLE EMP90
DROP COLUMN CREATED_DATE;--날짜 열 삭제

ALTER TABLE EMP90
DROP COLUMN COM1;--COM1삭제

ALTER TABLE EMP90
DROP COLUMN GENDER;--GENDER열 삭제

DESC EMP90;


--이름 수정
--열의 이름 수정
ALTER TABLE EMP90
RENAME COLUMN department_id TO 부서번호;--열의 이름 수정
--테이블 이름 수정
RENAME EMP90 TO  부서90;--부서90으로 이름 수정
 
 DESC 부서90;
 
 
 