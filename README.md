Tutorial:
Lấy Databaste: https://github.com/tuantadev2664/Project-Final-PRJ301/blob/main/database/data_Project_VVIP_Final_update_7_9.xls import vào SQL để có data.

--DB: Order and Order Detai
Use[Project_Final_PRJ301]
CREATE TABLE [Order] (
    orderId nvarchar(20) NOT NULL PRIMARY KEY,
    accountId nvarchar(20) NOT NULL,
    orderDate nvarchar(10),
    name nvarchar(255) NOT NULL,
    phone nvarchar(255),
    email nvarchar(255) NOT NULL,
    city nvarchar(255),
    district nvarchar(255),
    ward nvarchar(255),
    address nvarchar(255),
    quantity varchar(20),
    total varchar(20)
);
INSERT INTO [Order] (orderId,accountId, orderDate, name, phone, email, city, district, ward, address, quantity, total)
VALUES
('OR001','ACC001', '2024-07-12', 'John Doe', '1234567890', 'johndoe@example.com', 'Hanoi', 'Ba Dinh', 'Truc Bach', '123 ABC Street', '5', '150000'),
('OR002','ACC002', '2024-07-12', 'Jane Smith', '0987654321', 'janesmith@example.com', 'Ho Chi Minh City', 'District 1', 'Ben Nghe', '456 XYZ Street', '3', '90000');

select count(*) from [Order];

CREATE TABLE OrderDetail (
 orderId nvarchar(20) NOT NULL,
 productId nvarchar(20) NOT NULL,
 color nvarchar(255) NOT NULL,
 size nvarchar(255) NULL,
 quantity nvarchar(255) NOT NULL,
);
INSERT INTO OrderDetail (orderId, productId, color, size, quantity)
VALUES ('ORD001', 'MBL267', '635', 'L', '2');



--tao procedure cho update solg khi order
CREATE PROCEDURE PlaceOrder
	@orderId nvarchar(10),
    @ProductID nvarchar(10),
	@colorid nvarchar(10),
	@colorName nvarchar(20),
	@Productsize nvarchar(10),
    @Quantity INT

AS
BEGIN
    -- Kiểm tra số lượng tồn kho
    DECLARE @StockQuantity INT
    SELECT @StockQuantity = productStock
    FROM ProductDetail
    WHERE productCode = @ProductID and colorId = @colorid and productSize = @Productsize

    IF @StockQuantity < @Quantity
    BEGIN
        RAISERROR('Sản phẩm không đủ số lượng tồn kho.', 16, 1)
        RETURN
    END

    -- Thực hiện đặt hàng
    BEGIN TRANSACTION

    UPDATE ProductDetail
    SET productStock = productStock - @Quantity
    WHERE productCode = @ProductID and colorId = @colorid and productSize = @Productsize

    -- Thêm mã đơn hàng vào bảng Orders
	INSERT INTO OrderDetail (orderId, productId, color, size, quantity) 
	VALUES (@orderId, @ProductID, @colorName, @Productsize, @Quantity)

    COMMIT TRANSACTION

    PRINT 'Đặt hàng thành công.'
END
