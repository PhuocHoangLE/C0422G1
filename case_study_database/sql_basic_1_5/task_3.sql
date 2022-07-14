-- task 3 : Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
use furama ;
select * from khach_hang 
where (round(datediff(curdate(),ngay_sinh)/365,0) >= 18
and round(datediff(curdate(),ngay_sinh)/365,0) <= 50
and dia_chi like "%Đà Nẵng"
or dia_chi like "%Quảng Trị") ;


 