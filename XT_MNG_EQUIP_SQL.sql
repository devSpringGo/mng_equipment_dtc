CREATE DATABASE XT_MNG_EUIPMENT
GO
USE XT_MNG_EUIPMENT
GO
--Drop table 
-- 1.bảng acc // nhan vien - bo phan
--CREATE TABLE MNG_EQ_ACCOUNT (
--	ACC_ID int primary key identity(1,1) not null,
--	ACC_USERNAME varchar(50) not null,
--	ACC_PASSWORD nvarchar(50) not null,
--	ACC_STATUS bit default 1 --0:active, 1: inactive
--)
-- Data test:
--INSERT INTO [dbo].[MNG_EQ_ACCOUNT]
--           ([ACC_USERNAME]
--           ,[ACC_PASSWORD]
--           ,[ACC_STATUS])
--     VALUES
--           ('admin','123456a@',1),
--		   ('manage','123456a@',1),
--		   ('technical','123456a@',1),
--		   ('staff1','123456a@',1),
--		   ('staff2','123456a@',1)
-- Drop table MNG_EQ_ACCOUNT
--Delete from MNG_EQ_ACCOUNT
--DBCC CHECKIDENT('MNG_EQ_ACCOUNT', RESEED, 0)
Select * from MNG_EQ_ACCOUNT
GO
-- 2.bảng phòng ban // bo phan = Department
--Drop table BoPhan
CREATE TABLE [dbo].[BoPhan](
	[MaPB] [int] IDENTITY(1,1) primary key NOT NULL,
	[TenBoPhan] [nvarchar](100) NULL,
	[TenVietTat] [nvarchar](20) NULL,
	[KeyP] [int] NULL,
	[KeyC] [int] NULL,
	[TyTrong1] [int] NULL,
	[TyTrong2] [int] NULL,
	[TyTrong3] [int] NULL,
	[NgayApDung] [date] NULL,
	[TenUser] [nvarchar](50) NULL,
	[TaiLieuBP] [nvarchar](max) NULL,
	[SoTT] [int] NULL,
	[MaCaLamViec] [int] NULL,
	[PhanLoai] [nvarchar](30) NULL,
	[LuongCB] [nvarchar](300) NULL,
	[StKeyP] [nvarchar](100) NULL,
	[UnAct] [bit] NULL,
	[MailPB] [nvarchar](150) NULL,
	[MaPBTB] [int] NULL,
	[MaBravo] [nvarchar](30) NULL,
	[NhomDinhBien] [smallint] NULL,
	[FullTuBK] [smallint] NULL,
	[SoTT5Phut] [smallint] NULL,
	[DoiThuCanhTranh] [bit] NULL,
	[ChuyenXe] [tinyint] NULL
)
--CREATE TABLE BoPhan (
--	DEPT_ID int primary key identity(1,1) not null,
--	DEPT_NAME nvarchar(100) null,
--	DEPT_TYPE varchar(20) null, --type of dept: 0: Office, 1:store,...
--	DEPT_ADDRESS nvarchar(200) null
--)
---- Data test:
--INSERT INTO [dbo].[BoPhan]
--           ([DEPT_NAME]
--           ,[DEPT_TYPE]
--           ,[DEPT_ADDRESS])
--     VALUES
--           (N'Phòng IT','0',N'Phan Đăng Lưu, Hải Châu'),
--		   (N'Phòng Hành chính nhân sự','0',N'Phan Đăng Lưu, Hải Châu'),
--		   (N'Phòng Kĩ thuật sữa chữa','0',N'Phan Đăng Lưu, Hải Châu'),
--		   (N'Tiệm bánh 1','1',N'Phan Đăng Lưu, Hải Châu'),
--		   (N'Tiệm bánh 2','1',N'Lê Thanh Nghị, Hải Châu')
--DBCC CHECKIDENT ('BoPhan', RESEED, 0);
--Drop table BoPhan
Select * from BoPhan
GO
-- 3.New: bảng role
CREATE TABLE MNG_EQ_ROLE (
	ROLE_ID int primary key identity(1,1) not null,
	ROLE_NAME nvarchar(50) not null --role: 0:admin, 1: manage store, 2: staff,... to set role with func per user
)
-- Data test:
INSERT INTO [dbo].[MNG_EQ_ROLE]
           ([ROLE_NAME])
     VALUES
           (N'Giám đốc'),
		   (N'Quản lý'),
		   (N'Nhân viên')
