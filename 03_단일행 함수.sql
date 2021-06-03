--������ �Լ��� ��ҹ��� ���۰� ���� �����Լ��� �ִ�.
--1.��ҹ��� �����Լ� (upper,lower,initcap)
select employee_id,first_name,UPPER(FIRST_NAME),LOWER(FIRST_NAME),INITCAP(FIRST_NAME)
from employees; --UPPER �빮��, LOWER �ҹ���, INITCAP�� ù���ڸ� �빮��

Select employee_id,first_name,UPPER(FIRST_NAME),LOWER(FIRST_NAME),INITCAP(FIRST_NAME)
from employees
WHERE UPPER(FIRST_NAME)='PATRICK';--�̸��� ��ҹ��� ������� ��� ���

--substr�Լ� (���̸�,m,n):���ڿ����� Ư����ġ���� �߶󳽴�.
--m�� ���۹���,n�� �߶� ����
SELECT employee_id,first_name,
substr(first_name,1,3),--ù���� ���� 3���� �߶󳽴�.
substr(first_name,2,4),--�ι�°���� 4���� �߶󳽴�.
substr(first_name,2)--�ι�°���� ������ �߶󳽴�
FROM employees;

--length�Լ�(���ڿ�):���ڿ��� ���̸� ����
SELECT first_name,LENGTH(FIRST_NAME)
FROM employees;

--instr �Լ�(���ڿ�,ã�¹���m,����n):���ڿ����� ã�� ������ ��ġ�� ����
--m�� �˻���� ��ġ,n�� ã�� Ƚ��
SELECT first_name,
 instr(first_name,'e'),
  instr(first_name,'e',1,2)--ó������ �˻��ϰ� �ι��� 'e'�� ��ġ
FROM employees;

--lpad,rpad(���ڿ�,�ڸ���,'����'):Ư�� ���ڷ� �յڿ� �ִ´�.
SELECT employee_id,first_name,salary,
    lpad(salary,10,'#'),rpad(salary,10,'*')
FROM employees;

--replace�Լ�(���ڿ�,'����','�ٲܹ���'):Ư�� ���ڳ� ���ڿ��� ��ü
SELECT employee_id,first_name,
 replace(first_name,'a','*')--FIRST_NAME A��� *�� ��ü
FROM employees;

SELECT employee_id,first_name,
 replace(first_name,'en','#')--FIRST_NAME A��� *�� ��ü
FROM employees;

--��� ���̺� : �ӽ����̺�(����� ����ϰ� ������ �ӽ� ���̺��� ��� ����1)
select 10*20 from dual;

--TRIM�Լ�: ���ξ ���̾ �߶󳽴�.
SELECT TRIM('H' FROM 'HelloWorld')
FROM DUAL;

SELECT TRIM(' 'FROM 'HelloWorld')--������ �߶󳽴�.
FROM DUAL;

--����1
SELECT last_name,email,UPPER(last_name),LOWER(LAST_NAME),INITCAP(email)
FROM employees;
--����1������� Ǭ ����
SELECT last_name,LOWER(LAST_NAME),UPPER(last_name),email,INITCAP(email)
FROM employees;


--����2
SELECT JOB_ID,
SUBSTR(JOB_ID,1,2)
FROM employees;

--������ �Լ�
--ROUND:�ݿø�
SELECT ROUND(15.193,1)AS �Ҽ�ù°,--��°�ڸ� 9���� �ݿø� 15.2
ROUND(15.193,0) AS ����,--�Ҽ�ù°�ڸ����� �ݿø�
ROUND(15.193,-1) AS "10�� �ڸ�"--10�� �ڸ� 5���� �ݿø� 20
FROM DUAL;

--TRUNC:����
SELECT
TRUNC(15.193,1)AS �Ҽ�ù°,--��°�ڸ� 9���� ���� 
TRUNC(15.193,0) AS ����,--�Ҽ�ù°�ڸ����� ����
TRUNC(15.193,-1) AS "10�� �ڸ�"--10�� �ڸ� 5���� ����
FROM DUAL;

