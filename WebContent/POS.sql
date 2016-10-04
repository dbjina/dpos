CREATE DATABASE pos;

USE pos;

CREATE TABLE employee (
       emp_seq              int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       emp_id					 int NOT NULL UNIQUE,
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
       ing_order_date       datetime NOT NULL,
       emp_seq              int NOT NULL
);


CREATE TABLE menu (
       menu_seq             int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menu_name            varchar(255) NOT NULL,
       menu_description     varchar(2000) NULL,
       menu_price_seq       int NOT NULL,
       menu_recipe          text NULL,
       menu_type_seq        int NULL
);


CREATE TABLE menu_ingredients (
       menu_seq             int NOT NULL,
       ing_seq              int NOT NULL,
       menu_ing_amount      int NOT NULL,
       unit_seq             int NOT NULL
);


CREATE TABLE menu_price (
       menu_price_seq       int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menu_seq             int NOT NULL,
       menu_price           FLOAT NOT NULL,
       menu_size            varchar(10) NULL,
       menu_price_group_seq int NULL
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
       sup_name             varchar(255) NULL,
       sup_contact_number   varchar(10) NULL,
       sup_website          varchar(255) NULL,
       sup_email            varchar(255) NULL,
       sup_memo             text NULL
);

CREATE TABLE supplier_type (
       sup_type_seq         int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       sup_type             CHAR(18) NULL
);


CREATE TABLE supplier_type_tag (
       sup_seq              int NOT NULL,
       sup_type_seq         int NOT NULL
);


CREATE TABLE `table` (
       table_seq            int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       table_hold_customer_amount int NULL,
       table_name           varchar(50) NULL
);


CREATE TABLE table_current_order (
       order_seq            int NOT NULL AUTO_INCREMENT PRIMARY KEY,
       menu_seq             int NOT NULL,
       order_date           datetime NOT NULL,
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
                             REFERENCES menu(menu_seq) ;


ALTER TABLE menu_price
       ADD  FOREIGN KEY (menu_price_group_seq)
                             REFERENCES menu_price_group(menu_price_group_seq) ;


ALTER TABLE menu_price
       ADD  FOREIGN KEY (menu_seq)
                             REFERENCES menu(menu_seq) ;


ALTER TABLE supplier_type_tag
       ADD  FOREIGN KEY (sup_type_seq)
                             REFERENCES supplier_type(sup_type_seq) ;


ALTER TABLE supplier_type_tag
       ADD  FOREIGN KEY (sup_seq)
                             REFERENCES supplier(sup_seq) ;


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
                             
/* Initialize default values */
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