CREATE TABLE Sinhvien (
MaSV varchar(20) primary key ,
Hoten nvarchar(50) ,
Gioitinh nvarchar(3) ,
Diachi nvarchar(50) 
)

CREATE TABLE GiaoTrinh (
MaGT varchar(20) primary key ,
TenGT nvarchar(50) ,
NhaXB nvarchar(20) 
)

CREATE TABLE MuonSach (
MaSV varchar(20) ,
MaGT varchar(20),
primary key (MaSV , MaGT),
NgayMuon date,
foreign key (MaSV) references SinhVien(MaSV),
foreign key (MaGT) references GiaoTrinh(MaGT)
)

-- câu 2 

ALTER proc sp_Sinhvien 
@MaSV varchar(20) ,
@Hoten nvarchar(50) ,
@Gioitinh nvarchar(3) ,
@Diachi nvarchar(50) 
AS
	BEGIN
	IF 
	@MaSV IS NULL
	PRINT 'NO'
	ELSE
	INSERT INTO Sinhvien VALUES (@MaSV , @Hoten ,@Gioitinh ,@Diachi)
	END

	EXEC sp_Sinhvien '01' , N'NGUYỄN TIẾN SĨ' , 'NAM', 'IMPERIAL GARDEN'
	EXEC sp_Sinhvien '02' , N'KIM MIN JAE' , 'NAM', 'MUNICH'
	EXEC sp_Sinhvien '03' , N'JISSO' , 'NỮ', 'SEUL'
	EXEC sp_Sinhvien '04' , N'PHÙNG THANH ĐỘ' , 'NAM', 'YÊN LÃNG'
	EXEC sp_Sinhvien '05' , N'TRANG MIXI' , 'NỮ', 'YÊN LÃNG'


ALTER PROC SP_GIAOTRINH
@MaGT varchar(20) ,
@TenGT nvarchar(50) ,
@NhaXB nvarchar(20) 
AS
	BEGIN
	IF 
	@MaGT IS NULL
	PRINT 'NO'
	ELSE
	INSERT INTO GiaoTrinh VALUES (@MaGT ,@TenGT ,@NhaXB)
	END

	EXEC SP_GIAOTRINH 'IT01' , N'HACKER MŨ TRẮNG' ,N'KIM ĐỒNG'
	EXEC SP_GIAOTRINH 'BD01' , N'TẮC BÓNG THẦN SẦU' ,N'BÓNG ĐÁ'
	EXEC SP_GIAOTRINH 'MS01' , N'LUYỆN THANH NHẠC' ,N'KIM ĐỒNG'
	EXEC SP_GIAOTRINH 'PV01' , N'BẢO MẬT TÀI KHOẢN' ,N'KIM ĐỒNG'
	EXEC SP_GIAOTRINH 'DS01' , N'100 CÁCH MOI QUỸ ĐEN' ,N'KIM ĐỒNG'

ALTER PROC SP_MUONSACH
@MaSV varchar(20) ,
@MaGT varchar(20),
@NgayMuon date
AS
	BEGIN
	IF 
	@MaGT IS NULL OR
	@MaSV IS NULL
	PRINT 'NO'
	ELSE 
	INSERT INTO MuonSach VALUES (@MaSV ,@MaGT,@NgayMuon)
	END

	EXEC SP_MUONSACH '01','IT01' ,'2024-01-04'
	EXEC SP_MUONSACH '02' ,'BD01','2024-01-04'
	EXEC SP_MUONSACH '03' ,'MS01' ,'2024-01-04'
	EXEC SP_MUONSACH '04','PV01','2024-01-04'
	EXEC SP_MUONSACH '05' ,'DS01','2024-01-04'

	SELECT * FROM MuonSach

-- CÂU 3
ALTER FUNCTION UDF_SINHVIEN (
@MaSV varchar(20) ,
@Hoten nvarchar(50) ,
@Gioitinh nvarchar(3) ,
@Diachi nvarchar(50) 
)
RETURNS TABLE
	AS

	RETURN (SELECT * FROM Sinhvien 
	WHERE @MaSV = MaSV AND @Hoten LIKE Hoten AND @Gioitinh LIKE Gioitinh AND @Diachi = @Diachi)

	SELECT * FROM UDF_SINHVIEN ('01' ,N'NGUYỄN TIẾN SĨ' , 'NAM', N'IMPERIAGARDEN') 



-- CÂU 4 :
CREATE VIEW V_TOP5 
	AS
	SELECT  TOP (5)  MuonSach.MaGT , SINHVIEN.MaSV , NgayMuon ,Hoten  , Gioitinh
	FROM Sinhvien
	INNER JOIN MuonSach ON MuonSach.MaSV = Sinhvien.MaSV  
	INNER JOIN GiaoTrinh ON GiaoTrinh.MaGT = Sinhvien.MaSV
	ORDER BY NgayMuon ASC

	SELECT * FROM V_TOP5

-- CÂU 5 :
ALTER PROC SP_TRASACH
@NGAYMUON DATE 
	AS
	BEGIN
	DELETE FROM MuonSach 
	WHERE @NGAYMUON = NgayMuon
	PRINT N'ĐÃ XÓA'
	END

	EXEC SP_TRASACH '2024-01-04'
	
	SELECT * FROM Sinhvien
	SELECT * FROM  GiaoTrinh
	SELECT * FROM MuonSach


