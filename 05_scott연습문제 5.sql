--scott��������
--36�� ������� 5���� �Ѵ� �μ��� �μ���� ����� ��ȸ (�����ʿ�)
--�������̺� ������� �Ҽ�����(�μ����� �˼� ���� ����)==>�����ʿ�
SELECT d.dname,count(e.empno)
FROM emp e
join dept d on e.deptno=d.deptno
group by d.dname
having count(e.empno)>5;
--37�� ������ �޿��հ谡  5000�� �ʰ��ϴ� �� ������ ���ؼ� ������  �޿� �հ踦 ��ȸ  
-- �� �Ǹſ�('SALESMAN')�� ����
SELECT job,sum(sal)�޿��հ�
FROM emp
where job != 'SALESMAN'
GROUP BY JOB
HAVING SUM(SAL)>5000;
--38��  ������� �����ȣ(empno), �����(ename), �޿�(sal), �޿����(grade)�� ����Ͻÿ�.
--(���̺� salgrade ���� )
SELECT e.empno,e.ename,e.sal,s.grade
FROM emp e
join salgrade s
    on e.sal between s.losal and s.hisal;

--39�� �μ���(deptno)�� ����� ���� Ŀ�̼�(comm)�� ���� ����� ���� ����Ͽ� ���ÿ�
SELECT deptno,count(*)as "�����",count(comm) as "Ŀ�̼� ���� �����"
FROM emp
group by deptno;
--40�� �μ���ȣ(deptno)�� 10�� '�ѹ���', 20�� '���ߺ�', 30�� ������'��� �Ͽ� 
--�̸�, �μ���ȣ, �μ��� ������ ����Ͽ� ���ÿ�. (decode �� case �Լ� ���)
SELECT ENAME, DEPTNO,
decode(deptno, 10 ,'�ѹ���',
                20,'���ߺ�',
                30,'�����'
                )�μ���

from emp;





