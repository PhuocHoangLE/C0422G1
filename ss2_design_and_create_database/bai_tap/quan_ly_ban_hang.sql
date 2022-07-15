drop database quan_ly_ban_hang ;
create database quan_ly_ban_hang ;
use quan_ly_ban_hang ;

create table customer (
	customer_id int not null primary key ,
	customer_name varchar(30) ,
	customer_age int
);

create table `order` (
	order_id int not null primary key ,
	order_date date,
	order_total_price double ,
	customer_id int ,
	foreign key (customer_id) references customer(customer_id) 
) ;

create table order_detail (
	order_id int ,
	product_id int ,
	primary key (order_id,product_id),
	foreign key (order_id) references `order`(order_id) ,
	foreign key (product_id) references product(product_id) ,
	order_qty varchar(30)
) ;

create table product (
	product_id int not null primary key ,
	product_name varchar(35),
	product_price double
);


