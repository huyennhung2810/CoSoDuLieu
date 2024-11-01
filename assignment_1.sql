CREATE DATABASE assignment_1

go 
use assignment_1
go
create table NXB(
maNXB char(10) primary key,
tenNXB nvarchar(50),
diachi nvarchar(50),
)
go
create table phanloai(
maphanloai nvarchar(10) primary key,
tenphanloai nvarchar(50),
)
go
create table tacgia(
matacgia char(10) primary key,
hoten nvarchar(50),
ngaysinh date,
gioitinh char(10),
)
go
create table sach(
masach char(10) primary key,
tieude nvarchar(50),
sotrang int check(sotrang > 5),
soluongbansao int check (soluongbansao > 1),
giatien money check (giatien > 0),
vitri nvarchar(255),
ngaynhap date,
maphanloai nvarchar(10),
matacgia char(10),
maNXB char(10)
foreign key(maNXB) references NXB(maNXB),
foreign key(maphanloai) references phanloai(maphanloai),
foreign key(matacgia) references tacgia(matacgia),
)
go
create table sinhvien(
masv char(10) primary key,
hoten nvarchar(50),
ngaysinh date,
gioitinh nvarchar(10),
ngayratruong date
)
go
create table nganh(
manganh char(10) primary key,
tennganh nvarchar(50),
)
go
create table lop(
malop char(10) primary key,
tenlop nvarchar(20),
manganh char(10),
foreign key(manganh) references nganh(manganh),
)
go
create table sinhvienlop(
malop char(10),
masv char(10),
primary key(malop, masv),
foreign key(masv) references sinhvien(masv),
foreign key(malop) references lop(malop),
)
go
create table phieumuon(
sophieu int identity(1,1) primary key,
masv char(10),
foreign key(masv) references sinhvien(masv),
ngaymuon date,
ngaytra date,
trangthai nvarchar(50)
)
go

create table chitetphieu(
masach char(10),
sophieu int identity(1,1),
primary key (masach, sophieu),
foreign key(masach) references sach(masach),
foreign key(sophieu) references phieumuon(sophieu),
ghichu nvarchar(250)
)
go

insert into NXB (maNXB, tenNXB, diachi) values
('NXB001', N'Nguyễn Văn A', N'Hà Nội'),
('NXB002', N'Nguyễn Văn B', N'Quảng Ninh'),
('NXB003', N'Nguyễn Văn C', N'Hà Nam'),
('NXB004', N'Nguyễn Văn D', N'Ninh Bình'),
('NXB005', N'Nguyễn Văn E', N'Nam Định')
SELECT * FROM NXB

insert into phanloai(maphanloai, tenphanloai) values
('11', N'phanloai01'),
('22', N'phanloai01'),
('33', N'phanloai01'),
('44', N'phanloai01'),
('55', N'phanloai01')
SELECT * FROM phanloai

insert into tacgia (matacgia, hoten, ngaysinh,gioitinh) values
('tacgia1', N'Nguyễn Thị A', '2005-10-18', N'Nữ'),
('tacgia2', N'Nguyễn Văn B', '2005-03-28', N'Nam'),
('tacgia3', N'Nguyễn Văn C', '2003-10-28', N'Nam'),
('tacgia4', N'Nguyễn Thị D', '2005-06-12', N'Nữ'),
('tacgia5', N'Nguyễn Văn E', '2005-12-22', N'Nam')
SELECT * FROM tacgia

insert into sach(masach,tieude,sotrang,soluongbansao,giatien,vitri,ngaynhap,maphanloai,matacgia,maNXB) values
('123','tieude01',300,200,50000,N'Hà Nội', '2023-12-23','11','tacgia1','NXB001'),
('234','tieude02',400,300,60000,N'Ninh Bình', '2022-10-21','22','tacgia2','NXB002'),
('345','tieude03',500,400,70000,N'Hà Nội', '2023-03-26','33','tacgia3','NXB001'),
('456','tieude04',600,500,80000,N'Hà Nam', '2024-12-02','44','tacgia4','NXB003'),
('567','tieude05',700,600,90000,N'Nam Định', '2024-10-28','55','tacgia5','NXB005')
SELECT * FROM sach

