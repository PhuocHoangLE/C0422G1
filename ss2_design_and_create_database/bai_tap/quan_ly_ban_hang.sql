drop database quan_ly_ban_hang ;
create database quan_ly_ban_hang ;
use quan_ly_ban_hang ;

create table customer (
customerid int not null primary key ,
customername varchar(30) ,
customerage int
);

create table `order` (
orderid int not null primary key ,
orderdate date,
order_total_price double ,
customerid int ,
foreign key (customerid) references customer(customerid) 
) ;

create table orderdetail (
orderid int ,
productid int ,
primary key (orderid,productid),
foreign key (orderid) references `order`(orderid) ,
foreign key (productid) references product(productid) ,
orderQTY varchar(30)
) ;

create table product (
productid int not null primary key ,
productname varchar(35),
product_price double
);


