CREATE DATABASE pos;

USE pos;

CREATE TABLE employee (
       emp_seq              int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       emp_id				int NOT NULL UNIQUE,
       emp_name             varchar(255) NOT NULL,
       emp_mobile           varchar(10) NOT NULL,
       emp_email            varchar(255) NOT NULL,
       emp_position_seq     int NOT NULL,
       emp_memo             text NULL,
       emp_password         varchar(255) NOT NULL
);

CREATE TABLE employee_planed_shift (
       emp_planed_shift_seq int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       emp_planed_shift_start_time datetime NULL,
       emp_planed_shift_end_time datetime NULL,
       emp_seq              int NULL
);

CREATE TABLE employee_position (
       emp_position_seq     int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       emp_position         varchar(20) NOT NULL
);

CREATE TABLE employee_shift (
       emp_shift_seq        int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       emp_seq              int NULL,
       emp_start_time       datetime NULL,
       emp_end_time         datetime NULL
);


CREATE TABLE employee_wage_history (
       emp_wage_history_seq int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       emp_wage             int NOT NULL,
       emp_wage_changed_date datetime NOT NULL,
       emp_seq              int NOT NULL
);


CREATE TABLE ingredient (
       ing_seq              int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       ing_name             varchar(255) NULL,
       ing_stock            int NULL,
       unit_seq             int NULL,
       sup_seq              int NOT NULL
);


CREATE TABLE ingredient_order (
       ing_order_seq        int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       ing_seq              int NOT NULL,
       ing_amount           int NOT NULL,
       unit_seq             int NOT NULL,
       ing_order_date       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
       emp_seq              int NOT NULL
);


CREATE TABLE menu (
       menu_seq             int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menu_name            varchar(255) NOT NULL,
       menu_description     text NULL,
       menu_recipe          text NULL,
       menu_type_seq        int NOT NULL
);


CREATE TABLE menu_ingredients (
       menu_seq             int NOT NULL,
       ing_seq              int NOT NULL,
       menu_ing_amount      int NOT NULL,
       unit_seq             int NOT NULL
);

CREATE TABLE menu_size (
		menu_size_seq			 int NOT NULL AUTO_INCREMENT PRIMARY KEY,
		menu_size				 varchar(10) NOT NULL
);

CREATE TABLE menu_price (
       menu_price_seq       int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menu_seq             int NOT NULL,
       menu_price           FLOAT NOT NULL,
       menu_size_seq            int NOT NULL,
       menu_price_group_seq int NOT NULL
);


CREATE TABLE menu_price_group (
       menu_price_group_seq int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menu_price_group_name varchar(50) NULL
);


CREATE TABLE menu_type (
       menu_type_seq        int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menu_type            varchar(30) NOT NULL
);


CREATE TABLE payment_type (
       payment_type_seq     int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       payment_type         CHAR(18) NULL
);



CREATE TABLE supplier (
       sup_seq              int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       sup_name             varchar(255) NOT NULL,
       sup_contact_number   varchar(10) NULL,
       sup_website          varchar(255) NULL,
       sup_email            varchar(255) NULL,
       sup_memo             text NULL
);

CREATE TABLE supplier_type (
       sup_type_seq         int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       sup_type             varchar(50) NULL
);


CREATE TABLE supplier_type_tag (
       sup_seq              int NOT NULL,
       sup_type_seq         int NOT NULL
);


CREATE TABLE `table` (
       table_seq            int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       table_hold_customer_amount int NOT NULL DEFAULT 0,
       table_name           varchar(50) UNIQUE NOT NULL
);


CREATE TABLE table_current_order (
       order_seq            int NOT NULL AUTO_INCREMENT PRIMARY KEY,
		 order_quantity		 int NOT NULL DEFAULT 1,
       menu_seq             int NOT NULL,
       order_date           datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
       emp_seq              int NOT NULL,
       table_seq            int NULL
);


CREATE TABLE table_order_payment_history (
       table_order_payment_history_se int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       payment_type_seq     int NULL,
       table_order_payment  FLOAT NOT NULL,
       table_seq            int NULL,
       emp_seq              int NULL,
       menu_seq             int NOT NULL,
       order_seq            int NULL,
       table_order_payment_date datetime NULL
);


