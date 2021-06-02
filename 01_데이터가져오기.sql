--한줄의 주석
/*
여러줄 주석은
이렇게 주석은 컴퓨터가 실행하지 않는다.
*/

--SELECT 문 
--1. 테이블의 모든 행과 열을 읽어오기
SELECT *
FROM employees;--셀렉트 설정 *은 전체열과행 읽고 프롬 employees테이블실행

SELECT *
FROM DEPARTMENTS;


--2. 특정 열만 읽어오기(2개의 열만), 열의 이름을 적는다
SELECT department_id, department_name
FROM departments;

SELECT  department_id, department_name
FROM departments;

--3.산술 연산자 사용(+,-,*,/)
--salary+100->열을 하나더 만들고 계산,salary+(salary*0.1)->salary에 10%를 더함 
SELECT  employee_id,first_name,salary , salary+100,salary+(salary*0.1)
FROM employees;

--4.널(null)이란?
--널은 입력되지 않은, 사용 불가능하는 값이다.
--널은 제로(0) 또는 공백(' ')과는 다르다.
SELECT  last_name, job_id,salary,commission_pct
FROM employees;



--5. 널값을 계산할수 없다.
SELECT  last_name, job_id,salary,commission_pct,commission_pct+10
FROM employees;

SELECT department_name,manager_id, manager_id+10,location_id
FROM departments;

--6.별칭 정하기 AS
SELECT  last_name, last_name AS 이름
FROM  employees;

--7.||연결연산자 = > 열과 열을 연결해서 하나의 열로
-- 공백이 있을경우, 문자열로 처리해줘야 한다.||' '||은 first name과 last name이 붙어있어 띄워주고 싶을때 사용하는것이다.
SELECT first_name, last_name, first_name||' '||last_name AS "전체 이름"
FROM employees;

--8.DISTINCT 열의 중복을 제거
SELECT distinct department_id
FROM employees;

SELECT distinct department_id
FROM departments;

SELECT 
first_name AS "이름",
employee_id AS "사원번호",
salary,
salary*1.1 AS "뉴 셀러리"
FROM employees;

--9.DISCRIBE DESC 명령어//테이블의 구조를 간략하게 설명한다. 
DESC employees;
DESC departments;

--10.예제문제 풀어보기
SELECT  department_id AS "부서 번호",department_name AS "부서 이름"
FROM departments;

SELECT 
last_name,
first_name,
job_id,
salary,
salary-salary /10
FROM employees;

SELECT 
last_name,
first_name,
job_id,
salary,
salary-(salary *0.05)
FROM employees;





