use Project_Final_PRJ301
go

-- Tạo bảng Account
CREATE TABLE Account (
    id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL,
    password NVARCHAR(255) NOT NULL,
    fullName NVARCHAR(100),
    email NVARCHAR(100),
    phone NVARCHAR(15),
    gender NVARCHAR(10),
    birthday DATE,
	role INT DEFAULT 3
);

-- Thêm ràng buộc CHECK cho cột 'email' để đảm bảo định dạng email hợp lệ
ALTER TABLE Account
ADD CONSTRAINT CHK_Email_Format CHECK (email LIKE '%@%.%');

-- Thêm ràng buộc CHECK cho cột 'gender'
ALTER TABLE Account
ADD CONSTRAINT CHK_Gender CHECK (gender IN ('Male', 'Female', 'Other'));

-- Tạo bảng Address
CREATE TABLE Address (
    aid INT IDENTITY(1,1) PRIMARY KEY,
    country NVARCHAR(50),
    province NVARCHAR(50),
    district NVARCHAR(50),
    ward NVARCHAR(50),
    street NVARCHAR(100),
    houseNumber NVARCHAR(20),
    accountId INT,
    FOREIGN KEY (accountId) REFERENCES Account(id)
);

-- Chèn 10 dòng mới vào bảng Account
INSERT INTO Account (username, password, fullName, email, phone, gender, birthday, role) VALUES
('user1', 'password1', 'Full Name 1', 'user1@example.com', '1234567890', 'Male', '1990-01-01', 1),
('user2', 'password2', 'Full Name 2', 'user2@example.com', '1234567891', 'Female', '1991-02-01', 2),
('user3', 'password3', 'Full Name 3', 'user3@example.com', '1234567892', 'Male', '1992-03-01', 1),
('user4', 'password4', 'Full Name 4', 'user4@example.com', '1234567893', 'Female', '1993-04-01', 2),
('user5', 'password5', 'Full Name 5', 'user5@example.com', '1234567894', 'Male', '1994-05-01', 1),
('user6', 'password6', 'Full Name 6', 'user6@example.com', '1234567895', 'Female', '1995-06-01', 2),
('user7', 'password7', 'Full Name 7', 'user7@example.com', '1234567896', 'Male', '1996-07-01', 1),
('user8', 'password8', 'Full Name 8', 'user8@example.com', '1234567897', 'Female', '1997-08-01', 2),
('user9', 'password9', 'Full Name 9', 'user9@example.com', '1234567898', 'Male', '1998-09-01', 1),
('user10', 'password10', 'Full Name 10', 'user10@example.com', '1234567899', 'Female', '1999-10-01', 2);


-- Chèn 10 dòng mới vào bảng Address
INSERT INTO Address (country, province, district, ward, street, houseNumber, accountId) VALUES
('Country1', 'Province1', 'District1', 'Ward1', 'Street1', 'House1', 1),
('Country2', 'Province2', 'District2', 'Ward2', 'Street2', 'House2', 2),
('Country3', 'Province3', 'District3', 'Ward3', 'Street3', 'House3', 3),
('Country4', 'Province4', 'District4', 'Ward4', 'Street4', 'House4', 4),
('Country5', 'Province5', 'District5', 'Ward5', 'Street5', 'House5', 5),
('Country6', 'Province6', 'District6', 'Ward6', 'Street6', 'House6', 6),
('Country7', 'Province7', 'District7', 'Ward7', 'Street7', 'House7', 7),
('Country8', 'Province8', 'District8', 'Ward8', 'Street8', 'House8', 8),
('Country9', 'Province9', 'District9', 'Ward9', 'Street9', 'House9', 9),
('Country10', 'Province10', 'District10', 'Ward10', 'Street10', 'House10', 10);

-- Chèn thêm 10 dòng mới vào bảng Address
INSERT INTO Address (country, province, district, ward, street, houseNumber, accountId) VALUES
('CountryA', 'ProvinceA', 'DistrictA', 'WardA', 'StreetA', 'HouseA', 1),
('CountryB', 'ProvinceB', 'DistrictB', 'WardB', 'StreetB', 'HouseB', 1),
('CountryC', 'ProvinceC', 'DistrictC', 'WardC', 'StreetC', 'HouseC', 2),
('CountryD', 'ProvinceD', 'DistrictD', 'WardD', 'StreetD', 'HouseD', 2),
('CountryE', 'ProvinceE', 'DistrictE', 'WardE', 'StreetE', 'HouseE', 3),
('CountryF', 'ProvinceF', 'DistrictF', 'WardF', 'StreetF', 'HouseF', 3),
('CountryG', 'ProvinceG', 'DistrictG', 'WardG', 'StreetG', 'HouseG', 4),
('CountryH', 'ProvinceH', 'DistrictH', 'WardH', 'StreetH', 'HouseH', 5),
('CountryI', 'ProvinceI', 'DistrictI', 'WardI', 'StreetI', 'HouseI', 5),
('CountryJ', 'ProvinceJ', 'DistrictJ', 'WardJ', 'StreetJ', 'HouseJ', 6);

