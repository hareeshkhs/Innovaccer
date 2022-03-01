/*  Users Table */
create table users (
	user_id SERIAL PRIMARY KEY,
	user_Email varchar(100) NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	telephone bigint NOT NULL,
	created_at DATE NOT NULL,
	Role_type boolean,
	postal_code int NOT NULL,
	Address varchar(500) NOT NULL,
	record_id INT references userpayment(record_id)
)
/* User payment Details Table */
create table userpayment(
	record_id SERIAL PRIMARY KEY,
	payment_type varchar(50) NOT NULL,
	Account_No bigint NOT NULL,
	CARD_NO bigint NOT NULL,
	Expiry_Month int NOT NULL,
	Expiry_Year int NOT NULL,
	UPI_Id VARCHAR(100) NOT NULL,
	provider VARCHAR(100) NOT NULL
)
/* Product Table */
create table products (
	p_id serial Primary key,
	p_name varchar(100) NOT NULL,
	p_price bigint NOT NULL,
	cat_id int references category(cat_id),
	p_stock bigint NOT NULL,
	p_live boolean,
	p_modifiedat TIMESTAMP NOT NULL DEFAULT NOW()
)
/* Category Table */
create table category (
	cat_id serial primary key,
	cat_name varchar(100) NOT NULL,
	description varchar(500) NOT NULL,
	modified_at TIMESTAMP NOT NULL DEFAULT NOW()
)
/* Order Table */
create table orders (
	order_id SERIAL PRIMARY KEY,
	user_id int references users(user_id),
	orderdetails_id INT,
	order_Amount bigint NOT NULL,
	order_shipname varchar(100) NOT NULL,
	order_date TIMESTAMP NOT NULL DEFAULT NOW(),
	order_Trackingid bigint NOT NULL,
	payment_id INT references paymentdetails(payment_id)
)
/* Orders payment details */
create table paymentdetails (
	payment_id SERIAL PRIMARY KEY,
	payment_type VARCHAR(100) NOT NULL,
	payment_status VARCHAR(50) NOT NULL,
	payment_at TIMESTAMP NOT NULL DEFAULT NOW()
)
/* Order details Table */
create table orderdetails (
	orderdetails_id SERIAL PRIMARY KEY,
	order_id int,
	p_id int references products(p_id)
)
/* Inserting data into all tables */
insert into users(user_Email,first_name,last_name,telephone,created_at,Role_type,postal_code,Address,record_id)values
('Ramkrishna@gmail.com','ram','kirshna','9030643474','2022-03-01','true',532127,'1-11,main road,tekkalivalasa,VZM,AP',1),
('Kishorekumar123@gmail.com','Kishore','Kumar','9033475843','2022-03-02','true',532427,'1-23,naditha complex,Yusaf guda,Hydarabad,Telagana',2),
('saahilqurishi@email.com','Saahil','Qurishi','9023643474','2022-03-03','true',123227,'1106-1108, Akash Deep Building, Barakhamba Road, Connaught Place,Delhi',3),
('Harishkumarkhs@gmail.com','Hareesh','Kumar','8178643474','2022-03-04','true',103027,'Jun-40, Lakshmi Amman Koil Street, Perambur,Tamilnadu',4),
('Rithvikrocky234@email.com','Rithvik','Badri','7485878474','2022-03-05','true',498556,'F9,40, 4th Floor,lakshmi Complex, K R Road,Bangalore,Karnataka',5),
('Balajienamala143@gmail.com','Balaji','Enamala','8378538884','2022-03-06','true',354656,'220-a, Veena Dalwai Indl Estate, S V Road, Jogeshwari (west),Mumbai,Maharastra',6);

insert into userpayment(payment_type,Account_No,CARD_NO,Expiry_Month,Expiry_Year,UPI_Id,provider)values('UPI',4563748345,456387657829,09,2025,'ramkirshna@ybl','Phone pay');
insert into userpayment(payment_type,Account_No,CARD_NO,Expiry_Month,Expiry_Year,UPI_Id,provider)values('UPI',4748579232,437584397490,05,2025,'kishore-kumar@ipl','Paytm'),
('CARD',4837498374,823746747844,11,2026,'saahil.qurishi@apl','Paytm'),
('CARD',4748534232,437584237490,12,2027,'Hareesh-kumar@ybl','Amazon Pay'),
('CARD',4748579293,272584394320,02,2025,'badririthvik@gpay','Google Pay'),
('UPI',4485791029,392584397356,01,2026,'balajienamala@ipl','Mobikwik');
select * from userpayment;

insert into products(p_name,p_price,cat_id,p_stock,p_live)values
('Boat Ear phones',1999,1,10,'true'),
('Dining Table',24999,2,102,'true'),
('Bed',45000,2,39,'true'),
('Lg Smart Tv',125999,1,0,'false'),
('Apple MacBook Air',220599,1,200,'true'),
('Killer Blazzer',4999,3,233,'true'),
('Wrong Shirt',1499,3,374,'true'),
('Butterfly Oven',23949,4,32,'true');

select * from category;
insert into category(cat_name,description) values ('Electronics','All Electrlonics');
insert into category(cat_name,description) values ('Furniture','Quality Wood Furniture');
insert into category(cat_name,description) values ('Clothing','All types of perfect cloths');
insert into category(cat_name,description) values ('Kitchen','All types of Cooking related items');

/* Alter the constraints for orders table */
Alter table orders
add column order_qty INT;
ALTER TABLE orders
ADD CONSTRAINT fk_orders
FOREIGN KEY (orderdetails_id) 
REFERENCES orderdetails (orderdetails_id);
insert into orders(user_id,orderdetails_id,order_Amount,order_shipname,order_Trackingid,payment_id)values
(1,1,24999,'Delhivary',23452783,1);
insert into orders(user_id,orderdetails_id,order_Amount,order_shipname,order_Trackingid,payment_id)values
(4,2,1499,'DTDC',23452723,2);
insert into orders(user_id,orderdetails_id,order_Amount,order_shipname,order_Trackingid,payment_id)values
(5,3,220599,'Ekart',23452734,3);

insert into paymentdetails(payment_type,payment_status)values
('UPI','success'),
('CARD','success'),
('UPI','success');
insert into orderdetails(order_id,p_id)values(1,2);
insert into orderdetails(order_id,p_id)values(2,7),(3,5);
select * from orders;
select * from orderdetails;
select * from products;
/* Creating trigger for product quantity while a order placed by new orders */
create or replace function fn_stock_change_log()
returns trigger
language PLPGSQL
as
$$
	BEGIN
		update products set p_stock = p_stock - new.order_qty where p_id=new.p_id;
        return new;
    END;
$$

create trigger trigger_products_qty_changes
	after insert
	on orders
	for each row
		execute procedure fn_stock_change_log()
/* Table for storing changes made by deleting a record in orders table */
create table changes_log(
	changes_id SERIAL PRIMARY KEY,
	order_id INT NOT NULL,
	user_id INT NOT NULL,
	order_amount BIGINT NOT NULL,
	updated_at TIMESTAMP NOT NULL DEFAULT NOW()
)

/* Creating trigger for delete of a record in orders */
Create or replace function delete_of_record_trigger()
RETURNS TRIGGER
LANGUAGE PLPGSQL
as 
$$
	BEGIN 
		insert into changes(order_id,user_id,order_amount)values(OLD.order_id,OLD.user_id,OLD.order_amount);
		RETURN OLD;
	END;
$$

CREATE TRIGGER delete_trigger
	BEFORE DELETE
	ON orders
	FOR EACH ROW
		EXECUTE PROCEDURE delete_of_record_trigger();


