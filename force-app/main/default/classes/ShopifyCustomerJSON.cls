//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class ShopifyCustomerJSON {

	public class Addresses {

		public Addresses(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						{
							System.debug(LoggingLevel.WARN, 'Addresses consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Customers {
		public Long id {get;set;} 
		public String email {get;set;} 
		public Boolean accepts_marketing {get;set;} 
		public String created_at {get;set;} 
		public String updated_at {get;set;} 
		public String first_name {get;set;} 
		public String last_name {get;set;} 
		public Integer orders_count {get;set;} 
		public String state {get;set;} 
		public String total_spent {get;set;} 
		public Object last_order_id {get;set;} 
		public String note {get;set;} 
		public Boolean verified_email {get;set;} 
		public Object multipass_identifier {get;set;} 
		public Boolean tax_exempt {get;set;} 
		public Object phone {get;set;} 
		public String tags {get;set;} 
		public Object last_order_name {get;set;} 
		public String currency_var {get;set;} 
		public List<Addresses> addresses {get;set;} 
		public String accepts_marketing_updated_at {get;set;} 
		public Object marketing_opt_in_level {get;set;} 
		public List<Addresses> tax_exemptions {get;set;} 
		public String admin_graphql_api_id {get;set;} 

		public Customers(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getLongValue();
						} else if (text == 'email') {
							email = parser.getText();
						} else if (text == 'accepts_marketing') {
							accepts_marketing = parser.getBooleanValue();
						} else if (text == 'created_at') {
							created_at = parser.getText();
						} else if (text == 'updated_at') {
							updated_at = parser.getText();
						} else if (text == 'first_name') {
							first_name = parser.getText();
						} else if (text == 'last_name') {
							last_name = parser.getText();
						} else if (text == 'orders_count') {
							orders_count = parser.getIntegerValue();
						} else if (text == 'state') {
							state = parser.getText();
						} else if (text == 'total_spent') {
							total_spent = parser.getText();
						} else if (text == 'last_order_id') {
							last_order_id = parser.readValueAs(Object.class);
						} else if (text == 'note') {
							note = parser.getText();
						} else if (text == 'verified_email') {
							verified_email = parser.getBooleanValue();
						} else if (text == 'multipass_identifier') {
							multipass_identifier = parser.readValueAs(Object.class);
						} else if (text == 'tax_exempt') {
							tax_exempt = parser.getBooleanValue();
						} else if (text == 'phone') {
							phone = parser.readValueAs(Object.class);
						} else if (text == 'tags') {
							tags = parser.getText();
						} else if (text == 'last_order_name') {
							last_order_name = parser.readValueAs(Object.class);
						} else if (text == 'currency') {
							currency_var = parser.getText();
						} else if (text == 'addresses') {
							addresses = arrayOfAddresses(parser);
						} else if (text == 'accepts_marketing_updated_at') {
							accepts_marketing_updated_at = parser.getText();
						} else if (text == 'marketing_opt_in_level') {
							marketing_opt_in_level = parser.readValueAs(Object.class);
						} else if (text == 'tax_exemptions') {
							tax_exemptions = arrayOfAddresses(parser);
						} else if (text == 'admin_graphql_api_id') {
							admin_graphql_api_id = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Customers consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public List<Customers> customers {get;set;} 

	public ShopifyCustomerJSON(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'customers') {
						customers = arrayOfCustomers(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'ShopifyCustomerJSON consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	public static ShopifyCustomerJSON parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new ShopifyCustomerJSON(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	

    private static List<Customers> arrayOfCustomers(System.JSONParser p) {
        List<Customers> res = new List<Customers>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Customers(p));
        }
        return res;
    }








    private static List<Addresses> arrayOfAddresses(System.JSONParser p) {
        List<Addresses> res = new List<Addresses>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Addresses(p));
        }
        return res;
    }



}