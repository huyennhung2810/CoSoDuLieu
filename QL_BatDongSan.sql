CREATE DATABASE QL_BatDongSan

go 
use QL_BatDongSan
go
create table vanphong(
mavp char(10) primary key,
diachi nvarchar(50),
matruongphong char(10)
)
go
CREATE TABLE nhanvien(
manv char(10) primary key,
hoten nvarchar(50),
mavp char(10),
foreign key(mavp) references vanphong(mavp)
);
go
create table thannhan(
id int identity(1,1) primary key,
hoten nvarchar(50),
ngaysinh date,
moiquanhe nvarchar(50),
manv char(10),
foreign key(manv) references nhanvien(manv)
)
go
create table chusohuu(
macsh char(10) primary key,
hoten nvarchar(50),
sdt char(15),
email varchar(50)
)
go
create table batdongsan(
mabds char(10) primary key,
diachi nvarchar(50),
macsh char(10),
mavp char(10),
foreign key(macsh) references chusohuu(macsh),
foreign key(mavp) references vanphong(mavp)
)
go 
create table BDSdaban(
mabds char(10),
manv char(10),
primary key (mabds,manv),
ngayban date,
giaban money,
foreign key(mabds) references batdongsan(mabds),
foreign key(manv) references nhanvien(manv)
)

insert into vanphong( mavp, diachi, matruongphong) values
('vp001', N'Hà Nội', 'tp234'),
('vp002', N'Quảng Ninh', 'tp345'),
('vp003', N'Hà Nam', 'tp456'),
('vp004', N'Ninh Bình', 'tp567'),
('vp005', N'Bắc Ninh', 'tp678')
SELECT * FROM vanphong

insert into nhanvien(manv, hoten, mavp) values
('nv112', N'Hà Thị Huyền Nhung', 'vp001'),
('nv113', N'Nguyễn Quốc Phong', 'vp001'),
('nv114', N'Trần Tuấn Lộc', 'vp002'),
('nv115', N'Tăng Xuân Khánh', 'vp003'),
('nv116', N'Hà Văn Tuấn', 'vp001')
SELECT * FROM nhanvien

insert into thannhan(hoten,ngaysinh,moiquanhe,manv) values
(N'Hà Thị Huyền Nhung', '2003-10-28', N'Họ hàng', 'nv112'),
( N'Nguyễn Quốc Phong', '2003-04-17', N'Con cái', 'nv113'),
( N'Trần Tuấn Lộc', '1996-08-12', N'Họ hàng', 'nv114'),
( N'Tăng Xuân Khánh', '2004-02-23', N'Họ hàng', 'nv115'),
( N'Hà Văn Tuấn', '2005-11-04', N'Họ hàng', 'nv116')
SELECT * FROM thannhan

insert into chusohuu(macsh, hoten,sdt,email) values
('csh1', N'Hà Thị Huyền Nhung', '0979085701', N'han99536@gmail.com'),
('csh2', N'Nguyễn Quốc Phong', '0973485701', N'phongg@gmail.com'),
('csh3', N'Trần Tuấn Lộc', '0972337401', N'loccc@gmail.com'),
('csh4', N'Tăng Xuân Khánh', '0434585701', N'khanhh@gmail.com'),
('csh5', N'Hà Văn Tuấn', '0979045731', N'hatuantoc@gmail.com')
SELECT * FROM chusohuu

insert into batdongsan(mabds, diachi,macsh, mavp) values
('bds111', N'Hà Nội', 'csh1', 'vp001'),
('bds222', N'Quảng Ninh', 'csh2', 'vp002'),
('bds333', N'Hà Nam', 'csh3', 'vp003'),
('bds444', N'Ninh Bình', 'csh4', 'vp004'),
('bds555', N'Bắc Ninh', 'csh5', 'vp005')
SELECT * FROM batdongsan

insert into BDSdaban(mabds, manv, ngayban, giaban) values
('bds111', 'nv112', '2024-05-05', 56000000),
('bds222', 'nv113', '2023-06-07', 66000000),
('bds333', 'nv114', '2022-12-10', 77000000),
('bds444', 'nv115', '2021-11-07', 88000000),
('bds555', 'nv116', '2020-02-02', 99000000)
SELECT * FROM BDSdaban