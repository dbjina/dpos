package com.dbjina.pos.define;

public class DBTableDefine {

	
	// Query
		public static final String INSERT_TEMPLATE = "INSERT INTO %1$s (%2$s) VALUES (%3$s)";
		public static final String SELECT_TEMPLATE = "SELECT %1$s FROM %2$s WHERE 1=1";
		public static final String UPDATE_TEMPLATE = "UPDATE %1$s SET %2$s WHERE %3$s = ?";
		public static final String DELETE_TEMPLATE = "DELETE FROM %1$s WHERE %2$s = %3$s";
		public static final String WHERE_AND_TEMPLATE = "%1$s AND %2$s = %3$s";	// 1번에는 QUERY_TEMPLATE 들어가야함
		public static final String WHERE_OR_TEMPLATE = "%1$s OR %2$s = %3$s";	// 1번에는 QUERY_TEMPLATE 들어가야함
	
	/**********************************************************************
	 * employee table
	 ***********************************************************************/
	// Table names
	public static final String EMPLOYEE_TABLE = "employee";
	
	// Column names
	public static final String EMP_SEQ_COLUMN = "emp_seq";
	public static final String EMP_ID_COLUMN = "emp_id";
	public static final String EMP_NAME_COLUMN = "emp_name";
	public static final String EMP_MOBILE_COLUMN = "emp_mobile";
	public static final String EMP_EMAIL_COLUMN = "emp_email";
	public static final String EMP_POSITION_SEQ_COLUMN = "emp_position_seq";
	public static final String EMP_MEMO_COLUMN = "emp_memo";
	public static final String EMP_PASSWORD_COLUMN = "emp_password";
	
	// Group of columns
	public static final String ADD_EMPLOYEE_COLUMNS = EMP_ID_COLUMN + ", " + EMP_NAME_COLUMN + ", " + EMP_MOBILE_COLUMN + ", " + EMP_EMAIL_COLUMN + ", " + EMP_POSITION_SEQ_COLUMN + ", " + EMP_MEMO_COLUMN + ", " + EMP_PASSWORD_COLUMN;
	public static final String ALL_EMPLOYEE_COLUMNS = EMP_SEQ_COLUMN + ", " + EMP_ID_COLUMN + ", " + EMP_NAME_COLUMN + ", " + EMP_MOBILE_COLUMN + ", " + EMP_EMAIL_COLUMN + ", " + EMP_POSITION_SEQ_COLUMN + ", " + EMP_MEMO_COLUMN + ", " + EMP_PASSWORD_COLUMN;
	public static final String ID_PASSWORD_EMPLOYEE_COLUMNS = EMP_ID_COLUMN + ", " + EMP_PASSWORD_COLUMN;
	
	// Columns names in employee_position table
	/*public static final String EMP_POSITION_SEQ = "emp_position_seq";
	public static final String EMP_POSITION = "emp_position";*/
	
	
	/**********************************************************************
	 * employee_position table
	 ***********************************************************************/
	// Table names
	public static final String EMPLOYEE_POSITION_TABLE = "employee_position";
	
	// Columns names
	// public static final String EMP_POSITION_SEQ_COLUMN = "emp_position_seq";  Already exitst in employee_table
	public static final String EMP_POSITION_COLUMN = "emp_position";
	
	// Group of columns
	public static final String ALL_EMPLOYEE_POSITION_COLUMNS = EMP_POSITION_SEQ_COLUMN + ", " + EMP_POSITION_COLUMN;
	
	/**********************************************************************
	 * supplier table
	 ***********************************************************************/
	// Table names
	public static final String SUPPLIER_TABLE = "supplier";
	
	// Columns names
	public static final String SUP_SEQ_COLUMN = "sup_seq";
	public static final String SUP_NAME_COLUMN = "sup_name";
	public static final String SUP_CONTACT_NUMBER_COLUMN = "sup_contact_number";
	public static final String SUP_WEBSITE_COLUMN = "sup_website";
	public static final String SUP_EMAIL_COLUMN = "sup_email";
	public static final String SUP_MEMO_COLUMN = "sup_memo";
	
	// Group of columns
	public static final String ALL_SUPPLIER_COLUMNS = SUP_SEQ_COLUMN + ", " + SUP_NAME_COLUMN + ", " + SUP_CONTACT_NUMBER_COLUMN + ", " + SUP_WEBSITE_COLUMN + ", " + SUP_EMAIL_COLUMN + ", " + SUP_MEMO_COLUMN;
	
	/**********************************************************************
	 * supplier_type table
	 ***********************************************************************/
	// Table names
	public static final String SUPPLIER_TYPE_TABLE = "supplier_type";
	
	// Columns names
	public static final String SUP_TYPE_SEQ_COLUMN = "sup_type_seq";
	public static final String SUP_TYPE_COLUMN = "sup_type";
	
	// Group of columns
	public static final String ALL_SUPPLIER_TYPE_COLUMNS = SUP_TYPE_SEQ_COLUMN + ", " + SUP_TYPE_COLUMN;
	
	/**********************************************************************
	 * supplier_type_tag table
	 ***********************************************************************/
	// Table names
	public static final String SUPPLIER_TYPE_TAG_TABLE = "supplier_type_tag";
	
	// Columns names
//	public static final String SUP_SEQ_COLUMN = "sup_type_seq";  Already exitst in supplier table 
//	public static final String SUP_TYPE_SEQ_COLUMN = "sup_type_seq";  Already exitst in supplier_type table
	
	// Group of columns
	public static final String ALL_SUPPLIER_TYPE_TAG_COLUMNS = SUP_SEQ_COLUMN + ", " + SUP_TYPE_SEQ_COLUMN;
}
