Tutorial:
b1: http://localhost:8080/project-final-prj301/listsample //gọi đến ListSampleServlet
b2: ListSampleServlet chuyển hướng đến home.jsp 
b3: khi kích vào thanh sản phẩm thì sẽ gọi đến http://localhost:8080/project-final-prj301/list // gọi đến ListServlet
b4: khi kích vào bất kì category thì nó sẽ chuyển đến  http://localhost:8080/project-final-prj301/category?categoryID=C01 // gọi đến CategoryServlet đc truyền cùng param là categoryID



LƯU Ý: file data ecexl đã up trong database. chỉ add vào 3 sheet là sheet1(Product), sheet2(Category), sheet 3(Status). 

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