CREATE TABLE unit (
       unit_seq             int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       unit                 varchar(20) NULL
);


CREATE TABLE wage_payment (
       pay_seq              int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       pay_amount           FLOAT NULL,
       pay_date             datetime NULL,
       emp_seq              int NULL
);


ALTER TABLE employee
       ADD  FOREIGN KEY (emp_position_seq)
                             REFERENCES employee_position(emp_position_seq) 
										  ON UPDATE CASCADE	
										  ON DELETE RESTRICT;


ALTER TABLE employee_planed_shift
       ADD  FOREIGN KEY (emp_seq)
                             REFERENCES employee(emp_seq) ;


ALTER TABLE employee_shift
       ADD  FOREIGN KEY (emp_seq)
                             REFERENCES employee(emp_seq) ;


ALTER TABLE employee_wage_history
       ADD  FOREIGN KEY (emp_seq)
                             REFERENCES employee(emp_seq) ;


ALTER TABLE ingredient
       ADD  FOREIGN KEY (sup_seq)
                             REFERENCES supplier(sup_seq) ;


ALTER TABLE ingredient
       ADD  FOREIGN KEY (unit_seq)
                             REFERENCES unit(unit_seq) ;


ALTER TABLE ingredient_order
       ADD  FOREIGN KEY (emp_seq)
                             REFERENCES employee(emp_seq) ;


ALTER TABLE ingredient_order
       ADD  FOREIGN KEY (unit_seq)
                             REFERENCES unit(unit_seq) ;


ALTER TABLE ingredient_order
       ADD  FOREIGN KEY (ing_seq)
                             REFERENCES ingredient(ing_seq) ;


ALTER TABLE menu
       ADD  FOREIGN KEY (menu_type_seq)
                             REFERENCES menu_type(menu_type_seq) ;


ALTER TABLE menu_ingredients
       ADD  FOREIGN KEY (unit_seq)
                             REFERENCES unit(unit_seq) ;


ALTER TABLE menu_ingredients
       ADD  FOREIGN KEY (ing_seq)
                             REFERENCES ingredient(ing_seq) ;


ALTER TABLE menu_ingredients
       ADD  FOREIGN KEY (menu_seq)
                             REFERENCES menu(menu_seq);


ALTER TABLE menu_price
       ADD  FOREIGN KEY (menu_size_seq)
                             REFERENCES menu_size(menu_size_seq);

ALTER TABLE menu_price
       ADD  FOREIGN KEY (menu_price_group_seq)
                             REFERENCES menu_price_group(menu_price_group_seq) ;


ALTER TABLE menu_price
       ADD  FOREIGN KEY (menu_seq)
                             REFERENCES menu(menu_seq)
									  		ON UPDATE CASCADE
											ON DELETE CASCADE ;


ALTER TABLE supplier_type_tag
       ADD  FOREIGN KEY (sup_type_seq)
                             REFERENCES supplier_type(sup_type_seq)
									  		ON UPDATE CASCADE
											ON DELETE CASCADE ;


ALTER TABLE supplier_type_tag
       ADD  FOREIGN KEY (sup_seq)
                             REFERENCES supplier(sup_seq)
									  		ON UPDATE CASCADE ;


ALTER TABLE table_current_order
       ADD  FOREIGN KEY (table_seq)
                             REFERENCES `table`(table_seq) ;


ALTER TABLE table_current_order
       ADD  FOREIGN KEY (menu_seq)
                             REFERENCES menu(menu_seq) ;


ALTER TABLE table_current_order
       ADD  FOREIGN KEY (emp_seq)
                             REFERENCES employee(emp_seq) ;


ALTER TABLE table_order_payment_history
       ADD  FOREIGN KEY (menu_seq)
                             REFERENCES menu(menu_seq) ;


ALTER TABLE table_order_payment_history
       ADD  FOREIGN KEY (order_seq)
                             REFERENCES table_current_order(order_seq) ;


