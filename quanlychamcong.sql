CREATE DATABASE QUAN_LY_CHAM_CONG
go 
use QUAN_LY_CHAM_CONG
go

create table NHANVIEN(
MaNV char(10) primary key,
HoTen nvarchar(50),
NgaySinh date,
Luong money,
GTinh nvarchar(10),
)

insert into NHANVIEN(MaNV, HoTen, NgaySinh, Luong, GTinh) values
('V01', N'Trần Văn Tèo', '1968-3-1', 9000000, N'Nam'),
('V02', N'Lê Huy', '1988-3-3', 6000000, N'Nam'),
('V03', N'Đặng Thị Hiếu', '2001-1-5', 60000000, N'Nữ')
SELECT * FROM NHANVIEN

create table DUAN(
MaDA char(10) primary key,
TenDA nvarchar(50),
Nambatdau int,
)
insert into DUAN(MaDA,TenDA,Nambatdau) values
('DA1',N'Phần mềm dạy online', '2019'),
('DA2',N'Mạng toàn cầu', '2020'),
('DA3',N'Quản lý sách', '2021')
select * from DUAN

create table CHAMCONG(
MaNV char(10),
MaDA char(10),
PRIMARY KEY(MaNV, MaDA),
foreign key(MaNV) references NHANVIEN(MaNV),
foreign key(MaDA) references DUAN(MaDA),
SOGIO int,
)
insert into CHAMCONG(MaNV, MaDA, SOGIO) values
('V01', 'DA1', 28),
('V01', 'DA2', 200),
('V02', 'DA1', 90)
select * from CHAMCONG

--2.Đưa ra thông tin: MaNV, HoTen, Tuoi của những nhân viên có giới tính nam và tuổi > 19.
SELECT
	MaNV,HoTen,
YEAR(GETDATE()) - YEAR(NgaySinh) AS TUOI
FROM NHANVIEN
WHERE ((YEAR(GETDATE()) - YEAR(NgaySinh)) > 19) AND GTinh = N'Nam'

--3. Đưa ra thông tin: MaDA, TenDA của những dự án do nhân viên Lê Huy tham gia.
SELECT 
	DUAN.MaDA, DUAN.TenDA, NHANVIEN.HoTen
FROM DUAN
JOIN CHAMCONG ON DUAN.MaDA = CHAMCONG.MaDA
JOIN NHANVIEN ON CHAMCONG.MaNV = NHANVIEN.MaNV
WHERE NHANVIEN.HoTen = N'Lê Huy';


--4. Đưa ra thông tin nhân viên có tổng số giờ lớn nhất. thông tin hiển thị gồm có: MaNV, HoTen, Tổng số giờ.
SELECT top 1 
	NHANVIEN.MaNV, NHANVIEN.HoTen, SUM(CHAMCONG.SOGIO) AS TongSoGio
FROM NHANVIEN
JOIN CHAMCONG ON NHANVIEN.MaNV = CHAMCONG.MaNV
GROUP BY NHANVIEN.MaNV, NHANVIEN.HoTen
ORDER BY TongSoGio DESC

--5. Đưa ra danh sách 2 nhân viên đầu tiên thông tin gồm: MaNV, HoTen, Luong của những nhân viên 
--tham gia dự án mạng toàn cầu và sắp xếp giảm dần theo HoTen.
SELECT TOP 2 NHANVIEN.MaNV, NHANVIEN.HoTen, NHANVIEN.Luong
FROM NHANVIEN
JOIN CHAMCONG ON NHANVIEN.MaNV = CHAMCONG.MaNV
JOIN DUAN ON CHAMCONG.MaDA = DUAN.MaDA
WHERE DUAN.TenDA = N'Mạng toàn cầu'
ORDER BY NHANVIEN.HoTen DESC;


--6. Thêm một bản ghi mới vào bảng chamcong dữ liệu phù hợp (không được nhập quá trị null)
INSERT INTO CHAMCONG (MaNV, MaDA, SOGIO) VALUES
('V03', 'DA2', 345);
select * from CHAMCONG

--7. Tăng lương cho mọi nhân viên mã V01
UPDATE NHANVIEN
SET Luong = Luong + 1000000
WHERE MaNV = 'V01';
select * from NHANVIEN


--8. Xóa nhân viên không tham gia dự án nào.
DELETE FROM NHANVIEN
WHERE MaNV NOT IN (SELECT MaNV FROM CHAMCONG);