--ID�� ¦������ �������� ����Ѵ�. MOD
SELECT employee_id,LAST_NAME
FROM employees
WHERE MOD(employee_id,2)=0--2�� ���� �������� 0�̸� ¦���̴�.1�̸� Ȧ��
ORDER BY EMPLOYEE_ID;






--����1
SELECT salary,
ROUND(SALARY/30,0) AS  ����,
ROUND(SALARY/30,1) AS �Ҽ�ù°,
ROUND(SALARY/30,-1) AS "10�� �ڸ�"
FROM employees
ORDER BY salary DESC;

--��¥�� �Լ�
SELECT 
ROUND(SYSDATE, 'DD')��,--SYSDATE���� ��¥,�� �ݿø�, now 6��3��13��-->6��4��
ROUND(SYSDATE, 'MM')��,--6��3��=>6��1��(���� �ݿø� �ȵǰ�, ���� �ʱ�ȭ)
ROUND(SYSDATE, 'YYYY')�⵵,--1���� 12����6���̶� 2021���̰� ���ڸ� �ʱ�ȭ�Ǿ 01/01
MONTHS_BETWEEN('2017-10-10','2017-07-10')������,
ADD_MONTHS('2017-07-10',3)�ֵ�վ�--7���� 3���� ���ؼ� 10/10
FROM DUAL;

--sysdate�� ���� ��¥�� �ð��� ��Ÿ����.
SELECT sysdate from dual;

--��¥����
select sysdate -1 as ����, sysdate as ����, sysdate+1 ����
from dual;

--90�� �μ��� �������� ��������� �ٹ��ϼ�
select last_name,TRUNC(SYSDATE-HIRE_DATE)AS �ٹ��ϼ�--���糯¥���� ��볯¥ �����̴�.TRUNC�� �������� ��¥�ͳ�¥�� ���� �ϼ��� �����µ� ����ð��� HIRE-DATE�� �ð��� �����ʱ� ������ �Ҽ����� ���´�. �׷��� ����
FROM employees
WHERE department_id=90;

--����1 
SELECT SYSDATE,HIRE_DATE,MONTHS_BETWEEN(SYSDATE ,HIRE_DATE) 
FROM employees
WHERE DEPARTMENT_ID=100;
--����2
SELECT HIRE_DATE,ADD_MONTHS(hire_date,3),ADD_MONTHS(HIRE_DATE,-3)
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 106;

--TO_CHAR������ �Լ�
SELECT TO_CHAR(12345678,'999,999,999')AS �޸�--9�� ���� ���ڸ��� ���ٶ�� ��
FROM DUAL;

SELECT TO_CHAR(123.45678,'999,999.99')AS �Ҽ���
FROM DUAL;

SELECT TO_CHAR(12345678,'$999,999,999')AS �޷�
FROM DUAL;

SELECT TO_CHAR(12345678,'L999,999,999')AS ������ȭ
FROM DUAL;

--TO_CHAR ��¥�� ���ڷ� ��ȯ
--�� �� �Ͻ� ����
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') AS ���糯¥
FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') AS ���糯¥
FROM DUAL;



--HH24:MI:SS����ð� ����
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS ���糯¥
FROM DUAL;

--365���� ����
SELECT TO_CHAR(SYSDATE,'DDD') AS ����
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'IW') AS ����
FROM DUAL;

SELECT TO_CHAR(SYSDATE,'MONTH') AS ��
FROM DUAL;

--����1
 SELECT employee_id,
 to_char(hire_date,'MM/DD')
 FROM employees
 WHERE DEPARTMENT_ID=100;
  --����2
  SELECT last_name,
  to_char(salary,'$999,999.00')--�Ҽ����� .���� ǥ���Ұ�
  FROM employees
  where salary>10000;
  
  --���ڸ� ��¥�� ��ȯ
  --TO_DATE
  SELECT TO_DATE('2011-01-01','YYYY-MM-DD')--2011-01-01 ���ڿ��� ��¥�� �ٲ۴�.
  FROM DUAL;
  
  --���ڸ� ���ڷ� ��ȯ
  --TO_NUMBER
  SELECT TO_NUMBER('100')+100
  FROM DUAL;
  

