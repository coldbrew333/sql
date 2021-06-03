--문자형 함수는 대소문자 조작과 문자 조작함수가 있다.
--1.대소문자 조작함수 (upper,lower,initcap)
select employee_id,first_name,UPPER(FIRST_NAME),LOWER(FIRST_NAME),INITCAP(FIRST_NAME)
from employees; --UPPER 대문자, LOWER 소문자, INITCAP은 첫글자만 대문자

Select employee_id,first_name,UPPER(FIRST_NAME),LOWER(FIRST_NAME),INITCAP(FIRST_NAME)
from employees
WHERE UPPER(FIRST_NAME)='PATRICK';--이름의 대소문자 상관업싱 결과 출력

--substr함수 (열이름,m,n):문자열에서 특정위치부터 잘라낸다.
--m은 시작문자,n은 잘라낼 길이
SELECT employee_id,first_name,
substr(first_name,1,3),--첫문자 부터 3개를 잘라낸다.
substr(first_name,2,4),--두번째부터 4개를 잘라낸다.
substr(first_name,2)--두번째부터 끝까지 잘라낸다
FROM employees;

--length함수(문자열):문자열의 길이를 리턴
SELECT first_name,LENGTH(FIRST_NAME)
FROM employees;

--instr 함수(문자열,찾는문자m,순서n):문자열에서 찾는 문자의 위치를 리턴
--m은 검사시작 우치,n은 찾는 횟수
SELECT first_name,
 instr(first_name,'e'),
  instr(first_name,'e',1,2)--처음부터 검사하고 두번쨰 'e'의 위치
FROM employees;

--lpad,rpad(문자열,자릿수,'문자'):특정 문자로 앞뒤에 넣는다.
SELECT employee_id,first_name,salary,
    lpad(salary,10,'#'),rpad(salary,10,'*')
FROM employees;

--replace함수(문자열,'문자','바꿀문자'):특정 문자나 문자열을 교체
SELECT employee_id,first_name,
 replace(first_name,'a','*')--FIRST_NAME A대신 *로 교체
FROM employees;

SELECT employee_id,first_name,
 replace(first_name,'en','#')--FIRST_NAME A대신 *로 교체
FROM employees;

--듀얼 테이블 : 임시테이블(결과를 출력하고 싶은데 임시 테이블을 사용 행이1)
select 10*20 from dual;

--TRIM함수: 접두어나 접미어를 잘라낸다.
SELECT TRIM('H' FROM 'HelloWorld')
FROM DUAL;

SELECT TRIM(' 'FROM 'HelloWorld')--공백을 잘라낸다.
FROM DUAL;

--예제1
SELECT last_name,email,UPPER(last_name),LOWER(LAST_NAME),INITCAP(email)
FROM employees;
--예제1강사님이 푼 문제
SELECT last_name,LOWER(LAST_NAME),UPPER(last_name),email,INITCAP(email)
FROM employees;


--예제2
SELECT JOB_ID,
SUBSTR(JOB_ID,1,2)
FROM employees;

--숫자형 함수
--ROUND:반올림
SELECT ROUND(15.193,1)AS 소수첫째,--둘째자리 9에서 반올림 15.2
ROUND(15.193,0) AS 정수,--소수첫째자리에서 반올림
ROUND(15.193,-1) AS "10의 자리"--10의 자리 5에서 반올림 20
FROM DUAL;

--TRUNC:버림
SELECT
TRUNC(15.193,1)AS 소수첫째,--둘째자리 9에서 버림 
TRUNC(15.193,0) AS 정수,--소수첫째자리에서 버림
TRUNC(15.193,-1) AS "10의 자리"--10의 자리 5에서 버림
FROM DUAL;

--ID가 짝수번쨰 직원들을 출력한다. MOD
SELECT employee_id,LAST_NAME
FROM employees
WHERE MOD(employee_id,2)=0--2로 나눈 나머지가 0이면 짝수이다.1이면 홀수
ORDER BY EMPLOYEE_ID;






--예제1
SELECT salary,
ROUND(SALARY/30,0) AS  정수,
ROUND(SALARY/30,1) AS 소수첫째,
ROUND(SALARY/30,-1) AS "10의 자리"
FROM employees
ORDER BY salary DESC;

--날짜형 함수
SELECT 
ROUND(SYSDATE, 'DD')일,--SYSDATE현재 날짜,일 반올림, now 6월3일13시-->6월4일
ROUND(SYSDATE, 'MM')월,--6월3일=>6월1일(월은 반올림 안되고, 날이 초기화)
ROUND(SYSDATE, 'YYYY')년도,--1년은 12개월6월이라서 2021년이고 뒷자리 초기화되어서 01/01
MONTHS_BETWEEN('2017-10-10','2017-07-10')월차이,
ADD_MONTHS('2017-07-10',3)애드먼쓰--7월에 3개월 더해서 10/10
FROM DUAL;

--sysdate는 현재 날짜와 시간을 나타낸다.
SELECT sysdate from dual;

--날짜연산
select sysdate -1 as 어제, sysdate as 오늘, sysdate+1 내일
from dual;

--90번 부서의 직원들의 현재까지의 근무일수
select last_name,TRUNC(SYSDATE-HIRE_DATE)AS 근무일수--현재날짜에서 고용날짜 뺀거이다.TRUNC를 쓴이유는 날짜와날짜를 빼면 일수가 나오는데 현재시각과 HIRE-DATE의 시각이 맞지않기 때문에 소수점이 나온다. 그래서 버림
FROM employees
WHERE department_id=90;

--예제1 
SELECT SYSDATE,HIRE_DATE,MONTHS_BETWEEN(SYSDATE ,HIRE_DATE) 
FROM employees
WHERE DEPARTMENT_ID=100;
--예제2
SELECT HIRE_DATE,ADD_MONTHS(hire_date,3),ADD_MONTHS(HIRE_DATE,-3)
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 106;

--TO_CHAR숫자형 함수
SELECT TO_CHAR(12345678,'999,999,999')AS 콤마--9는 숫자 세자리씩 들어간다라는 예
FROM DUAL;

SELECT TO_CHAR(123.45678,'999,999.99')AS 소수점
FROM DUAL;

SELECT TO_CHAR(12345678,'$999,999,999')AS 달러
FROM DUAL;

SELECT TO_CHAR(12345678,'L999,999,999')AS 로컬통화
FROM DUAL;

--TO_CHAR 날짜를 문자로 변환
--년 월 일시 분초
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') AS 현재날짜
FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') AS 현재날짜
FROM DUAL;



--HH24:MI:SS현재시간 분초
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS 현재날짜
FROM DUAL;

--365일중 몇일
SELECT TO_CHAR(SYSDATE,'DDD') AS 몇일
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'IW') AS 몇주
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'MONTH') AS 달
FROM DUAL;

--예제1
 SELECT employee_id,
 to_char(hire_date,'MM/DD')
 FROM employees
 WHERE DEPARTMENT_ID=100;
  --예제2
  SELECT last_name,
  to_char(salary,'$999,999.00')--소수점은 .으로 표시할것
  FROM employees
  where salary>10000;
  
  --문자를 날짜로 변환
  --TO_DATE
  SELECT TO_DATE('2011-01-01','YYYY-MM-DD')--2011-01-01 문자열을 날짜로 바꾼다.
  FROM DUAL;
  
  --문자를 숫자로 변환
  --TO_NUMBER
  SELECT TO_NUMBER('100')+100
  FROM DUAL;
  

