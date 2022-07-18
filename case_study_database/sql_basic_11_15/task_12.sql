-- task 12:Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT 
    hop_dong.ma_hop_dong,
    nhan_vien.ho_ten,
    khach_hang.ho_ten,
    khach_hang.so_dien_thoai,
    dich_vu.ten_dich_vu,
    SUM(IFNULL(hop_dong_chi_tiet.so_luong, 0)) AS so_luong_dich_vu_di_kem,
    hop_dong.tien_dat_coc
FROM
    hop_dong
        JOIN
    nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
        JOIN
    khach_hang ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
WHERE
    hop_dong.ma_hop_dong IN (SELECT 
            hop_dong.ma_hop_dong
        FROM
            hop_dong
        WHERE
            (MONTH(hop_dong.ngay_lam_hop_dong) BETWEEN 10 AND 12)
                AND YEAR(hop_dong.ngay_lam_hop_dong) = 2020)
        AND hop_dong.ma_hop_dong NOT IN (SELECT 
            hop_dong.ma_hop_dong
        FROM
            hop_dong
        WHERE
            (MONTH(hop_dong.ngay_lam_hop_dong) BETWEEN 1 AND 6)
                AND YEAR(hop_dong.ngay_lam_hop_dong) = 2021)
GROUP BY hop_dong.ma_hop_dong;



