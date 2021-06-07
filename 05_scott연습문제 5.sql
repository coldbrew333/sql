--scott연습문제
--36번 사원수가 5명이 넘는 부서의 부서명과 사원수 조회 (조인필요)
--직원테이블만 가지고는 할수없음(부서명을 알수 없기 때문)==>조인필요
SELECT d.dname,count(e.empno)
FROM emp e
join dept d on e.deptno=d.deptno
group by d.dname
having count(e.empno)>5;
--37번 직업별 급여합계가  5000을 초과하는 각 직무에 대해서 직무와  급여 합계를 조회  
-- 단 판매원('SALESMAN')은 제외
SELECT job,sum(sal)급여합계
FROM emp
where job != 'SALESMAN'
GROUP BY JOB
HAVING SUM(SAL)>5000;
--38번  사원들의 사원번호(empno), 사원명(ename), 급여(sal), 급여등급(grade)을 출력하시오.
--(테이블 salgrade 조인 )
SELECT e.empno,e.ename,e.sal,s.grade
FROM emp e
join salgrade s
    on e.sal between s.losal and s.hisal;

--39번 부서별(deptno)로 사원의 수와 커미션(comm)을 받은 사원의 수를 출력하여 보시오
SELECT deptno,count(*)as "사원수",count(comm) as "커미션 받은 사원수"
FROM emp
group by deptno;
--40번 부서번호(deptno)가 10은 '총무부', 20은 '개발부', 30은 영업부'라고 하여 
--이름, 부서번호, 부서명 순으로 출력하여 보시오. (decode 나 case 함수 사용)
SELECT ENAME, DEPTNO,
decode(deptno, 10 ,'총무부',
                20,'개발부',
                30,'영어부'
                )부서명

from emp;





