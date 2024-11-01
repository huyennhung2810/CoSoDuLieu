select sqrt(25) as 'Can Bac Hai' ,
select SQUARE(5) as 'BinhPhuong' ,
select 2*PI*10 AS 'DIEN TICH' ,
select len(' hiae ') as 'dem' ,
select LTRIM(RTRIM(' Sql server ')) as 'demi',
select CHARINDEX('r' , 'sql server') as 'dem' ,
select SUBSTRING ('sql server' , 2 ,3 ) as 'start',
select REPLACE('0973-456-226' ,'-','.') as 'thay the',

select REVERSE('ilusm') as 'doi' ,
select lower('ilusm') as 'hiii' ,
select UPPER('do u love me') as '?',
select SPACE('      5') as '??'

use  QLDA

select DCHI , LEFT(DCHI,2) AS LEFT2 , RIGHT(DCHI,3) AS RIGHT3 , SUBSTRING(DCHI , LEN(DCHI)-2,3) AS SUBTRING3
SELECT LEN(DCHI) AS DCHI
from NHANVIEN

SELECT * 
FROM THANNHAN

SELECT UPPER(NHANVIEN.HONV) AS HONV,TENLOT ,  CONCAT(
    
        LOWER(SUBSTRING(TENNV, 1, 1)), 
        UPPER(SUBSTRING(TENNV, 2, 1)), 
        LOWER(SUBSTRING(TENNV, 3, LEN(TENNV)-2))
    ) AS TENNV ,DCHI
FROM NHANVIEN JOIN THANNHAN ON NHANVIEN.MANV = THANNHAN.MA_NVIEN 
GROUP BY HONV , TENNV , TENLOT ,DCHI
HAVING COUNT(THANNHAN.MA_NVIEN) >2 

SELECT LOWER(LEFT(TENNV,1))+
UPPER(SUBSTRING(TENNV,2,1))+
RIGHT(TENNV,LEN(TENNV)-2)
FROM NHANVIEN

SELECT SUBSTRING(DCHI,4, LEN(DCHI)-10)
FROM NHANVIEN

select SUBSTRING(DCHI,CHARINDEX(' ', DCHI)+1, 
CHARINDEX(',',DCHI) - CHARINDEX(' ',DCHI)-1) AS 'Địa chỉ'
from NhanVien



