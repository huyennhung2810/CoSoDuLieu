create database DuAn1

--sản phẩm
create table san_pham (
	id_san_pham varchar(10) primary key,
	ma_san_pham varchar(10),
	ten_san_pham nvarchar(20),
	so_luong int,
	trang_thai bit
);
INSERT INTO san_pham (id_san_pham, ma_san_pham, ten_san_pham, so_luong, trang_thai)
VALUES
    ('ISP-QWE', 'SP-cb1', N'Giày chạy bộ', 100, 1),
    ('ISP-WER', 'SP-bd1', N'Giày bóng đá', 150, 1),
    ('ISP-ERT', 'SP-tn3', N'Giày tennis', 200, 1);


create table nhan_hieu(
	id_nhan_hieu varchar(10) primary key,
	ten_nhan_hieu nvarchar(20),
	trang_thai bit
);

INSERT INTO nhan_hieu (id_nhan_hieu, ten_nhan_hieu, trang_thai)
VALUES
    ('INH-QWE', N'Nike', 1),
    ('INH-WER', N'Adidas', 1),
    ('INH-RTY', N'Puma', 1);

create table chat_lieu(
	id_chat_lieu varchar(10) primary key,
	loai nvarchar(20),
	trang_thai bit
);
INSERT INTO chat_lieu (id_chat_lieu, loai, trang_thai)
VALUES
    ('ICL-1AZX', N'Vải lưới', 1),
    ('ICL-W2R3', N'Da tổng hợp', 1),
	('ICL-PL31', N'Cao su', 1);

create table mau_sac (
	id_mau_sac varchar(10) primary key,
	ten_mau nvarchar(20),
	trang_thai bit
);
INSERT INTO mau_sac (id_mau_sac, ten_mau, trang_thai)
VALUES
    ('IMS-XH1', N'Xanh', 1),
    ('IMS-ND0', N'Đen', 1),
    ('IMS-GT1', N'Tráng', 1);

create table kich_thuoc (
	id_kich_thuoc varchar(10) primary key,
	ten_kich_thuoc int,
	trang_thai bit
);

INSERT INTO kich_thuoc (id_kich_thuoc, ten_kich_thuoc, trang_thai)
VALUES
    ('IKT-BT5', 40,1),
    ('IKT-BK4', 42 , 1),
    ('IKT-BH2', 39 ,1 )

create table hinh_anh (
	id_hinh_anh varchar(10) primary key,
	ten_hinh varchar(20),
	trang_thai bit
);
INSERT INTO hinh_anh (id_hinh_anh, ten_hinh, trang_thai)
VALUES
    ('IHA-GCB', N'Giày chạy bộ', 1),
    ('IHA-GBD', N'Giày bóng đá', 1),
    ('IHA-GTN', N'Giày tennis', 1);

create table khoi_luong(
	id_khoi_luong varchar(10) primary key,
	khoi_luong int,
	trang_thai bit
);
INSERT INTO khoi_luong (id_khoi_luong, khoi_luong, trang_thai)
VALUES
    ('IKL-NTK', 500, 1),
    ('IKL-BTK', 700, 1),
    ('IKL-TTK', 800, 1);

create table xuat_xu (
	id_xuat_xu varchar(10) primary key,
	ten_nuoc nvarchar(20),
	trang_thai bit,
);
INSERT INTO xuat_xu (id_xuat_xu, ten_nuoc, trang_thai)
VALUES
    ('IXX-NV', N'Việt Nam', 1),
    ('IXX-TQ', N'Trung Quốc', 1),
    ('IXX-ID', N'Indonesia', 1);

create table nha_san_xuat (
	id_nha_san_xuat varchar(10) primary key,
	ten_nha_san_xuat nvarchar(30),
	trang_thai bit
);
INSERT INTO nha_san_xuat (id_nha_san_xuat, ten_nha_san_xuat, trang_thai)
VALUES
    ('INSX-NI', N'Nike Inc.', 1),
    ('INSX-AA', N'Adidas AG', 1),
    ('INSX-PS', N'Puma SE', 1);

