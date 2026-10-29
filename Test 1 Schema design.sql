Drop database if exists Shopping_Management;
Create database Shopping_Management;
Use Shopping_Management;
Create table Customers(
     Customer_id int Unique auto_increment,
     Customer_name varchar(100) not null,
     Email varchar(100) primary key,
     Phone_number varchar(10) unique not null,
     Age tinyint unsigned check(age>0),
     Gender enum('Male','Female','Other'),
	 Country varchar(50) default'India',
     City varchar(50) not null,
     Pincode char(6) default'201301',
     Registration_Date date default(current_date),
     Registration_Time time default(current_time),
     Inserted_at timestamp default(current_timestamp),
     Address Varchar(250) Not null,
     Customer_status enum('Active','Inactive','Blocked')default'Active',
     Customer_notes tinytext);
Insert into Customers(Customer_name,Email,Phone_number,Age,Gender,City,Address,Customer_status,Customer_notes)
values
("Astha","ast@gmail.com","9087645342","23","Female","Meerut",'24 ring road','active','Good product');
Select *from customers;
     
Create table Orders(
    Order_id int unique auto_increment,
    Customer_id int, 
    Order_Date date default(current_date),
    Order_Amount decimal(10,2) not null,
    Order_status enum('Pending','Processing','Shipped','Delivered','Cancelled')default'Pending',
    Payment_Method enum('cash','card','upi','netbanking'),
    Payment_status enum('pending','paid','failed')default'Pending',
    Shipping_Address varchar(250) not null,
    Delivery_Pincode char(6),
    Quantity int unsigned not null check(quantity>0),
    Discount_Amount decimal(10,2) default'0',
    Delivery_Date date null,
    Created_at timestamp default(current_timestamp),
    Tracking_Number varchar(30) Primary key,
    Delivery_Status enum('Not dispatched','In transit','Delivered','Returned')default'Not dispatched',
    Order_notes tinytext,
    Foreign key(CUSTOMER_ID)references customers(customer_id)on delete cascade,
    foreign key(CUSTOMER_ID)references customers(customer_id)on update cascade
);
Insert into oders(Customer_id,Order_Amount,Order_status,Payment_Method,Payment_status,Shipping_Address,Delivery_Pincode,Quantity,Tracking_number,Order_notes)
Values
('1','25000','Pending','Cash','Pending','24 ring road','201301','2','234154','Good Product');

Select * from orders;
    

