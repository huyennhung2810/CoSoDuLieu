USE SU23_COM2034_PH55611 
CREATE TABLE SANPHAM (
MASANPHAM VARCHAR (20)  PRIMARY KEY ,
TENSANPHAM NVARCHAR (50) NOT NULL ,
GIAHIENHANH MONEY NOT NULL ,
SOLUONGTON INT NOT NULL
);

CREATE TABLE HOADON (
MAHOADON VARCHAR(20) PRIMARY KEY ,
NGAYLAP DATE NOT NULL ,
SODIENTHOAI VARCHAR(20)
);

CREATE TABLE HOADONCHITIET (
MASANPHAM VARCHAR(20) ,
MAHOADON VARCHAR(20) ,
SOLUONGMUA INT,
PRIMARY KEY(MASANPHAM , MAHOADON) ,
GIAMUA MONEY ,
FOREIGN KEY (MASANPHAM) REFERENCES SANPHAM(MASANPHAM) ,
FOREIGN KEY (MAHOADON) REFERENCES HOADON(MAHOADON)
)

-- TẠO THỦ TỤC ĐỂ INSERT DỮ LIỆU CHO CÁC BẢNG 
-- CÓ THAM SỐ TRUYỀN VÀO : CÁC COLUMMS CỦA BẢNG ĐẤY 
CREATE PROC sp_DuLieuSanPham
	@masanpham varchar(20) , 
	@tensanpham nvarchar(50) ,
	@gia money ,
	@soluongton INT
AS	
	BEGIN
	IF @masanpham IS NULL OR
		@tensanpham IS NULL OR
		@gia IS NULL OR
		@soluongton IS NULL
			PRINT N'VUI LONG KHONG DE TRONG'
	ELSE 
		INSERT INTO SANPHAM VALUES (@masanpham , @tensanpham ,@gia ,@soluongton)

	END

	EXEC sp_DuLieuSanPham '01' , N'AK47 Wild Lotus' , 3400 ,1
	EXEC sp_DuLieuSanPham '02' , N'AK47 Wild Lotus' , 2400 ,1
	EXEC sp_DuLieuSanPham '03' , N'AK47 Wild Lotus' , 1400 ,1
	EXEC sp_DuLieuSanPham '04' , N'AK47 Wild Lotus' , 4400 ,1

CREATE PROC sp_DuLieuHoaDon 
	@mahoadon varchar(20) ,
	@ngaylap date ,
	@sdt varchar 
AS
	BEGIN 
	IF @mahoadon IS NULL OR
		@ngaylap IS NULL
			PRINT N'GHI CMN DU LIEU VAO'
	ELSE 
		INSERT INTO HOADON VALUES (@mahoadon , @ngaylap ,@sdt)
	END

	EXEC sp_DuLieuHoaDon '1503' , '2014-03-22' , '0886391097'
	EXEC sp_DuLieuHoaDon '1504' , '2022-02-11' , '0886391098'
	EXEC sp_DuLieuHoaDon '1505' , '2012-05-11' , '0886391099'
	EXEC sp_DuLieuHoaDon '1506' , '2008-12-03' , '0886391096'


CREATE PROC sp_DuLieuHoaDonChiTiet
	@masanpham varchar(20) ,
	@mahoadon varchar (20) ,
	@soluongmua int ,
	@giamua money 

AS
	BEGIN 
	IF @masanpham IS NULL OR
		@mahoadon IS NULL
		PRINT N'GHI CMN DU LIEU VAO'
	ELSE 
		INSERT INTO HOADONCHITIET VALUES(@masanpham , @mahoadon , @soluongmua ,@giamua)
	END

--LAB 5 BÀI 2 BÀI 3 