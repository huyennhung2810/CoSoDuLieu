CREATE DATABASE QuanLy_KhamBenh;
go
use QuanLy_KhamBenh
go
CREATE TABLE THUOC (
	Mathuoc char(10) primary key,
	Tenthuoc nvarchar(50),
	Donvitinh nvarchar(50),
	DonGia money,
	Nhomdieutri nvarchar(50)
)
go
CREATE TABLE HOSO(
	Mahs char(10) PRIMARY KEY,
    Hoten nvarchar(50),
    Ngsinh DATE,
    Gioitinh nvarchar(10),
    Cancuoc char(20),
    Ngaylap DATE
)
go
CREATE TABLE KHAMBENH(
	makb char(10) PRIMARY KEY,
    Mahs char(10),
    Ngaykham DATE,
    Bacsi NVARCHAR(50),
    Ketluan VARCHAR(100),
    FOREIGN KEY (Mahs) REFERENCES HOSO(Mahs)
)
go
CREATE TABLE TOATHUOC(
	makb char(10),
    Mathuoc char(10),
    Soluong char(10),
    PRIMARY KEY (makb, Mathuoc),
    FOREIGN KEY (makb) REFERENCES KHAMBENH(makb),
    FOREIGN KEY (Mathuoc) REFERENCES THUOC(Mathuoc)
)
go

insert into THUOC( Mathuoc,Tenthuoc, Donvitinh,DonGia,Nhomdieutri) values
('MT1', N'Thuốc A', N'viên', 500, N'Covit 19'),
('MT2', N'Thuốc B', N'viên', 400, N'Dị ứng'),
('MT3', N'Thuốc C', N'viên', 700, N'Tiêu hóa')
SELECT * FROM THUOC 

insert into HOSO(Mahs, Hoten, Ngsinh, Gioitinh,Cancuoc,Ngaylap) values
('024', N'Nguyễn Thị A', '2003-10-28', 'Nữ', '123456789', '2019-05-17'),
('235', N'Nguyễn Thị B', '2004-11-24', 'Nữ', '234567896', '2020-06-13'),
('532', N'Nguyễn Thị C', '2002-04-12', 'Nữ', '345678923', '2018-12-23')
SELECT * FROM HOSO

insert into KHAMBENH(makb, Mahs, Ngaykham, Bacsi, Ketluan) values
('mkb1', '024', '1975-12-02', N'Bác sĩ 1', N'Khỏe mạnh'),
('mkb111', '235', '2023-1-1', N'Bác sĩ 2', N'Cần điều trị thêm'),
('mkb3', '532', '2023-1-1', N'Bác sĩ 3', N'Cần có NY')
SELECT * FROM KHAMBENH

insert into TOATHUOC(makb, Mathuoc, Soluong) values
('mkb1', 'MT1', 9),
('mkb111', 'MT2', 25),
('mkb3', 'MT3', 35)
SELECT * FROM TOATHUOC


--Câu 2: Trả lời bằng ngôn ngữ SQL các câu truy vấn sau: (6 điểm)

--1) Hiểnthị (Mathuoc, tenthuoc, soluong)trong những lần khám bệnh của hồ sơ có mã là ‘024’.
SELECT T.Mathuoc, T.Tenthuoc, TT.Soluong
FROM TOATHUOC TT
JOIN KHAMBENH KB ON TT.Makb = KB.Makb
JOIN THUOC T ON TT.Mathuoc = T.Mathuoc
WHERE KB.Mahs = 024

--2) Hiển thị (Mahs, Hotenbn, tuổi, Bacsi, Ketluan) được khám bệnh trong ngày 1/1/2023.

--Sắp xếp d.sách theo Mahs (tăng dần)

--3) Hiển thị (Mahs, Hotenbn, Bacsi, Ketluan, ngày khám) bị kết luận là “Cần có NY”.
SELECT H.Mahs, H.Hoten, KB.Bacsi, KB.Ketluan, KB.Ngaykham
FROM KHAMBENH KB
JOIN HOSO H ON KB.Mahs = H.Mahs
WHERE KB.Ketluan = 'Cần có NY'

--4) Tìm các loại thuốc thuộc nhóm điều trị “tiêu hoá” có giá từ 500 đến 1000 đồng.
SELECT Mathuoc, Tenthuoc, DonGia
FROM THUOC
WHERE Nhomdieutri like N'%Tiêu hóa' AND DonGia BETWEEN 500 AND 1000

--5) Hiển thị (Ngkham, Bacsi, Ketluan) của  các bệnh nhân  sinh trong năm 1975.
SELECT KHAMBENH.Ngaykham, KHAMBENH.Bacsi, KHAMBENH.Ketluan
FROM HOSO
JOIN KHAMBENH ON HOSO.Mahs = KHAMBENH.Mahs
WHERE YEAR(HOSO.Ngsinh) = 1975

--6) In chi tiết các lần khám bệnh (Ngkham, Bacsi, Ketluan) của bệnh có tênsinhvien.
--Sắp xếp theo Ngkham (tăng dần).


SELECT KHAMBENH.Ngaykham, KHAMBENH.Bacsi, KHAMBENH.Ketluan
FROM HOSO
JOIN KHAMBENH ON HOSO.Mahs = KHAMBENH.Mahs
WHERE HOSO.Hoten LIKE '%Sinh viên%'
ORDER BY KHAMBENH.Ngaykham ASC;


--7) Tìm thông tin các bệnh nhân nhieu tuoi nhat.
SELECT *
FROM HOSO
Where Ngsinh = (SELECT MIN(Ngsinh) from HOSO);
--chạy select con trc . lấy kết quả làm điều kiện của select cha

--8) Tìm thông tin các bệnh nhân trên 50 tuổi..
SELECT * FROM HOSO
WHERE YEAR (GETDATE()) - YEAR(Ngsinh) > 50
--9) Đưa ra họ tên bệnh nhân, bác sỹ và tổng tiền của mỗi toa thuốc.
SELECT h.Hoten, k.Bacsi, SUM(t.DonGia * tt.Soluong) AS TongTien
FROM TOATHUOC as tt
JOIN THUOC as t ON tt.Mathuoc = t.Mathuoc
JOIN KHAMBENH as k ON tt.makb = k.makb
JOIN HOSO as h ON k.Mahs = h.Mahs
GROUP BY TT.makb, h.Hoten, k.Bacsi
--nếu có tính tổng thường dùng group
-- tất cả các thuộc tính lấy sau select đặt trong group 
--10)Giảm giá 10% cho các thuốc thuộc nhóm điều trị “Covit 19”.
UPDATE THUOC
SET DonGia = DonGia * 0.9
WHERE Nhomdieutri = 'Covit 19';
SELECT * FROM THUOC
--11) Xóa toa thuốc có makb là ‘mkb34’ hoặc ‘mkb111’.
DELETE FROM TOATHUOC
WHERE makb = 'mkb34' OR makb = 'mkb111';
SELECT * FROM TOATHUOC
--12) Xóa toa thuốc có số lượng <10.
DELETE FROM TOATHUOC
WHERE Soluong < 10;
SELECT * FROM TOATHUOC


SELECT * FROM THUOC
SELECT * FROM HOSO
SELECT * FROM KHAMBENH
SELECT * FROM TOATHUOC

