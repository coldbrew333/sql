--scott��������
--1�� �μ���ȣ�� 10���� �μ��� ��� �� �����ȣ, �̸�, ������ ����϶�
select empno,ename,sal 
from emp
where deptno=10;
--2�� �����ȣ�� 7369�� ��� �� �̸�, �Ի���, �μ���ȣ�� ����϶�.
SELECT ename,hiredate,deptno
FROM emp
where empno=7369;
--3���̸��� ALLEN�� ����� ��� ������ ����϶�.
select empno, ename, job, mgr,hiredate,sal,comm,deptno
from emp
where ename='ALLEN';
select *--������� Ǯ�� �Ѱ�.
from emp
where ename='ALLEN';
--4�� �Ի����� 81/02/20�� ����� �̸�, �μ���ȣ, ������ ����϶�.
SELECT ENAME,DEPTNO,SAL
FROM emp
WHERE HIREDATE='81/02/20';
--5�������� MANAGER�� �ƴ� ����� ��� ������ ����϶�.
SELECT empno,ename,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE JOB!='MANAGER';--<>�� �ȴ�(�ƴϴ�.)
--6���Ի����� 81/04/02 ���Ŀ� �Ի��� ����� ������ ����϶�.
SELECT EMPNO,ENAME,JOB,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE HIREDATE>='81/04/02';
SELECT *
FROM emp
WHERE HIREDATE>='81/04/02';
--7�� �޿��� $800 �̻��� ����� �̸�, �޿�, �μ���ȣ�� ����϶�.
SELECT ENAME,SAL,DEPTNO
FROM emp
WHERE SAL>=800;
--8�� �μ���ȣ�� 20�� �̻��� ����� ��� ������ ����϶�.
SELECT EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE DEPTNO>=20;
SELECT*
FROM emp
WHERE DEPTNO>=20;
--9�� �̸��� K�� �����ϴ� ������� ���� �̸��� ���� ����� ��� ������ ����϶�.
--(���ڿ� �񱳽� ���ĺ������� ö�� �� �� 'B'>'A')
SELECT*
FROM emp
WHERE ename>='L';--�ڷ� ������ ���ĺ��� Ŀ��.
--10���Ի����� 81/12/09 ���� ���� �Ի��� ������� ��� ������ ����϶�.
SELECT EMPNO, ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO
FROM emp
WHERE HIREDATE<'81/12/09';