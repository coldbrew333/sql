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

--������ ��������
--���������� ����� �������� ������ ���ö�
--�����ڸ� ������� ���� ���� ����.(=,>,<�ε�ȣ ���Ұ�)==>IN, ANY,ALL�� �������� ���� ���� ������ ���

--�μ��� �ּ� ���� ���
SELECT  MIN(SALARY)
FROM employees
GROUP BY DEPARTMENT_ID;

--���� �μ��� ���������� ���������� ���
--�μ��� ���������� �޴� ������� ��µȴ�.
SELECT employee_id ������ȣ,last_name �̸�
FROM EMPLOYEES
WHERE salary IN (SELECT  MIN(SALARY)
                             FROM employees
                             GROUP BY DEPARTMENT_id);
--ANY�� ALL�����ڴ�  IN���� �ٸ��� �տ� �� �����ڰ� �ٴ´�.
--ANY������: �������� ����� �ϳ��� �����ϸ�ȴ�.OR
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE SALARY <ANY (SELECT  salary
                                         FROM employees
                                         where job_id='IT_PROG')-->(9000���� ���� ������ ��� ��µȴ�) 
                                         --�������� ����� �ϳ��� �����ϸ� �ȴ�
and job_id != 'IT_PROG';    


--ALL������
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary <ALL (SELECT  salary
                                         FROM employees
                                         where job_id='IT_PROG')--�������� ����� ���� �� �����ؾ� �Ѵ�.
and job_id != 'IT_PROG';    

DELETE FROM employees WHERE SALARY  IS NULL;--SALARY�� �ΰ��� �־���..


SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

--����1 �μ���ȣ(department_id)��  20���� �������� �Ŵ������̵�(manager_id)�� ���� �Ŵ����� ������  �������� ����϶�. (�� 20�� �μ��� ������ ����!)


SELECT employee_id �����̸�,first_name �̸�,job_id ����,SALARY �޿�
FROM employees
WHERE manager_id IN(SELECT manager_id
                                        FROM employees
                                        WHERE DEPARTMENT_ID=20)--���������� 20���μ��� �Ŵ���ID �� ��ȯ(20���μ��� ���� �Ŵ��� ���̵� ã��)
AND DEPARTMENT_ID !=20;--20���μ��� ����

--����2  job_id��  'ST_MAN'�� �������� ��� ������ ���ٵ� �޿��� ����  �������� ����϶�. (ANY)
SELECT employee_id,LAST_NAME,JOB_ID,SALARY
FROM EMPLOYEES
WHERE SALARY < ANY (SELECT SALARY
                                          FROM EMPLOYEES
                                          WHERE JOB_ID='ST_MAN')--������ ST_MAN �� ������ �ϳ��� ������ ����
AND JOB_ID!='ST_MAN';--ST_MAN�� ����                                          
--����3 ��å�� 'IT_PROG' �� ������ ���� �޿��� ���� �������� ����Ͻÿ�.(ALL)
SELECT employee_id,LAST_NAME,JOB_ID,SALARY
FROM EMPLOYEES
WHERE salary<ALL(SELECT salary
                                  FROM EMPLOYEES
                                  WHERE JOB_ID='IT_PROG')--���� IT_PROG���� ������ ���� ����(��� ����)�Ҷ�
 AND JOB_ID!='IT_PROG';--IT_PROG����            
 
 --���߿� ��������:�������� ����� 2�� �̻��� ���� ��ȯ��(where ������ 1:1 ����)
 --Bruce ������ �Ŵ����� ���� ��� 
 SELECT employee_id,first_name,job_id,salary,manager_id
 FROM EMPLOYEES
 WHERE (MANAGER_ID,JOB_ID)IN (SELECT MANAGER_ID,JOB_ID
                                                            FROM EMPLOYEES
                                                            WHERE first_name ='Bruce')
AND first_name != 'Bruce';--��罺�� ����    

--�μ��� �ּұ޿� �޴� ����� ���� �˻�
SELECT department_id �μ���ȣ,employee_id ������ȣ, first_name �̸�, salary ����
FROM employees
where (department_id,salary)IN(     SELECT department_id,MIN(SALARY)
                                                           FROM EMPLOYEES
                                                           GROUP BY department_id)--�μ����� �ּұ޿� ��������
order by department_id;--�μ��� ��������


--����1  employees ���̺��� job_id���� ���� ���� salary�� ������ ã�ƺ���, 
--ã�Ƴ� job_id�� salary�� �ش��ϴ� ������ first_name, job_id, salary, department_id �� ����Ͻÿ�. (salary �������� ����)
SELECT first_name �̸�,job_id ����,salary ����,department_id �μ���ȣ
FROM employees
where(job_id,salary)in (select job_id,min(salary)
                                        from employees
                                        GROUP BY  job_id)--������ �ּұ޿� ��������
                                        --group by �� Ư�� �� �Ǵ� �����͸� �������� �����͸� �׷����� ���´�.
order by salary DESC;--���� ��������
