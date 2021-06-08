--데이터의 입력/수저/삭제(DML작업)==>매우중요

--데이터 입력 INSERT INTO
--부서 테이블 복사하여 COPY_DEP테이블을 만든다
CREATE TABLE COPY_DEP
AS 
SELECT*FROM  departments;---->AS 다음 셀렉트문을 복사

--복사한 테이블에 입력
INSERT INTO  COPY_DEP(department_id,department_name,manager_id,location_id)
VALUES(300,'Game',100,1700);

select*from copy_dep;
--테이블의 열을 확인
DESC departments;-->not null일경우 무조건 데이터 입력해야한다.(기본키도 마찬가지로 데이터가 존재해야한다.)


INSERT INTO  COPY_DEP(department_id,department_name)
VALUES(280,'Music');

INSERT INTO  COPY_DEP(department_id,department_name)
VALUES(280,'가나다라마바사아자차');

SELECT*FROM copy_dep;



--예제1  departments 테이블에 다음과 같이 각각의 department_id, department_name,
-- manager_id가 200, location_id가 1700인 행을 3개 입력하세요.


INSERT INTO departments VALUES(271,'Sample Dept1',200,1700);
INSERT INTO departments VALUES(272,'Sample Dept2',200,1700);
INSERT INTO departments VALUES(273,'Sample Dept3',200,1700);

SELECT*FROM  departments;
--트랜잭션 중간
ROLLBACK;



--예제2  아래와 같이 테이블을 만든후  SELECT 문을 이용하여 departments 테이블 내용을 전부 입력하시오. ( 위의 scott예제 3번째 방법)
--copy_departments 라는 테이블을 만듦
CREATE TABLE copy_departments( department_id number(4,0),
                              department_name varchar2(30 byte),
                              manager_id number(6,0),
                              location_id number(4,0));
                              
DESC copy_departments;


--데이터수정
--예제1copy_departments 테이블에서 department_id 150부터 200까지 부서번호의 manager_ID 를 100으로 수정하라.
UPDATE departments
SET manager_id=100,location_id  = 2400;--수정할 열을 콤마(,)로 분리
--WHERE department_id between 150 and 200;--수정할 행을 선택 없을경우 전체행에 적용된다.

select*from departments;
ROLLBACK;

--데이터의 삭제
--DELETE

DELETE FROM departments where department_id=271;
DELETE FROM departments where department_id=272;
DELETE FROM departments where department_id=273;

--직원테이블이 부서테일블을 참조하는 부서는 삭제가 안된다.
DELETE FROM departments ;
select*from departments;


DELETE FROM copy_dep;--모든행 삭제
select*from copy_dep;--확인
ROLLBACK;

DESC departments;

--오라클 데이터 타입

--문자열을 VARCHAR2( n)를 사용
--n은 바이트수, 한글은 3바이트를 차지한다. 영문이 숫자는 1바이트

--숫자형은 NUMBER(P,S)를 사용
--(P,S)생략시 총 38자리수의 숫자 및 소수를 저장가능
--P는 소수점 포함 자릿수, S는 소수점의 자릿수(0은 자릿수에 포함되지 않는다.)
DESC departments;
DESC employees;
