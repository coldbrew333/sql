--�ε��� Ȯ��
--�ε����� �ڵ����� �⺻Ű,����ũ ���� �����ȴ�.
SELECT 

      TABLE_NAME                ���̺��,

      INDEX_NAME                �ε����̸�,

      COLUMN_NAME            �÷��̸�

FROM ALL_IND_COLUMNS 

WHERE TABLE_NAME ='EMPLOYEES';
--�ܷ�Ű�� �ٸ� ���̺� �⺻Ű�� ����

--�ε��� �ǽ��� ���̺� �ۼ�
DROP TABLE MEMBERS;
CREATE TABLE MEMBERS(
member_id NUMBER PRIMARY KEY,
first_name VARCHAR2(100) NOT NULL,
last_name VARCHAR2(100)NOT NULL,
gender VARCHAR2(1) NOT NULL,
dob     DATE                NOT NULL,
email   VARCHAR2(255) NOT NULL
);

SELECT*FROM MEMBERS ORDER BY member_id;
DELETE FROM MEMBERS;

SELECT 

      TABLE_NAME                ���̺��,

      INDEX_NAME                �ε����̸�,

      COLUMN_NAME            �÷��̸�

FROM ALL_IND_COLUMNS 

WHERE TABLE_NAME= 'MEMBERS';

--SQL���� ���࿡ ���� ���� �����

EXPLAIN PLAN FOR--�Ʒ��� ����Ʈ�� ����� ������ �����Ѵ�.
SELECT*FROM  MEMBERS
WHERE LAST_NAME='Harse';

--����� ���� �б�
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY());

--�ε��� ����� ��� ���̺��� last_name�� �ε�������
CREATE INDEX  members_last_name_i--�ε��� �̸�
ON members(last_name);


