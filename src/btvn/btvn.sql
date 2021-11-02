create database khoVatTu;
use khoVatTu;

create table vatTu(
    id int not null primary key ,
    maVatTu varchar(20) not null ,
    tenVatTu varchar(50) not null ,
    donViTinh varchar(10) not null ,
    giaTien double not null
);

create table tonKho(
    id int not null primary key ,
    id_vatTu int not null ,
    soLuongDau int not null ,
    tongSoLuongNhap int not null ,
    tongSoLuongXuat int not null,
    foreign key (id_vatTu) references vatTu(id)
);

create table nhaCungCap(
    id int not null primary key ,
    maNhaCungCap varchar(20) not null ,
    tenNhaCungCap varchar(50) not null ,
    diaChi varchar(50) not null ,
    soDienThoai int(10) not null
);

create table donDatHang(
    id int not null primary key ,
    id_nhaCungCap int not null ,
    maDon varchar(20) not null ,
    ngayDatHang date not null ,
    foreign key (id_nhaCungCap) references nhaCungCap(id)
);

create table phieuNhap(
    id int not null primary key ,
    maPhieuNhap varchar(20) not null ,
    ngayNhap date not null ,
    id_donHang int not null ,
    foreign key (id_donHang) references donDatHang(id)
);

create table phieuXuat(
    id int not null primary key ,
    maPhieuXuat varchar(20) not null ,
    ngayXuat date not null ,
    tenKhachHang varchar(100) not null
);

create table chiTietDonHang(
    id int not null primary key ,
    id_donHang int not null ,
    id_vatTu int not null ,
    soLuongDat int not null
);
alter table khoVatTu.chiTietDonHang
add constraint foreign key (id_donHang) references donDatHang(id);
alter table khoVatTu.chiTietDonHang
add constraint foreign key (id_vatTu) references vatTu(id);

create table chiTietPhieuNhap(
    id int not null primary key ,
    id_phieuNhap int not null ,
    id_vatTu int not null ,
    soLuongDat int not null,
    donGiaNhap double not null ,
    ghiChu varchar(50),
    foreign key (id_phieuNhap) references phieuNhap(id),
    foreign key (id_vatTu) references  vatTu(id)
);

create table chiTietPhieuXuat(
    id int not null primary key ,
    id_phieuXuat int not null ,
    id_vatTu int not null ,
    soLuongXuat int not null,
    donGiaXuat double not null ,
    ghiChu varchar(50),
    foreign key (id_phieuXuat) references phieuXuat(id),
    foreign key (id_vatTu) references  vatTu(id)
);






