create database if not exists quanly_donhang;

create table NHACC(
	MaNCC int primary key auto_increment,
    TenNCC varchar(50),
    DiaChi varchar(50),
    SĐT varchar(50)
);

create table DONHN(
	SoDH int primary key auto_increment,
    NgayDH date,
    NHACC_MaNCC int,
    foreign key(NHACC_MaNCC) references NHACC (MaNCC) 
);
create table VATTU(
	MaVTU int primary key auto_increment,
    TenVTU varchar(50)
);
create table PHIEUNHAP(
	SoPN int primary key auto_increment,
    NgayNhap date
);

create table DETAIL(
	DGNhap int,
    SLNhap int,
    MaVTU int,
    SoPN int,
    primary key(MaVTU,SoPN),
    foreign key (MaVTU) references VATTU (MaVTU),
    foreign key (SoPN) references PHIEUNHAP (SoPN)
);

create table PHIEUXUAT(
	SoPX int primary key auto_increment,
    NgayXuat date
);

create table detail_xuat(
	DGXuat int,
    SLXuat int,
    SoPX int,
    MaVTU int,
    primary key(SoPX, MaVTU),
    foreign key (SoPX) references PHIEUXUAT(SoPX),
    foreign key(MaVTU) references VATTU(MaVTU)
);