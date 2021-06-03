--테이블의 모든 데이터 가져오기
select*from employees;


--WHERE 절에 가져올 행을 선택해보자
--위치는 FROM 아래에 작성
SELECT *
FROM employees
WHERE DEPARTMENT_ID = 90;--부서번호가 90인 직원들만 출력

SELECT*
FROM employees
WHERE salary =24000;--월급이 24000인 직원들만 출력

/*WHERE절 주의:
   문자와 날짜(DATE)는 한 따옴표('')를 사용한다.
   문자는 대소문자를 구별한다.
   날짜는 날짜포맷에 맞춰서 작성한다.
*/

--WHERE + 문자열 
SELECT*
FROM employees
WHERE first_name ='Steven'; --한 따옴표(쌍 따옴표 x, 한따옴표 없는것도 x)

SELECT*
FROM employees
WHERE first_name ='steven'; --결과가 없음 대소문자 구분하기 때문에....

--WHERE+날짜
SELECT*
FROM employees
WHERE hire_date = '2003-06-17';--날짜( '2003-06-17','03/06/17'),'년도/달/날'

--비교연산자
SELECT*
FROM employees
WHERE salary>=10000;--월급이 만달러 이상

SELECT*
FROM employees
WHERE hire_date>='2007-07-07';--2007년 7월7일 이후에 고용한 직원들

SELECT*
FROM employees
WHERE first_name>'F';--이름이 알파벳 F보다 큰 사람


--예제1
SELECT*
FROM employees
where employee_id=100;

--예제2
SELECT*
FROM employees
where first_name='David';

--예제3
SELECT*
FROM employees
where employee_id<=105;

--예제4
SELECT*
FROM job_history
where start_date>='2006/03/03';

--예제5
SELECT*
FROM departments
where location_id !=1700;

SELECT*
FROM departments
where location_id <>1700;--<>, !=같지 않다.


--논리 연산자 AND OR NOT
SELECT last_name,department_id,salary
FROM employees
where department_id = 60 OR (department_id=80 AND salary>10000);

--예제1
SELECT*
FROM employees
WHERE salary>4000 AND JOB_ID='IT_PROG';

--예제2
SELECT  *
FROM EMPLOYEES
WHERE salary>4000 AND(JOB_ID='IT_PROG' OR JOB_ID='FI_ACCOUNT');

--IN 연산자(OR와 비슷)
SELECT*
FROM employees
WHERE SALARY = 4000 OR salary =3000 OR SALARY =2700;--월급이 4000또는 3000또는 2700인 직원들

SELECT  *
FROM employees
WHERE SALARY IN(4000,3000,2700);--위의 OR와 같다.

SELECT  *
FROM employees
WHERE SALARY NOT IN(4000,3000,2700);--NOT IN =>아닌경우

--예제1
SELECT
    *
FROM employees
WHERE  salary IN(10000,17000,24000);

--예제2
SELECT
    *
FROM employees
WHERE DEPARTMENT_ID NOT IN(30,50,80,100,110);


--BETWEEN 연산자(AND 대신 사용가능)
SELECT *
FROM employees
WHERE SALARY >=9000 AND SALARY <=10000;--월급이 9000이상 10000이하

SELECT *
FROM employees
WHERE SALARY BETWEEN 9000 AND 10000;--최소 최대값 포함

--예제1
SELECT
    *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--예제2
SELECT*
FROM employees
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-30';--오류난 이유;day에 한따옴표 넣지 않음

--예제3
SELECT*
FROM employees
WHERE salary <7000 OR SALARY >17000;--내가푼 풀이

SELECT*
FROM employees
WHERE salary not between 7000 and 17000;--NOT BETWEEN AND풀이

--Like  연산자 +%(모든 문자가능),_(한문자)
SELECT*FROM employees
where last_name LIKE '%B';--대문자 B로 시작한다.

SELECT*FROM employees
WHERE last_name LIKE '%b';--소문자 b로 시작한다.


--SELECT*FROM employees
where last_name LIKE '_y'--이름의 마지막에 y가 올 경우
예제1
SELECT*FROM employees
where job_id LIKE %AD%;-- AD포함이면 조회

예제2
SELECT*FROM employees
where job_id LIKE '%AD_';--AD 뒤에 문자열 3자리 _3번

예제3
SELECT*FROM employees
where phone_number LIKE '%1234';--1234로 끝나는 경우

예제 4
SELECT*FROM employees
where phone_number not like '%3%'--3이 포함되지 않는다
and phone_number like '%9';--9로 끝난다.

예제5
select*from employees
where job_id lke '%MGR%'
OR JOB_ID LIKE '%ASST%'--MGR포함 또는 ASST포함

--널연산자 is null ,is not null
select*from employees
where commission_pct IS NULL;--커미션이 널값인 경우에만 출력

select*from employees
where commission_pct IS NOT NULL;--커미션이 널값이 아닌경우

예제1
select*from employees
where manager_id is null;--매니저 id가 널값인경우

--order by정렬
 SELECT*FROM employees
 order by hire_date;--날짜가 작은 순으로 출력(EX.01/01/01)
 
 SELECT*FROM employees
 order by hire_date DESC;--날짜가 큰순으로 출력(EX08/02/01)

SELECT*FROM employees
order by last_name DESC;--라스트 네임이 알파벳 끝순(Z)부터

SELECT
    *
FROM employees 
ORDER BY salary DESC;--월급이 가장 큰순으로 출력

--oder by뒤에 열이 2개 이상일때(여러 열을 정렬)
--테이블의 모든 데이터 가져오기
select*from employees;


--WHERE 절에 가져올 행을 선택해보자
--위치는 FROM 아래에 작성
SELECT *
FROM employees
WHERE DEPARTMENT_ID = 90;--부서번호가 90인 직원들만 출력

