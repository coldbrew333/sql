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
  instr(first_name,'e',1,2)--ó������ �˻��ϰ� �ι�? 'e'�� ��ġ
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

--ID�� ¦����? �������� ����Ѵ�. MOD
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
  
  --Null�� ó�� �Լ�
  --NVL�Լ�(X,Y)���࿡ X�� �ΰ��̸� Y������ ��ü�Ѵ�.
  
  SELECT  last_name,NVL(MANAGER_ID,0) AS �Ŵ���
  FROM EMPLOYEES
  WHERE LAST_NAME ='King';
  
    SELECT  last_name,MANAGER_ID AS �Ŵ���
  FROM EMPLOYEES
  WHERE LAST_NAME ='King';--NVL�� ���� ���, ���� ���� ���� NULL���� ���´�.
  
  --NVL2(ex,ex1,ex2):ex���� �ΰ��� �ƴѰ�� ex1���� ��ü�ϰ� �ΰ��̸� ex2�� ��ü�Ѵ�.
SELECT employee_id, last_name,NVL2(MANAGER_ID,1,0) AS �Ŵ�������
FROM EMPLOYEES
WHERE LAST_NAME ='King';

--����1
--���� Ǯ��
SELECT last_name,salary,
NVL(commission_pct,0),(SALARY*12)+NVL(commission_pct*12*salary,0) 
FROM employees;
--������� Ǯ��
SELECT last_name,salary,
NVL(commission_pct,0),
SALARY*12+salary*12*NVL(commission_pct,0) AS ���� 
FROM employees
ORDER BY ���� DESC;

--����2
SELECT last_name,salary,
NVL(commission_pct,0),
SALARY*12+salary*12*NVL(commission_pct,0) AS ���� ,
NVL2(commission_pct,'SAL+COMM','SAL')AS �������
--(SALARY*12)+NVL2(commission_pct*12*salary,SAL,SAL+COMM)===>����Ǯ����(����� ������ ����)
FROM employees
ORDER BY ���� DESC;

--DECODE�Լ�

SELECT last_name,JOB_ID,SALARY,
DECODE(job_id,'IT_PROG',SALARY*1.0,
                           'ST_CLERK',SALARY*1.15,
                           'SA_REP', SALARY*1.20,
                                           SALARY)AS ��������
FROM employees;

--����1
SELECT LAST_NAME,job_id,salary,
DECODE(TRUNC(salary/2000), 0, 0.00,
                                                    1,0.09,
                                                    2,0.20,
                                                    3,0.30,
                                                    4,0.40,
                                                    5,0.42,
                                                    6,0.44,
                                                       0.45)AS ����
FROM EMPLOYEES;

--CASE�Լ�:���ǹ��� �񱳸� �Ҽ��ִ�
SELECT last_name,JOB_ID,SALARY,
CASE job_id WHEN  ' IT_PROG'   THEN  SALARY*1.0
                     WHEN  ' ST_CLERK'  THEN   SALARY*1.15
                     WHEN   'SA_REP'      THEN   SALARY*1.20
                      ELSE                                      SALARY
                      END AS ���޼���
FROM employees;

SELECT last_name, JOB_ID,SALARY,
CASE WHEN SALARY <5000 THEN 'LOW'
            WHEN SALARY < 10000 THEN 'Medium'
            WHEN SALARY < 20000 THEN 'Good'
            ELSE                                            'Excellent'--20000Q���� �̻��� ���
            END AS �޿� --OR END "�޿�"
FROM EMPLOYEES;


--����1
SELECT employee_id,first_name,last_name,SALARY,
CASE WHEN SALARY >=9000 THEN '�����޿�'
            WHEN SALARY >=6000 THEN '�����޿�'--9000�̸��̸鼭 6000�̻��϶�
             ELSE                                            '�����޿�'--6000�̸��� ���
            END AS �޿����
FROM EMPLOYEES
WHERE JOB_ID ='IT_PROG';

SELECT employee_id,first_name,last_name,SALARY,
CASE WHEN SALARY >=9000 THEN '�������'
  WHEN SALARY BETWEEN 6000 AND 8999 THEN '�������'
                                                                                       ELSE '�������'
            END  AS �޿�    ���                                                            
FROM EMPLOYEES
ORDER BY �޿���� 
WHERE JOB_ID='IT_PROG';

