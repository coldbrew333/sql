--�������� �Է�/����/����(DML�۾�)==>�ſ��߿�

--������ �Է� INSERT INTO
--�μ� ���̺� �����Ͽ� COPY_DEP���̺��� �����
CREATE TABLE COPY_DEP
AS 
SELECT*FROM  departments;---->AS ���� ����Ʈ���� ����

--������ ���̺� �Է�
INSERT INTO  COPY_DEP(department_id,department_name,manager_id,location_id)
VALUES(300,'Game',100,1700);

select*from copy_dep;
--���̺��� ���� Ȯ��
DESC departments;-->not null�ϰ�� ������ ������ �Է��ؾ��Ѵ�.(�⺻Ű�� ���������� �����Ͱ� �����ؾ��Ѵ�.)


INSERT INTO  COPY_DEP(department_id,department_name)
VALUES(280,'Music');

INSERT INTO  COPY_DEP(department_id,department_name)
VALUES(280,'�����ٶ󸶹ٻ������');

SELECT*FROM copy_dep;



--����1  departments ���̺� ������ ���� ������ department_id, department_name,
-- manager_id�� 200, location_id�� 1700�� ���� 3�� �Է��ϼ���.


INSERT INTO departments VALUES(271,'Sample Dept1',200,1700);
INSERT INTO departments VALUES(272,'Sample Dept2',200,1700);
INSERT INTO departments VALUES(273,'Sample Dept3',200,1700);

SELECT*FROM  departments;
--Ʈ����� �߰�
ROLLBACK;



--����2  �Ʒ��� ���� ���̺��� ������  SELECT ���� �̿��Ͽ� departments ���̺� ������ ���� �Է��Ͻÿ�. ( ���� scott���� 3��° ���)
--copy_departments ��� ���̺��� ����
CREATE TABLE copy_departments( department_id number(4,0),
                              department_name varchar2(30 byte),
                              manager_id number(6,0),
                              location_id number(4,0));
                              
DESC copy_departments;


--�����ͼ���
--����1copy_departments ���̺��� department_id 150���� 200���� �μ���ȣ�� manager_ID �� 100���� �����϶�.
UPDATE departments
SET manager_id=100,location_id  = 2400;--������ ���� �޸�(,)�� �и�
--WHERE department_id between 150 and 200;--������ ���� ���� ������� ��ü�࿡ ����ȴ�.

select*from departments;
ROLLBACK;

--�������� ����
--DELETE

DELETE FROM departments where department_id=271;
DELETE FROM departments where department_id=272;
DELETE FROM departments where department_id=273;

--�������̺��� �μ����Ϻ��� �����ϴ� �μ��� ������ �ȵȴ�.
DELETE FROM departments ;
select*from departments;


DELETE FROM copy_dep;--����� ����
select*from copy_dep;--Ȯ��
ROLLBACK;

DESC departments;

--����Ŭ ������ Ÿ��

--���ڿ��� VARCHAR2( n)�� ���
--n�� ����Ʈ��, �ѱ��� 3����Ʈ�� �����Ѵ�. ������ ���ڴ� 1����Ʈ

--�������� NUMBER(P,S)�� ���
--(P,S)������ �� 38�ڸ����� ���� �� �Ҽ��� ���尡��
--P�� �Ҽ��� ���� �ڸ���, S�� �Ҽ����� �ڸ���(0�� �ڸ����� ���Ե��� �ʴ´�.)
DESC departments;
DESC employees;
