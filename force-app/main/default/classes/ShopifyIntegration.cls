public class ShopifyIntegration {
    public static void getCustomers(){
        HttpRequest req=new HttpRequest();
        HttpResponse  res=new HttpResponse();
        Http http = new Http();
        Shopify_Credentials__c credentials = [SELECT Id, API_Key__c, API_Version__c, API_URL__c, API_Secret__c FROM Shopify_Credentials__c];
        req.setEndpoint(credentials.API_URL__c + 'admin/api/'+ credentials.API_Version__c +'/customers.json');
        req.setMethod('GET');
        req.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueof(credentials.API_Key__c + ':' + credentials.API_Secret__c)) );
        res= http.send(req);
        System.debug(res.getBody());
        if(res.getStatusCode() == 200){
            ShopifyCustomerJSON customerList = ShopifyCustomerJSON.parse(res.getBody());
            List<Account> accList = new List<Account>();
            for (ShopifyCustomerJSON.Customers customer : customerList.customers){
                Account acc = new Account();
                acc.name = customer.first_name + ' ' + customer.last_name;
                acc.shopify_id__c = String.valueOf(customer.id);
                acc.Phone = String.valueOf(customer.phone);
                accList.add(acc);
            }
            if (accList.size() > 0){
                upsert accList shopify_id__c;
            }
        }else {
                System.debug(res.getStatusCode());
                System.debug(res.getStatus());
                
                // Handle Error
            }
    }
}
