ĐỀ TEST_06 1/10
COM2012 (50 phút):


Câu 1: Tạo CSDL HangHoa
và nhập DL mỗi bảng 5 dòng


(bảng nhacungcap:dòng đầu là thông tin sv làm bài):
(4 điểm)

NHACUNGCAP (MANCC, Tenncc,diachi),



HANG (MAHANG, Tenhang, soluong, dongia, xuatSu)

HANGDABAN (MANCC, MAHANG, soluongban,
ngayban, giaban)


Câu 2: Trả lời bằng ngôn ngữ SQL các câu truy vấn sau: (6 điểm)


A. Tìm kiếm dữ liệu:
select


1. Đưa ra
thông tin các nhà cung cấp có tên bắt đầu bằng chữ ‘T’ (0.5đ)

2. Đưa ra các thông tin các măt hàng có số lượng bán từ 200 – 1000. (0.5đ)


3. Đưa ra tên các mặt hàng đã bán được trong tháng 1/2023. (1đ)


4. Tìm 
thông tin 2 mặt hàng có đơn giá cao nhất. (1đ)


5. Tình tổng tiền đã bán của hàng có
mã ‘H12’ trong tháng 1/2023. (1đ)


6.đưa ra tên các hàng không bán được
trong tháng 12/2022. (1đ)


B. Cập nhật dữ liệu :


1. Giảm 10% đơn giá cho các mặt hàng  có xuất sứ “Việt Nam”: UPDATE (0.5đ)


2. Xóa các hàng đã bán trước năm 2022.: DELETE (0.5đ)

create database hanghoa_test_1_10_24 --tao database
go
use hanghoa_test_1_10_24
go

create table nhacungcap(
mancc char(20) primary key,--khoa chinh
tenncc nvarchar(50),
diachi nvarchar(100)
)
go

create table hang(
mahang char(20) primary key,
tenhang nvarchar(100),
soluong int,
dongia money,
xuatxu nvarchar(100)
)
go

create table hangdaban(
mahang char(20),
mancc char(20),
soluongban int,
giaban money,
ngayban date,
primary key (mahang,mancc),
foreign key (mahang) references hang(mahang),
foreign key (mancc) references nhacungcap(mancc),
)
--them du lieu vao bang
select * from nhacungcap
insert into nhacungcap(mancc,tenncc,diachi) values
('c1',N'nguyen phong',N'bac giang'),
('c2',N'nguyen phu',N'bac can'),
('c3',N'nguyen phuong',N'bac ninh'),
('c4',N'nguyen long',N'bac tay'),
('c5',N'nguyen huong',N'bac nam')

select * from hang
insert into hang(mahang,tenhang,soluong,dongia,xuatxu) values
('h1',N'duong',20,19,N'ha noi'),
('h2',N'sua',21,20,N'ha noi'),
('h3',N'lua',22,21,N'ha noi'),
('h4',N'gao',22,22,N'ha noi'),
('h5',N'muoi',23,23,N'ha noi')

select * from hangdaban
insert into hangdaban(mahang,mancc,soluongban,giaban,ngayban) values
('h1','c1',3,24,'2024-9-30'),
('h1','c2',4,50,'2024-1-1'),
('h2','c1',12,140,'2024-2-12'),
('h3','c4',5,100,'2024-9-1'),
('h2','c4',6,150,'2024-9-13')

SELECT tenncc--cau1
FROM nhacungcap
WHERE tenncc LIKE 'T%'
ORDER BY tenncc;

--cau2
select * from hang join hangdaban on hang.mahang=hangdaban.mahang
where hangdaban.soluongban>=2 and hangdaban.soluongban<=1000
--cau3
SELECT DISTINCT h.Tenhang
FROM HANG h
JOIN HANGDABAN hd ON h.MAHANG = hd.MAHANG
WHERE hd.ngayban >= '2023-01-01' AND hd.ngayban < '2024-09-01';


--cau4
SELECT top 2 *
FROM HANG
ORDER BY dongia DESC;--sap xep giam dan lay top 2

--cau5
SELECT SUM(soluongban * giaban) AS TongTien
FROM HANGDABAN
WHERE MAHANG = 'H12' AND ngayban >= '2023-01-01' AND ngayban < '2023-02-01';

--b.1
update hang set dongia=dongia*0.9
where xuatxu like N'ha noi'

--b.2
delete from hangdaban
where year(ngayban)<2022