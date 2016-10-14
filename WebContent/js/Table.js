function Table() {
	var table_seq;
	var table_hold_customer_amount;
	var table_name;
	
	this.getTable_seq = function() { return this.table_seq; };
	this.getTable_hold_customer_amount = function() { return this.table_hold_customer_amount; };
	this.getTable_name = function() { return this.table_name; };
	
	this.setTable_seq = function(value) { this.table_seq = value; };
	this.setTable_hold_customer_amount = function(value) { this.table_hold_customer_amount = value; };
	this.setTable_name = function(value) { this.table_name = value; };
}
