--���̺��� ��� ������ ��������
select*from employees;


--WHERE ���� ������ ���� �����غ���
--��ġ�� FROM �Ʒ��� �ۼ�
SELECT *
FROM employees
WHERE DEPARTMENT_ID = 90;--�μ���ȣ�� 90�� �����鸸 ���

SELECT*
FROM employees
WHERE salary =24000;--������ 24000�� �����鸸 ���

/*WHERE�� ����:
   ���ڿ� ��¥(DATE)�� �� ����ǥ('')�� ����Ѵ�.
   ���ڴ� ��ҹ��ڸ� �����Ѵ�.
   ��¥�� ��¥���˿� ���缭 �ۼ��Ѵ�.
*/

--WHERE + ���ڿ� 
SELECT*
FROM employees
WHERE first_name ='Steven'; --�� ����ǥ(�� ����ǥ x, �ѵ���ǥ ���°͵� x)

SELECT*
FROM employees
WHERE first_name ='steven'; --����� ���� ��ҹ��� �����ϱ� ������....

--WHERE+��¥
SELECT*
FROM employees
WHERE hire_date = '2003-06-17';--��¥( '2003-06-17','03/06/17'),'�⵵/��/��'

--�񱳿�����
SELECT*
FROM employees
WHERE salary>=10000;--������ ���޷� �̻�

SELECT*
FROM employees
WHERE hire_date>='2007-07-07';--2007�� 7��7�� ���Ŀ� ����� ������

SELECT*
FROM employees
WHERE first_name>'F';--�̸��� ���ĺ� F���� ū ���


--����1
SELECT*
FROM employees
where employee_id=100;

--����2
SELECT*
FROM employees
where first_name='David';

--����3
SELECT*
FROM employees
where employee_id<=105;

--����4
SELECT*
FROM job_history
where start_date>='2006/03/03';

--����5
SELECT*
FROM departments
where location_id !=1700;

SELECT*
FROM departments
where location_id <>1700;--<>, !=���� �ʴ�.


--�� ������ AND OR NOT
SELECT last_name,department_id,salary
FROM employees
where department_id = 60 OR (department_id=80 AND salary>10000);

--����1
SELECT*
FROM employees
WHERE salary>4000 AND JOB_ID='IT_PROG';

--����2
SELECT  *
FROM EMPLOYEES
WHERE salary>4000 AND(JOB_ID='IT_PROG' OR JOB_ID='FI_ACCOUNT');

--IN ������(OR�� ���)
SELECT*
FROM employees
WHERE SALARY = 4000 OR salary =3000 OR SALARY =2700;--������ 4000�Ǵ� 3000�Ǵ� 2700�� ������

SELECT  *
FROM employees
WHERE SALARY IN(4000,3000,2700);--���� OR�� ����.

SELECT  *
FROM employees
WHERE SALARY NOT IN(4000,3000,2700);--NOT IN =>�ƴѰ��

--����1
SELECT
    *
FROM employees
WHERE  salary IN(10000,17000,24000);

--����2
SELECT
    *
FROM employees
WHERE DEPARTMENT_ID NOT IN(30,50,80,100,110);


--BETWEEN ������(AND ��� ��밡��)
SELECT *
FROM employees
WHERE SALARY >=9000 AND SALARY <=10000;--������ 9000�̻� 10000����

SELECT *
FROM employees
WHERE SALARY BETWEEN 9000 AND 10000;--�ּ� �ִ밪 ����

--����1
SELECT
    *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--����2
SELECT*
FROM employees
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-30';--������ ����;day�� �ѵ���ǥ ���� ����

--����3
SELECT*
FROM employees
WHERE salary <7000 OR SALARY >17000;--����Ǭ Ǯ��

SELECT*
FROM employees
WHERE salary not between 7000 and 17000;--NOT BETWEEN ANDǮ��

