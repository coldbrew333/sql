--�������� �Է�

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


--����1  departments ���̺� ������ ���� ������ department_id, department_name,
-- manager_id�� 200, location_id�� 1700�� ���� 3�� �Է��ϼ���.
INSERT INTO COPY_DEP(department_id,department_name,manager_id,location_id)
VALUES(271,'Sample Dept1',200,1700);

INSERT INTO COPY_DEP(department_id,department_name,manager_id,location_id)
VALUES(272,'Sample Dept2',200,1700);

INSERT INTO COPY_DEP(department_id,department_name,manager_id,location_id)
VALUES(273,'Sample Dept3',200,1700);

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

INSERT INTO departments()