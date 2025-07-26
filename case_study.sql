
CREATE DATABASE IF not exists furama_resort;
use furama_resort;
CREATE TABLE vi_tri (
    ma_vi_tri INT PRIMARY KEY,
    ten_vi_tri VARCHAR(50)
);

CREATE TABLE trinh_do (
    ma_trinh_do INT PRIMARY KEY,
    ten_trinh_do VARCHAR(50)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT PRIMARY KEY,
    ten_bo_phan VARCHAR(50)
);

CREATE TABLE nhan_vien (
    ma_nhan_vien INT PRIMARY KEY,
    ho_ten VARCHAR(50),
    ngay_sinh DATE,
    so_cmnd VARCHAR(20),
    luong DOUBLE,
    so_dien_thoai VARCHAR(15),
    email VARCHAR(50),
    dia_chi VARCHAR(100),
    ma_vi_tri INT,
    ma_trinh_do INT,
    ma_bo_phan INT
);

CREATE TABLE loai_khach (
    ma_loai_khach INT PRIMARY KEY,
    ten_loai_khach VARCHAR(50)
);

CREATE TABLE khach_hang (
    ma_khach_hang INT PRIMARY KEY,
    ho_ten VARCHAR(50),
    ngay_sinh DATE,
    gioi_tinh BIT,
    so_cmnd VARCHAR(20),
    so_dien_thoai VARCHAR(15),
    email VARCHAR(50),
    dia_chi VARCHAR(100),
    ma_loai_khach INT
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT PRIMARY KEY,
    ten_kieu_thue VARCHAR(50)
);

CREATE TABLE dich_vu (
    ma_dich_vu INT PRIMARY KEY,
    mo_ta_tien_nghi_khac TEXT,
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    ma_kieu_thue INT,
    ma_loai_dich_vu INT
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(50),
    gia DOUBLE,
    don_vi VARCHAR(20),
    trang_thai VARCHAR(100)
);

CREATE TABLE hop_dong (
    ma_hop_dong INT PRIMARY KEY,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT
);

CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT PRIMARY KEY,
    so_luong INT,
    ma_hop_dong INT,
    ma_dich_vu_di_kem INT
);

-- INSERT INTO vi_tri
INSERT INTO vi_tri VALUES
(1, 'Lễ tân'),
(2, 'Phục vụ'),
(3, 'Quản lý'),
(4, 'Giám sát');

-- INSERT INTO trinh_do
INSERT INTO trinh_do VALUES
(1, 'Trung cấp'),
(2, 'Cao đẳng'),
(3, 'Đại học'),
(4, 'Sau đại học');

-- INSERT INTO bo_phan
INSERT INTO bo_phan VALUES
(1, 'Nhân sự'),
(2, 'Kế toán'),
(3, 'Lễ tân'),
(4, 'Dịch vụ');

