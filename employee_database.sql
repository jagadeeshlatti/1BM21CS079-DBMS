create database if not exists employee;
use employee;
show tables;

create table dept(
deptno int,
dname varchar(30),
dloc varchar(30),
primary key (deptno)
);

insert into dept
values(1,'Logistics','Bengaluru'),
(2,'Statistics','Mysuru'),
(3,'Marketing','Hyderabad'),
(4,'Design','Bengaluru'),
(5,'Management','Mysuru'),
(6,'Finance','Bombay');

select *
from dept;

create table project(
pno int,
ploc varchar(30),
pname varchar(30),
primary key (pno)
);

insert into project
values(01,'Hyderabad','Project_KD'),
(02,'Mysuru','Project_KRANTI'),
(03,'Hyderabad','Project_D56'),
(04,'Bengaluru','Project_RVMN'),
(05,'Bombay','Project_K'),
(06,'Mysuru','Project_THUNIVU');

select*
from project;

create table employee(
empno int,
ename varchar(30),
mgr_no int,
hiredate date,
sal int,
deptno int,
primary key (empno),
foreign key (deptno) references dept (deptno)
);

insert into employee
values(101,'DARSHAN',2310,'2021-10-09',56000,1),
(102,'SUDEEP',2317,'2021-03-07',96000,1),
(103,'YASH',2510,'2021-10-08',66000,1),
(104,'SHIVRAJKUMAR',9310,'2021-02-09',42000,2),
(105,'PRABHAS',3310,'2021-03-04',76000,2),
(106,'JRNTR',5561,'2022-01-05',47900,3),
(107,'ALLUARJUN',7810,'2021-11-19',420000,4),
(108,'AJITH Prasad',4231,'2021-02-13',327100,5),
(109,'RAJANIKANTH',1324,'2021-07-14',87600,5),
(110,'RISHAB',6780,'2021-12-31',123000,5);

select *
from employee;

create table incentives(
empno int,
incentive_date date,
incentive_amount int,
primary key (empno,incentive_date),
foreign key (empno) references employee(empno)
);

insert into incentives
values(101,'2022-10-01',5000),
(106,'2022-11-02',7000),
(102,'2022-05-03',6000),
(105,'2022-07-05',5000),
(110,'2022-08-07',9000);

select *
from incentives;

create table assigned_to(
empno int,
pno int,
job_role varchar(30),
primary key(empno,pno),
foreign key(empno) references employee(empno),
foreign key(pno) references project(pno)
);

insert into assigned_to
values(101,01,'Developer'),
(103,04,'Tester'),
(102,05,'Manager'),
(105,03,'Supervisor'),
(107,02,'Team Leader'),
(106,06,'Executive Manager');

select *
from assigned_to;

select empno
from assigned_to
where pno in ( select pno
				from project
                where ploc in("Bengaluru","Mysuru","Hyderabad"));
                
select empno
from employee
where empno not in(select empno
					from incentives);
                    

select e.ename,e.empno,d.dname,a.job_role,d.dloc,p.ploc
from project p,assigned_to a,employee e,dept d
where p.pno=a.pno and a.empno=e.empno and e.deptno=d.deptno and p.ploc=d.dloc ;




