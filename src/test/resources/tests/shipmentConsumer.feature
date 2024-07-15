
Feature: Shipment Tracker Scenarios for MKPL


  @Shipment_Consumer


  Scenario: Place Shipment End to End
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ShipmentTracker.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'ShipmentTracker' }
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
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'
    * karate.abort()

 # kafka validation
   
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(15000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
   # * match records[0].orderType == 'marketplace'
   # * match records[0].event.id == 'SHIPMENT-DELIVERED'

  @Shipment_Consumer
  Scenario: Verification of orderNumber Error when the respective field is not exist in kafka message.
    * def testDataAll = read('classpath:payloads/MissingOrderNumberShipment.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'MissingOrderNumberShipment' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "Check the shipment is exist in the shipment db " + dbResults[0].shipmentStatus

  @Shipment_Consumer
  Scenario: Verification of fulfillmentOrderNumber Error when the respective field is not exist in kafka message.
    * def testDataAll = read('classpath:payloads/MissingFullmentOrder.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'MissingFullmentOrder' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "Check the shipment is exist in the shipment db " + dbResults[0].shipmentStatus

  @Shipment_Consumer
  Scenario: Verification of shipment-id Error when the respective field is not exist in kafka message.

    * def testDataAll = read('classpath:payloads/ShipmentIdError.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'ShipmentIdError' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "Check the shipment is exist in the shipment db " + dbResults[0].shipmentStatus

  @Shipment_Consumer
  Scenario: Verification of trackingNumber Error when the respective field is not exist in kafka message.
    * def testDataAll = read('classpath:payloads/TrackingNumberMissing.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'TrackingNumberMissing' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "Check the shipment is exist in the shipment db " + dbResults[0].shipmentStatus


  @Shipment_Consumer
  Scenario: Verification of trackingURL Error when the respective field is not exist in kafka message.
    * def testDataAll = read('classpath:payloads/TrackingURLMIssing.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'TrackingURLMIssing' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "Check the shipment is exist in the shipment db " + dbResults[0].shipmentStatus


  @Shipment_Consumer
  Scenario: Verification of shippedDateTimeError when the respective field is not exist in kafka message.
    * def testDataAll = read('classpath:payloads/ShipmentDateMissing.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'ShipmentDateMissing' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "Check the shipment is exist in the shipment db " + dbResults[0].shipmentStatus





