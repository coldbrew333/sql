
-- Do it!  å 89������ ��� ȭ�鿡 ���� 2��scott�� adams�� �����ִµ� 
--�츮�� ��ġ�� ������Ŭ xe�����̾ �׷���,
--2���� �߰��ϴ� sql��,��ü ��ũ��Ʈ ���� �Ǵ� �ϳ��� ���徿 �����ص� �ȴ�.

INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        TO_DATE('1987-04-19', 'YYYY-MM-DD'), 3000, NULL, 20);--O_DATE('1987-04-19'), 3000, NULL, 20 �̷��� �ᵵ �ȴ�.
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        TO_DATE('1987-05-23', 'YYYY-MM-DD'), 1100, NULL, 20);

COMMIT; -- DB�� ��������

select*from emp;