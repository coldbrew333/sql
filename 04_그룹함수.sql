--�׷��Լ� ����ϱ�
--���,�ִ밪,�ּҰ� �հ�
SELECT TRUNC(AVG(SALARY)) ��տ���,
MAX(SALARY) �ְ�,
MIN(SALARY) ������,
SUM(SALARY) ���հ�
FROM EMPLOYEES;

--80���μ��� �������� ��հ��� �˰� �ʹ�.
SELECT TRUNC(AVG(SALARY)) ��տ���,--�ΰ�����
MAX(SALARY) �ְ�,--�ΰ�����
MIN(SALARY) ������,--�ΰ�����
SUM(SALARY) ���հ�--�ΰ�����
FROM EMPLOYEES
WHERE DEPARTMENT_ID =80;--80�� �μ�

--count���� ����
SELECT COUNT(*)������--(*)�� ��� NULL���� ī��Ʈ
FROM employees;

SELECT COUNT(commission_pct)--COMMISSION_PCT�� NULL�� ���ܽ�Ŵ
FROM employees;

--80���μ��� ���?
SELECT COUNT(*) AS ������--(*)�� ��� NULL���� ī��Ʈ
FROM employees
WHERE DEPARTMENT_ID =80;

--GROUP BY ���� �׷����� ����� �׷��Լ��� ���

SELECT department_id �μ���ȣ,  ROUND(AVG(salary))��ձ޿�, COUNT(*)������
FROM employees
GROUP BY department_id;--�μ� �׷����� ������

SELECT employee_id, department_id �μ���ȣ,  ROUND(AVG(salary))��ձ޿�, COUNT(*)������
--�μ����� �������� ������, EMPLOYEE_ID�� ���� �ȵȴ�.
FROM employees
GROUP BY department_id;--�μ� �׷����� ������

--����1
SELECT department_id  �μ���,
COUNT (*) �����,
MAX(SALARY)�ְ�޿�,
MIN(SALARY)�ּұ޿�,
SUM(SALARY)�޿��հ�,
ROUND(AVG(SALARY)) ��ձ޿�
FROM employees
GROUP BY DEPARTMENT_ID
ORDER  BY �޿��հ� DESC;

--����2(�׷��� �����ؾ��Ѵ�.)
SELECT DEPARTMENT_ID �μ���ȣ,
JOB_ID ����,
MANAGER_ID ����ȣ,
SUM(salary) �����հ�,
COUNT(*) ������
FROM employees
GROUP BY DEPARTMENT_ID,JOB_ID,MANAGER_ID
ORDER BY DEPARTMENT_ID;

--����3
SELECT
ROUND(AVG(MAX(SALARY))),
AVG(MIN(SALARY))
FROM employees
GROUP BY DEPARTMENT_ID;

--�׷��� ������ HAVING

SELECT department_id �μ���ȣ,COUNT(*)������ --���̸�,�׷��Լ�(���̸�)
FROM employees --���̺�
GROUP BY DEPARTMENT_ID --�׷��
HAVING COUNT(*)>5; --�׷�����, 5���� ū���� ���

--����1
SELECT job_id ����,
SUM(SALARY) �޿��հ�
FROM employees
where  job_id != 'AC_MGR' 
group by job_id
HAVING AVG(SALARY)>10000
ORDER BY �޿��հ� DESC;
--����2
SELECT
department_id �μ� ��ȣ,
ROUND(AVG(SALARY))  ��ձ޿�
FROM EMPLOYEES
WHERE DEPARTMNET_ID != 40
group by department_id
HAVING ROUND(AVG(SALARY))<=7000;

--����3
SELECT
job_id  ����,
sum(salary) �޿��Ѿ�
FROM employees
WHERE JOB_ID NOT LIKE '%REP%'
GROUP BY JOB_ID
HAVING SUM(salary)>=13000
ORDER BY �޿��Ѿ� DESC;




