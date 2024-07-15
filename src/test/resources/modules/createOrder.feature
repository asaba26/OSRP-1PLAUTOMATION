@ignore
Feature: Create Order on EMOM Order Topic

  @Regular
  Scenario: Generate Payload for Order Creation and post on EMOM Order Topic
  
    #Generate payload for order creation and post on EMOM order topic
    * def generatePayload = call read('classpath:services/generatePayload.feature@orderCreation') { 'payloadName' : '#(payloadName)' }
    * def orderId = generatePayload.orderId
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * set testDataAll.orderId = orderId
    * set testDataAll.fulfillmentOrderId = fulfillmentOrderId
    * def storeId = generatePayload.EMOM_Payload.storeNumber
    * print "***************>>>>>>>>>>>>>"+storeId
    * string payload = generatePayload.EMOM_Payload
    * def postMessage = call read('classpath:services/postMessageOnKafka.feature@SHIPMENT_QA')

    @Refund
    Scenario: Generate Payload for Order Creation and post on EMOM Order Topic
    
      #Generate payload for order creation and post on EMOM order topic
      * def generatePayload = call read('classpath:services/generatePayload.feature@Refund') { 'payloadName' : '#(payloadName)' }
      * def orderId = generatePayload.orderId
      * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
      * set testDataAll.orderId = orderId
      * set testDataAll.fulfillmentOrderId = fulfillmentOrderId
      #* def storeId = generatePayload.EMOM_Payload.storeNumber
     # * print "***************>>>>>>>>>>>>>"+storeId
      * string payload = generatePayload.EMOM_Payload
      * print payload 
      * def postMessage = call read('classpath:services/postMessageOnKafka.feature@REFUND_QA')

    

      @OnePl_TOTE
      Scenario: Generate Payload for 1PL tote  and post on OSRP_1PL_TOTE Topic
      
        #Generate payload for order creation and post on EMOM order topic
        * def generatePayload = call read('classpath:services/generatePayload.feature@RP') { 'payloadName' : '#(payloadName)' }
        * def orderId = generatePayload.orderId
        * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
        * set testDataAll.orderId = orderId
        * set testDataAll.fulfillmentOrderId = fulfillmentOrderId
        #* def storeId = generatePayload.EMOM_Payload.storeNumber
       # * print "***************>>>>>>>>>>>>>"+storeId
        * string payload = generatePayload.EMOM_Payload
        * print payload 
        * def postMessage = call read('classpath:services/postMessageOnKafka.feature@RP_QA')

      @AKS
      Scenario: Generate Payload for Order Creation and post on EMOM Order Topic
      
        #Generate payload for order creation and post on EMOM order topic
        * def generatePayload = call read('classpath:services/generatePayload.feature@AKS') { 'payloadName' : '#(payloadName)' }
        * def orderId = generatePayload.orderId
        * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
        * set testDataAll.orderId = orderId
        * set testDataAll.fulfillmentOrderId = fulfillmentOrderId
        #* def storeId = generatePayload.EMOM_Payload.storeNumber
       # * print "***************>>>>>>>>>>>>>"+storeId
        * string payload = generatePayload.EMOM_Payload
        * print payload 
        * def postMessage = call read('classpath:services/postMessageOnKafka.feature@AKS_QA')


        @OnePL_EMOM
        Scenario: Generate Payload for Order Creation and post on EMOM Order Topic
  
          #Generate payload for order creation and post on EMOM order topic
          * def generatePayload = call read('classpath:services/generatePayload.feature@OnePL_EMOM') { 'payloadName' : '#(payloadName)' }
          * def orderId = generatePayload.orderId
          * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
          * set testDataAll.orderId = orderId
          * set testDataAll.fulfillmentOrderId = fulfillmentOrderId
          * def storeId = generatePayload.EMOM_Payload.storeNumber
          * print "***************>>>>>>>>>>>>>"+storeId
          * string payload = generatePayload.EMOM_Payload
          * def postMessage = call read('classpath:services/postMessageOnKafka.feature@EMOM_ORDER_TOPIC')
  
  @Reschedule
  Scenario: Generate Payload for Order Creation and post on EMOM Order Topic
  
    #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def generatePayload = call read('classpath:services/generatePayload.feature@ShipmentCreation') { 'payloadName' : '#(payloadName)' }
    * def orderId = generatePayload.orderId
    * def OrderStatusCreation = testData.messageAction
    * print "OrderStatusCreation" + "   " +OrderStatusCreation
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.shippedDateTime = orderCreatedDate
    * string payload = generatePayload.EMOM_Payload
    * def postMessage = call read('classpath:services/postMessageOnKafka.feature@SHIPMENT_QA')



  @UniqueSeller
  Scenario: Generate Payload for Order Creation and post on EMOM Order Topic

    #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def generatePayload = call read('classpath:services/generatePayload.feature@UniqueSeller') { 'payloadName' : '#(payloadName)' }
    * def sellerId = generatePayload.sellerId
    * string payload = generatePayload.EMOM_Payload

  @IgonredEvents
  Scenario: Generate Payload for Order Creation and post on EMOM Order Topic

    #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def generatePayload = call read('classpath:services/generatePayload.feature@ShipmentCreation') { 'payloadName' : '#(payloadName)' }
    * def orderId = generatePayload.orderId
    * def OrderStatusCreation = testData.messageAction
    * print "OrderStatusCreation" + "   " +OrderStatusCreation
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * string payload = generatePayload.EMOM_Payload
    * def postMessage = call read('classpath:services/postMessageOnKafka.feature@SHIPMENT_QA')

  @ShipmentMissingFields
  Scenario: Generate Payload for Shipment Creation and post on EMOM Order Topic

    #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def generatePayload = call read('classpath:services/generatePayload.feature@ShipmentMissingField') { 'payloadName' : '#(payloadName)' }
    * def orderId = generatePayload.orderId
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    * set testData.shippedDateTime = orderCreatedDate

    * string payload = generatePayload.EMOM_Payload
    * def postMessage = call read('classpath:services/postMessageOnKafka.feature@SHIPMENT_QA')


    @Delivery_1pl
    Scenario: Generate Payload for Order Creation and post on EMOM Order Topic
      * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = testData.orderIdType == null ? commonUtils.create_random_orderId() : commonUtils.create_random_orderId(testData.orderIdType)
    * def fulfillmentOrderId = orderId+'011'
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
      * def stageByDateTime = commonUtils.future_date()+'T15:50:00.000Z'
      * def startTime = commonUtils.future_date()+'T15:00:00.000Z'
      * def endTime = commonUtils.future_date()+'T19:00:00.000Z'
      * def editCutOffDate = commonUtils.future_date()+'T06:59:59.000Z'
      * def cancelCutOffDate = commonUtils.future_date()+'T08:00:00.000Z'
      * print orderId,orderCreatedDate
      * print stageByDateTime,startTime,endTime
      * set testData.startTime = startTime
      * set testData.orderId = orderId
      * set testData.fulfillmentOrderId = fulfillmentOrderId
      * set testData.endTime = endTime
      * set testData.stageByDateTime = stageByDateTime
      * set testData.editCutOffDate = editCutOffDate
      * set testData.cancelCutOffDate = cancelCutOffDate
      * if (!testData.adaFlag) karate.set('testData', '$.adaFlag', false)
      * json EMOM_Payload = read('classpath:payloads/'+payloadName+'.json')
      * if (testData.adaFlag) karate.set('EMOM_Payload', '$.customer.preference.optIn[]', {"type": "ADA","id": "WHEELCHAIR_ACCESS","isOptin": true})
      * print EMOM_Payload
      * set testData.addressLine1 = EMOM_Payload.customer.address[0].addressLine1
      * set testData.zipCode = EMOM_Payload.customer.address[0].zipCode
      * set testData.city = EMOM_Payload.customer.address[0].city
      * set testData.state = EMOM_Payload.customer.address[0].state
      * set testData.grossOrderTotal = EMOM_Payload.orderTotal.amount
      * string payload = EMOM_Payload
      * def headers = {'event':'CREATED','orderCategory':'1P'}
      * def postMessage = call read('classpath:services/postMessageOnKafka.feature@EMOM_ORDER_TOPIC')
      * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    