-- INSERT INTO loai_khach
INSERT INTO loai_khach VALUES
(1, 'Diamond'),
(2, 'Platinum'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Member');

-- INSERT INTO nhan_vien
INSERT INTO nhan_vien (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES 
(1, 'Nguyễn Văn An', '1970-11-07', '456231786', 10000000, '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', 1, 3, 1),
(2, 'Lê Văn Bình', '1997-04-09', '654231234', 7000000, '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', 1, 2, 2),
(3, 'Hồ Thị Yến', '1995-12-12', '999231723', 14000000, '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', 1, 3, 2),
(4, 'Võ Công Toản', '1980-04-04', '123231365', 17000000, '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', 1, 4, 4),
(5, 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', 6000000, '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', 2, 1, 1),
(6, 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', 7000000, '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', 2, 2, 3),
(7, 'Nguyễn Hữu Hà', '1993-01-01', '534323231', 8000000, '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', 2, 3, 2),
(8, 'Nguyễn Hà Đông', '1989-09-03', '234414123', 9000000, '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', 2, 4, 4),
(9, 'Tòng Hoang', '1982-09-03', '256781231', 6000000, '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', 2, 4, 4),
(10, 'Nguyễn Công Đạo', '1994-01-08', '755434343', 8000000, '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', 2, 3, 2);


-- INSERT INTO khach_hang
INSERT INTO khach_hang
(ma_khach_hang, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES
(1, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
(2, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
(3, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
(4, 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
(5, 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
(6, 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
(7, 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
(8, 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
(9, 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
(10, 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);


-- INSERT INTO loai_dich_vu
INSERT INTO loai_dich_vu VALUES
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

-- INSERT INTO kieu_thue
INSERT INTO kieu_thue VALUES
(1, 'Ngày'),
(2, 'Tuần'),
(3, 'Tháng'),
(4, 'Năm');

-- INSERT INTO dich_vu
INSERT INTO dich_vu VALUES
(1, 'Có hồ bơi', 500, 4, 3, 1),
(2, 'Có thêm bếp nướng', NULL, 3, 2, 2),
(3, 'Có tivi', NULL, NULL, 4, 3),
(4, 'Có hồ bơi', 300, 3, 3, 1),
(5, 'Có thêm bếp nướng', NULL, 2, 3, 2),
(6, 'Có tivi', NULL, NULL, 4, 3);

-- INSERT INTO dich_vu_di_kem
INSERT INTO dich_vu_di_kem VALUES
(1, 'Karaoke', 10000, 'giờ', 'tiện nghi, hiện tại'),
(2, 'Thuê xe máy', 10000, 'chiếc', 'hỏng 1 xe'),
(3, 'Thuê xe đạp', 20000, 'chiếc', 'tốt'),
(4, 'Buffet buổi sáng', 15000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(5, 'Buffet buổi trưa', 90000, 'suất', 'đầy đủ đồ ăn, tráng miệng'),
(6, 'Buffet buổi tối', 16000, 'suất', 'đầy đủ đồ ăn, tráng miệng');

-- INSERT INTO hop_dong
INSERT INTO hop_dong VALUES
(1, '2020-12-08', '2020-12-08', 0, 3, 1, 3),
(2, '2020-07-14', '2020-07-21', 200000, 2, 3, 1),
(3, '2021-03-15', '2021-03-17', 50000, 3, 2, 2),
(4, '2021-01-14', '2021-01-18', 100000, 2, 3, 5),
(5, '2021-07-14', '2021-07-15', 0, 2, 2, 6);

-- INSERT INTO hop_dong_chi_tiet
INSERT INTO hop_dong_chi_tiet VALUES
(1, 5, 2, 4),
(2, 8, 2, 5),
(3, 15, 2, 6),
(4, 1, 3, 1),
(5, 11, 3, 2),
(6, 1, 1, 3),
(7, 2, 1, 2),
(8, 2, 5, 2);


-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
-- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT * 
FROM nhan_vien
WHERE LEFT(SUBSTRING_INDEX(ho_ten, ' ', -1), 1) IN ('H', 'T', 'K')
AND LENGTH(ho_ten) <= 15;

  
-- 3. Hiển thị thông tin của tất cả khách hàng có độ 
-- tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.


  
SELECT * 
FROM khach_hang
WHERE 
  FLOOR(DATEDIFF(CURRENT_DATE, ngay_sinh) / 365) BETWEEN 18 AND 50
AND (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị');



-- 4. Đếm số lần khách hàng loại Diamond đặt phòng
SELECT kh.ma_khach_hang, kh.ho_ten, COUNT(hd.ma_hop_dong) AS so_lan_dat
FROM khach_hang kh
JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang, kh.ho_ten
ORDER BY so_lan_dat ASC;

-- 5. Hiển thị dịch vụ đi kèm sử dụng nhiều nhất
SELECT dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, SUM(hdct.so_luong) AS tong_so_luong
FROM dich_vu_di_kem dvdk
JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
ORDER BY tong_so_luong DESC;

-- 6. Tính doanh thu theo loại dịch vụ (Villa, House, Room)
SELECT ldv.ten_loai_dich_vu, SUM(hd.tien_dat_coc) AS tong_doanh_thu
FROM loai_dich_vu ldv
JOIN dich_vu dv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY ldv.ten_loai_dich_vu;

-- 7. Hiển thị các hợp đồng có số lượng dịch vụ đi kèm > 10
SELECT hd.ma_hop_dong, SUM(hdct.so_luong) AS tong_so_luong
FROM hop_dong hd
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong
HAVING tong_so_luong > 10;

-- 8. Hiển thị những nhân viên làm hợp đồng với tổng tiền đặt cọc > 100000
SELECT nv.ma_nhan_vien, nv.ho_ten, SUM(hd.tien_dat_coc) AS tong_coc
FROM nhan_vien nv
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
GROUP BY nv.ma_nhan_vien, nv.ho_ten
HAVING tong_coc > 100000;

-- 9. Hiển thị khách hàng chưa từng đặt phòng
SELECT *
FROM khach_hang
WHERE ma_khach_hang NOT IN (SELECT ma_khach_hang FROM hop_dong);

-- 10. Hiển thị dịch vụ đã được khách hàng sử dụng
SELECT DISTINCT dv.*
FROM dich_vu dv
JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu;

-- 11. Hiển thị nhân viên không làm hợp đồng
SELECT *
FROM nhan_vien
WHERE ma_nhan_vien NOT IN (SELECT ma_nhan_vien FROM hop_dong);

-- 12. Hiển thị danh sách dịch vụ đi kèm chưa bao giờ được sử dụng
SELECT *
FROM dich_vu_di_kem
WHERE ma_dich_vu_di_kem NOT IN (SELECT DISTINCT ma_dich_vu_di_kem FROM hop_dong_chi_tiet);

-- 13. Hiển thị hợp đồng và tên khách hàng, tên nhân viên làm hợp đồng
SELECT hd.ma_hop_dong, kh.ho_ten AS ten_khach_hang, nv.ho_ten AS ten_nhan_vien
FROM hop_dong hd
JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien;

-- 14. Hiển thị danh sách dịch vụ và số lần được thuê
SELECT dv.ma_dich_vu, dv.mo_ta_tien_nghi_khac, COUNT(hd.ma_dich_vu) AS so_lan_thue
FROM dich_vu dv
JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY dv.ma_dich_vu, dv.mo_ta_tien_nghi_khac;

-- 15. Hiển thị dịch vụ được thuê nổi bật nhất (số lần thuê nhiều nhất)
SELECT dv.ma_dich_vu, dv.mo_ta_tien_nghi_khac, COUNT(hd.ma_dich_vu) AS so_lan_thue
FROM dich_vu dv
JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
GROUP BY dv.ma_dich_vu, dv.mo_ta_tien_nghi_khac
ORDER BY so_lan_thue DESC
LIMIT 1;




										





