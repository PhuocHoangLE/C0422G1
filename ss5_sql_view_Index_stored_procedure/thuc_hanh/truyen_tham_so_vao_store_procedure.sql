use classicmodels ;

-- THAM SỐ INT
delimiter //
create procedure getCusById
(in cusNum INT(11))
begin
select * from customers where customerNumber = cusNum ;
end //
delimiter ;
call getCusById(175) ;

-- THAM SỐ OUT
delimiter //
CREATE PROCEDURE GetCustomersCountByCity(
IN in_city varchar(50),
OUT total INT )
BEGIN
select count(customerNumber)
INTO total
from customers
where city = in_city ;
end //
delimiter ;
call GetCustomersCountByCity('Lyon',@total) ;
select @total

-- THAM SỐ LOẠI INOUT
delimiter //
create procedure SetCounter(
INOUT counter INT ,
IN inc INT
)
BEGIN
SET counter = counter + inc ;
END //
delimiter ;
SET @counter = 1 ;
CALL SetCounter(@counter,1) ;
CALL SetCounter(@counter,1) ;
CALL SetCounter(@counter,5) ;
SELECT @counter ;