GO
-- 4.bảng user // nhan vien
--Drop table NhanVien
CREATE TABLE [dbo].[NhanVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) PRIMARY KEY NOT NULL,
	[MaPB] [int] NULL,
	[HoVaTen] [nvarchar](50) NULL,
	[TenKhongDau] [nvarchar](50) NULL,
	[SoCMND] [nvarchar](30) NULL,
	[NgaySinh] [datetime] NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](225) NULL,
	[Email] [nvarchar](50) NULL,
	[MaChucVu] [int] NULL,
	[ChucVu] [nvarchar](50) NULL,
	[TonDau] [real] NULL,
	[NgayNghiCB] [real] NULL,
	[NgayDauLamViec] [datetime] NULL,
	[Gio] [nvarchar](12) NULL,
	[GhiChu] [nvarchar](255) NULL,
	[Act] [bit] NOT NULL,
	[QuanHe] [nvarchar](100) NULL,
	[HeSo] [real] NULL,
	[GioiTinh] [nvarchar](10) NULL,
	[NgayKetThuc] [datetime] NULL,
	[NgayVaoCongTy] [datetime] NULL,
	[NgayHetHD] [datetime] NULL,
	[BiDanh] [nvarchar](50) NULL,
	[Tmp] [nvarchar](255) NULL,
	[QuanLyGT] [bit] NOT NULL,
	[DongPhuc] [bit] NOT NULL,
	[NgayNhanDP] [datetime] NULL,
	[ThoiHanDP] [tinyint] NULL,
	[NgayNghiViec] [datetime] NULL,
	[EditTF] [bit] NULL,
	[NotKPIs] [bit] NULL,
	[NgayCapNhat] [datetime] NULL,
	[MaCC] [int] NOT NULL,
	[MaPB_DC] [int] NULL,
	[Ngay_DC] [datetime] NULL,
	[MaTinhLuong] [tinyint] NULL,
	[Add_Bkr] [bit] NULL,
	[StDuyet_MaNV] [nvarchar](max) NULL,
	[StDuyet_MaPB] [nvarchar](max) NULL,
	[StNhom_MaNV] [nvarchar](max) NULL,
	[StNhom_MaPB] [nvarchar](250) NULL,
	[MaBLuong] [int] NULL,
	[TenUserSD] [nvarchar](50) NULL,
	[LockKPIs] [datetime] NULL,
	[SoTT5PhutNV] [smallint] NULL,
	[TapTinCV] [nvarchar](500) NULL,
	[DuyetHS] [smallint] NULL,
	[TrinhDo] [nvarchar](30) NULL,
	[ChoOHienTai] [nvarchar](300) NULL,
	[NgayBoNhiem] [date] NULL,
	USR_ROLE int null
	constraint FK_NhanVien_BoPhan foreign key (MaPB) references BoPhan(MaPB),
	constraint FK_NhanVien_Role foreign key (USR_ROLE) references MNG_EQ_ROLE(ROLE_ID)
)
--CREATE TABLE NhanVien (
--	USR_ID int primary key identity(1,1) not null,
--	USR_ACC int not null unique, --follow with account per staff
--	USR_DEPT int null, --department of staff
--	USR_ROLE int null, --role: 0:admin, 1: manage store, 2: staff,...
--	USR_FULLNAME nvarchar(100) null,
--	USR_EMAIL nvarchar(200) null unique,
--	USR_PHONE varchar(20) null,
--	constraint FK_User_Account foreign key (USR_ACC) references MNG_EQ_ACCOUNT(ACC_ID),
--    constraint FK_User_Dept foreign key (USR_DEPT) references BoPhan(DEPT_ID),
--    constraint FK_User_Role foreign key (USR_ROLE) references MNG_EQ_ROLE(ROLE_ID)
--)
GO
-- 5.bảng loại thiết bị
CREATE TABLE MNG_EQ_EQUIPMENT_TYPE (
	EQ_TYPE_ID int primary key identity(1,1) not null,
	EQ_TYPE_NAME nvarchar(200) unique not null
)
GO
--9. Bảng supplier
CREATE TABLE MNG_EQ_SUPPLIER (
    SUP_ID int primary key identity(1,1),
    SUP_NAME nvarchar(100) not null,
    SUP_CONTACT nvarchar(100) null,
    SUP_PHONE varchar(20) null,
    SUP_ADDRESS nvarchar(200) null
)
GO
-- 6.bảng thiết bị
CREATE TABLE MNG_EQ_EQUIPMENT (
	EQUIP_ID int primary key identity(1,1) not null,
	EQUIP_ID_DEPT int null,
	EQUIP_SUPPLIER int null,
	EQUIP_ID_USER nvarchar(50) null, --user manage if equip of internal else insert id user
	EQUIP_NAME nvarchar(200) not null,
	EQUIP_TYPE int null,
	EQUIP_PURCHASE_DATE smalldatetime null,
	EQUIP_WARRANTY_END_DATE smalldatetime null,
	EQUIP_STATUS varchar(20) default 0, --status: 0: not active, 1:active,...
	EQUIP_ORIGINAL_COST decimal(18,2) null,
	EQUIP_USEFUL_TIME int null, --number of month then equipment can active
	EQUIP_RESIDUAL_VAL decimal(18,2) null, --value estimate equipment last
	EQUIP_QR_CODE VARCHAR(200) null,
	constraint FK_Equipment_EquipmentType foreign key (EQUIP_TYPE) references MNG_EQ_EQUIPMENT_TYPE(EQ_TYPE_ID),
    constraint FK_Equipment_BoPhan foreign key (EQUIP_ID_DEPT) references BoPhan(MaPB),
	constraint FK_Equipment_Supplier foreign key (EQUIP_SUPPLIER) references MNG_EQ_SUPPLIER(SUP_ID),
	constraint FK_Equipment_NhanVien foreign key (EQUIP_ID_USER) references NhanVien(MaNV)
)
GO
-- 7.bảng lịch bảo trì
--Drop table MNG_EQ_MAINTENANCE_SCHEDULE
CREATE TABLE MNG_EQ_MAINTENANCE_SCHEDULE (
	MS_ID int primary key identity(1,1) not null,
	MS_ID_EQUIP int not null,
	MS_ID_USER nvarchar(50) null, --id of technical maintenance //add new 270825
	MS_SCHEDULE_DATE smalldatetime null,
	MS_DESCRIPTION nvarchar(max) null, --decribe info of ms
	MS_STATUS bit default 0 --status of maintenance: 0: not done, 1 done
	constraint FK_Schedule_Equipment foreign key (MS_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID),
	constraint FK_Schedule_User foreign key (MS_ID_USER) references NhanVien(MaNV)
)
--Data test:

