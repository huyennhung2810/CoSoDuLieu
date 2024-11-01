CREATE DATABASE PTPM_COM2012_PH57362
go
use PTPM_COM2012_PH57362
go

create table HocVien(
MaHV char(10) primary key,
HoTen nvarchar(50),
NgaySinh date,
GioiTinh nvarchar(10),
DiaChi nvarchar(50),
)

insert into HocVien(MaHV, HoTen, NgaySinh, GioiTinh, DiaChi) values
('HV001', 'DungNA21', '1995-05-15', 'Nam', 'Ha Noi'),
('HV002', 'HangNT29', '1998-09-20', 'Nu', 'Ho Chi Minh'),
('HV003', 'LinhTD169', '1993-12-10', 'Nam', 'Da Nang')
select * from HocVien

create table KhoaHoc (
MaKH char(10) primary key,
TenKH nvarchar(50),
MoTa nvarchar(50),
HocPhi money,
SoBuoi int,
)
delete KhoaHoc
insert into KhoaHoc(MaKH, TenKH, MoTa, HocPhi, SoBuoi) values
('KH001', 'Lap Trinh Java', 'Lap trinh Java co ban', '1,000,000', 20),
('KH002', 'Tieng Anh Giao Tiep', 'Giao tiep Tieng Anh', '2,000,000', 15),
('KH003', 'Marketing Online', 'Quang cao online', '1,500,000', 18)
select * from KhoaHoc


create table DangKyHoc(
MaHV char(10),
MaKH char(10),
primary key(MaHV, MaKH),
NgayDangKy date,
foreign key(MaHV) references HocVien(MaHV),
foreign key(MaKH) references KhoaHoc(MaKH),
)
insert into DangKyHoc(MaHV, MaKH, NgayDangKy) values
('HV001', 'KH001', '2022-01-15'),
('HV002', 'KH002', '2022-02-20'),
('HV003', 'KH003', '2022-03-10')
select * from DangKyHoc

--3. Hien thi danh sach hoc vien gom: ma hoc vien, ho ten, ngay sinh, dia chi
select
	MaHV, HoTen, NgaySinh, DiaChi
from HocVien

--4. Hien thi danh sach khoa hoc gom: ma khoa hoc, ten khoa hoc, mo ta, hoc phi cho 
-- cac khoa hoc co hoc phi duoi 2,000,000

select
	MaKH, TenKH, MoTa, HocPhi
from KhoaHoc
where HocPhi < '2,000,000';
--5. Hien thi thong tin hoc vien gom : Ma hoc vien, ho ten, ten khoa hoc,
--Ngay dang ky cho cac hoc vien la nam.
select 
MaHV, HoTen, KhoaHoc.TenKH, DangKyHoc.NgayDangKy
from HocVien

--6. Hien thi danh sach khoa hoc va so luong hoc vien da dang ky moi khoa hoc,
-- chi hien thi nhung khoa hoc co so luong hoc vien dang ki lon hon 1

--7. cap nhat hoc phi cua khoa hoc co ma khoa hoc 'KH001' thanh 1,200,000
UPDATE KhoaHoc
set HocPhi = '1,200,000'
where MaKH = 'KH001';
select * from KhoaHoc
--8. Xoa cac ban ghi trong bang dangkyhoc co ngay dang ki truoc '2022-02-01'
delete DangKyHoc
where NgayDangKy > '2022-02-01'