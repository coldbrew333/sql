--������ �ּ�
/*
������ �ּ���
�̷��� �ּ��� ��ǻ�Ͱ� �������� �ʴ´�.
*/

--SELECT �� 
--1. ���̺��� ��� ��� ���� �о����
SELECT *
FROM employees;--����Ʈ ���� *�� ��ü������ �а� ���� employees���̺����

SELECT *
FROM DEPARTMENTS;


--2. Ư�� ���� �о����(2���� ����), ���� �̸��� ���´�
SELECT department_id, department_name
FROM departments;

SELECT  department_id, department_name
FROM departments;

--3.��� ������ ���(+,-,*,/)
--salary+100->���� �ϳ��� ����� ���,salary+(salary*0.1)->salary�� 10%�� ���� 
SELECT  employee_id,first_name,salary , salary+100,salary+(salary*0.1)
FROM employees;

--4.��(null)�̶�?
--���� �Էµ��� ����, ��� �Ұ����ϴ� ���̴�.
--���� ����(0) �Ǵ� ����(' ')���� �ٸ���.
SELECT  last_name, job_id,salary,commission_pct
FROM employees;



--5. �ΰ��� ����Ҽ� ����.
SELECT  last_name, job_id,salary,commission_pct,commission_pct+10
FROM employees;

SELECT department_name,manager_id, manager_id+10,location_id
FROM departments;

--6.��Ī ���ϱ� AS
SELECT  last_name, last_name AS �̸�
FROM  employees;

--7.||���Ῥ���� = > ���� ���� �����ؼ� �ϳ��� ����
-- ������ �������, ���ڿ��� ó������� �Ѵ�.||' '||�� first name�� last name�� �پ��־� ����ְ� ������ ����ϴ°��̴�.
SELECT first_name, last_name, first_name||' '||last_name AS "��ü �̸�"
FROM employees;

--8.DISTINCT ���� �ߺ��� ����
SELECT distinct department_id
FROM employees;

SELECT distinct department_id
FROM departments;

SELECT 
first_name AS "�̸�",
employee_id AS "�����ȣ",
salary,
salary*1.1 AS "�� ������"
FROM employees;

--9.DISCRIBE DESC ��ɾ�//���̺��� ������ �����ϰ� �����Ѵ�. 
DESC employees;
DESC departments;

--10.�������� Ǯ���
SELECT  department_id AS "�μ� ��ȣ",department_name AS "�μ� �̸�"
FROM departments;

SELECT 
last_name,
first_name,
job_id,
salary,
salary-salary /10
FROM employees;

SELECT 
last_name,
first_name,
job_id,
salary,
salary-(salary *0.05)
FROM employees;





