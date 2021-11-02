use classicmodels;
SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
explain SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
#tạo chỉ mục cho bảng customers
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
explain SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.';
#một vài thông tin trong explain
# possible_keys : Đưa ra những Index có thể sử dụng để query
# key : và Index nào đang được sử dụng
# key_len : Chiều dài của từng mục trong Index
# ref : Cột nào đang sử dụng
# rows : Số hàng (rows) mà MySQL dự đoán phải tìm
# extra : Thông tin phụ, thật tệ nếu tại cột này là “using temporary” hay “using filesort”

#thêm chỉ mục vào bảng
alter table customers add index idx_full_name(contactFirstName,contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

#xóa chi mục trong bảng
ALTER TABLE customers DROP INDEX idx_full_name;
