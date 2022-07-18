-- task 8: 	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
SELECT 
    khach_hang.ho_ten
FROM
    khach_hang
GROUP BY khach_hang.ho_ten;