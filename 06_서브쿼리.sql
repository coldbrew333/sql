--��������:���������� SELECT��(��������)�� ���ԵǾ� �ִ� ���ϳ��� ���� SELECT���̴�.

--������ ��������: ������������ ���� �ϳ��� �ุ ��ȯ, ������(=,>,<,!=,<>)�� ���
--Popp�̸��� �������� ������ڰ� ū(�ֱ���) �������� ����϶�
--popp�� ����������� �˻�->������� ���� ū ������ ���(popp������ ��� ���� ��)
SELECT last_name �̸�, hire_date �������
FROM employees
where hire_date>(select hire_date from employees where last_name='Popp');
--������ ���������� ���ٸ� ����� ���;��ϴµ� �������� �������(smith��� ����� �θ��̻� ����)

--�������� �������� ���
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE job_id =    ( SELECT job_id
                    FROM   employees
                    WHERE last_name = 'Chen')
                    
    AND salary >  ( SELECT salary
                    FROM   employees
                    WHERE last_name = 'Chen');
--����(�׷�)�Լ��� ����� ��������
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE salary =    ( SELECT min(salary)
                    FROM employees);
--����1
SELECT last_name,salary
FROM employees
where salary>(select salary from employees where last_name='Abel');
--����2
SELECT employee_id,last_name,department_id,salary
FROM employees
where department_id=(select department_id from employees where last_name='Bull')
and salary>(select salary from employees where last_name='Bull');
--����3
SELECT last_name �̸�,salary �޿�,manager_id �Ŵ���
FROM employees
where manager_id=(select employee_id from employees where last_name='Russell');
--����4
SELECT*
FROM employees
where job_id=(select job_id from jobs where job_title='Stock Manager');