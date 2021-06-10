--제약조건

--열의 이름과 같은 줄에 제약조건
CREATE TABLE emp(
    eno NUMBER(3)CONSTRAINT emp_eno_pk PRIMARY KEY,--열이름 옆에 제약조건도 추가
    emp_name  VARCHAR2(20)
    );
    
    DESC emp;
    DROP TABLE emp;--emp 테이블 삭제
    
    CREATE TABLE emp(
    eno NUMBER(3),--열이름 옆에 제약조건도 추가
    emp_name  VARCHAR2(20),
    CONSTRAINT emp_eno_pk PRIMARY KEY(eno)--열의 아래에 제약조건 추가
    );---emp(테이블)_eno(열이름)_pk(제약조건),[CONSTRAINT emp_eno_pk]->제약조건의 이름
    
    
    CREATE TABLE emp(
    eno NUMBER(3 )PRIMARY KEY,--열이름 옆에 제약조건도 추가
    emp_name  VARCHAR2(20)
    );--,[CONSTRAINT emp_eno_pk]-->대괄호가 있는경우 생략가능

 DESC emp;
 DROP TABLE emp;--emp 테이블 삭제
 
 --NOT NULL제약조건:널값을 허용하지 않는다.(입력을 해야한다.)
 DESC departments;
 
 --부서 테이블에 값을 입력(이때 department_name을 입력하지 않았으므로 에러 발생=>NOT NULL제약조건)
 INSERT INTO departments(department_id, manager_id,location_id)
 VALUES(400,200,1700);--department_name은 null값을 허용하지 않는다.
 
 
 CREATE TABLE emp(
 eno NUMBER(3 )PRIMARY KEY,--열이름 옆에 제약조건도 추가
 emp_name  VARCHAR2(20)NOT NULL
    );

DESC emp;
INSERT INTO emp VALUES (1,NULL);--emp_name열에 null 값을 넣었을때 에러
INSERT INTO emp(eno) VALUES (2);--emp_name옆에 입력 안했을때 에러

--유니크(Unique Key)고유키(중복 방지)
DROP TABLE EMP;

 CREATE TABLE emp(
    eno                NUMBER(3 )PRIMARY KEY,--열이름 옆에 제약조건도 추가
    emp_name    VARCHAR2(20)NOT NULL,
    email              VARCHAR2(30)UNIQUE--중복방지
    );
    
INSERT INTO emp VALUES(1,'hong','hong@naver');
INSERT INTO emp VALUES(2,'hwang','hwang@naver');
INSERT INTO emp VALUES(3,'kim','kim@naver');
INSERT INTO emp VALUES(4,'kim','kim@naver');--3번 kim@naver와 값은 값->유니크 제약조건 어겼음...

 