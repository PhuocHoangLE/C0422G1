use quanlysinhvien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    *
FROM
    `subject`
WHERE
    credit;
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT 
    *
FROM
    `subject`
WHERE
    sub_id = (SELECT 
            sub_id
        FROM
            mark
        WHERE
            mark = (SELECT 
                    MAX(mark.mark)
                FROM
                    mark));
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT student.*, 
			AVG(mark.mark) 
            AS diem_trung_binh
FROM student
			JOIN mark ON student.student_id = mark.student_id
GROUP BY student.student_id
ORDER BY diem_trung_binh DESC;
