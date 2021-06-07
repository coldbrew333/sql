--scott 연습문제
--21번문제) 이름 중 S자가 들어가 있는 사람만 모든 정보를 출력하라
select*
from emp
where ename like '%S%';
--22번이름이 M로 시작하고 마지막 글자가 N인 사람의 모든 정보를 출력하라
--(단, 이름은 전체 6자리이다. 자리수를 이용한 와일드카드 '_' 을 이용)
select*
from emp
where ename like'M____N';
--23번이름이 첫 번째 문자는 관계없고, 두 번째 문자가 A인 사람의 정보를 출력하라.
select*
from emp
where ename like '_A%';--하나의 문자가 있다는 것을 알기때문에 언더바 A %
--24번 커미션이 NULL인 사람의 정보를 출력하라.  ( IS NULL 또는 IS NOT NULL 사용) 
SELECT
    *
FROM EMP
WHERE COMM IS NULL;
--25번  커미션이 NULL이 아닌 사람의 모든 정보를 출력하라. ( IS NULL 또는 IS NOT NULL 사용) 
SELECT
    *
FROM EMP
WHERE COMM IS NOT NULL;
--26번부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서 ,월급을 출력하라.
SELECT ENAME, DEPTNO,SAL
FROM EMP
WHERE DEPTNO =30 AND SAL>=1500;
--27번 이름의 첫 글자가 K로 시작하거나 부서번호가 30인 사람의 사원번호, 이름, 부서번호를 출력하라.
SELECT EMPNO,ENAME,DEPTNO
FROM emp
WHERE ename LIKE 'K%' OR DEPTNO =30;
--28번 급여가 $1,500 이상이고 부서번호가 30번인 사원 중 직업이MANAGER인 사람의 정보를 출력하라
SELECT*
FROM emp
where sal>=1500 
and deptno=30
and job='MANAGER';
--29번부서번호가 30인 사람의 모든 정보를 출력하고 직원번호로 SORT(정렬)하라.
SELECT*
FROM emp
WHERE DEPTNO=30
ORDER BY EMPNO;
--30번직원들의 급여가 많은 순으로 SORT(정렬) 하라
SELECT
    *
FROM EMP
order by sal desc;
