--11번 직원번호가 7698보다 작거나 같은 사람들의 직원번호와 이름을 출력하라.
select deptno,ename,empno
from emp
where empno<=7698;
--12번입사일이 81/04/02 보다 같거나 늦고 82/12/09 보다 같거나 빠른 사원의 이름,월급, 부서번호를 출력하라.
select ename,sal,deptno
from emp
where hiredate>='81/04/02' and hiredate<='82/12/09';
--13번급여가 $1,600보다 크고 $3,000보다 작은 직원의 이름, 직업, 급여를 출력하라.
SELECT ename,job,sal
FROM emp
where sal>1600 and sal<3000;
--14번직원번호가 7654와 7782 사이 이외의 직원의 모든 정보를 출력하라. 
SELECT empno,ename,job,mgr,hiredate,sal,comm,deptno
FROM emp
where empno  not between 7654 and 7782;
--15번이름이 B와 J 사이의 모든 직원의 정보를 출력하라.
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where ename BETWEEN 'B' AND 'J';
--16번 입사일이 81년 이외에 입사한 직원의 모든 정보를 출력하라.
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE NOT HIREDATE  BETWEEN '81/01/01'AND '81/12/31';
--17번직업이 MANAGER이거나 SALESMAN인 직원의 모든 정보를 출력하라.
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE  JOB IN('MANAGER','SALESMAN');
--18번부서번호가 20, 30번을 제외한 모든 직원의 이름, 사원번호, 부서번호를 출력하라.
SELECT EMPNO,ENAME,DEPTNO
FROM EMP
WHERE  DEPTNO  NOT LIKE '%20%' AND DEPTNO NOT LIKE'%30%';
--19번이름이 S로 시작하는 직원원의 사원번호, 이름, 입사일, 부서번호를 출력하라.
SELECT EMPNO,ENAME,HIREDATE,DEPTNO
FROM EMP
WHERE ENAME LIKE 'S%';
--20번입사일이 81년도인 사람의 모든 정보를 출력하라
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE HIREDATE LIKE '%81%';