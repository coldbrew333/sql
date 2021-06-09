--1. EMP ���̺��� ����(���� �̸�, �� ��밡�� �� ������Ÿ��)�� Ȯ���ϴ� ��ɹ��� �ۼ��ϼ���.
DESC EMP;
--2.EMP ���̺��� �μ���ȣ(DEPTNO) �� ���� 30�̰� ����(JOB) �� ���� SALESMAN�� �����͸� ��µǵ��� ��ȸ�ϴ� ������ �ۼ��ϼ���.

SELECT deptno �μ���ȣ,job ����
FROM emp
WHERE DEPTNO=30 AND job='SALESMAN';          
--3.EMP ���̺��� �޿�(SAL) �� ���� 2000 �̻� 3000 ������ ��� �����͸� ��ȸ�ϴ� SQL���� �ۼ��ϼ���.  
SELECT*
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

--4.EMP ���̺��� �� ������ ���� �����ʹ� ���� �� EMP_TEMP ���̺��� �����ϴ� SQL���� �ۼ��ϼ���.
CREATE TABLE EMP_TEMP
AS
SELECT*
FROM emp
WHERE 1 !=1;

SELECT*
FROM emp_temp;

--5.EMP_TEMP ���̺� ȫ�浿 ����� �߰� �մϴ�.
--�����ȣ(EMPNO)�� 9999, ����̸�(ENAME)�� ȫ�浿, ��å(JOB)�� PRESIDENT, ���ӻ��(MGR)�� NULL��, �������(HIREDATE)�� 2001�� 1�� 1��, �޿�(SAL)�� 5000, �߰� ����(COMM)�� 1000, �μ� ��ȣ(DEPTNO)�� 10���� �����͸� �߰��ϴ� SQL���� �ۼ��Ͽ� �Է��ϼ���.

INSERT INTO EMP_TEMP VALUES (9999,'ȫ�浿','PRESIDENT',NULL,'2001-01-01',5000,1000,10);

--6.DEPT ���̺��� �����ؼ� DEPT_TEMP2 ���̺��� �����ϴ� SQL���� �ۼ��ϼ���.
CREATE TABLE DEPT_TEMP2
AS
SELECT*
FROM DEPT;

SELECT *
FROM dept_temp2;

--7.DEPT_TEMP2 ���̺��� 40�� �μ�(DEPTNO)�� �μ��̸�(DNAME)�� DATABASE�� �����ϰ� ����(LOC)�� SEOUL�� �����ϴ� SQL���� �ۼ��ϼ���. (����� ĸ���Ͽ� �ٿ� �ֽ��ϴ�.)
UPDATE DEPT_TEMP2
SET DNAME='DATABASE',LOC='SEOUL'
WHERE DEPTNO=40;


SELECT *
FROM dept_temp2;


--8.���̺� �� �ุ �����ؾ� �ϴµ� �߸��ؼ� ��ü ���� ������ ���ȴ�. �̶� Ʈ������� ����ϴ� ��ɾ �ۼ��ϼ���.

ROLLBACK;

--9.[�����ذ� 1.2 �� ���� ���̺� ���� �����͸� ����, ����, �����ϰ� ���� ��ȸ�ϴ� DML ��ɹ��� �ۼ��� �� �ִ�.]
-- EMP ���̺��� ����̸�(ENAME)���� �����Ͱ� �빮���̵� �ҹ����̵� ������� SMITH�� ��� ������ ��ȸ�ϴ� SQL���� �ۼ��ϼ���.
--(��Ʈ: UPPER �Լ��� WHERE ���� ��� �̸��� �빮�ڷ� ���� ���� �˻�)

SELECT *
from emp
WHERE UPPER(ENAME)='SMITH';

--10. EMP ���̺��� ��� �̸��� 4���� ������ ��� ������ ��ȸ�ϴ� SQL���� �ۼ��ϼ���.

select * 
from emp 
where length(ename) <= 4;

