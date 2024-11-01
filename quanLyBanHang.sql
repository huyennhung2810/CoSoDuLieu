CREATE DATABASE QuanLyBanHang1

CREATE TABLE KhachHang(
maKhachHang nvarchar(5) PRIMARY KEY,
hoVaTenLot nvarchar(50),
Ten nvarchar(50),
diaChi nvarchar(255),
Email nvarchar(50),
dienThoai nvarchar(13),
)
--Khi nhập dữ liệu có khóa tự sinh (identity ) thì bỏ cột tự sinh trong câu lệnh insert into
CREATE TABLE SanPham (
maSanPham int identity(1,1) PRIMARY KEY,
moTa nvarchar(255),
soLuong int check(soLuong >= 0),
donGia Money check(donGia >= 0),
tenSP nvarchar(50),
)

CREATE TABLE HoaDon (
maHoaDon int PRIMARY KEY,
ngayMuaHang Date,
maKhachHang nvarchar(5),
trangThai nvarchar(30),
foreign key(maKhachHang) references KhachHang(maKhachHang),
)

CREATE TABLE HoaDonChiTiet (
maHoaDon int,
foreign key(maHoaDon) references HoaDon(maHoaDon),
maSanPham int,
foreign key(maSanPham) references SanPham(maSanPham),
soLuong int,
maHoaDonChiTiet int identity(1,1) PRIMARY KEY,
)

insert into KhachHang(maKhachHang, hoVaTenLot, Ten, diaChi, Email, dienThoai) values
('kh11', N'Hà Thị Huyền', N'Nhung', N'Ninh Bình', 'han99536@gmail.com', '0979085701'),
('kh22', N'Nguyễn Quốc', N'Phong', N'Bắc Giang', 'hongg@gmail.com', '0912739342'),
('kh33', N'Hà Văn', N'Tuấn', N'Yên Bái', 'hatuantoc@gmail.com', '0345673454'),
('kh44', N'Trần Tuấn', N'Lộc', N'Phú Thọ', 'loccc@gmail.com', '0895356353'),
('kh55', N'Nguyễn Quốc', N'Anh', N'Bắc Ninh', 'quocanhh@gmail.com', '0934873722')
SELECT * FROM KhachHang

insert into SanPham( moTa, soLuong, donGia, tenSP) values
( N'Làm sạch',100, 50000, N'Nước rửa chén' ),
( N'Làm sạch',200, 100000, N'Nước lau nhà' ),
( N'Đồ vệ sinh cá nhân',300, 150000, N'Sữa rửa mặt' ),
( N'Đồ vệ sinh cá nhân',400, 200000, N'Sữa tắm' ),
(N'Sản phẩm công nghệ',500, 250000, N'Bàn phím máy tính' )
SELECT * FROM SanPham

insert into HoaDon(maHoaDon, ngayMuaHang, maKhachHang, trangThai) values
(1,'2023-08-12', 'kh11', N'Đã thanh toán' ),
(2,'2023-09-23', 'kh22', N'Đã thanh toán' ),
(3,'2023-12-23', 'kh33', N'Đã thanh toán' ),
(4,'2023-03-28', 'kh44', N'Chưa thanh toán' ),
(5,'2023-10-28', 'kh55', N'Đã thanh toán' )
SELECT * FROM HoaDon

insert into HoaDonChiTiet(maHoaDon,maSanPham, soLuong) values
(1, 1, 100),
(2, 2, 200),
(3, 3, 300),
(4, 4, 400),
(5, 5, 500)
SELECT * FROM HoaDonChiTiet

--Lab 5:
Bài 1 (4 điểm) Viết các câu truy vấn sau: 
a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột 
SELECT * FROM KhachHang
b. Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã 
khách hàng, họ và tên, email, số điện thoại 
SELECT TOP 3 
	maKhachHang, hoVaTenLot, Ten, Email, dienThoai
FROM KhachHang

c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, 
tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng 
SELECT
	maSanPham, tenSp,TongTienTonKho = donGia * soLuong
FROM SanPham

d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: 
maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột 
hoVaTenLot và Ten 
SELECT
	maKhachHang, hoVaTenLot + ' ' + Ten, diaChi
FROM KhachHang
WHERE
	Ten Like '%H%'
	--Dùng like khi chỉ biết 1 phần dữ liệu, % thay thế cho 1 nhóm ký tự bất kì.

e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’ 
SELECT * FROM KhachHang
WHERE diaChi Like N'% Đà Nẵng %'

f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500. 
SELECT * FROM SanPham
WHERE soLuong >= 100 AND soLuong <=500

g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng 
trong năm 2016 
SELECT 
	maHoaDon, ngayMuaHang, trangThai
FROM HoaDon
WHERE trangThai Like N'% Chưa thanh toán %'
	AND YEAR(ngayMuaHang) = 2024

h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003, 
KH006 
SELECT
	maHoaDon, maKhachHang, ngayMuaHang, trangThai
FROM HoaDon
WHERE maKhachHang IN ('kh11', 'kh33', 'kh66')

PHẦN II 
Bài 2 (4 điểm) Viết các câu truy vấn sau: 
a. Hiển thị số lượng khách hàng có trong bảng khách hàng 
b. Hiển thị đơn giá lớn nhất trong bảng SanPham 
c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm 
d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm 
e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán 
f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. 
g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu 
chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5. 
h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, 
maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang


--Lab6
Bài 1 (4 điểm) Viết các câu truy vấn sau: 
a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột 
sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua 
SELECT 
HoaDon.maHoaDon,
HoaDon.maKhachHang,
HoaDon.trangThai,

b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột 
sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với 
điều kiện maKhachHang = ‘KH001’ 
c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột 
sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành 
tiền. Với thành tiền= donGia* soLuong  
d. Hiển thị thông tin từ bảng khách hàng, bảng  hoá đơn, hoá đơn chi tiết gồm các 
cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và 
tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh 
toán. 
e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ 
hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần 
của cột tổng tiền. 
Yêu cầu: Nộp lại file chứa các câu lệnh T-SQL. 
PHẦN II 
Bài 2 (4 điểm) Viết các câu truy vấn sau: 
a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016 
b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016 
c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016 
d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên 
“Iphone 7 32GB” trong tháng 12/2016 
e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản 
phẩm.
