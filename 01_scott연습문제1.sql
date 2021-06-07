--scott연습문제
--1번 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라
select empno,ename,sal 
from emp
where deptno=10;
--2번 사원번호가 7369인 사람 중 이름, 입사일, 부서번호를 출력하라.
SELECT ename,hiredate,deptno
FROM emp
where empno=7369;
--3번이름이 ALLEN인 사람의 모든 정보를 출력하라.
select empno, ename, job, mgr,hiredate,sal,comm,deptno
from emp
where ename='ALLEN';
select *--강사님이 풀이 한것.
from emp
where ename='ALLEN';
--4번 입사일이 81/02/20인 사원의 이름, 부서번호, 월급을 출력하라.
SELECT ENAME,DEPTNO,SAL
FROM emp
WHERE HIREDATE='81/02/20';
--5번직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라.
SELECT empno,ename,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE JOB!='MANAGER';--<>도 된다(아니다.)
--6번입사일이 81/04/02 이후에 입사한 사원의 정보를 출력하라.
SELECT EMPNO,ENAME,JOB,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE HIREDATE>='81/04/02';
SELECT *
FROM emp
WHERE HIREDATE>='81/04/02';
--7번 급여가 $800 이상인 사람의 이름, 급여, 부서번호를 출력하라.
SELECT ENAME,SAL,DEPTNO
FROM emp
WHERE SAL>=800;
--8번 부서번호가 20번 이상인 사원의 모든 정보를 출력하라.
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE DEPTNO>=20;
SELECT*
FROM emp
WHERE DEPTNO>=20;
--9번 이름이 K로 시작하는 사람보다 높은 이름을 가진 사람의 모든 정보를 출력하라.
--(문자열 비교시 알파벳순으로 철자 비교 예 'B'>'A')
SELECT*
FROM emp
WHERE ename>='L';--뒤로 갈수록 알파벳이 커짐.
--10번입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.
SELECT EMPNO, ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE HIREDATE<'81/12/09';