--11�� ������ȣ�� 7698���� �۰ų� ���� ������� ������ȣ�� �̸��� ����϶�.
select deptno,ename,empno
from emp
where empno<=7698;
--12���Ի����� 81/04/02 ���� ���ų� �ʰ� 82/12/09 ���� ���ų� ���� ����� �̸�,����, �μ���ȣ�� ����϶�.
select ename,sal,deptno
from emp
where hiredate>='81/04/02' and hiredate<='82/12/09';--betwwen and ��밡��
--13���޿��� $1,600���� ũ�� $3,000���� ���� ������ �̸�, ����, �޿��� ����϶�.
SELECT ename,job,sal
FROM emp
where sal>1600 and sal<3000;
--14��������ȣ�� 7654�� 7782 ���� �̿��� ������ ��� ������ ����϶�. 
SELECT *
FROM emp
where empno  not between 7654 and 7782;
SELECT *
FROM emp
where empno <7654 or empno>7782;
SELECT *
FROM emp
where  not (empno>=7654 and empno <=7782);
--15���̸��� B�� J ������ ��� ������ ������ ����϶�.
select empno,ename,job,mgr,hiredate,sal,comm,deptno
from emp
where ename BETWEEN 'B' AND 'J';
SELECT*
FROM EMP
WHERE ename>='B' AND ename <='J';
--16�� �Ի����� 81�� �̿ܿ� �Ի��� ������ ��� ������ ����϶�.
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE NOT HIREDATE  BETWEEN '81/01/01'AND '81/12/31';

--16�� ��� Ǯ������ �����
--17�������� MANAGER�̰ų� SALESMAN�� ������ ��� ������ ����϶�.
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE  JOB IN('MANAGER','SALESMAN');
--18���μ���ȣ�� 20, 30���� ������ ��� ������ �̸�, �����ȣ, �μ���ȣ�� ����϶�.
SELECT EMPNO,ENAME,DEPTNO
FROM EMP
WHERE  DEPTNO  NOT LIKE '%20%' AND DEPTNO NOT LIKE'%30%';
SELECT EMPNO,ENAME,DEPTNO
FROM EMP
WHERE  DEPTNO  NOT IN(20,30);
--19���̸��� S�� �����ϴ� �������� �����ȣ, �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT EMPNO,ENAME,HIREDATE,DEPTNO
FROM EMP
WHERE ENAME LIKE 'S%';--�ڿ��� ���� �𸣴ϱ� %
--20���Ի����� 81�⵵�� ����� ��� ������ ����϶�
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE HIREDATE LIKE '%81%';
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM EMP
WHERE HIREDATE  BETWEEN '1981-01-01' AND '1981-12-31';
