drop database quan_ly_ban_hang ;
create database quan_ly_ban_hang ;
use quan_ly_ban_hang ;

create table customer (
	customer_id int primary key ,
	customer_name varchar(30) ,
	customer_age int
);

create table `order` (
	order_id int primary key ,
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

insert into customer (customer_id ,customer_name,customer_age)
values  (1,"Minh Quan",10) ,
		(2,"Ngọc Oanh",20) ,
		(3,"Hong Ha",50) ;
        
insert into `order` (order_id,customer_id,order_date,order_total_price) 
values  (2,2,'2006/3/23',null) ,
		(3,1,'2006/3/16',null) ;
        
insert into product (product_id,product_name,product_price)
values  (1,"May Giat",3) ,
		(2,"Tu Lanh",5) ,
		(3,"Dieu Hoa",7) ,
		(4,"Quat",1) ,
		(5,"Bep Dien",2) ;
        
insert into order_detail (order_id,product_id,order_qty)
values  (1,1,3) ,
		(1,3,7) ,
		(1,4,2) ,
		(2,1,1) ,
		(3,1,8) ,
		(2,5,4) ,
		(2,3,3) ;
        
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select `order`.order_id,`order`.order_date,`order`.order_total_price  
from `order` ;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.customer_name , p.product_name
from customer c
join `order` o on c.customer_id = o.order_id 
join order_detail odt on o.order_id = odt.order_id
join product p on odt.product_id = p.product_id ;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào .
select  c.*, count(o.customer_id) as so_lan_dat_hang 
from customer c
left join `order` o on c.customer_id = o.customer_id 
group by c.customer_id
having so_lan_dat_hang = 0 ;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
       
select o.order_id ,o.order_date
sum(otd.order_detail.order_qty * p.product_price) as gia_ban 
from `order` o
join order_detail otd on o.order_id = otd.order_id
join product p on otd.product_id = p.product_id
