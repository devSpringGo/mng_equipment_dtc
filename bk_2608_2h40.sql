CREATE DATABASE XT_MNG_EUIPMENT
GO
USE XT_MNG_EUIPMENT
GO
--Drop table:
--Drop table MNG_EQ_ACCOUNT
--Drop table MNG_EQ_DEPARTMENT
--Drop table MNG_EQ_ROLE
--Drop table MNG_EQ_USER
--Drop table MNG_EQ_EQUIPMENT_TYPE
-- 1.bảng acc
CREATE TABLE MNG_EQ_ACCOUNT (
	ACC_ID int primary key identity(1,1) not null,
	ACC_USERNAME varchar(50) not null,
	ACC_PASSWORD nvarchar(50) not null,
	ACC_STATUS bit default 1
)
-- Data test:
INSERT INTO [dbo].[MNG_EQ_ACCOUNT]
           ([ACC_USERNAME]
           ,[ACC_PASSWORD]
           ,[ACC_STATUS])
     VALUES
           ('admin','123456a@',1),
		   ('manage','123456a@',1),
		   ('technical','123456a@',1),
		   ('staff1','123456a@',1),
		   ('staff2','123456a@',1)
-- Drop table MNG_EQ_ACCOUNT
--Delete from MNG_EQ_ACCOUNT
--DBCC CHECKIDENT('MNG_EQ_ACCOUNT', RESEED, 0)
Select * from MNG_EQ_ACCOUNT
GO
-- 2.bảng phòng ban
CREATE TABLE MNG_EQ_DEPARTMENT (
	DEPT_ID int primary key identity(1,1) not null,
	DEPT_NAME nvarchar(100) null,
	DEPT_TYPE varchar(20) null, --type of dept: 0: Office, 1:store,...
	DEPT_ADDRESS nvarchar(200) null
)
-- Data test:
INSERT INTO [dbo].[MNG_EQ_DEPARTMENT]
           ([DEPT_NAME]
           ,[DEPT_TYPE]
           ,[DEPT_ADDRESS])
     VALUES
           (N'Phòng IT','0',N'Phan Đăng Lưu, Hải Châu'),
		   (N'Phòng Hành chính nhân sự','0',N'Phan Đăng Lưu, Hải Châu'),
		   (N'Phòng Kĩ thuật sữa chữa','0',N'Phan Đăng Lưu, Hải Châu'),
		   (N'Tiệm bánh 1','1',N'Phan Đăng Lưu, Hải Châu'),
		   (N'Tiệm bánh 2','1',N'Lê Thanh Nghị, Hải Châu')
--DBCC CHECKIDENT ('MNG_EQ_DEPARTMENT', RESEED, 0);
--Drop table MNG_EQ_DEPARTMENT
Select * from MNG_EQ_DEPARTMENT
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
-- 3.bảng user
CREATE TABLE MNG_EQ_USER (
	USR_ID int primary key identity(1,1) not null,
	USR_ACC int not null unique, --follow with account per staff
	USR_DEPT int null, --department of staff
	USR_ROLE int null, --role: 0:admin, 1: manage store, 2: staff,...
	USR_FULLNAME nvarchar(100) null,
	USR_EMAIL nvarchar(200) null unique,
	USR_PHONE varchar(20) null,
	constraint FK_User_Account foreign key (USR_ACC) references MNG_EQ_ACCOUNT(ACC_ID),
    constraint FK_User_Dept foreign key (USR_DEPT) references MNG_EQ_DEPARTMENT(DEPT_ID),
    constraint FK_User_Role foreign key (USR_ROLE) references MNG_EQ_ROLE(ROLE_ID)
)
Select * from MNG_EQ_ACCOUNT
Select * from MNG_EQ_ROLE
Select * from MNG_EQ_DEPARTMENT
Select * from MNG_EQ_USER
--DBCC CHECKIDENT ('MNG_EQ_USER', RESEED, 0);
--Drop table MNG_EQ_USER
-- Data test:
INSERT INTO [dbo].[MNG_EQ_USER]
           ([USR_ACC]
           ,[USR_DEPT]
           ,[USR_ROLE]
           ,[USR_FULLNAME]
           ,[USR_EMAIL]
           ,[USR_PHONE])
     VALUES
           (1,1,1,N'Trần Văn A',N'tva@doticom.vn','0123456789'),
		   (2,2,2,N'Lê Văn A',N'lva@doticom.vn','0223456789'),
		   (3,3,3,N'Trần Công C',N'tcc@doticom.vn','0323456789'),
		   (4,4,3,N'Nguyễn Hữu D',N'nhd@doticom.vn','0423456789'),
		   (5,5,3,N'Nguyễn Văn E',N'nve@doticom.vn','0523456789')
