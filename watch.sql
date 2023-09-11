create database ASM;
drop database asm
use ASM;

create table Categories(
	Id char(4) primary key,
	Name nvarchar(50),
	Image nvarchar(50)
)

drop table Categories

create table Products (
	Id int identity(1,1) primary key,
	Name nvarchar(50),
	Image nvarchar(50),
	Price money,
	Discount float,
	CreateDate date,
	CategoryId char(4) foreign key references Categories(Id)	
)

drop table Products

insert into Categories
values ('1', N'Apple', 'apple.png'),
('2', N'Xiaomi', 'xiaomi.png')

insert into Products
values
(N'Apple Watch Series 6', 'applewatch1.jpg', 12000000, 10, '3-4-2022', '1'),
(N'Apple Watch Series 5', 'applewatch2.jpg', 10000000, 12, '3-4-2021', '1'),
(N'Apple Watch Series 4', 'applewatch3.jpg', 9000000, 15, '3-4-2020', '1'),
(N'Apple Watch Series 3', 'applewatch4.jpg', 8500000, 11, '3-4-2019', '1')

insert into Products
values
(N'Amazfit Gts n?i ??a', 'xiaomi1.jpg', 2500000, 8, '3-4-2022', '2'),
(N'Xiaomi Amazfit Gts Vàng', 'xiaomi2.jpg', 3000000, 15, '3-4-2021', '2')

create table Accounts(
	Username nvarchar(50) primary key,
	Password nvarchar(50),
	Fullname nvarchar(50),
	Email varchar(50),
	Photo nvarchar(50),
	Activated bit,
	Admin bit,
	Otp varchar(10)
)

insert into Accounts
values
(N'PhuongPham', 'phuong123', N'Ph?m Duy Ph??ng', 'thth1732003@gmail.com', 'xiaomi.png', 1, 1, '')


insert into Accounts
values
(N'TrongBao', 'trong123', N'Nguyễn Bảo Trọng', 'trong@gmail.com', 'xiaomi.png', 1, 0, '')

insert into Accounts
values
(N'QuocThinh', 'thinh123', N'Nguyễn Lê Quốc Thịnh', 'thinh@gmail.com', 'apple.png', 1, 0, ''),
(N'QuocTri', 'tri123', N'Trần Quốc Trí', 'tri@gmail.com', 'apple.png', 1, 0, ''),
(N'DucTuan', 'tuan123', N'Lê Đức Tuấn', 'tuan@gmail.com', 'xiaomi.png', 1, 0, ''),
(N'Ti', '123', N'Lê Văn Tí', 'ti@gmail.com', 'xiaomi.png', 1, 0, ''),
(N'Teo', '123', N'Nguyễn Văn Tèo', 'teo@gmail.com', 'apple.png', 1, 0, ''),
(N'admin', '123', N'ADMIN', 'admin@gmail.com', 'xiaomi.png', 1, 1, '')


create table Orders(
	Id bigint identity(1,1) primary key,
	Username nvarchar(50) foreign key references Accounts(Username),
	CreateDate datetime,
	Address nvarchar(100),
	Phone varchar(11),
	FullName nvarchar(50),
	Email varchar(255),
	Price float,
	Status bit
)


insert into Orders
values (N'TrongBao', '6-6-2023', N'CV phần mềm Quang Trung, Q12, TPHCM', '012345678', N'Nguyễn Bảo Trọng', 'trong@gmail.com', 12000000, 0),
(N'QuocThinh', '7-6-2023', N'CV phần mềm Quang Trung, Q12, TPHCM', '012345678', N'Nguyễn Lê Quốc Thịnh', 'thinh@gmail.com', 14000000, 1),
(N'Teo', '5-6-2023', N'CV phần mềm Quang Trung, Q12, TPHCM', '012345678', N'Nguyễn Văn Tèo', 'teo@gmail.com', 19000000, 0),
(N'Ti', '1-5-2023', N'CV phần mềm Quang Trung, Q12, TPHCM', '012345678', N'Lê Văn Tí', 'ti@gmail.com', 22000000, 0),
(N'DucTuan', '6-6-2023', N'CV phần mềm Quang Trung, Q12, TPHCM', '012345678', N'Lê Đức Tuấn', 'tuan@gmail.com', 10000000, 1),
(N'QuocTri', '7-6-2023', N'CV phần mềm Quang Trung, Q12, TPHCM', '012345678', N'Trần Quốc Trí', 'tri@gmail.com', 15000000, 0)


delete from Orders;
drop table Orders;

create table OrderDetails(
	Id bigint identity(1,1) primary key,
	Price float,
	Quantity int,
	OrderId bigint foreign key references Orders(Id),
	ProductId int foreign key references Products(Id),
	constraint UK_O_P unique(OrderId, ProductId)
)

ALTER TABLE OrderDetails
ADD CONSTRAINT fk_onDelete
FOREIGN KEY (OrderId)  REFERENCES Orders (Id) ON DELETE CASCADE;

insert into OrderDetails
values (12000000, 1, 1, 1),
(10000000, 1, 5, 2),
(12000000, 2, 4, 1)


drop table OrderDetails;

delete from OrderDetails;


select * from Categories
select * from Products
select * from Accounts;
select * from Orders; 
select * from OrderDetails;
