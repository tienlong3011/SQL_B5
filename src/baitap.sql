create database demo;
use demo;

create table products(
    id int primary key not null ,
    productsCode varchar(10) not null ,
    productsName varchar(50) not null ,
    productsPrice double not null ,
    productAmount int not null ,
    productDescription varchar(50),
    productStatus boolean
);
#Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index products_index
on Products (productsCode);
#Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index products_composite
on Products(productsName,productsPrice);
#Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select productsName,productsPrice,productAmount from products;
explain select productsCode from products;
#So sánh câu truy vấn trước và sau khi tạo index


#Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view products_view as
    select productsCode,productsName,productsPrice,productStatus
from products;
select * from products_view;

#Tiến hành sửa đổi view
create or replace view products_view as
    select productsCode,productsName,productsPrice,productAmount,productStatus
from products;
select * from products_view;

#Tiến hành xoá view
drop view products_view;

#Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
create procedure p_procedure()
    begin
        select * from products;
    end //
    delimiter ;

call p_procedure();

# Tạo store procedure thêm một sản phẩm mới
DELIMITER //
create procedure new_products(
    p_id int ,
    p_Code varchar(10)  ,
    p_Name varchar(50)  ,
    p_Price double  ,
    p_Amount int  ,
    p_Description varchar(50),
    p_Status boolean
)
begin
    insert into
        products (id, productsCode, productsName, productsPrice,
                  productAmount, productDescription, productStatus) value
    (p_id,p_Code,p_Name,p_Price,p_Amount,p_Description,p_Status);
end //
delimiter ;
call new_products(6,'c14646','Iphone13 Promax',1000,70,'new',1);

select * from products;

# Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure edit_products(id_search int,
                               p_Code varchar(10)  ,
                               p_Name varchar(50)  ,
                               p_Price double  ,
                               p_Amount int  ,
                               p_Description varchar(50),
                               p_Status boolean)
begin
    update products
    set productsCode = p_Code ,
        productsName = p_Name ,
        productsPrice = p_Price,
        productAmount = p_Amount,
        productDescription = p_Description,
        productStatus = p_Status
    where id =  id_search ;
end //
delimiter ;

call edit_products(6,'c6','Iphone13 Promax',900,1000,'new',1);
select * from products;

#Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure remove_product(in id_search int)
    begin
        delete from products
            where id = id_search;
    end //
    delimiter ;
call remove_product(6);
select * from products;