--Select * from MNG_EQ_USER A
--left join MNG_EQ_DEPARTMENT B ON A.USR_DEPT = B.DEPT_ID
--left join MNG_EQ_ROLE C ON A.USR_ROLE = C.ROLE_ID
--where C.ROLE_NAME like N'%Giám đốc%'
--where c.ROLE_ID = 1
GO
-- 4.bảng loại thiết bị
CREATE TABLE MNG_EQ_EQUIPMENT_TYPE (
	EQ_TYPE_ID int primary key identity(1,1) not null,
	EQ_TYPE_NAME nvarchar(200) unique not null
)
-- Data test:
INSERT INTO [dbo].[MNG_EQ_EQUIPMENT_TYPE]
           ([EQ_TYPE_NAME])
     VALUES
           (N'Điều hòa'),
		   (N'Tủ lạnh'),
		   (N'Máy tính'),
		   (N'Máy trộn kem'),
		   (N'Máy pha cà phê'),
		   (N'Lò nướng')
Select * from MNG_EQ_EQUIPMENT_TYPE ORDER BY EQ_TYPE_ID ASC
GO
-- 5.bảng thiết bị
CREATE TABLE MNG_EQ_EQUIPMENT (
	EQUIP_ID int primary key identity(1,1) not null,
	EQUIP_NAME nvarchar(200) not null,
	EQUIP_TYPE int null,
	EQUIP_PURCHASE_DATE smalldatetime null,
	EQUIP_WARRANTY_END_DATE smalldatetime null,
	EQUIP_SUPPLIER nvarchar(100) null,
	EQUIP_STATUS varchar(20) default 0, --status: 0: not active, 1:active,...
	EQUIP_ID_DEPT int null,
	EQUIP_ORIGINAL_COST decimal(18,2) null,
	EQUIP_USEFUL_TIME int null, --number of month then equipment can active
	EQUIP_RESIDUAL_VAL decimal(18,2) null, --value estimate equipment last
	EQUIP_QR_CODE VARCHAR(200) null,
	constraint FK_Equipment_EquipmentType foreign key (EQUIP_TYPE) references MNG_EQ_EQUIPMENT_TYPE(EQ_TYPE_ID),
    constraint FK_Equipment_Dept foreign key (EQUIP_ID_DEPT) references MNG_EQ_DEPARTMENT(DEPT_ID),
)
--Drop table MNG_EQ_EQUIPMENT
Select * from MNG_EQ_EQUIPMENT_TYPE ORDER BY EQ_TYPE_ID ASC
Select * from MNG_EQ_DEPARTMENT
--Data test:
INSERT INTO [dbo].[MNG_EQ_EQUIPMENT]
           ([EQUIP_NAME]
           ,[EQUIP_TYPE]
           ,[EQUIP_PURCHASE_DATE]
           ,[EQUIP_WARRANTY_END_DATE]
           ,[EQUIP_SUPPLIER]
           ,[EQUIP_STATUS]
           ,[EQUIP_ID_DEPT]
           ,[EQUIP_ORIGINAL_COST]
           ,[EQUIP_USEFUL_TIME]
           ,[EQUIP_RESIDUAL_VAL]
           ,[EQUIP_QR_CODE])
     VALUES
			--it
           (N'Điều hòa 1',1,GETDATE(),null,N'Nhà cung cấp 1','0',1,10000000,36,null,null),
		   (N'Máy tính 1',3,GETDATE(),null,N'Nhà cung cấp 2','0',1,20000000,24,null,null),
		   (N'Máy tính 2',3,GETDATE(),null,N'Nhà cung cấp 2','0',1,20000000,24,null,null),
		   (N'Máy tính 3',3,GETDATE(),null,N'Nhà cung cấp 2','0',1,20000000,24,null,null),
		   (N'Máy tính 4',3,GETDATE(),null,N'Nhà cung cấp 2','0',1,20000000,24,null,null),
		   (N'Máy tính 5',3,GETDATE(),null,N'Nhà cung cấp 2','0',1,20000000,24,null,null),
		   --hcns
		   (N'Điều hòa 2',1,GETDATE(),null,N'Nhà cung cấp 1','0',2,10000000,36,null,null),
		   (N'Máy tính 1',3,GETDATE(),null,N'Nhà cung cấp 2','0',2,20000000,24,null,null),
		   (N'Máy tính 2',3,GETDATE(),null,N'Nhà cung cấp 2','0',2,20000000,24,null,null),
		   (N'Máy tính 3',3,GETDATE(),null,N'Nhà cung cấp 2','0',2,20000000,24,null,null),
		   (N'Tủ lạnh 1',2,GETDATE(),null,N'Nhà cung cấp 3','0',2,5000000,36,null,null),
		   --kt
		   (N'Điều hòa 3',1,GETDATE(),null,N'Nhà cung cấp 1','0',3,10000000,36,null,null),
		   (N'Máy tính 1',3,GETDATE(),null,N'Nhà cung cấp 2','0',3,20000000,24,null,null),
		   (N'Máy tính 2',3,GETDATE(),null,N'Nhà cung cấp 2','0',3,20000000,24,null,null),
		   (N'Máy tính 3',3,GETDATE(),null,N'Nhà cung cấp 2','0',3,20000000,24,null,null),
		   --tb1
		   (N'Điều hòa 4',1,GETDATE(),null,N'Nhà cung cấp 1','0',4,10000000,36,null,null),
		   (N'Máy tính 1',3,GETDATE(),null,N'Nhà cung cấp 2','0',4,20000000,24,null,null),
		   (N'Tủ lạnh 1',2,GETDATE(),null,N'Nhà cung cấp 3','0',4,8000000,36,null,null),
		   (N'Tủ lạnh 2',2,GETDATE(),null,N'Nhà cung cấp 3','0',4,8000000,36,null,null),
		   (N'Máy pha cà phê 1',5,GETDATE(),null,N'Nhà cung cấp 4','0',4,12000000,36,null,null),
		   (N'Máy trộn kem 1',4,GETDATE(),null,N'Nhà cung cấp 5','0',4,18000000,36,null,null),
		   (N'Lò nướng 1',6,GETDATE(),null,N'Nhà cung cấp 6','0',4,25000000,36,null,null),
		   --tb2
		   (N'Điều hòa 5',1,GETDATE(),null,N'Nhà cung cấp 1','0',5,10000000,36,null,null),
		   (N'Máy tính 1',3,GETDATE(),null,N'Nhà cung cấp 2','0',5,20000000,24,null,null),
		   (N'Tủ lạnh 1',2,GETDATE(),null,N'Nhà cung cấp 3','0',5,8000000,36,null,null),
		   (N'Tủ lạnh 2',2,GETDATE(),null,N'Nhà cung cấp 3','0',5,8000000,36,null,null),
		   (N'Máy pha cà phê 1',5,GETDATE(),null,N'Nhà cung cấp 4','0',5,12000000,36,null,null),
		   (N'Máy trộn kem 1',4,GETDATE(),null,N'Nhà cung cấp 5','0',5,18000000,36,null,null),
		   (N'Lò nướng 1',6,GETDATE(),null,N'Nhà cung cấp 6','0',5,25000000,36,null,null)
