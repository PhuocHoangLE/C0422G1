use quanlysinhvien ;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT 
    *
FROM
    class
WHERE
    start_date LIKE '%12%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * 
from `subject` 
where credit between 3 and 5 ;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'Hung';
set sql_safe_updates = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần .
SELECT 
    s.student_name, su.sub_name, m.mark
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
        JOIN
    `subject` su ON su.sub_id = m.sub_id
ORDER BY mark ASC , su.sub_name; 



