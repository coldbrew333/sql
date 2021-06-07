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