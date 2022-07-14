drop database ban_hang ;

create database ban_hang ;

use ban_hang ;

create table phieu_xuat (
	so_px int primary key ,
	ngay_xuat date
) ;

create table vat_tu (
	ma_vtu int primary key ,
	ten_vtu varchar(45)
);

create table chi_tiet_phieu_xuat (
	dg_xuat double ,
	sl_xuat int ,
	ma_vtu int ,
	so_px int ,
	foreign key (ma_vtu) references vat_tu(ma_vtu) ,
	foreign key (so_px) references phieu_xuat(so_px)
);

create table phieu_nhap (
	so_pn int primary key ,
	ngay_nhap date 
);

create table chi_tiet_phieu_nhap (
	dg_nhap int ,
	sl_nhap int,
	ma_vtu int ,
	so_pn int,
	foreign key(ma_vtu) references vat_tu(ma_vtu) ,
	foreign key(so_pn) references phieu_nhap(so_pn)
);

create table don_dh (
	so_dh int primary key ,
	ngay_dh date
);

create table chi_tiet_don_dat_hang (
	so_dh int ,
	ma_vtu int ,
	primary key (so_dh,ma_vtu),
	foreign key (so_dh) references don_dh(so_dh),
	foreign key (ma_vtu) references vat_tu(ma_vtu)
);

create table nha_cc (
	ma_ncc int primary key ,
	ten_ncc varchar(45),
	dia_chi varchar(45)
) ;

create table cc (
	ma_ncc int ,
	so_dh int ,
	primary key(ma_ncc,so_dh),
	foreign key (ma_ncc) references nha_cc(ma_ncc),
	foreign key (so_dh) references don_dh(so_dh)
) ;

create table so_dien_thoai (
	id int primary key ,
	sdt varchar(45) ,
	ma_ncc int,
	foreign key (ma_ncc) references nha_cc(ma_ncc)
);