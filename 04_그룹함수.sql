--그룹함수 사용하기
--평균,최대값,최소값 합계
SELECT TRUNC(AVG(SALARY)) 평균월급,
MAX(SALARY) 최고값,
MIN(SALARY) 최저값,
SUM(SALARY) 총합계
FROM EMPLOYEES;

--80번부서의 직원들의 평균값을 알고 싶다.
SELECT TRUNC(AVG(SALARY)) 평균월급,--널값제외
MAX(SALARY) 최고값,--널값제외
MIN(SALARY) 최저값,--널값제외
SUM(SALARY) 총합계--널값제외
FROM EMPLOYEES
WHERE DEPARTMENT_ID =80;--80번 부서

--count행의 갯수
SELECT COUNT(*)직원수--(*)의 경우 NULL값도 카운트
FROM employees;

SELECT COUNT(commission_pct)--COMMISSION_PCT의 NULL값 제외시킴
FROM employees;

--80번부서는 몇명?
SELECT COUNT(*) AS 직원수--(*)의 경우 NULL값도 카운트
FROM employees
WHERE DEPARTMENT_ID =80;

--GROUP BY 절로 그룹으로 나누어서 그룹함수를 사용

SELECT department_id 부서번호,  ROUND(AVG(salary))평균급여, COUNT(*)직원수
FROM employees
GROUP BY department_id;--부서 그룹으로 나누기

SELECT employee_id, department_id 부서번호,  ROUND(AVG(salary))평균급여, COUNT(*)직원수
--부서별로 나누었기 때문에, EMPLOYEE_ID가 들어가면 안된다.
FROM employees
GROUP BY department_id;--부서 그룹으로 나누기

--예제1
SELECT department_id  부서명,
COUNT (*) 사원수,
MAX(SALARY)최고급여,
MIN(SALARY)최소급여,
SUM(SALARY)급여합계,
ROUND(AVG(SALARY)) 평균급여
FROM employees
GROUP BY DEPARTMENT_ID
ORDER  BY 급여합계 DESC;

--예제2(그룹을 세번해야한다.)
SELECT DEPARTMENT_ID 부서번호,
JOB_ID 직업,
MANAGER_ID 상사번호,
SUM(salary) 월급합계,
COUNT(*) 직원수
FROM employees
GROUP BY DEPARTMENT_ID,JOB_ID,MANAGER_ID
ORDER BY DEPARTMENT_ID;

--예제3
SELECT
ROUND(AVG(MAX(SALARY))),
AVG(MIN(SALARY))
FROM employees
GROUP BY DEPARTMENT_ID;

--그룹의 조건절 HAVING

SELECT department_id 부서번호,COUNT(*)직원수 --열이름,그룹함수(열이름)
FROM employees --테이블
GROUP BY DEPARTMENT_ID --그룹명
HAVING COUNT(*)>5; --그룹조건, 5보다 큰곳만 출력

--예제1
SELECT job_id 직종,
SUM(SALARY) 급여합계
FROM employees
where  job_id != 'AC_MGR' 
group by job_id
HAVING AVG(SALARY)>10000
ORDER BY 급여합계 DESC;
--예제2
SELECT
department_id 부서 번호,
ROUND(AVG(SALARY))  평균급여
FROM EMPLOYEES
WHERE DEPARTMNET_ID != 40
group by department_id
HAVING ROUND(AVG(SALARY))<=7000;

--예제3
SELECT
job_id  직종,
sum(salary) 급여총액
FROM employees
WHERE JOB_ID NOT LIKE '%REP%'
GROUP BY JOB_ID
HAVING SUM(salary)>=13000
ORDER BY 급여총액 DESC;




