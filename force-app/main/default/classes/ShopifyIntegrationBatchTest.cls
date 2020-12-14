@isTest public class ShopifyIntegrationBatchTest {
    private class Mock implements HttpCalloutMock {
        String json = '{'+
		'    \"customers\": ['+
		'        {'+
		'            \"id\": 0,'+
		'            \"email\": \"justin.wills@g2atechgroup.com\",'+
		'            \"accepts_marketing\": false,'+
		'            \"created_at\": \"2020-11-20T13:34:56-05:00\",'+
		'            \"updated_at\": \"2020-11-20T13:34:56-05:00\",'+
		'            \"first_name\": \"Test\",'+
		'            \"last_name\": \"Test\",'+
		'            \"orders_count\": 0,'+
		'            \"state\": \"disabled\",'+
		'            \"total_spent\": \"0.00\",'+
		'            \"last_order_id\": null,'+
		'            \"note\": \"\",'+
		'            \"verified_email\": true,'+
		'            \"multipass_identifier\": null,'+
		'            \"tax_exempt\": false,'+
		'            \"phone\": null,'+
		'            \"tags\": \"\",'+
		'            \"last_order_name\": null,'+
		'            \"currency\": \"USD\",'+
		'            \"addresses\": [],'+
		'            \"accepts_marketing_updated_at\": \"2020-11-20T13:34:56-05:00\",'+
		'            \"marketing_opt_in_level\": null,'+
		'            \"tax_exemptions\": [],'+
		'            \"admin_graphql_api_id\": \"gid://shopify/Customer/4457570762951\"'+
		'        },'+
		'        {'+
		'            \"id\": 1,'+
		'            \"email\": \"justin.wills@g2technologies.com\",'+
		'            \"accepts_marketing\": false,'+
		'            \"created_at\": \"2020-11-20T01:21:03-05:00\",'+
		'            \"updated_at\": \"2020-11-20T01:21:03-05:00\",'+
		'            \"first_name\": \"Justin\",'+
		'            \"last_name\": \"Wills\",'+
		'            \"orders_count\": 0,'+
		'            \"state\": \"disabled\",'+
		'            \"total_spent\": \"0.00\",'+
		'            \"last_order_id\": null,'+
		'            \"note\": \"\",'+
		'            \"verified_email\": true,'+
		'            \"multipass_identifier\": null,'+
		'            \"tax_exempt\": false,'+
		'            \"phone\": null,'+
		'            \"tags\": \"\",'+
		'            \"last_order_name\": null,'+
		'            \"currency\": \"USD\",'+
		'            \"addresses\": [],'+
		'            \"accepts_marketing_updated_at\": \"2020-11-20T01:21:03-05:00\",'+
		'            \"marketing_opt_in_level\": null,'+
		'            \"tax_exemptions\": [],'+
		'            \"admin_graphql_api_id\": \"gid://shopify/Customer/4456556069063\"'+
		'        }'+
		'    ]'+
		'}';
        public HTTPResponse respond(HTTPRequest req) {
            
            HTTPResponse res = new HTTPResponse();
            if (req.getEndpoint().endsWith('admin/api/2020-10/customers.json')) {
                res.setBody(json);
                res.setStatusCode(200);

            } else {
                System.assert(false, 'unexpected endpoint ' + req.getEndpoint());
                return null;
            }
            return res;
        }

    }
    @isTest(seeAllData=true)
    static void testBatch(){
        Test.setMock(HttpCalloutMock.class, new Mock());
        ShopifyIntegrationBatch shopify= new ShopifyIntegrationBatch();

        Test.startTest();
        Database.executeBatch(shopify);
        Test.stopTest();
        Account a = [Select shopify_id__c, name FROM Account WHERE shopify_id__c = '1' limit 1];
        System.assert(a.name == 'Justin Wills');
    }
    @isTest(seeAllData=True) static void testSchedule(){
        Test.setMock(HttpCalloutMock.class, new Mock());
        ShopifyIntegrationBatch shopify =new ShopifyIntegrationBatch();
        String sch = '0 0 1 * * ? *';
        Test.startTest();
        String jobID = system.schedule('Shopify Customer Pull - Test', sch, shopify);
        Test.stopTest();
        }
}
