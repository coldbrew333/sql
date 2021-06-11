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

﻿
-- PK FK 기본키, 외래키


CREATE TABLE dept(

dno NUMBER(4),

dname VARCHAR2(20),

CONSTRAINT dept_dno_pk PRIMARY KEY(dno)

);

INSERT INTO dept VALUES(1, 'first');

SELECT * FROM dept;


DROP TABLE emp;


-- 외래키 PK

CREATE TABLE emp(

eno NUMBER(4),

enp_name VARCHAR2(20),

sal NUMBER(10),

dno NUMBER(4),

CONSTRAINT emp_dno_pk PRIMARY KEY(eno),

CONSTRAINT emp_dno_fk FOREIGN KEY(dno) REFERENCES dept(dno)

-- 외래키 dno 좌표는 dept 테이블에 dno열

);


-- 부서 테이블에 테스트 부서 값 들 을 입력

INSERT INTO dept VALUES ( 10, 'Text 1');

INSERT INTO dept VALUES ( 20, 'Text 2');

INSERT INTO dept VALUES ( 30, 'Text 3');

INSERT INTO dept VALUES ( 40, 'Text 4');

INSERT INTO dept VALUES ( 50, 'Text 5');


SELECT * FROM dept;

DELETE FROM dept WHERE dno = 1;

-- INSERT INTO dept VALUES(1, 'first'); 이거 삭제 한거임


-- EMP 직원 테이블에 값을 입력

INSERT INTO dept VALUES (1010 , 'Kim', 200, 60); -- 외래키 에러


INSERT INTO emp VALUES (1010 , 'Kim', 200, 10);

INSERT INTO emp VALUES (1020 , 'Lee', 180, 20);

INSERT INTO emp VALUES (1030 , 'jung', 220, 30);

INSERT INTO emp VALUES (1040 , 'Ch', 250, 40);

INSERT INTO emp VALUES (1050 , 'Kimg', 300, 50);

INSERT INTO emp VALUES (1060 , 'Kang', 500, NULL); -- 외래키는 널값가능 또는 참조열의 값만


SELECT * FROM emp;


-- 제약조건을 출력하는 SQL문

SELECT *

FROM ALL_CONSTRAINTS -- 오라클에서 자동 생성된 테이블에 제약조건들이 담겨있다.

WHERE TABLE_NAME = 'EMPLOYEES'; -- 이떄 테이블 명은 대문자로


-- 제약 조건의 추가

-- 우선 기본 테이블 작성

CREATE TABLE CLASS(

cno VARCHAR2(2),

cname VARCHAR2(50)

);


INSERT INTO class VALUES( '01', '데이터베이스');

INSERT INTO class VALUES( '02', '프로그래밍');

SELECT *

FROM class;


CREATE TABLE STUDENT(

sno VARCHAR2(4),

sname VARCHAR2(50),

cno VARCHAR2(2)

);

INSERT INTO STUDENT VALUES( '0414', '홍길동', 01);

INSERT INTO STUDENT VALUES( '0415', '임꺽정', 02);

INSERT INTO STUDENT VALUES( '0416', '이순신', 03);

SELECT * FROM student;


-- 클래스 테이블에 제약조건 추가

ALTER TABLE class

ADD CONSTRAINT class_cno_pk PRIMARY KEY (cno); --cno밑에 기본키 추가



ALTER TABLE class

ADD CONSTRAINT class_cname_uk UNIQUE (cname); --cno밑에 유니크키 추가


-- 학생 테이블 제약조건 추가

ALTER TABLE student

ADD CONSTRAINT class_sno_pk PRIMARY KEY (sno); -- sno밑에 기본키 추가


ALTER TABLE student

MODIFY sname CONSTRAINT student_sname_nn NOT NULL; -- sname밑에 NOT NULL 추가 MODIFY


ALTER TABLE student

ADD CONSTRAINT class_cno_pk FOREIGN KEY (cno) REFERENCES CLASS(cno); -- sno밑에 기본키 추가

-- 이미 학생 테이블에 들어있는 데이터가 참조테이블에 없는 클래스번호 이기 때무넹


-- 학생테이블의 아이디 1416번을 cno를 01로수정

UPDATE student SET cno='01'

WHERE sno='0416';

SELECT * FROM student;


-- 제약조건의 삭제

ALTER TABLE CLASS

DROP CONSTRAINT CLASS_CNAME_UK; --계약조건의 이름으로 삭제


ALTER TABLE CLASS

DROP CONSTRAINT CLASS_CNO_PK; -- 기본키 삭제 이미학생 테이블에서 클래스테이블의 cno를 참조하고 있음


-- 이떄 참조하는 외래키 제약조건도 함께 삭제

ALTER TABLE CLASS

DROP CONSTRAINT CLASS_CNO_PK CASCADE; -- CASCADE가 연결되어 있는 외래키도 같이 삭제한다


ALTER TABLE student

DROP PRIMARY KEY; -- 기본키 삭제


ALTER TABLE student

DROP CONSTRAINT STUDENT_SNAME_NN; -- 제약조건 이름으로 not null 삭제

﻿
 
