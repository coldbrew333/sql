--scott��������
--31���μ���ȣ�� ASCENDING SORT�� �� �޿��� ���� ��� ������ ����϶�.
--( �Ѱ� �̻��� ���� ���Ľ� �޸�(,)�� ����մϴ�.)
SELECT*
FROM emp
ORDER BY DEPTNO ASC , SAL DESC;
--32���μ���ȣ�� DESCENDING SORT�ϰ�, �̸� ������ ASCENDING SORT �޿� ������ DESCENDING SORT �϶�.
SELECT DEPTNO, ENAME,SAL
FROM EMP
ORDER BY DEPTNO DESC,ename ,SAL DESC;
--33�� 10���μ��� ��� �������� �޿��� 13%�� ���ʽ��� �����ϱ�� �Ͽ���. �̸�, �޿�, ���ʽ��ݾ�, �μ���ȣ�� ����϶�
--( �Ҽ����� �ݿø���.)
SELECT ename,SAL,ROUND(SAL*0.13)BONUS,DEPTNO
FROM EMP
WHERE DEPTNO=10;
--34�� ������ �̸�, �޿�, Ŀ�̼�, �Ѿ�(�޿�+Ŀ�̼�)�� ���Ͽ� �Ѿ��� ���� ������ ����Ͽ���.
--(��, Ŀ�̼��� null�� ����� 0���� �ؼ� ����.)
SELECT
    ENAME,SAL,NVL(COMM,0),SAL+NVL(COMM,0)TOTAL
FROM EMP
ORDER BY TOTAL DESC;

--35���޿��� $1,500���� $3,000 ������ ����� ���ؼ��� �޿��� 15%�� ȸ��� �����ϱ�� �Ͽ���.
--��� ����� �̸�, �޿�, ȸ��(�Ҽ����� 2�ڸ����� �ݿø�)�� ����Ͽ���.
--(��, ȸ��� �޷�ǥ��$�� �����ϰ� �Ҽ��� 1�ڸ����� ���)
SELECT ENAME,SAL,TO_CHAR(ROUND(SAL*0.15,1),'$999.0')ȸ��
FROM EMP
WHERE SAL BETWEEN 1500 AND 3000;

