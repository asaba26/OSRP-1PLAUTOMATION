Feature: Refund 2.0 for marketplace retuns flow - Shipement Flow 

@Refund_Regression_UPS 
Scenario: Validating E2E refund  shipment flow and verifying mandatory fields

# post payload on OCRR_OSLM_REQUEST-QA
# set test data for shipment tracker
 * def testDataAll = read('classpath:payloads/Refund.json')
 * def testData = testDataAll

# set test data for shipment tracker
 * def createOrder = call read('classpath:modules/createOrder.feature@Refund') { 'payloadName' : 'Refund' }
 * def orderId = createOrder.orderId
 * set testData.orderId = orderId
 * def fulfillmentOrderId = createOrder.fulfillmentOrderId
 # db valiadation
 * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
 * print testData.orderId
 * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
 * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
 * sleep(15000)
 * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
 * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
 * sleep(500000)
 #* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
 #* print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
 #* match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'
 # EDM kafka validation
 * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
 * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
 #* sleep(500000)
 * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server, EDM_TOPIC_MKPL)
 * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
# * sleep(150000)
 * sleep(2000)
 * set testData.kafkaMessages = records
 * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
 * print records[0].fulfillmentOrderNumber
 * print records[0].events[0].eventId

 @Refund_Regression_USPS
    Scenario: Validating E2E refund  shipment flow and verifying mandatory fields
       # post payload on OCRR_OSLM_REQUEST-QA
         # set test data for shipment tracker
          * def testDataAll = read('classpath:payloads/USPSRefund.json')
          * def testData = testDataAll
          # set test data for shipment tracker
         * def createOrder = call read('classpath:modules/createOrder.feature@Refund') { 'payloadName' : 'USPSRefund' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
    # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * sleep(15000)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    #* match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
   # * sleep(500000)
    #* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
 #* print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
 #* match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'
 
 # EDM kafka validation
 * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
 * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
 #* sleep(500000)
 * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server, EDM_TOPIC_MKPL)
 * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
# * sleep(150000)
 * sleep(2000)
 * set testData.kafkaMessages = records
 * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
 * print records[0].fulfillmentOrderNumber
 * print records[0].events[0].eventId

@Refund_Regression_FEDEX
Scenario: Validating E2E refund  shipment flow and verifying mandatory fields

# post payload on OCRR_OSLM_REQUEST-QA
# set test data for shipment tracker
 * def testDataAll = read('classpath:payloads/fedexTrackerRefund.json')
 * def testData = testDataAll

# set test data for shipment tracker
 * def createOrder = call read('classpath:modules/createOrder.feature@Refund') { 'payloadName' : 'fedexTrackerRefund' }
 * def orderId = createOrder.orderId
 * set testData.orderId = orderId
 * def fulfillmentOrderId = createOrder.fulfillmentOrderId
 # db valiadation
 * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
 * print testData.orderId
 * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
 * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
 * sleep(15000)
 * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
 * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
 * sleep(500000)
 #* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
 #* print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
 #* match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'