GO
-- 8.bảng yêu cầu sửa chữa
CREATE TABLE MNG_EQ_REPAIR_REQUEST (
	REQ_ID int primary key identity(1,1) not null,
	REQ_ID_EQUIP int not null,
	REQ_ID_USER nvarchar(50) not null,
	REQ_DATE smalldatetime null, --date create request
	REQ_URGENCY_LEVEL varchar(10) null, --level urgency repair: 0: low, 1:medium, 2:high(important) 
	REQ_DESCRIPTION nvarchar(200) null, --decribe error/ message to repair
	REQ_IMG_PATH varchar(max) null, --image of device or st
	REQ_TYPE_REPAIR int null, --type fix: internal or external
	REQ_SUPPLIER int null, --if type external => will have supplier. Supplier fix => send bill to technical => technical insert Repair his
	REQ_STATUS int default 0, --status of request: 0:pending, 1: In process, 2: Done, 3: Cancel
	constraint FK_Request_Equipment foreign key (REQ_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID),
    constraint FK_Request_User foreign key (REQ_ID_USER) references NhanVien(MaNV),
	constraint FK_Request_Supplier foreign key (REQ_SUPPLIER) references MNG_EQ_SUPPLIER(SUP_ID)
)
GO

-- 10.bảng lịch sử sữa chữa: 
CREATE TABLE MNG_EQ_REPAIR_HISTORY (
	RH_ID int primary key identity(1,1) not null,
	RH_ID_EQUIP int not null,
	RH_ID_TECHNICAL nvarchar(50) null, --info staff technical fix ticket y/n
	RH_ID_REQ int null, --info request if have
	RH_CREATED_DATE smalldatetime null, --date start repair with per technical
	RH_REPAIR_DATE smalldatetime null, --day fix this request (will update date when finish request)
	RH_DESCRIPTION nvarchar(max) null, 
	RH_COST decimal(18,2) null,
	RH_STATUS bit default 0 --status: 0: not done, 1: done (if done then finish ticket)
	constraint FK_RepairHis_Equipment foreign key (RH_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID),
    constraint FK_RepairHis_User foreign key (RH_ID_TECHNICAL) references NhanVien(MaNV),
	constraint FK_RepairHis_Request foreign key (RH_ID_REQ) references MNG_EQ_REPAIR_REQUEST(REQ_ID),
)
--Drop table MNG_EQ_REPAIR_HISTORY
GO
--11. bảng linh kiện: nếu có thay thế linh kiện thì sẽ new các linh kiện vào đây. (bao gồm linh kiện sửa ngoài)
CREATE TABLE MNG_EQ_REPAIR_SPAREPART (
    RSP_ID int primary key identity(1,1) not null,
    RSP_ID_REPAIR int not null,   -- fk repair his
    RSP_PART_NAME nvarchar(200) not null, -- name
    RSP_QUANTITY int not null default 1,  -- number
    RSP_UNIT_PRICE decimal(18,2) null,    -- cost
    RSP_NOTE nvarchar(max) null,          -- note
    constraint FK_SparePart_Repair foreign key (RSP_ID_REPAIR) references MNG_EQ_REPAIR_HISTORY(RH_ID)
);
GO
-- 12.bảng sử dụng thiết bị
CREATE TABLE MNG_EQ_USAGE_HISTORY (
	UH_ID int primary key identity(1,1) not null,
	UH_ID_EQUIP int not null,
	UH_ID_DEPT int not null,
	UH_START_DATE smalldatetime null,
	UH_END_DATE smalldatetime null,
	constraint FK_UsageHis_Equipment foreign key (UH_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID),
	constraint FK_UsageHis_PhongBan foreign key (UH_ID_DEPT) references BoPhan(MaPB),
)
GO
-- 13.bảng điều chuyển thiết bị
CREATE TABLE MNG_EQ_TRANSFER (
	TRN_ID int primary key identity(1,1) not null,
	TRN_ID_EQUIP int not null,
	TRN_ID_DEPT_FROM int not null,
	TRN_ID_DEPT_TO int not null,
	TRN_DATE_FROM smalldatetime null,
	TRN_DATE_TO smalldatetime null,
	TRN_APPROVE_BY varchar(20) null, --if null then not approve else show name of user (instead of status of transfer)
	TRN_STATUS int default 0 --status: new:0, approve:1, in process:2, done:3
	constraint FK_Transfer_Equipment foreign key (TRN_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID),
	constraint FK_Transfer_Dept_From foreign key (TRN_ID_DEPT_FROM) references BoPhan(MaPB),
	constraint FK_Transfer_Dept_To foreign key (TRN_ID_DEPT_TO) references BoPhan(MaPB),
)
--14. bảng thanh lý: who, when, how much
--drop table MNG_EQ_LIQUIDATION
CREATE TABLE MNG_EQ_LIQUIDATION (
	LIQ_ID int primary key identity(1,1) not null,
	LIQ_ID_USER nvarchar(50) not null, --user create ticket liquidation
	LIQ_CREATED smalldatetime null,
	LIQ_APPROVE_BY nvarchar(50) null, --user approve this ticket
	LIS_NOTE nvarchar(max) null 
    constraint FK_Liquidation_User_Create foreign key (LIQ_ID_USER) references NhanVien(MaNV),
	constraint FK_Liquidation_User_Approve foreign key (LIQ_APPROVE_BY) references NhanVien(MaNV)
)
--15. bảng thanh lý chi tiết:
CREATE TABLE MNG_EQ_LIQUIDATION_DETAIL (
	LDTL_ID int primary key identity(1,1) not null,
	LDTL_ID_LIQ int not null,
	LDTL_ID_EQUIP int not null,
	LDTL_NUMBER int null,
	LDTL_PRICE_ESTIMATE decimal(18,2) null, --read docs of table 'equipment'
	LDTL_PRICE_SELL decimal(18,2) null,
	LDTL_REASON nvarchar(max) null
	constraint FK_Liquidation_Dtl_Liq foreign key (LDTL_ID_LIQ) references MNG_EQ_LIQUIDATION(LIQ_ID),
	constraint FK_Liquidation_Dtl_Equipment foreign key (LDTL_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID)
)
-- 16.new: add quyen sd with user and dept
--CREATE TABLE [dbo].[QuyenSD](
--	[IdUser] [int] IDENTITY(1,1) NOT NULL,
--	[TenUser] [nvarchar](50) NOT NULL,
--	[MaNV] [nvarchar](50) NULL,
--	[MaPB] [int] NULL,
--	[Password] [nvarchar](50) NULL,
--	[PhanQuyen] [nvarchar](max) NULL,
--	[TruyCap] [bit] NOT NULL,
--	[GhiChu] [nvarchar](255) NULL,
--	[LoaiPM] [tinyint] NULL,
--	[QuyenTruyCap] [varchar](350) NULL,
--	[PhanNhomQL] [nvarchar](max) NULL,
--	[DuocPhep] [int] NULL,
--	[IDUD] [nvarchar](50) NULL,
--	[TaiLieuUser] [nvarchar](max) NULL,
--	[ShareFile] [nvarchar](max) NULL,
--	[StDayOff] [nvarchar](250) NULL,
--	[ChiNhanh] [nvarchar](250) NULL,
--	[SendPassWord] [nvarchar](50) NULL,
--	[SendUserName] [nvarchar](50) NULL,
--	[SmtpServerPort] [int] NULL,
--	[SmtpServer] [nvarchar](50) NULL,
--	[QuyenTruyCapWeb] [varchar](350) NULL,
--	[SmtpDeadline] [tinyint] NULL,
--	[UyQuyen] [nvarchar](50) NULL,
--	[AutSale] [tinyint] NULL,
--	[PathDataFile] [nvarchar](150) NULL,
--	[PathImg] [nvarchar](150) NULL,
--	[IdMay] [int] NULL,
--	[TapTinCC] [nvarchar](150) NULL,
--	[KeyDOTICOM] [nvarchar](250) NULL,
--	[LuuTru] [nvarchar](150) NULL,
--	[FontSys] [nvarchar](150) NULL,
--	[PhanQuyenPOS] [nvarchar](max) NULL,
--	[FontMenu] [nvarchar](150) NULL,
--	[Lock_Cong] [tinyint] NULL,
--	[Status] [bit] NULL
--)
------------------------TEST QUERY---------------------------------
Drop table  MNG_EQ_ACCOUNT
Drop table  BoPhan
Drop table  MNG_EQ_ROLE
Drop table  NhanVien
Drop table  MNG_EQ_EQUIPMENT_TYPE
Drop table  MNG_EQ_EQUIPMENT
Drop table  MNG_EQ_USAGE_HISTORY
Drop table  MNG_EQ_MAINTENANCE_SCHEDULE
Drop table  MNG_EQ_REPAIR_REQUEST
Drop table  MNG_EQ_REPAIR_HISTORY
Drop table  MNG_EQ_TRANSFER
Drop table  MNG_EQ_LIQUIDATION
Drop table  MNG_EQ_LIQUIDATION_DETAIL
Drop table  MNG_EQ_SUPPLIER
Drop table  MNG_EQ_REPAIR_SPAREPART
