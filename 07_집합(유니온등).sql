--���տ�����
--UNION�� �̿��� �� ����:���� ���� �����Ѵ�.
SELECT employee_id,job_id
FROM employees--������107
UNION --������ ���� ���� ���� total 115�� ����(������ 107+10=117)
SELECT employee_id,job_id
FROM job_history;--������ 10

--UNION ALL�� �̿��� ������:�������� �־ ���Ѵ�.
SELECT employee_id,job_id
FROM employees--������107
UNION ALL--������ 107+10=117 ������ , �����൵ ��� ����̱� ������ 118
SELECT employee_id,job_id
FROM job_history;--������ 10

--������ INTERSECT(ù��° ����Ʈ���� �ι�° ����Ʈ�� ������ ���)
SELECT employee_id,job_id
FROM employees
INTERSECT
SELECT employee_id,job_id
FROM job_history;


--������ MINUS(ù��° ����Ʈ������ �ι�°�� �� ���)
SELECT employee_id,job_id
FROM employees
MINUS--ù��° ����Ʈ�� ������107���߿��� �ι�° ����Ʈ���� ������ �����
SELECT employee_id,job_id
FROM job_history;

--����1) ?employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ UNION �����ڸ� �̿��� ���� ������.
SELECT department_id
FROM employees
UNION
SELECT department_id
FROM departments;


--����2employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ UNION ALL�����ڸ� �̿��� ���� ������.
SELECT department_id
FROM employees
UNION all
SELECT department_id
FROM departments;

--����3employees ���̺��� department_id ���հ� departments ���̺��� department_id ������ �������� INTERSECT �����ڸ� �̿��� ����� ������.
SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--����4 departments ���̺��� department_id ���տ��� employees ���̺��� department_id ������ MINUS �����ڸ� �̿��� �� ������.
--�μ����̺��� ������ ���� ���̺��� ����� �ȵ� �μ���ȣ
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees;

--Ʈ������




