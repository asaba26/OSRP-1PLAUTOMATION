@ignore
Feature: Generate Payloads

  @ShipmentCreation
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.shippedDateTime = orderCreatedDate
    * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload

  @Refund 
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.orderId = orderCreatedDate
    * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload
  

  @RP
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.orderId = orderCreatedDate
    * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload
  


  @AKS
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.orderId = orderCreatedDate
    * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload

  @Manualupdate
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.orderId = orderCreatedDate
    * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload

  @FedexCreation
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
     * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload


  @UniqueSeller
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def sellerId = commonUtils.create_random_orderId()
    * print sellerId
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload


  @ShipmentMissingField
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.shippedDateTime = orderCreatedDate
    * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload


  @OnePL_EMOM
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.shippedDateTime = orderCreatedDate
    * print orderCreatedDate
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload


  @events
  Scenario: Generate Payload for events
    * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
    * print EMOM_Payload


