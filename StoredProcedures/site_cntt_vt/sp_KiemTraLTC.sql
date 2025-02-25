﻿USE [QLDSV_TC]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROC [dbo].[sp_KiemTraLTC]
@NIENKHOA nchar(9), @HOCKY int, @MAMH nchar(10), @NHOM int 
AS
BEGIN
	IF EXISTS ( SELECT * FROM LOPTINCHI WHERE LOPTINCHI.NIENKHOA = @NIENKHOA AND LOPTINCHI.HOCKY = @HOCKY AND LOPTINCHI.MAMH = @MAMH AND LOPTINCHI.NHOM = @NHOM)
	BEGIN
		RAISERROR ('Lớp tín chỉ đã tồn tại', 16,1)
		RETURN 1;
	END

	IF EXISTS ( SELECT * FROM LINK1.QLDSV_TC.DBO.LOPTINCHI WHERE LOPTINCHI.NIENKHOA = @NIENKHOA AND LOPTINCHI.HOCKY = @HOCKY AND LOPTINCHI.MAMH = @MAMH AND LOPTINCHI.NHOM = @NHOM)
	BEGIN
		RAISERROR ('Lớp tín chỉ đã tồn tại trên chi nhánh khác', 16,1)
		RETURN 1;
	END

	IF EXISTS ( SELECT * FROM LINK0.QLDSV_TC.DBO.LOPTINCHI WHERE LOPTINCHI.NIENKHOA = @NIENKHOA AND LOPTINCHI.HOCKY = @HOCKY AND LOPTINCHI.MAMH = @MAMH AND LOPTINCHI.NHOM = @NHOM)
	BEGIN
		RAISERROR ('Lớp tín chỉ đã tồn tại trên chi nhánh khác', 16,1)
		RETURN 1;
	END

RETURN 0;
END