create table co_giay (
	id_co_giay varchar(10) primary key,
	ten_co_giay nvarchar(20),
	trang_thai bit
);
INSERT INTO co_giay (id_co_giay, ten_co_giay, trang_thai)
VALUES
    ('ICG-CC', N'Cổ cao', 1),
    ('ICG-CT', N'Cổ thấp', 1),
    ('ICG-CL', N'Cổ lửng', 1);

create table chi_tiet_san_pham (
	id_chi_tiet_san_pham varchar(10) primary key,
	id_nhan_hieu varchar(10),
	foreign key (id_nhan_hieu) REFERENCES nhan_hieu(id_nhan_hieu),
	id_chat_lieu varchar(10),
	foreign key (id_chat_lieu) REFERENCES chat_lieu(id_chat_lieu),
	id_kich_thuoc varchar(10),
	foreign key (id_kich_thuoc) REFERENCES kich_thuoc(id_kich_thuoc),
	id_mau_sac varchar(10),
	foreign key (id_mau_sac) REFERENCES mau_sac(id_mau_sac),
	id_hinh_anh varchar(10),
	foreign key (id_hinh_anh) REFERENCES hinh_anh(id_hinh_anh),
	id_khoi_luong varchar(10),
	foreign key (id_khoi_luong) REFERENCES khoi_luong(id_khoi_luong),
	id_xuat_xu varchar(10),
	foreign key (id_xuat_xu) REFERENCES xuat_xu(id_xuat_xu),
	id_nha_san_xuat varchar(10),
	foreign key (id_nha_san_xuat) REFERENCES nha_san_xuat(id_nha_san_xuat),
	id_co_giay varchar(10),
	foreign key (id_co_giay) REFERENCES co_giay(id_co_giay),
	id_san_pham varchar(10),
	foreign key (id_san_pham) REFERENCES san_pham(id_san_pham),
	ten nvarchar(20),
	so_luong_ton int,
	trang_thai bit,
	don_gia money,
);
INSERT INTO chi_tiet_san_pham (id_chi_tiet_san_pham, id_nhan_hieu, id_chat_lieu, id_kich_thuoc, id_mau_sac, id_hinh_anh, id_khoi_luong, id_xuat_xu, id_nha_san_xuat, id_co_giay, id_san_pham, ten, so_luong_ton, trang_thai, don_gia)
VALUES
    ('ICTSP-D2N7', 'INH-QWE', 'ICL-1AZX', 'IKT-BT5', 'IMS-XH1', 'IHA-GCB', 'IKL-NTK', 'IXX-NV', 'INSX-NI', 'ICG-CC', 'ISP-QWE', N'Giày chạy bộ Nike ', 50, 1, 1500000),
    ('ICTSP-S71N', 'INH-WER', 'ICL-W2R3', 'IKT-BK4', 'IMS-ND0', 'IHA-GBD', 'IKL-BTK', 'IXX-TQ', 'INSX-AA', 'ICG-CT', 'ISP-WER', N'Giày bóng đá Adidas ', 60, 1, 2000000),
    ('ICTSP-T05T', 'INH-RTY', 'ICL-PL31', 'IKT-BH2', 'IMS-GT1', 'IHA-GTN', 'IKL-TTK', 'IXX-ID', 'INSX-PS', 'ICG-CL', 'ISP-ERT', N'Giày tennis Puma ', 70, 1, 2500000);

