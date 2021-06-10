--���� �߰�/����

--�߰� add

--90���μ� �������� ���̺� EMP90
CREATE TABLE EMP90
AS
SELECT employee_id,first_name,last_name,salary,department_id
FROM employees
WHERE department_id=90;

DESC EMP90;--CREATE TABLE AS�� ������ ���̺��� NOT NULL���� ���������� ���� �ȵȴ�.

--GENDER���� �߰�
ALTER  TABLE EMP90
ADD (GENDER VARCHAR2(1));--���� �� �߰�

DESC EMP90;
SELECT*FROM EMP90;--���� �� �߰� Ȯ�� ,�����Ͱ� ���� ��쿡�� �� ���� NULL�� �ڵ� �Էµȴ�.


--COM1�� �߰� ����Ʈ0,NOT NULL
ALTER TABLE EMP90
ADD(COM1 NUMBER DEFAULT 0 NOT NULL);--COM1�� �߰�

--��¥ �� (�÷�) �߰�
ALTER TABLE EMP90
ADD (CREATED_DATE DATE DEFAULT SYSDATE);--CREATED_DATE �� �߰�

DESC EMP90;
-- GENDER ���� ũ�� 1 =>100����
ALTER TABLE EMP90
MODIFY(GENDER VARCHAR2(100));--���� ũ�� ����

--��(�÷�)�� ����
ALTER TABLE EMP90
DROP COLUMN CREATED_DATE;--��¥ �� ����

ALTER TABLE EMP90
DROP COLUMN COM1;--COM1����

ALTER TABLE EMP90
DROP COLUMN GENDER;--GENDER�� ����

DESC EMP90;


--�̸� ����
--���� �̸� ����
ALTER TABLE EMP90
RENAME COLUMN department_id TO �μ���ȣ;--���� �̸� ����
--���̺� �̸� ����
RENAME EMP90 TO  �μ�90;--�μ�90���� �̸� ����
 
 DESC �μ�90;
 
 
 