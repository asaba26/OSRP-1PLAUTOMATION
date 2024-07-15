@RPUI 
Feature: Order Creation and Validation for OnePL


Background:

      * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
      * def testDataAll = read('classpath:tests/OnePL/OnePL_Regression_Scenarios_TestData.json')
      * def assertionsAll = read('classpath:tests/OnePL/OnePL_Assertions.json')
      * def testData = karate.merge(testDataAll.DELIVERY_OnePL, assertionsAll.DELIVERY_OnePL)
      * def orderId = testData.orderIdType == null ? commonUtils.create_random_orderId() : commonUtils.create_random_orderId(testData.orderIdType)
      * def fulfillmentOrderId = orderId+'011'
      * def storeNumber = testData.storeId
      * def orderCreatedDate = commonUtils.CurrentUTCtime()
      * def stageByDateTime = commonUtils.future_date()+'T19:00:00.000Z'
      * def startTime = commonUtils.future_date()+'T17:00:00.000Z'
      * def endTime = commonUtils.future_date()+'T19:00:00.000Z'
      * print orderId,orderCreatedDate
      * set testData.orderId = orderId
      * set testData.fulfillmentOrderId = fulfillmentOrderId
      * set testData.orderCreatedDate = orderCreatedDate
    
Scenario: Validating  order placement and verifying mandatory fields In RP UI

      # Given statement for RP UI 
      Given url RPUI_DBURL_ENDPOINT + '/listener/DocRequestTaskCombinedListener.asp'
      And header Content-Type = 'application/xml; charset=utf-8'
      And header Ocp-Apim-Subscription-Key = 'd80fa7062ee84096bf06caed0d812296'
      And header storeId = '1502'

# post payload on EMOM TOPIC 
* def createOrder = call read('classpath:modules/createOrder.feature@Delivery_1pl') { 'payloadName' : 'OnePL/OnePL_EMOM' }
* def orderId = createOrder.orderId
* def fulfillmentOrderId = createOrder.fulfillmentOrderId
* print orderId
* print fulfillmentOrderId
* def referenceNumber = createOrder.referenceNumber

# post payload on OSRP OnePL TOTE TOPIC
* def Tote_Order = call read('classpath:modules/postEvents.feature@OSRP_1PL_TOTES_EVENTS_TOPIC') { 'payloadName' : 'OnePL/OSRP_1PL_TOTE' }


* def DocBol_Criteria = "FWStop.OrderKey like '"+orderId+"%'"
* print DocBol_Criteria
  # db validation
And request 
"""
<?xml version="1.0" encoding="UTF-8"?> 
<DocFWImport> 
<Header CompanyName="Safeway" LoginName="FW-Interface" Password="changeme" ReceiverID="MyCompany001" SendDateTime="8/2/2017 10:55:15 AM" extDocControlID="xxBOLSourceMessageID" senderID="SFFODLL"/> 
<Request>
<DocRequestTask MessagePurpose="1005" ProcessCode="" ScheduleKey="">
<DocCriteria>
<DocBOL Criteria="#(DocBol_Criteria)"/>
</DocCriteria>
</DocRequestTask>
</Request>
</DocFWImport>
"""
And print request 
When method post 
 Then status 200
 And print response
 And match response contains fulfillmentOrderId

#Retrive message from kafka OSRP_1PL_TOTE TOPIC 
#
# * def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSLM_ORDER')
# * def results = result.allRecords
# * print results
# * print orderId
# * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]") // Selecting records with matching orderNumber
# * set testData.kafkaMessages = records // Storing selected records in testData.kafkaMessages
# * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value") // Selecting the value of the matching record
# * print ourrecord




    
      