--khách hàng 
create table dia_chi (
	id_dia_chi varchar(10) primary key,
	quoc_gia nvarchar(40),
	thanh_pho nvarchar(40),
	quan_huyen nvarchar(40),
	xa nvarchar(40),
	thon_ngo_ngach nvarchar(50),
	so_nha nvarchar(10),
	dia_chi_chi_tiet nvarchar(50)
);
INSERT INTO dia_chi (id_dia_chi, quoc_gia, thanh_pho, quan_huyen, xa, thon_ngo_ngach, so_nha, dia_chi_chi_tiet)
VALUES
    ('IDC-VNHN01', N'Việt Nam', N'Hà Nội', N'Hoàn Kiếm', N'Hàng Trống', N'Tràng Tiền', N'Số 10', N'Khu vực A'),
    ('IDC-VNHC12', N'Việt Nam', N'Hồ Chí Minh', N'Quận 1', N'Bến Nghé', N'Nguyễn Huệ', N'Số 20', N'Khu vực B'),
    ('IDC-VNDN23', N'Việt Nam', N'Đà Nẵng', N'Hải Châu', N'Thanh Bình', N'Bạch Đằng', N'Số 30', N'Khu vực C');

create table khach_hang (
	id_khach_hang varchar(10) primary key,
	id_dia_chi varchar(10),
	foreign key (id_dia_chi) REFERENCES dia_chi(id_dia_chi),
	ma_khach_hang varchar(10),
	ten_khach_hang nvarchar(50),
	gioi_tinh bit,
	sdt varchar(15),
	trang_thai bit,
);
INSERT INTO khach_hang (id_khach_hang, id_dia_chi, ma_khach_hang, ten_khach_hang, gioi_tinh, sdt, trang_thai)
VALUES
    ('IKH-QAX1W2', 'IDC-VNHN01', 'KH-ES10R', N'Nguyễn Văn An', 1, '0987654321', 1),
    ('IKH-QSC0E3', 'IDC-VNHC12', 'KH-WE4KD', N'Trần Thị Bình', 0, '0987654322', 1),
    ('IKH-PLM9IA', 'IDC-VNDN23', 'KH-WV0WV', N'Hoàng Minh Chí', 1, '0987654323', 1);
--nhân viên 

create table nhan_vien (
	id_nhan_vien varchar(10) primary key,
	ma_nhan_vien varchar(10),
	ho_ten nvarchar(30),
	sdt varchar(15),
	email varchar(30),
	dia_chi nvarchar(100),
	gioi_tinh bit,
	ngay_sinh date,
	chuc_vu nvarchar(20),
	mat_khau varchar(20),
	cccd varchar(12),
	trang_thai bit
);
INSERT INTO nhan_vien (id_nhan_vien, ma_nhan_vien, ho_ten, sdt, email, dia_chi, gioi_tinh, ngay_sinh, chuc_vu, mat_khau, cccd, trang_thai)
VALUES
    ('1', 'NV-EIW5', N'Nguyễn Văn Dũng', '0987654321', 'vanan@gmail.com', N'Hà Nội', 1, '1990-01-01', N'Nhân viên', '12345678', '12345678910', 1),
    ('2', 'NV-EWO7', N'Trần Thị Bưởi', '0987654322', 'thib@gmail.com', N'Hồ Chí Minh', 0, '1992-05-15', N'Quản lý', '12345678', '12345678910', 1),
    ('3', 'NV-OME1', N'Lê Văn Cường', '0987654323', 'vanc@gmail.com', N'Đà Nẵng', 1, '1988-11-28', N'Nhân viên', '12345678', '12345678910', 0);
--hóa đơn
create table hinh_thuc_thanh_toan (
	id_hinh_thuc_thanh_toan varchar(10) primary key,
	hinh_thuc_thanh_toan int
);
INSERT INTO hinh_thuc_thanh_toan (id_hinh_thuc_thanh_toan, hinh_thuc_thanh_toan)
VALUES 
    ('HTTT-CK1', 1),
    ('HTTT-TM1', 2);


