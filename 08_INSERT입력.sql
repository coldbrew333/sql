--데이터의 입력

--부선 테이블 복사하여 COPY_DEP테이블을 만든다
CREATE TABLE COPY_DEP
AS 
SELECT*FROM  departments;---->AS 다음 셀렉트문을 복사

--복사한 테이블에 입력
INSERT INTO  COPY_DEP(department_id,department_name,manager_id,location_id)
VALUES(300,'Game',100,1700);

select*from copy_dep;
--테이블의 열을 확인
DESC departments;-->not null일경우 무조건 데이터 입력해야한다.(기본키도 마찬가지로 데이터가 존재해야한다.)


INSERT INTO  COPY_DEP(department_id,department_name)
VALUES(280,'Music');


--예제1  departments 테이블에 다음과 같이 각각의 department_id, department_name,
-- manager_id가 200, location_id가 1700인 행을 3개 입력하세요.
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
--트랜잭션 중간
ROLLBACK;



--예제2  아래와 같이 테이블을 만든후  SELECT 문을 이용하여 departments 테이블 내용을 전부 입력하시오. ( 위의 scott예제 3번째 방법)
--copy_departments 라는 테이블을 만듬
CREATE TABLE copy_departments( department_id number(4,0),
                              department_name varchar2(30 byte),
                              manager_id number(6,0),
                              location_id number(4,0));
                              
DESC copy_departments;

INSERT INTO departments()