use classicmodels;
DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers;
END //
DELIMITER ;
# DELIMITER //: dùng để phân cách bộ nhớ lưu trữ thủ tục Cache và mở ra một ô lưu trữ mới.
# CREATE PROCEDURE findAllCustomers(): dùng để khai báo tạo một Procedure mới, trong đó findAllCustomers chính là tên thủ tục còn hai từ đầu là từ khóa.
# **BEGIN và END; // ** dùng để khai báo bắt đầu của Procedure và kết thúc Procedure
# **DELIMITER ; ** đóng lại ô lưu trữ

# gọi procedure
call findAllCustomers();

#drop và tạo lại procedure


DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//
CREATE PROCEDURE findAllCustomers()
BEGIN
    SELECT * FROM customers where customerNumber = 175;
END //
DELIMITER ;

call findAllCustomers();

