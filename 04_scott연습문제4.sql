--scott연습문제
--31번부서번호로 ASCENDING SORT한 후 급여가 많은 사람 순으로 출력하라.
--( 한개 이상의 열로 정렬시 콤마(,)를 사용합니다.)
SELECT*
FROM emp
ORDER BY DEPTNO ASC , SAL DESC;
--32번부서번호가 DESCENDING SORT하고, 이름 순으로 ASCENDING SORT 급여 순으로 DESCENDING SORT 하라.
SELECT DEPTNO, ENAME,SAL
FROM EMP
ORDER BY DEPTNO DESC,ename ,SAL DESC;
--33번 10번부서의 모든 직원에게 급여의 13%를 보너스로 지급하기로 하였다. 이름, 급여, 보너스금액, 부서번호를 출력하라
--( 소수점은 반올림함.)
SELECT ename,SAL,ROUND(SAL*0.13)BONUS,DEPTNO
FROM EMP
WHERE DEPTNO=10;
--34번 직원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력하여라.
--(단, 커미션이 null인 사원도 0으로 해서 포함.)
SELECT
    ENAME,SAL,NVL(COMM,0),SAL+NVL(COMM,0)TOTAL
FROM EMP
ORDER BY TOTAL DESC;

--35번급여가 $1,500부터 $3,000 사이의 사원에 대해서만 급여의 15%를 회비로 지불하기로 하였다.
--모든 사원의 이름, 급여, 회비(소수이하 2자리에서 반올림)를 출력하여라.
--(단, 회비는 달러표시$로 시작하고 소수점 1자리까지 출력)
SELECT ENAME,SAL,TO_CHAR(ROUND(SAL*0.15,1),'$999.0')회비
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000;