SELECT*
FROM employees
WHERE salary =24000;--월급이 24000인 직원들만 출력

/*WHERE절 주의:
   문자와 날짜(DATE)는 한 따옴표('')를 사용한다.
   문자는 대소문자를 구별한다.
   날짜는 날짜포맷에 맞춰서 작성한다.
*/

--WHERE + 문자열 
SELECT*
FROM employees
WHERE first_name ='Steven'; --한 따옴표(쌍 따옴표 x, 한따옴표 없는것도 x)

SELECT*
FROM employees
WHERE first_name ='steven'; --결과가 없음 대소문자 구분하기 때문에....

--WHERE+날짜
SELECT*
FROM employees
WHERE hire_date = '2003-06-17';--날짜( '2003-06-17','03/06/17'),'년도/달/날'

--비교연산자
SELECT*
FROM employees
WHERE salary>=10000;--월급이 만달러 이상

SELECT*
FROM employees
WHERE hire_date>='2007-07-07';--2007년 7월7일 이후에 고용한 직원들

SELECT*
FROM employees
WHERE first_name>'F';--이름이 알파벳 F보다 큰 사람


--예제1
SELECT*
FROM employees
where employee_id=100;

--예제2
SELECT*
FROM employees
where first_name='David';

--예제3
SELECT*
FROM employees
where employee_id<=105;

--예제4
SELECT*
FROM job_history
where start_date>='2006/03/03';

--예제5
SELECT*
FROM departments
where location_id !=1700;

SELECT*
FROM departments
where location_id <>1700;--<>, !=같지 않다.


--논리 연산자 AND OR NOT
SELECT last_name,department_id,salary
FROM employees
where department_id = 60 OR (department_id=80 AND salary>10000);

--예제1
SELECT*
FROM employees
WHERE salary>4000 AND JOB_ID='IT_PROG';

--예제2
SELECT  *
FROM EMPLOYEES
WHERE salary>4000 AND(JOB_ID='IT_PROG' OR JOB_ID='FI_ACCOUNT');

--IN 연산자(OR와 비슷)
SELECT*
FROM employees
WHERE SALARY = 4000 OR salary =3000 OR SALARY =2700;--월급이 4000또는 3000또는 2700인 직원들

SELECT  *
FROM employees
WHERE SALARY IN(4000,3000,2700);--위의 OR와 같다.

SELECT  *
FROM employees
WHERE SALARY NOT IN(4000,3000,2700);--NOT IN =>아닌경우

--예제1
SELECT
    *
FROM employees
WHERE  salary IN(10000,17000,24000);

--예제2
SELECT
    *
FROM employees
WHERE DEPARTMENT_ID NOT IN(30,50,80,100,110);


--BETWEEN 연산자(AND 대신 사용가능)
SELECT *
FROM employees
WHERE SALARY >=9000 AND SALARY <=10000;--월급이 9000이상 10000이하

SELECT *
FROM employees
WHERE SALARY BETWEEN 9000 AND 10000;--최소 최대값 포함

--예제1
SELECT
    *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--예제2
SELECT*
FROM employees
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-30';--오류난 이유;day에 한따옴표 넣지 않음

--예제3
SELECT*
FROM employees
WHERE salary <7000 OR SALARY >17000;--내가푼 풀이

SELECT*
FROM employees
WHERE salary not between 7000 and 17000;--NOT BETWEEN AND풀이

--Like  연산자 +%(모든 문자가능),_(한문자)
SELECT*FROM employees
where last_name LIKE '%B';--대문자 B로 시작한다.

SELECT*FROM employees
WHERE last_name LIKE '%b';--소문자 b로 시작한다.


SELECT*FROM employees
where last_name LIKE '_y';--이름의 마지막에 y가 올 경우

예제1
SELECT*FROM employees
where job_id LIKE %AD%;-- AD포함이면 조회

예제2
SELECT*FROM employees
where job_id LIKE '%AD_';--AD 뒤에 문자열 3자리 _3번

예제3
SELECT*FROM employees
where phone_number LIKE '%1234';--1234로 끝나는 경우

예제 4
SELECT*FROM employees
where phone_number not like '%3%'--3이 포함되지 않는다
and phone_number like '%9';--9로 끝난다.

예제5
select*from employees
where job_id lke '%MGR%'
OR JOB_ID LIKE '%ASST%'--MGR포함 또는 ASST포함

--널연산자 is null ,is not null
select*from employees
where commission_pct IS NULL;--커미션이 널값인 경우에만 출력

select*from employees
where commission_pct IS NOT NULL;--커미션이 널값이 아닌경우

예제1
select*from employees
where manager_id is null;--매니저 id가 널값인경우

--order by정렬
SELECT department_id,employee_id,first_name,last_name
FROM employees
order by department_id,employee_id;--콤마(,)로 분리,같은 값이 있을경우 뒤의 조건을 보고 정렬한다.

--계산하는 열의 별칭으로  정렬
SELECT department_id,last_name,salary*12 AS 연봉--월급*12=>연봉(열)
FROM employees
ORDER BY 연봉 DESC;

--예제1
SELECT employee_id,FIRST_NAME,last_name
FROM employees
ORDER BY employee_id DESC;

--예제2
SELECT
    *
FROM employees
WHERE job_id like '%CLERK%'
ORDER BY salary DESC;--oder by는 가장 마지막에 위치(조건 where절 아래)

--예제3(내가 풀음)
SELECT employee_id,department_id,salary
FROM employees
WHERE employee_id>=120 AND employee_id<=150
ORDER BY department_id ,salary DESC;
--예제3(강사님이 풀음)
SELECT employee_id,department_id,salary
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC ,salary DESC;
