--DDL 데이터 정의어

--테이블 만들기
CREATE TABLE  test(
    char_col   VARCHAR(4),--문자열 4바이트
    number_ex    NUMBER(2),--숫자2자리
    start_date DATE DEFAULT SYSDATE--날짜 디폴트 현재날짜
);

DESC test;--테이블 데이터 확인

 SELECT*FROM test;
 --테이터를 입력
 INSERT INTO test VALUES('abcd',12,'2021-06-09');
 
 --DEFAULT 값 =>입력을 안했을때 널값 대신 디폴트 값이 입력된다.
  INSERT INTO test VALUES('hong',13,NULL);--널값을 입력함
  INSERT INTO test(char_col,number_ex)VALUES('Kim',15);--날짜를 입력안했을때 디폴트값이 입력된다.
  
  --테이블 삭제하기
  DROP TABLE test;-- 테이블 이름은 대소문자 구분하지않고 입력가능,데이터는 대소문자 가린다
  
  rollback;--DDL은 테이블 생성및 삭제 등은 항상 commit이 된다 그래서 롤백 할수 없다.(ex test테이블을 지웠기때문에 되살릴수 없음.)
           --DML 명령어에서는 사용가능
           
--예제1
CREATE TABLE sample_product(
product_id    NUMBER,
prdouct_name  VARCHAR2(20),
menu_date    DATE 
);

DESC sample_product;

DROP TABLE sample_product;           

--CREATE TABLES AS :AS다음의 셀렉트 문의 결과로 테이블을 만들어 저장 
CREATE TABLE EMP_TEMP
AS
SELECT*FROM employees
WHERE 1 !=1;--항상 거짓인 조건(모든 행을 가져오지 않는다. )

SELECT*FROM EMP_TEMP;--항상 거짓인 조건은 추가 했기때문에 데이터 없고 테이블 구조만 복사  
DESC EMP_TEMP;

--80번부서의 직원들의 테이블
CREATE TABLE EMP80--오류발생..(만들어놓고 계속 만듦./..ㅎㅎ)
AS
SELECT employee_id,last_name,salary*12 ANNUAL,hire_date
FROM employees
WHERE department_id=80;
 
SELECT*FROM EMP80;
DESC EMP80;

--30번 부서의 직원 테이블을 만든다. 이때 EMP 30열의 이름을 직접 입력
CREATE TABLE EMP30(직원번호,풀네임,월급,고용일자)
AS
SELECT employee_id,last_name||''||first_name,salary,hire_date
FROM employees
WHERE department_id=30;

SELECT*FROM EMP30;
DESC EMP30;


--예제1
CREATE TABLE stmans(id,job,sal)
AS
SELECT employee_id,job_id,salary
FROM employees
WHERE JOB_ID='ST_MAN';

SELECT*FROM stmans;
DESC STMANS;


SELECT*
FROM EMPLOYEES
WHERE LAST_NAME='%B';

