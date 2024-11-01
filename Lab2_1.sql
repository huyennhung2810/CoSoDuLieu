create database lab2_1

create table KhachHang(
	maKhachHang char(50) primary key,
	hoVaTenLot Nvarchar(50),
	ten nvarchar(50),
	diaChi nvarchar(50),
	Email char(50),
	dienThoai char(50)
)


create table SanPham(
	maSanPham int identity(1,1) primary key,
	moTa nvarchar(100),
	soLuong int check(soLuong > 0),
	donGia money check(donGia > 0),
	tenSP nvarchar(50)
)

create table HoaDon(
	maHoaDon int primary key,
	ngayMuaHang date,
	maKhachHang char(50),
	foreign key (maKhachHang) references KhachHang(maKhachHang),
	trangThai nvarchar(50)
)

create table HoaDonChiTiet(
	maHoaDon int,
	foreign key(maHoaDon) references HoaDon(maHoaDon),

	maSanPham int,
	foreign key(maSanPham) references SanPham(maSanPham),
	soLuong int,
	maHoaDonChiTiet int identity (1,1) primary key
)



INSERT INTO KhachHang (maKhachHang, hoVaTenLot, Ten, diaChi, Email, dienThoai) VALUES
('KH123', N'Ha Thi Huyen', N'Nhung', N'Ninh Binh', N'han99536@gmail.com', '0979085701'),
('KH223', N'Nguyễn Quốc', N'Phong', N'Bắc Giang', N'phongg@gmail.com', '1021332343'),
('KH334', N'Hà Văn', N'Tuấn', N'Yen Bai', N'hatuantoc@gmail.com', '3142353151'),
('KH434', N'Tạ Hoàng ', N'Dương', N'HN', N'duongg@gmail.com', '32526424631'),
('KH543', N'Trần Tuấn', N'Lộc', N'Phú Thọ', N'locc@gmail.com', '54435342243')


insert into SanPham(moTa, soLuong, donGia, tenSP) values
(N'làm sạch',100 ,50000, N'nước rửa bat'),
(N'làm sạch',200 ,60000, N'nước lau nhà'),
(N'đồ vệ sinh cá nhân',399 ,70000, N'sữa rửa mặt'),
(N'đồ vệ sinh cá nhân',123 ,80000, N'kem đánh răng'),
(N'sản phẩm công nghệ',222 ,90000, N'chuột')
select * from SanPham


insert into HoaDon(maHoaDon, ngayMuaHang, maKhachHang, trangThai) values
(01, '2023-12-22', 'KH123', N'Đã thanh toán'),
(02, '2022-9-23', 'KH223', N'Đã thanh toán'),
(03, '2024-8-24', 'KH334', N'Đã thanh toán'),
(04, '2024-10-25', 'KH434', N'chưa thanh toán'),
(05, '2021-3-26', 'KH543', N'Đã thanh toán')
select * from HoaDon


insert into HoaDonChiTiet(maHoaDon, maSanPham, soLuong) values
(01, 01, 100),
(02, 02, 200),
(03, 03, 399),
(04, 04, 123),
(05, 05, 222)
select * from HoaDonChiTiet
