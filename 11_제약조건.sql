--��������

--���� �̸��� ���� �ٿ� ��������
CREATE TABLE emp(
    eno NUMBER(3)CONSTRAINT emp_eno_pk PRIMARY KEY,--���̸� ���� �������ǵ� �߰�
    emp_name  VARCHAR2(20)
    );
    
    DESC emp;
    DROP TABLE emp;--emp ���̺� ����
    
    CREATE TABLE emp(
    eno NUMBER(3),--���̸� ���� �������ǵ� �߰�
    emp_name  VARCHAR2(20),
    CONSTRAINT emp_eno_pk PRIMARY KEY(eno)--���� �Ʒ��� �������� �߰�
    );---emp(���̺�)_eno(���̸�)_pk(��������),[CONSTRAINT emp_eno_pk]->���������� �̸�
    
    
    CREATE TABLE emp(
    eno NUMBER(3 )PRIMARY KEY,--���̸� ���� �������ǵ� �߰�
    emp_name  VARCHAR2(20)
    );--,[CONSTRAINT emp_eno_pk]-->���ȣ�� �ִ°�� ��������

 DESC emp;
 DROP TABLE emp;--emp ���̺� ����
 
 --NOT NULL��������:�ΰ��� ������� �ʴ´�.(�Է��� �ؾ��Ѵ�.)
 DESC departments;
 
 --�μ� ���̺� ���� �Է�(�̶� department_name�� �Է����� �ʾ����Ƿ� ���� �߻�=>NOT NULL��������)
 INSERT INTO departments(department_id, manager_id,location_id)
 VALUES(400,200,1700);--department_name�� null���� ������� �ʴ´�.
 
 
 CREATE TABLE emp(
 eno NUMBER(3 )PRIMARY KEY,--���̸� ���� �������ǵ� �߰�
 emp_name  VARCHAR2(20)NOT NULL
    );

DESC emp;
INSERT INTO emp VALUES (1,NULL);--emp_name���� null ���� �־����� ����
INSERT INTO emp(eno) VALUES (2);--emp_name���� �Է� �������� ����

--����ũ(Unique Key)����Ű(�ߺ� ����)
DROP TABLE EMP;

 CREATE TABLE emp(
    eno                NUMBER(3 )PRIMARY KEY,--���̸� ���� �������ǵ� �߰�
    emp_name    VARCHAR2(20)NOT NULL,
    email              VARCHAR2(30)UNIQUE--�ߺ�����
    );
    
INSERT INTO emp VALUES(1,'hong','hong@naver');
INSERT INTO emp VALUES(2,'hwang','hwang@naver');
INSERT INTO emp VALUES(3,'kim','kim@naver');
INSERT INTO emp VALUES(4,'kim','kim@naver');--3�� kim@naver�� ���� ��->����ũ �������� �����...

 