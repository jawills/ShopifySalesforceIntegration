global class ShopifyIntegrationBatch implements Database.Batchable<sobject>, Database.AllowsCallouts, Schedulable{

    // ShopifyIntegrationBatch shopify =new ShopifyIntegrationBatch();
    // String sch = '0 0 0 * * ? *';
    // String jobID = system.schedule('Shopify Customer Pull', sch, shopify);

    global void execute(SchedulableContext sc){
        ShopifyIntegrationBatch shopify =new ShopifyIntegrationBatch();
        Database.executeBatch(shopify);
    }
      
    global Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('Select id from Account limit 1');
    } 
       
    global void execute(Database.BatchableContext bc, list<sobject> glst){
        ShopifyIntegration.getCustomers();
    }
       
    global void finish(Database.BatchableContext bc){
        System.debug('Finished Shopify Customer Pull');
    }
}