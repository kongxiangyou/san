create database abc;
-- 岗位
create table employeeJob
(
	employeeJobId int auto_increment,
    employeeJobName varchar(200),
    employeeDescribe text,  -- 职位描述 
    primary key(employeeJobId)
);

-- 员工信息表
create table employee
(
	employeeId int auto_increment,
    employeeCode varchar(100),
    employeeName varchar(200),
	employeePassword varchar(100),
    employeeGender varchar(200),
    employeePhone varchar(200),
    employeeEmail varchar(200),
    employeeBrithday date,
    employeeIdentity varchar(100), -- 身份证号
    employeeState varchar(100),	-- 状态：在职，离职，出差，休假，其他
    employeeIntroduction text, -- 简介 
    employeeAddress text, -- 家庭地址 
    employeeEducation varchar(100), -- 学历；小学，中学，高中，中专，大专，本科，硕士，博士 
    employeeJobId int,
    primary key(employeeId)
);

insert into employee(employeeCode, employeeName, employeePassword,
employeeGender,  employeePhone,  employeeEmail,employeeBrithday, 
 employeeIdentity,  employeeState,  employeeIntroduction,employeeAddress, 
 employeeEducation,employeeJobId )
value('admin',"admin","123456","男","12345678910",'123@qq.com',null ,null,在职,null,null,null,2);

alter table employee add pciture varchar(200); -- 头像

 

insert into employeeJob (employeeJobName,employeeDescribe)values
("采购员","采购"),("超级管理员","超级管理员"),("仓管员","仓库管理"),("销售员","销售");

-- 商品信息表
create table produce
(
	produceId int primary key auto_increment,
    produceName varchar(200),
    produceNum varchar(100),
    produceDescribe text,
    employeeId int
);

alter table produce change   produceNum produceISBN varchar(100);  -- 商品编码

-- 采购表
create table procurement
(
	procurementId int primary key auto_increment,
    procurementNum int,
    procurementPrice DECIMAL(6,2),
    procurementTime date,
    procurementSuppliers varchar(200),
    produceId int,
    employeeId int
);

create table suppliers(
	supplierId int primary key auto_increment,
    supplierName varchar(100),
    procurementId int
);

alter table suppliers add constraint supplierToprocurement_FK
foreign key (procurementId) references procurement(procurementId) on update cascade;

 alter table procurement change procurementTime procurementTime datetime;
-- 库存表
create table store
(
	storeId int primary key auto_increment,
	produceNum int,
    produceId int
);
alter table store add allNum int; -- 曾经入库数量
alter table store add procurementNum int; -- 已采购的数量
--  入库
create table inventory
(
	inventoryId int primary key auto_increment,
    inventoryNum int,
    inventoryTime datetime,
    inventoryPostion varchar(100),
    inventoryRemain int,
    produceId int,
    employeeId int,
    procurementId int
);

-- 出库
create table outbound
(
	outboundId int primary key auto_increment,
    outboundNum int,
    outboundTime dateTime,
    produceId int,
    employeeId int,
    inventoryId int
);
-- 店铺表

create table shop
(
	shopId int primary key auto_increment,
    shopName varchar(200),
    shopAddress varchar(200),
    shopPhone varchar(200)
);
alter table shop add employeeId int;
-- 店铺库存表
create table shopStore
(
	shopStoreId int primary key auto_increment,
    shopStoreNum int,
    shopStoreTime dateTime,
    shopId int,
    produceId int,
    outboundId int,
    employeeId int,
    shopStoreallNum int -- 曾进货的数量
);

-- 销售表
create table sale
(
	saleId int  primary key auto_increment,
    salePrice DECIMAL(6,2),
    saleNum int, -- 销售数量
    proceeds  DECIMAL(6,2), -- 收入
    saleTime datetime,
    employeeId int,
    produceId int,
    shopStoreId int,
    shopId int 
);


-- 员工关系
alter table employee add constraint employeeToEmployeeType_FK
foreign key (employeeJobId) references employeeJob(employeeJobId) on update cascade;

-- 商品关系
alter table produce add constraint produceToEmployee_FK
foreign key (employeeId) references employee(employeeId) on update cascade;

-- 进货关系
alter table procurement add constraint procurementToEmployee_FK
foreign key (employeeId) references employee(employeeId) on update cascade;

alter table procurement add constraint procurementToProduce_FK
foreign key (produceId) references produce(produceId) on update cascade;

-- 库存表关系
alter table store add constraint storeToProduce_FK
foreign key (produceId) references produce(produceId) on update cascade;

-- 入库关系
alter table inventory add constraint inventoryToProduce_FK
foreign key (produceId) references produce(produceId) on update cascade; 

alter table inventory add constraint inventoryToEmployee_FK
foreign key (employeeId) references employee(employeeId) on update cascade;

alter table inventory add constraint inventoryToEmployee_FK
foreign key (procurementId) references procurement(procurementId) on update cascade;

-- 出库关系
alter table outbound add constraint outboundToProduce_FK
foreign key (produceId) references produce(produceId) on update cascade; 

alter table outbound add constraint outboundToEmployee_FK
foreign key (employeeId) references employee(employeeId) on update cascade;

alter table outbound add constraint outboundToInventory_FK
foreign key (inventoryId) references inventory(inventoryId) on update cascade;

-- 店铺关系
alter table shopStore add constraint shopStoreToShop_FK
foreign key (shopId) references shop(shopId) on update cascade; 

alter table shopStore add constraint shopStoreToEmployee_FK
foreign key (employeeId) references employee(employeeId) on update cascade; 

alter table shopStore add constraint shopStoreToProduce_FK
foreign key (produceId) references produce(produceId) on update cascade; 

alter table shopStore add constraint shopStoreToOutboundId_FK
foreign key (outboundId) references outbound(outboundId) on update cascade; 

-- 销售关系
alter table sale add constraint saleToShop_FK
foreign key (shopId) references shop(shopId) on update cascade;
 
alter table sale add constraint saleToEmployee_FK
foreign key (employeeId) references employee(employeeId) on update cascade; 

alter table sale add constraint saleToProduce_FK
foreign key (produceId) references produce(produceId) on update cascade; 

alter table sale add constraint saleToshopStore_FK
foreign key (shopStoreId) references shopStore(shopStoreId) on update cascade; 