ALTER TABLE table_order_payment_history
       ADD  FOREIGN KEY (emp_seq)
                             REFERENCES employee(emp_seq) ;


ALTER TABLE table_order_payment_history
       ADD  FOREIGN KEY (table_seq)
                             REFERENCES `table`(table_seq) ;


ALTER TABLE table_order_payment_history
       ADD  FOREIGN KEY (payment_type_seq)
                             REFERENCES payment_type(payment_type_seq) ;


ALTER TABLE wage_payment
       ADD  FOREIGN KEY (emp_seq)
                             REFERENCES employee(emp_seq) ;
                             
/*************************************************************************************************************
	Views
*************************************************************************************************************/

# Supplier view
CREATE OR REPLACE VIEW v_supplier AS
 SELECT s.sup_seq, s.sup_name,
 		  s.sup_contact_number, 
		  s.sup_website,
		  s.sup_email, 
		  s.sup_memo,
		  st.sup_type,
		  st.sup_type_seq
 	FROM supplier s
		INNER JOIN supplier_type_tag stt
			ON s.sup_seq = stt.sup_seq
		INNER JOIN supplier_type st
			ON stt.sup_type_seq = st.sup_type_seq
	ORDER BY s.sup_name, sup_seq;
	
# Menu view
CREATE OR REPLACE VIEW v_menu AS
	SELECT m.menu_seq,
			 m.menu_name,
			 m.menu_description,
			 m.menu_recipe,			 
			 m.menu_type_seq,
			 mt.menu_type,
			 mp.menu_price_seq,
			 mp.menu_price,
			 mp.menu_size_seq,
			 ms.menu_size,
			 mp.menu_price_group_seq,
			 mpg.menu_price_group_name
		FROM `menu` m
			LEFT JOIN menu_type mt
				ON m.menu_type_seq = mt.menu_type_seq
			LEFT JOIN menu_price mp
				ON m.menu_seq = mp.menu_seq
			LEFT JOIN menu_size ms
				ON mp.menu_size_seq = ms.menu_size_seq
			LEFT JOIN menu_price_group mpg
				ON mp.menu_price_group_seq = mpg.menu_price_group_seq
		ORDER BY m.menu_name, m.menu_seq, mp.menu_price;
		
# Order view (TODO : employee, menu 테이블 조인되야 함)
CREATE OR REPLACE VIEW v_order AS
	SELECT t.table_seq,
			 t.table_hold_customer_amount,
			 t.table_name,
			 tco.order_seq,
			 tco.menu_seq,
			 tco.order_date,
			 tco.emp_seq
		FROM `table` t
			LEFT JOIN table_current_order tco
				ON t.table_seq = tco.table_seq
			ORDER BY cast(t.table_name as unsigned), t.table_seq;

			

/*************************************************************************************************************
	Initialize default values
*************************************************************************************************************/
# Employee_Position
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (99, "Standby");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (1, "CEO");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (2, "Manager");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (3, "All rounder");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (4, "Chef");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (5, "Kitchen hand");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (6, "Juice maker");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (7, "Casher");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (8, "Waiter");
INSERT INTO employee_position (emp_position_seq, emp_position) VALUES (9, "Waitress");

# Employee
INSERT INTO employee (emp_seq, emp_id, emp_name, emp_mobile, emp_email, emp_position_seq, emp_memo, emp_password) VALUES(1, 1111, 'test1', '0431122', 'test1@gmail.com', 1, 'lazy', '1111');
INSERT INTO employee (emp_seq, emp_id, emp_name, emp_mobile, emp_email, emp_position_seq, emp_memo, emp_password) VALUES(2, 2222, 'test2', '0432233', 'test2@gmail.com', 2, 'good man', '2222');
INSERT INTO employee (emp_seq, emp_id, emp_name, emp_mobile, emp_email, emp_position_seq, emp_memo, emp_password) VALUES(3, 3333, 'test3', '0433344', 'test3@gmail.com', 3, NULL, '3333');
INSERT INTO employee (emp_seq, emp_id, emp_name, emp_mobile, emp_email, emp_position_seq, emp_memo, emp_password) VALUES(4, 4444, 'test4', '0434455', 'test4@gmail.com', 4, 'sleepyhead', '4444');
INSERT INTO employee (emp_seq, emp_id, emp_name, emp_mobile, emp_email, emp_position_seq, emp_memo, emp_password) VALUES(5, 5555, 'test5', '0435566', 'test5@gmail.com', 5, 'slow', '5555');
INSERT INTO employee (emp_seq, emp_id, emp_name, emp_mobile, emp_email, emp_position_seq, emp_memo, emp_password) VALUES(6, 6666, 'test6', '0436677', 'test6@gmail.com', 99, 'fast learner', '6666');



