
-- Do it!  책 89페이지 결과 화면에 보면 2명scott과 adams가 빠져있는데 
--우리가 설치하 ㄴ오라클 xe버전이어서 그렇고,
--2명을 추가하는 sql문,전체 스크립트 실행 또는 하나의 문장씩 실행해도 된다.

INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('1987-04-19', 'YYYY-MM-DD'), 3000, NULL, 20);--O_DATE('1987-04-19'), 3000, NULL, 20 이렇게 써도 된다.
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('1987-05-23', 'YYYY-MM-DD'), 1100, NULL, 20);

COMMIT; -- DB에 영구저장

select*from emp;