Select * from MNG_EQ_EQUIPMENT
GO
-- 6.bảng lịch bảo trì
CREATE TABLE MNG_EQ_MAINTENANCE_SCHEDULE (
	MS_ID int primary key identity(1,1) not null,
	MS_ID_EQUIP int not null,
	MS_SCHEDULE_DATE smalldatetime null,
	MS_DESCRIPTION nvarchar(max) null, --decribe info of ms
	MS_STATUS bit default 0 --status of maintenance: 0: not done, 1 done
	constraint FK_Schedule_Equipment foreign key (MS_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID)
)
--Data test:

GO
-- 7.bảng yêu cầu sửa chữa
CREATE TABLE MNG_EQ_REPAIR_REQUEST (
	REQ_ID int primary key identity(1,1) not null,
	REQ_ID_EQUIP int not null,
	REQ_ID_USER int not null,
	REQ_DATE smalldatetime null,
	REQ_URGENCY_LEVEL varchar(10) null, --level urgency repair: 0: low, 1:medium, 2:high(important) 
	REQ_DESCRIPTION nvarchar(200) null, --decribe error/ message to repair
	REQ_IMG_PATH varchar(max) null,
	REQ_STATUS int default 0, --status of request: 0:pending, 1: In process, 2: Done, 3: Cancel
	constraint FK_Request_Equipment foreign key (REQ_ID_EQUIP) references MNG_EQ_EQUIPMENT(EQUIP_ID),
    constraint FK_Equipment_Dept foreign key (EQUIP_ID_DEPT) references MNG_EQ_DEPARTMENT(DEPT_ID)
)

GO
-- 8.bảng lịch sử sữa chữa: 
CREATE TABLE MNG_EQ_REPAIR_HISTORY (
	RH_ID int primary key identity(1,1) not null,
	RH_ID_EQUIP varchar(20) null,
	RH_ID_USER varchar(20) null, --info staff technical fix 
	RH_REPAIR_DATE smalldatetime null,
	RH_DESCRIPTION nvarchar(max) null,
	RH_COST decimal(18,2) null,
	RH_STATUS bit default 0 --status: 0: not done, 1: done
)
GO
-- 9.bảng sử dụng thiết bị
CREATE TABLE MNG_EQ_USAGE_HISTORY (
	UH_ID int primary key identity(1,1) not null,
	UH_ID_EQUIP varchar(20) null,
	UH_ID_DEPT varchar(20) null,
	UH_START_DATE smalldatetime null,
	UH_END_DATE smalldatetime null,
)
GO
-- 10.bảng điều chuyển thiết bị
CREATE TABLE MNG_EQ_TRANSFER (
	TRN_ID int primary key identity(1,1) not null,
	TRN_ID_EQUIP varchar(20) null,
	TRN_ID_DEPT_FROM varchar(20) null,
	TRN_ID_DEPT_TO varchar(20) null,
	TRN_DATE smalldatetime null,
	TRN_APPROVE_BY varchar(20) null --if null then not approve else show name of user (instead of status of transfer)
)