create table hoa_don (
	id_hoa_don varchar(10) primary key,
	id_khach_hang varchar(10),
	foreign key (id_khach_hang) REFERENCES khach_hang(id_khach_hang),
	id_nhan_vien varchar(10),
	foreign key (id_nhan_vien) REFERENCES nhan_vien(id_nhan_vien),
	id_hinh_thuc_thanh_toan varchar(10),
	foreign key (id_hinh_thuc_thanh_toan) REFERENCES hinh_thuc_thanh_toan(id_hinh_thuc_thanh_toan),
	ma_hoa_don varchar(10),
	ten_khach_hang nvarchar(50),
	thoi_gian date,
	sdt varchar(15),
	dia_chi nvarchar(50),
	ten_nhan_hieu nvarchar(20),
	ten_mau nvarchar(20),
	ten_kich_thuoc varchar(10),
	ten_hinh varchar(20),
	tong_tien money
);
INSERT INTO hoa_don (id_hoa_don, id_khach_hang, id_nhan_vien, id_hinh_thuc_thanh_toan, ma_hoa_don, ten_khach_hang, thoi_gian, sdt, dia_chi, ten_nhan_hieu, ten_mau, ten_kich_thuoc, ten_hinh, tong_tien)
VALUES
    ('IHD-D2OWEJ', 'IKH-QAX1W2', '1', 'HTTT-CK1', 'HD-QDJW21', N'Nguyễn Văn An', '2023-07-01', '0987654321', N'Hà Nội', N'Nike', N'Đen', N'Lớn', N'Giày chạy bộ', 1500000),
    ('IHD-WI29FC', 'IKH-QSC0E3', '2', 'HTTT-CK1', 'HD-KDD4NI', N'Trần Thị Bình', '2023-07-02', '0987654322', N'Hồ Chí Minh', N'Adidas', N'Trắng', N'Nhỏ', N'Giày bóng đá', 2000000),
    ('IHD-QWDI22', 'IKH-PLM9IA', '3', 'HTTT-TM1', 'HD-EJ399F', N'Hoàng Minh Chí', '2023-07-03', '0987654323', N'Đà Nẵng', N'Puma', N'Xanh', N'Vừa', N'Giày tennis', 1800000);


create table hoa_don_chi_tiet (
	id_hoa_don_chi_tiet varchar(10) primary key,
	id_hoa_don varchar(10),
	foreign key (id_hoa_don) REFERENCES hoa_don(id_hoa_don),
	id_chi_tiet_san_pham varchar(10),
	foreign key (id_chi_tiet_san_pham) REFERENCES chi_tiet_san_pham(id_chi_tiet_san_pham),
	so_luong int,
	gia money
);
INSERT INTO hoa_don_chi_tiet (id_hoa_don_chi_tiet, id_hoa_don, id_chi_tiet_san_pham, so_luong, gia)
VALUES
    ('HDCT-WCJ21', 'IHD-D2OWEJ', 'ICTSP-D2N7', 2, 1500000),
    ('HDCT-CEK23', 'IHD-WI29FC', 'ICTSP-S71N', 1, 2000000),
    ('HDCT-CDI20', 'IHD-QWDI22', 'ICTSP-T05T', 3, 1800000);

create table lich_su_hoa_don (
	id_lich_su_hoa_don varchar(10) primary key,
	id_hoa_don varchar(10),
	foreign key (id_hoa_don) REFERENCES hoa_don(id_hoa_don),
	trang_thai bit,
	li_do_huy nvarchar(50),
	hanh_dong_khach_hang nvarchar(50),
	hanh_dong_nv_thao_tac nvarchar(50),
);
INSERT INTO lich_su_hoa_don (id_lich_su_hoa_don, id_hoa_don, trang_thai, li_do_huy, hanh_dong_khach_hang, hanh_dong_nv_thao_tac)
VALUES
    ('LSHD-KW23D', 'IHD-D2OWEJ', 1, N'Khách hàng không hài lòng', N'Yêu cầu trả hàng', N'Xử lý trả hàng'),
    ('LSHD-AJ32E', 'IHD-WI29FC', 1, NULL, N'Giao hàng thành công', N'Hoàn tất giao hàng'),
    ('LSHD-2DI29', 'IHD-QWDI22', 0, N'Khách hàng huỷ đơn', N'Khách hàng yêu cầu huỷ', N'Xử lý huỷ đơn');