insert into sinhvien(masv, hoten, ngaysinh, gioitinh, ngayratruong) values
('Ph123',N'Nguyễn Thị A', '2003-10-28', N'Nữ', '2025-04-15'),
('Ph234',N'Nguyễn Thị B', '2005-04-23', N'Nữ', '2024-04-24'),
('Ph345',N'Nguyễn Văn A', '2003-05-12', N'Nam', '2025-06-15'),
('Ph456',N'Nguyễn Thị C', '2003-09-22', N'Nữ', '2025-09-15'),
('Ph567',N'Nguyễn Văn B', '2005-11-28', N'Nam', '2025-10-15')
SELECT * FROM sinhvien

insert into nganh (manganh, tennganh) values
('nganh01', N'Phát triển phần mềm'),
('nganh02', N'Ứng dụng phần mềm'),
('nganh03', N'Phát triển phần mềm'),
('nganh04', N'Ứng dụng phần mềm'),
('nganh05', N'Phát triển phần mềm')
SELECT * FROM nganh

insert into lop(malop, tenlop, manganh) values
('lop01', N'Phát triển 1', 'nganh01'),
('lop02', N'Phát triển 2', 'nganh02'),
('lop03', N'Phát triển 3', 'nganh03'),
('lop04', N'Phát triển 4', 'nganh04'),
('lop05', N'Phát triển 5', 'nganh05')
SELECT * FROM lop

insert  into sinhvienlop(malop, masv) values
('lop01', 'Ph123'),
('lop02', 'Ph234'),
('lop03', 'Ph345'),
('lop04', 'Ph456'),
('lop05', 'Ph567')
SELECT * FROM sinhvienlop

insert into phieumuon(masv, ngaymuon, ngaytra, trangthai) values
('Ph123', '2023-04-07', '2023-04-14',N'Đã trả'),
('Ph234', '2023-06-12', '2023-06-19',N'Đã trả'),
('Ph345', '2024-12-12', '2024-12-18',N'Chưa trả'),
('Ph456', '2023-04-12', '2023-04-21',N'Đã trả'),
('Ph567', '2022-06-14', '2022-06-24',N'Chưa trả')
SELECT * FROM phieumuon

insert into chitetphieu (masach,ghichu) values
('123', N'ghi chú 001'),
('234', N'ghi chú 002'),
('345', N'ghi chú 003'),
('456', N'ghi chú 004'),
('567', N'ghi chú 005')
SELECT * FROM chitetphieu

3. Thực hiện các yêu cầu
a,Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền, tác giả thuộc loại sách có mã "IT".
SELECT 
tieude, maphanloai, giatien, matacgia
FROM sach
where maphanloai like '33%';
b, Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách, ngày mượn, mã sinh viên có ngày mượn trong tháng 01/2024.
SELECT 
sophieu , masv , ngaymuon, ngaytra
FROM phieumuon
WHERE ngaymuon BETWEEN '2023-04-01' AND '2023-04-30';

c, Liệt kê các phiếu mượn chưa trả sách cho thư viện với thứ tự tăng dần của ngày mượn sách.
SELECT sophieu, masv, ngaymuon, ngaytra, trangthai
FROM phieumuon
Where trangthai like N'%Chưa trả%' 
ORDER BY ngaymuon ASC;

d, tìm các sách có giá bán trên 50.000đ . Đưa ra theo thứ tự giảm dần của giá tiền.
SELECT tieude,masach, giatien,matacgia
FROM sach
Where giatien > 50000
ORDER BY giatien DESC;
6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên
sách, mã sách, giá tiền , tác giả thuộc loại sách có mã “IT”.


 6.2 Liệt kê các
phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã sinh viên
có ngày mượn sau tháng 7/2024.


 6.3 Liệt kê các
phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.


6.4 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.


6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ
khoá “SQL”.


6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã
sinh viên, tên sinh viên, mã phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp
xếp thứ tự theo ngày mượn sách. s


6.8 Viết câu lệnh cập nhật lại giá tiền của các quyển
sách có ngày nhập kho trước năm 2023 giảm 30%.


6.9 Viết câu lệnh xoá các phiếu mượn có ngày mượn và
ngày trả trước 1/1/2023


6.10 Tìm thông tin các sinh viên nhiều tuổi nhất đã mượn
sách trong tháng 8/2024.