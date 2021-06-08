--집합연산자
--UNION을 이용한 합 집합:같은 행은 삭제한다.
SELECT employee_id,job_id
FROM employees--데이터107
UNION --교집합 같은 행은 삭제 total 115개 나옴(원래는 107+10=117)
SELECT employee_id,job_id
FROM job_history;--데이터 10

--UNION ALL을 이용한 합집합:같은행이 있어도 더한다.
SELECT employee_id,job_id
FROM employees--데이터107
UNION ALL--원래는 107+10=117 이지만 , 같은행도 모두 출력이기 때문에 118
SELECT employee_id,job_id
FROM job_history;--데이터 10

--교집합 INTERSECT(첫번째 셀렉트문과 두번째 셀렉트의 같은행 출력)
SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history;


--차집합 MINUS(첫번째 셀렉트문에서 두번째를 뺀 결과)
SELECT employee_id,job_id
FROM employees
MINUS--첫번째 셀렉트문 데이터107개중에서 두번째 셀렉트문과 같은거 뺀결과
SELECT employee_id,job_id
FROM job_history;

--예제1) ?employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을 UNION 연산자를 이용해 합쳐 보세요.
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;


--예제2employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합을 UNION ALL연산자를 이용해 합쳐 보세요.
SELECT department_id
FROM employees
UNION all
SELECT department_id
FROM departments;

--예제3employees 테이블의 department_id 집합과 departments 테이블의 department_id 집합의 교집합을 INTERSECT 연산자를 이용해 출력해 보세요.
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--예제4 departments 테이블의 department_id 집합에서 employees 테이블의 department_id 집합을 MINUS 연산자를 이용해 빼 보세요.
--부서테이블에는 있으나 직원 테이블에서 사용이 안된 부서번호
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;

--트랜젝션




