--DDL ������ ���Ǿ�

--���̺� �����
CREATE TABLE  test(
    char_col   VARCHAR(4),--���ڿ� 4����Ʈ
    number_ex    NUMBER(2),--����2�ڸ�
    start_date DATE DEFAULT SYSDATE--��¥ ����Ʈ ���糯¥
);

DESC test;--���̺� ������ Ȯ��

 SELECT*FROM test;
 --�����͸� �Է�
 INSERT INTO test VALUES('abcd',12,'2021-06-09');
 
 --DEFAULT �� =>�Է��� �������� �ΰ� ��� ����Ʈ ���� �Էµȴ�.
  INSERT INTO test VALUES('hong',13,NULL);--�ΰ��� �Է���
  INSERT INTO test(char_col,number_ex)VALUES('Kim',15);--��¥�� �Է¾������� ����Ʈ���� �Էµȴ�.
  
  --���̺� �����ϱ�
  DROP TABLE test;-- ���̺� �̸��� ��ҹ��� ���������ʰ� �Է°���,�����ʹ� ��ҹ��� ������
  
  rollback;--DDL�� ���̺� ������ ���� ���� �׻� commit�� �ȴ� �׷��� �ѹ� �Ҽ� ����.(ex test���̺��� �����⶧���� �ǻ츱�� ����.)
           --DML ��ɾ���� ��밡��
           
--����1
CREATE TABLE sample_product(
product_id    NUMBER,
prdouct_name  VARCHAR2(20),
menu_date    DATE 
);

DESC sample_product;

DROP TABLE sample_product;           

--CREATE TABLES AS :AS������ ����Ʈ ���� ����� ���̺��� ����� ���� 
CREATE TABLE EMP_TEMP
AS
SELECT*FROM employees
WHERE 1 !=1;--�׻� ������ ����(��� ���� �������� �ʴ´�. )

SELECT*FROM EMP_TEMP;--�׻� ������ ������ �߰� �߱⶧���� ������ ���� ���̺� ������ ����  
DESC EMP_TEMP;

--80���μ��� �������� ���̺�
CREATE TABLE EMP80--�����߻�..(�������� ��� ����./..����)
AS
SELECT employee_id,last_name,salary*12 ANNUAL,hire_date
FROM employees
WHERE department_id=80;
 
SELECT*FROM EMP80;
DESC EMP80;

--30�� �μ��� ���� ���̺��� �����. �̶� EMP 30���� �̸��� ���� �Է�
CREATE TABLE EMP30(������ȣ,Ǯ����,����,�������)
AS
SELECT employee_id,last_name||''||first_name,salary,hire_date
FROM employees
WHERE department_id=30;

SELECT*FROM EMP30;
DESC EMP30;


--����1
CREATE TABLE stmans(id,job,sal)
AS
SELECT employee_id,job_id,salary
FROM employees
WHERE JOB_ID='ST_MAN';

SELECT*FROM stmans;
DESC STMANS;


SELECT*
FROM EMPLOYEES
WHERE LAST_NAME='%B';

