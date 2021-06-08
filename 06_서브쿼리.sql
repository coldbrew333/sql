--서브쿼리:서브쿼리는 SELECT문(메인쿼리)에 포함되어 있는 또하나의 별도 SELECT문이다.

--단일행 서브쿼리: 서브쿼리에서 오직 하나의 행만 반환, 연산자(=,>,<,!=,<>)등 사용
--Popp이름의 직원보다 고용일자가 큰(최근의) 직원들을 출력하라
--popp의 직원고용일자 검색->고용일자 보다 큰 직원들 출력(popp직원의 고용 일자 모름)
SELECT last_name 이름, hire_date 고용일자
FROM employees
where hire_date>(select hire_date from employees where last_name='Popp');
--단일행 서브쿼리는 한줄만 결과가 나와야하는데 여러개가 결과나옴(smith라는 사람이 두명이상 존재)

--여러개의 서브쿼리 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE job_id =    ( SELECT job_id
                    FROM   employees
                    WHERE last_name = 'Chen')
                    
    AND salary >  ( SELECT salary
                    FROM   employees
                    WHERE last_name = 'Chen');
--집계(그룹)함수를 사용한 서브쿼리
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary =    ( SELECT min(salary)
                    FROM employees);
--예제1
SELECT last_name,salary
FROM employees
where salary>(select salary from employees where last_name='Abel');
--예제2
SELECT employee_id,last_name,department_id,salary
FROM employees
where department_id=(select department_id from employees where last_name='Bull')
and salary>(select salary from employees where last_name='Bull');
--예제3
SELECT last_name 이름,salary 급여,manager_id 매니저
FROM employees
where manager_id=(select employee_id from employees where last_name='Russell');
--예제4
SELECT*
FROM employees
where job_id=(select job_id from jobs where job_title='Stock Manager');

--다중행 서브쿼리
--서브쿼리의 결과가 여러개의 행으로 나올때
--연산자를 단일행과 같이 쓸수 없다.(=,>,<부등호 사용불가)==>IN, ANY,ALL등 여러개의 값에 쓰는 연산자 사용

--부서별 최소 월급 출력
SELECT  MIN(SALARY)
FROM employees
GROUP BY DEPARTMENT_ID;

--위의 부서별 최저월급을 서브쿼리로 사용
--부서별 최저월급을 받는 사람들이 출력된다.
SELECT employee_id 직원번호,last_name 이름
FROM EMPLOYEES
WHERE salary IN (SELECT  MIN(SALARY)
                             FROM employees
                             GROUP BY DEPARTMENT_id);
--ANY와 ALL연산자는  IN과는 다르게 앞에 비교 연산자가 붙는다.
--ANY연산자: 서브쿼리 결과중 하나라도 만족하면된다.OR
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE SALARY <ANY (SELECT  salary
                                         FROM employees
                                         where job_id='IT_PROG')-->(9000보다 작은 값들이 모두 출력된다) 
                                         --서브쿼리 결과중 하나라도 만족하면 된다
and job_id != 'IT_PROG';    


--ALL연산자
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary <ALL (SELECT  salary
                                         FROM employees
                                         where job_id='IT_PROG')--서브쿼리 결과를 전부 다 만족해야 한다.
and job_id != 'IT_PROG';    

DELETE FROM employees WHERE SALARY  IS NULL;--SALARY에 널값이 있었음..


SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

--예제1 부서번호(department_id)가  20번인 직원들의 매니저아이디(manager_id)와 같은 매니저를 가지는  직원들을 출력하라. (단 20번 부서의 직원은 제외!)


SELECT employee_id 직원이름,first_name 이름,job_id 직종,SALARY 급여
FROM employees
WHERE manager_id IN(SELECT manager_id
                                        FROM employees
                                        WHERE DEPARTMENT_ID=20)--서브쿼리로 20번부서의 매니저ID 를 반환(20번부서와 같은 매니저 아이디 찾기)
AND DEPARTMENT_ID !=20;--20번부서는 제외

--예제2  job_id가  'ST_MAN'인 직원들중 어느 한직원 보다도 급여가 작은  직원들을 출력하라. (ANY)
SELECT employee_id,LAST_NAME,JOB_ID,SALARY
FROM EMPLOYEES
WHERE SALARY < ANY (SELECT SALARY
                                          FROM EMPLOYEES
                                          WHERE JOB_ID='ST_MAN')--직종이 ST_MAN 의 월급중 하나라도 작으면 만족
AND JOB_ID!='ST_MAN';--ST_MAN은 제외                                          
--예제3 직책이 'IT_PROG' 인 직원들 보다 급여가 작은 직원들을 출력하시오.(ALL)
SELECT employee_id,LAST_NAME,JOB_ID,SALARY
FROM EMPLOYEES
WHERE salary<ALL(SELECT salary
                                  FROM EMPLOYEES
                                  WHERE JOB_ID='IT_PROG')--직종 IT_PROG보다 월급이 작은 직원(모두 만족)할때
 AND JOB_ID!='IT_PROG';--IT_PROG제외            
 
 --다중열 서브쿼리:서브쿼리 결과가 2개 이상의 열로 반환됨(where 절에도 1:1 대응)
 --Bruce 직업과 매니저가 같은 사람 
 SELECT employee_id,first_name,job_id,salary,manager_id
 FROM EMPLOYEES
 WHERE (MANAGER_ID,JOB_ID)IN (SELECT MANAGER_ID,JOB_ID
                                                            FROM EMPLOYEES
                                                            WHERE first_name ='Bruce')
AND first_name != 'Bruce';--브루스는 제외    

--부서별 최소급여 받는 사원의 정보 검색
SELECT department_id 부서번호,employee_id 직원번호, first_name 이름, salary 월급
FROM employees
where (department_id,salary)IN(     SELECT department_id,MIN(SALARY)
                                                           FROM EMPLOYEES
                                                           GROUP BY department_id)--부서별로 최소급여 서브쿼리
order by department_id;--부서별 오름차순


--예제1  employees 테이블에서 job_id별로 가장 낮은 salary가 얼마인지 찾아보고, 
--찾아낸 job_id별 salary에 해당하는 직원의 first_name, job_id, salary, department_id 를 출력하시오. (salary 내림차순 정렬)
SELECT first_name 이름,job_id 직업,salary 월급,department_id 부서번호
FROM employees
where(job_id,salary)in (select job_id,min(salary)
                                        from employees
                                        GROUP BY  job_id)--직업별 최소급여 서브쿼리
                                        --group by 는 특정 열 또는 데이터를 기준으로 데이터를 그룹으로 묶는다.
order by salary DESC;--월급 내림차순
