-- task 9 : Thực hiện thống kê doanh thu theo tháng, nghĩa là 
-- tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT 
    MONTH(hop_dong.ngay_lam_hop_dong) AS tháng,
    COUNT(MONTH(hop_dong.ngay_lam_hop_dong)) AS số_khách_đặt_phòng
FROM
    hop_dong
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = 2021
GROUP BY MONTH(hop_dong.ngay_lam_hop_dong)
ORDER BY MONTH(hop_dong.ngay_lam_hop_dong)