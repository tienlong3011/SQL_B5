use classicmodels;
create view customer_views as
    select customerName,customerNumber,phone
    from customers;
select * from customer_views;

#cập nhập bảng ảo view
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

select * from customer_views;