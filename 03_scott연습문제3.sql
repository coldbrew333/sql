--scott ��������
--21������) �̸� �� S�ڰ� �� �ִ� ����� ��� ������ ����϶�
select*
from emp
where ename like '%S%';
--22���̸��� M�� �����ϰ� ������ ���ڰ� N�� ����� ��� ������ ����϶�
--(��, �̸��� ��ü 6�ڸ��̴�. �ڸ����� �̿��� ���ϵ�ī�� '_' �� �̿�)
select*
from emp
where ename like'M____N';
--23���̸��� ù ��° ���ڴ� �������, �� ��° ���ڰ� A�� ����� ������ ����϶�.
select*
from emp
where ename like '_A%';--�ϳ��� ���ڰ� �ִٴ� ���� �˱⶧���� ����� A %
--24�� Ŀ�̼��� NULL�� ����� ������ ����϶�.  ( IS NULL �Ǵ� IS NOT NULL ���) 
SELECT
    *
FROM EMP
WHERE COMM IS NULL;
--25��  Ŀ�̼��� NULL�� �ƴ� ����� ��� ������ ����϶�. ( IS NULL �Ǵ� IS NOT NULL ���) 
SELECT
    *
FROM EMP
WHERE COMM IS NOT NULL;
--26���μ��� 30�� �μ��̰� �޿��� $1,500 �̻��� ����� �̸�, �μ� ,������ ����϶�.
SELECT ENAME, DEPTNO,SAL
FROM EMP
WHERE DEPTNO =30 AND SAL>=1500;
--27�� �̸��� ù ���ڰ� K�� �����ϰų� �μ���ȣ�� 30�� ����� �����ȣ, �̸�, �μ���ȣ�� ����϶�.
SELECT EMPNO,ENAME,DEPTNO
FROM emp
WHERE ename LIKE 'K%' OR DEPTNO =30;
--28�� �޿��� $1,500 �̻��̰� �μ���ȣ�� 30���� ��� �� ������MANAGER�� ����� ������ ����϶�
SELECT*
FROM emp
where sal>=1500 
and deptno=30
and job='MANAGER';
--29���μ���ȣ�� 30�� ����� ��� ������ ����ϰ� ������ȣ�� SORT(����)�϶�.
SELECT*
FROM emp
WHERE DEPTNO=30
ORDER BY EMPNO;
--30���������� �޿��� ���� ������ SORT(����) �϶�
SELECT
    *
FROM EMP
order by sal desc;
