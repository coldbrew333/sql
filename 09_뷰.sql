

--�ܼ��� �� �����
--�������̺��� �ʿ��� ������ ��� ��� �����ϱ�
--AS������ ����Ʈ ���� ����� EMP_V1�̸��� ��� �����.
CREATE VIEW EMP_V1--���̸�
AS
SELECT employee_id,first_name,last_name,email,hire_date,job_id 
FROM employees;

--���̸��� ������ ���̺�ó�� ���
SELECT*FROM EMP_V1;

--�信 �Է��ϱ� ==>���� ���̺��� �ƴ϶� �䰡 ����� ���̺� employees�� �Էµ�
INSERT INTO EMP_V1( employee_id,first_name,last_name,email,hire_date,job_id )
VALUES                        (333, 'David','King','DKING',SYSDATE,'IT_PROG');

--�ܼ��� EMP_V2�����(��Ī)-->��Ī�� ���� �̸��� �Ǿ���.
CREATE VIEW EMP_V2
AS
SELECT employee_id ������ȣ,first_name �̸�,last_name ��, email, hire_date,job_id
FROM employees;

--V2�� �Է��ϱ�
INSERT INTO EMP_V2(������ȣ,�̸�,��,email,hire_date,job_id)
VALUES                        (334, 'Lara','Craft','Lara',SYSDATE,'IT_PROG');

SELECT*FROM EMP_V2;

--�Է������� �����ϱ�
DELETE FROM emp_v2 
WHERE ������ȣ=334;--��� ����

--���� �̸��� �ٲ㼭 EMP_V3�����
CREATE VIEW EMP_V3(������ȣ,�̸�,��,�̸���,�������,����)
AS
SELECT employee_id ������ȣ,first_name �̸�,last_name ��, email, hire_date,job_id
FROM employees;

--�����Ѻ丸���,OR REPLACE�� �̹� ������� �䳪 ���̺��� ����
CREATE OR REPLACE VIEW �μ���_����_����
AS
SELECT department_id �μ���ȣ,count(*)������,max(salary)�ְ�޿�,min(salary)�����޿�
                ,AVG(salary)��ձ޿�
FROM employees
GROUP BY department_id;

select*from "�μ���_����_����";

--���ǻ���
DROP VIEW �μ���_����_����;