# Supplier_Type
INSERT INTO supplier_type (sup_type_seq, sup_type) VALUES (1, 'Drink');
INSERT INTO supplier_type (sup_type_seq, sup_type) VALUES (2, 'Bakery');
INSERT INTO supplier_type (sup_type_seq, sup_type) VALUES (3, 'Equipment');

# Supplier
INSERT INTO supplier (sup_seq, sup_name, sup_contact_number, sup_website, sup_email, sup_memo) VALUES (1, 'Milk Man', '0212341234', 'http://wwww.milkman.com', 'milkm@gmail.com', 'Milk man is a good guy');
INSERT INTO supplier (sup_seq, sup_name, sup_contact_number, sup_website, sup_email, sup_memo) VALUES (2, 'Bread Man', '0243214321', NULL , NULL , NULL);
INSERT INTO supplier (sup_seq, sup_name, sup_contact_number, sup_website, sup_email, sup_memo) VALUES (3, 'Metro', '0299998888', NULL , NULL , NULL);

INSERT INTO supplier_type_tag (sup_seq, sup_type_seq) VALUES (1, 1);
INSERT INTO supplier_type_tag (sup_seq, sup_type_seq) VALUES (2, 2);
INSERT INTO supplier_type_tag (sup_seq, sup_type_seq) VALUES (3, 1);
INSERT INTO supplier_type_tag (sup_seq, sup_type_seq) VALUES (3, 2);

#Unit
INSERT INTO unit (unit_seq, unit) VALUES (1, 'kg');
INSERT INTO unit (unit_seq, unit) VALUES (2, 'g');
INSERT INTO unit (unit_seq, unit) VALUES (3, 'L');
INSERT INTO unit (unit_seq, unit) VALUES (4, 'ml');
INSERT INTO unit (unit_seq, unit) VALUES (5, 'box(s)');
INSERT INTO unit (unit_seq, unit) VALUES (6, 'bunch(es)');
INSERT INTO unit (unit_seq, unit) VALUES (7, 'dozen(s)');
INSERT INTO unit (unit_seq, unit) VALUES (8, 'spoon(s)');
INSERT INTO unit (unit_seq, unit) VALUES (9, 't-spoon(s)');
INSERT INTO unit (unit_seq, unit) VALUES (10, 'pack(s)');

# Menu_Type
INSERT INTO menu_type (menu_type_seq, menu_type) VALUES (1, 'Beverage');
INSERT INTO menu_type (menu_type_seq, menu_type) VALUES (2, 'Coffee');
INSERT INTO menu_type (menu_type_seq, menu_type) VALUES (3, 'Breakfast');
INSERT INTO menu_type (menu_type_seq, menu_type) VALUES (4, 'Burger');
INSERT INTO menu_type (menu_type_seq, menu_type) VALUES (5, 'Sandwich');
INSERT INTO menu_type (menu_type_seq, menu_type) VALUES (6, 'Salad');
INSERT INTO menu_type (menu_type_seq, menu_type) VALUES (7, 'ETC');

