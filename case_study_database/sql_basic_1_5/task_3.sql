-- task 3 : Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
use furama ;
SELECT 
    *
FROM
    khach_hang
WHERE
    (ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) >= 18
        AND ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) <= 50
        AND dia_chi LIKE '%Đà Nẵng'
        OR dia_chi LIKE '%Quảng Trị')


 