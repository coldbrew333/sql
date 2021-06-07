-- JOIN:두개의 테이블을 합쳐서 원하는 데이터출력
SELECT e.employee_id 직원번호, last_name 이름, e.department_id 부서번호,department_name 부서명
FROM employees  e JOIN departments d
ON e.department_id=d.department_id;--테이블의 관계를 먼저 살펴본다.->테이블은 틀려도 열의 이름은 같다

--3개의 테이블 조인
select e.employee_id,l.city,d.department_name
from employees e
join departments d
    on e.department_id=d.department_id
join locations l
    on d.location_id = l.location_id;

--예제1
select d.department_name 부서명 ,l.city 도시명,c.country_name 국가명
from countries c
join locations l
         on c.country_id=l.country_id
join departments d
          on l.location_id=d.location_id
where l.city in('Seattle','London') AND c.country_name like 'United%';

--자체 조인:같은 테이블 내에서 참조열이 있을경우, 조인할때
--같은 테이블로 조인
select e.last_name 직원이름, m.last_name 매니저이름
from employees e
join employees m
    on e.manager_id=m.employee_id;
--외부조인(OUTER JOIN)
--조인 조건에 일치하지 않는 데이터까지 출력한다.
--LEFT,RIGHT,FULL

--LEFT:JOIN의 왼쪽 테이블에 NULL값이라도 출력
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e --EMPLOYEES DEPARTMENT에 NULL 값 존재
LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id;
    
--RIGHT:JOIN의 오른쪽 테이블에 NULL값이라도 출력
select e.last_name 직원, d.department_id 부서번호, d.department_name 부서명
FROM employees e 
RIGHT OUTER JOIN departments d--부서테이블에만 있는 부서가 있는경우가 있음. 
    ON e.department_id = d.department_id;
--110번까지는 부서명과 부서번호가 있는데, 그밑에 NULL값으로 뜨는 부서명은 직원이 없음

--FULL:JOIN의 왼쪽 오른쪽테이블의 값이 조건에 맞지 않더라도 출력
select e.last_name 직원, d.department_id 부서번호, d.department_name 부서명
FROM employees e 
FULL OUTER JOIN departments d 
    ON e.department_id = d.department_id;--양쪽의 NULL값 다나옴,
--예제1
SELECT c.country_name 국가, c.country_id 국가번호,l.location_id 지역번호,l.city 도시
FROM countries c
LEFT OUTER JOIN locations l
        ON c.country_id=l.country_id;
        
--CROSS JOIN
--예제1
SELECT c.country_name  국가,r.region_name 지역이름
FROM countries c
CROSS JOIN regions r;