# Menu
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (1, 'Latte', 'with milk', NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (2, 'Flat White', 'without froth', NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (3, 'Engish Breakfast', NULL, NULL, 3);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (4, 'Beef burger', NULL, NULL, 4);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (5, 'Green wish', NULL, NULL, 3);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (6, 'Coca Cola', NULL, NULL, 1);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (7, 'Chicken salad', NULL, NULL, 6);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (8, 'Chicken sandwich', NULL, NULL, 5);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (9, 'Ice', NULL, NULL, 7);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (10, 'Doppio', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (11, 'Espresso', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (12, 'Cappuccino', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (13, 'Machiato', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (14, 'Vienna', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (15, 'Moka', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (16, 'Long black', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (17, 'White coffee', NULL, NULL, 2);
INSERT INTO `menu` (menu_seq, menu_name, menu_description, menu_recipe, menu_type_seq) VALUES (18, 'Caramel machiato', NULL, NULL, 2);


# Menu_Price_Group
INSERT INTO menu_price_group (menu_price_group_seq, menu_price_group_name) VALUES (1, 'Normal');
INSERT INTO menu_price_group (menu_price_group_seq, menu_price_group_name) VALUES (2, 'Weekends');
INSERT INTO menu_price_group (menu_price_group_seq, menu_price_group_name) VALUES (3, 'Public holiday');

# Menu_Size
INSERT INTO menu_size (menu_size_seq, menu_size) VALUES (1, 'Normal');
INSERT INTO menu_size (menu_size_seq, menu_size) VALUES (2, 'Kid');
INSERT INTO menu_size (menu_size_seq, menu_size) VALUES (3, 'Extra');
INSERT INTO menu_size (menu_size_seq, menu_size) VALUES (4, 'Small');
INSERT INTO menu_size (menu_size_seq, menu_size) VALUES (5, 'Regular');
INSERT INTO menu_size (menu_size_seq, menu_size) VALUES (6, 'Large');
INSERT INTO menu_size (menu_size_seq, menu_size) VALUES (7, 'Venti');

# Menu_Price
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (1, 1, 3.5, 4, 1); # Latte, $3.5, Small size, Normal day
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (2, 1, 4.5, 5, 1); # Latte, $4.5, Regular size, Normal day
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (3, 1, 5.5, 6, 1); # Latte, $5.5, Large size, Normal day

INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (4, 1, 4.5, 4, 3); # Latte, $4.5, Small size, Public holidday
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (5, 1, 5.5, 5, 3); # Latte, $5.5, Regular size, Public holidday
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (6, 1, 6.5, 6, 3); # Latte, $6.5, Large size, Public holidday

INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (7, 2, 3.5, 4, 1); # Flat white, $3.5, Small size, Normal day
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (8, 2, 4.5, 5, 1); # Flat white, $4.5, Regular size, Normal day
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (9, 2, 5.5, 6, 1); # Flat white, $5.5, Large size, Normal day

INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (10, 3, 11.0, 1, 1); # Engish Breakfast, $11.0, Normal size, Normal day
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (11, 3, 12.5, 1, 3); # English Breakfast, $12.5, Normal size, Public holiday

INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (12, 4, 13.5, 1, 1); # Beef Burger, $13.5, Normal size, Normal day
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (13, 4, 15.5, 1, 3); # Beef Burger, $15.5, Normal size, Public holiday

INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (14, 5, 8.5, 1, 1); # Greenwish, $8.5, Normal size, Normal day
INSERT INTO menu_price (menu_price_seq, menu_seq, menu_price, menu_size_seq, menu_price_group_seq) VALUES (15, 5, 9.5, 1, 3); # Greenwish, $9.5, Normal size, Public holiday



# Table
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (1, 0, "1");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (2, 0, "2");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (3, 0, "3");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (4, 0, "4");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (5, 0, "5");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (6, 0, "6");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (7, 0, "7");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (8, 0, "8");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (9, 0, "9");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (10, 0, "10");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (11, 0, "11");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (12, 0, "12");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (13, 0, "13");
INSERT INTO `table` (table_seq, table_hold_customer_amount, table_name) VALUES (14, 0, "14");



SELECT * FROM unit;
SELECT * FROM supplier;
SELECT * FROM ingredient;

SELECT * FROM menu_type;
SELECT * FROM menu;

SELECT * FROM menu_price_group;
SELECT * FROM menu_price;

SELECT * FROM menu_ingredients;

SELECT * FROM v_menu;

SELECT * FROM v_table;
