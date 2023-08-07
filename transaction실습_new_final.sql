-- 사용법:  마우스로 일부분만 선택해서 실행하면서 결과 확인 할 것 csp.
SET IMPLICIT_TRANSACTIONS ON -- autocommit 해제

use LabDB
go

Create Table Simple (
id int primary key,
Name nvarchar(30) 
)
go

insert into Simple values
(1, 'Tom'),
(2, 'Jane'),
(3, 'Jerry'),
(4, 'Lucy');
go

commit work

begin tran  -- 이 지시자는 반드시 필요함.
save tran point1 --20 대
update simple set Name = 'Lucy2' where Name = 'Lucy';
save tran point2 -- 30 대
update simple set Name = 'Tom2' where Name ='Tom';
save tran point3 -- 40대
go

select * from simple;

Rollback tran point1;
go

select * from simple;

Delete from Simple;
Select * from Simple

Rollback 
select * from simple;

delete from simple;

commit

select * from simple;

set IMPLICIT_TRANSACTIONS OFF -- autocommit 설정.. 원상복귀

-- test 