--11.EMP ���̺��� ��å �̸��� ù���ں��� �� ���� ����ϴ� SQL���� �ۼ��ϼ���.
SELECT empno,ename,mgr,hiredate,sal,comm,deptno,
substr(job,1,3) job
FROM EMP;

--12.EMP ���̺��� 1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ������ ����ϴ� SQL���� �ۼ��ϼ���.
SELECT*
FROM emp
where hiredate>'81/06/01';


--13.EMP ���̺��� NVL �Լ��� ����Ͽ� ����� �����ȣ(EMPNO), ����̸�(ENAME), ����(SAL), �߰�����(COMM), �׸��� 1��ġ ������ ���ؼ� ANNSAL ���� ����ϴ� SQL���� �ۼ��ϼ���.
--(��Ʈ : 1�� ������ ����*12 + �߰����� �̴�. )

select empno �����ȣ,ename ����̸�,sal ����,comm �߰�����,sal*12+NVL(comm,0)ANNSAL
from emp;

--14. EMP ���̺��� �ߺ��� ������ ��å(JOB)�� ������ ����ϴ� SQL���� �ۼ��ϼ���.
--(��Ʈ :DISTINCT �� COUNT �Լ��� �̿��Ͽ� �ߺ��ȵ� ���� ���� ������ ī��Ʈ )
 SELECT  COUNT(DISTINCT job) ��å����
 FROM emp;--COUNT�� �ٸ��Ͱ� ���� �����°ǰ�?
  
--15.EMP�� DEPT ���̺��� ����(SAL)�� 3000 �̻� �޴� ������� ����̸��� �Ҽ� �μ��̸��� ����ϴ� SQL���� �ۼ��ϼ���. (����� ĸ���Ͽ� �ٿ� �ֽ��ϴ�.)
select e.ename,d.deptno
from emp e 
join dept d
on e.deptno=d.deptno
where e.sal>3000;

--16. EMP ���̺��� MARTIN���� �޿��� ���� ��������� ����ϴ� SQL���� �ۼ��ϼ���.
--(�������� ���)
SELECT*
FROM emp 
where sal<(select sal from emp where ename='MARTIN');

--17.EMP ���̺��� 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��������� ����ϴ� SQL���� �ۼ��ϼ���. (������������ ������ ������ ��İ� ������ ������ ������� ���� 2���� ��� �ۼ��ϼ���)
SELECT*
FROM emp
where sal>(select MAX(sal) from emp where deptno=30);

select*
from emp
where sal> all(select max(sal)from emp where deptno=30);


--18.EMP, SALGRADE ���̺��� �񵿵� �����Ͽ� ����� �޿������ 3����̰� 30�� �μ� �Ҽ��� ������� ��� ������ ����ϴ� SQL���� �ۼ��ϼ���.
select*
from emp e
join SALGRADE s 
on e.sal between s.losal and s.hisal
where grade=3 and deptno=30;--���� ������ �� ������ �ʴ°�..

--19.CREATE ��ɾ ����Ͽ� ���� �� ������ ������ EMP_DDL ���̺��� �����ϴ� SQL���� �ۼ��ϰ� �����ϼ���. �׸��� DESC ��ɾ�� ������ ���̺��� �� ������ Ȯ���ϼ���.
CREATE TABLE EMP_DDL(EMPNO NUMBER(4,0),
                     ENAME VARCHAR2(10),
                     JOB    VARCHAR2(9),
                     MGR    NUMBER(4),
                     HIREDATE DATE,
                     SAL     NUMBER(7,2),
                     COMM    NUMBER(7,2),
                     DEPTNO  NUMBER(2,0));
DESC EMP_DDL;

--20.EMP ���̺�� ������ ���̺��� EMP_V3 ��(VIEW) ���̺��� �����ϴ� SQL���� �ۼ��ϼ���.
   --���� �̸��� ������ ���� ���Ѵ�. (������ȣ, �̸�, ����, �������, ����, �μ���ȣ)

CREATE VIEW EMP_V3
AS
SELECT empno ������ȣ,ename �̸�,job ����, hiredate �������,sal ����, deptno �μ���ȣ
FROM EMP;

select*from EMP_V3;