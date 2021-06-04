-- JOIN:�ΰ��� ���̺��� ���ļ� ���ϴ� ���������
SELECT e.employee_id ������ȣ, last_name �̸�, e.department_id �μ���ȣ,department_name �μ���
FROM employees  e JOIN departments d
ON e.department_id=d.department_id;--���̺��� ���踦 ���� ���캻��.->���̺��� Ʋ���� ���� �̸��� ����

--3���� ���̺� ����
select e.employee_id,l.city,d.department_name
from employees e
join departments d
    on e.department_id=d.department_id
join locations l
    on d.location_id = l.location_id;

--����1
select d.department_name �μ��� ,l.city ���ø�,c.country_name ������
from countries c
join locations l
         on c.country_id=l.country_id
join departments d
          on l.location_id=d.location_id
where l.city in('Seattle','London') AND c.country_name like 'United%';

--��ü ����:���� ���̺� ������ �������� �������, �����Ҷ�
--���� ���̺�� ����
select e.last_name �����̸�, m.last_name �Ŵ����̸�
from employees e
join employees m
    on e.manager_id=m.employee_id;