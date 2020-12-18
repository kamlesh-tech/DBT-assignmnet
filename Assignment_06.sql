use assignment;

-- 1.	Write function that accepts a positive number from a user and displays its factorial on the screen.

delimiter $$
create function QUE_01( val int) returns int
begin
declare  iterator int(10) default 1;
	loop1 : Loop
	if(val <= 0) then
    leave loop1;
    end if;
    set iterator = iterator*val;
    set val =val-1;
    iterate loop1;
    end loop;
return iterator;
end ; $$

 -- drop function  Que_01;
set @value=5;
select Que_01(@value);

/*---------------------------------------------------------------------------------------------------*/

-- 2.	Write a function that accepts a positive number ‘n’ and displays whether that number is a Prime number or not.

delimiter $$
CREATE FUNCTION Que02(X INT) RETURNS VARCHAR(10)
BEGIN
	DECLARE M ,I INT;
	SET I=2;
	SET M=X/2;
	IF X=0 || X=1 THEN 
		RETURN 'NOT PRIME';
    ELSE
		L1: LOOP
		WHILE I<=M DO
			IF X%2=0 THEN 
				RETURN 'NOT PRIME';
				LEAVE L1;
				ELSE
				SET I=I+1;
				ITERATE L1;
			END IF;
	   END WHILE;
       RETURN 'PRIME';
	END LOOP L1;
	END IF;
END$$

select que02(5);

/*---------------------------------------------------------------------------------------------------*/
-- 3.	Write a function to Convert an inputed number of inches into yards, feet, and inches. For example, 124 inches equals 3 yards, 1 foot, and 4 inches.

delimiter $$
create function Que03( val int(20)) returns varchar(200)
begin

return concat(val ,' inches ', round(val/36),' yards ',round(val/12),' foot ');
end;$$

 -- drop function Que03;

select Que03(12);
/*---------------------------------------------------------------------------------------------------*/
-- 4.	Write a function to update salary of the employees of specified dept by 10%. Take dept no as parameter.

-- select * from emp;
delimiter $$
create function Que04(dept int) returns varchar(20)
begin
update emp set sal=sal+(sal*0.10) where deptno=dept;
return 'UPDATED';
end;$$

SELECT QUE04(30);

/*---------------------------------------------------------------------------------------------------*/

/*5.Create a function named USER_ANNUAL_COMP that has a parameter p_eno for passing on the values of  an employee number of the employee and p_comp for passing the compansation. In the function calculates and returns the annual compensation of the employee by using the following formula.
		annual_compensation =  (p_sal+p_comm)*12
If the salary or commission value is NULL then zero should be substituted for it.  Give a call to USER_ANNUAL_COMP.*/

-- select * from emp;
delimiter $$
 create function Que05(empn int ,comp int ) returns int
 begin
 declare val int;
 set val=(select sal from emp where empno=empn);
 return (val+comp)*12;
 end;$$
 
 
 select Que05(1004,20) as 'updated salary';
 
 /*---------------------------------------------------------------------------------------------------*/

/*6.	Create a procedure called USER_QUERY_EMP that accepts three parameters. Parameter p_myeno is of IN parameter mode 
which provides the empno value. The other two parameters p_myjob and p_mysal are of OUT mode. The procedure retrieves the salary and job of an employee 
with the provided employee number and assigns those to the two OUT parameters respectively. The procedure should raise the error if the empno
 does not exist in the EMP table by displaying an appropriate message*/
 


