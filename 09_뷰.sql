

--단순한 뷰 만들기
--직원테이블에서 필요한 열들을 골라서 뷰로 생성하기
--AS다음의 셀렉트 문의 결과를 EMP_V1이름의 뷰로 만든다.
CREATE VIEW EMP_V1--뷰이름
AS
SELECT employee_id,first_name,last_name,email,hire_date,job_id 
FROM employees;

--뷰이름을 가지고 테이블처럼 사용
SELECT*FROM EMP_V1;

--뷰에 입력하기 ==>실제 테이블이 아니라 뷰가 사용한 테이블 employees에 입력됨
INSERT INTO EMP_V1( employee_id,first_name,last_name,email,hire_date,job_id )
VALUES                        (333, 'David','King','DKING',SYSDATE,'IT_PROG');

--단순뷰 EMP_V2만들기(별칭)-->별칭이 열의 이름이 되었다.
CREATE VIEW EMP_V2
AS
SELECT employee_id 직원번호,first_name 이름,last_name 성, email, hire_date,job_id
FROM employees;

--V2에 입력하기
INSERT INTO EMP_V2(직원번호,이름,성,email,hire_date,job_id)
VALUES                        (334, 'Lara','Craft','Lara',SYSDATE,'IT_PROG');

SELECT*FROM EMP_V2;

--입력한직원 삭제하기
DELETE FROM emp_v2 
WHERE 직원번호=334;--라라 삭제

--열의 이름을 바꿔서 EMP_V3만들기
CREATE VIEW EMP_V3(직원번호,이름,성,이메일,고용일자,직종)
AS
SELECT employee_id 직원번호,first_name 이름,last_name 성, email, hire_date,job_id
FROM employees;

--복잡한뷰만들기,OR REPLACE는 이미 만들어진 뷰나 테이블을 수정
CREATE OR REPLACE VIEW 부서별_직원_보고서
AS
SELECT department_id 부서번호,count(*)직원수,max(salary)최고급여,min(salary)최저급여
                ,AVG(salary)평균급여
FROM employees
GROUP BY department_id;

select*from "부서별_직원_보고서";

--뷰의삭제
DROP VIEW 부서별_직원_보고서;


