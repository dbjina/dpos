function Menu() {
	var menu_seq;
	var menu_name;
	var menu_description;
	var menu_recipe;
	var menu_type_seq;
	var menu_type;
	var menu_price_seq;
	var menu_price;
	var menu_size_seq;
	var menu_size;
	var menu_price_group_seq;
	var menu_price_group_name;
	
	this.getMenu_seq = function() { return this.menu_seq; };
    this.getMenu_name = function() { return this.menu_name; };
    this.getMenu_description = function() { return this.menu_description; };
    this.getMenu_recipe = function() { return this.menu_recipe; };
    this.getMenu_type_seq = function() { return this.menu_type_seq; };
    this.getMenu_type = function() { return this.menu_type; };
    this.getMenu_price_seq = function() { return this.menu_price_seq; };
    this.getMenu_price = function() { return this.menu_price; };
    this.getMenu_size_seq = function() { return this.menu_size_seq; };
    this.getMenu_size = function() { return this.menu_size; };
    this.getMenu_price_group_seq = function() { return this.menu_price_group_seq; };
    this.getMenu_price_group_name = function() { return this.menu_price_group_name; };
    
    this.setMenu_seq = function(value) { this.menu_seq = value; };
    this.setMenu_name = function(value) { this.menu_name = value; };
    this.setMenu_description = function(value) { this.menu_description = value; };
    this.setMenu_recipe = function(value) { this.menu_recipe = value; };
    this.setMenu_type_seq = function(value) { this.menu_type_seq = value; };
    this.setMenu_type = function(value) { this.menu_type = value; };
    this.setMenu_price_seq = function(value) { this.menu_price_seq = value; };
    this.setMenu_price = function(value) { this.menu_price = value; };
    this.setMenu_size_seq = function(value) { this.menu_size_seq = value; };
    this.setMenu_size = function(value) { this.menu_size = value; };
    this.setMenu_price_group_seq = function(value) { this.menu_price_group_seq = value; };
    this.setMenu_price_group_name = function(value) { this.menu_price_group_name = value; };
}

function OrderMenu() {
	
	var menu_order_seq;
	var menu_order_quantity;
	var menu;
	
	this.getMenu_order_seq = function() { return this.menu_order_seq; };
	this.getMenu_order_quantity = function() { return this.menu_order_quantity; };
	this.getMenu = function() { return this.menu; };
	
    this.setMenu_order_seq = function(value) { this.menu_order_seq = value; };
    this.setMenu_order_quantity = function(value) {
    	if(value < 0) {
    		value = 0;
    	}
    	this.menu_order_quantity = value;
    };
    this.setMenu = function(value) { this.menu = value; };
}

OrderMenu.prototype = new Menu();
OrderMenu.prototype.constructor = OrderMenu;

OrderMenu.prototype.sum = function() {
	return this.getMenu_order_quantity() * this.getMenu().getMenu_price();
}
