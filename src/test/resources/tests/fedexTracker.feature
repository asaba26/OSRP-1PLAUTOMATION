

Feature: Fedex Tracker Scenarios for MKPL



  @Fedex_Tracker
  Scenario: Push a sample Kafka message to the OCMF topic with an empty carrier name
  and a valid tracker number, see if we have the right one chosen,
  and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/fedexTrackerEmptyCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTrackerEmptyCarrier' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    #* sleep(15000)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * print "carrier while push the data first time>>>>>>>>>>>" + dbResults[0].carrier
    * match dbResults[0].carrier == 'FEDEX'


  @Fedex_Tracker
  Scenario: Push a sample Kafka message to the OCMF topic with an incorrect carrier name
  and a valid tracker number,
  see if we have the right one chosen, and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/fedexTrackerIncorrectCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTrackerIncorrectCarrier' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    #* sleep(15000)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * print "carrier while push the data first time>>>>>>>>>>>" + dbResults[0].carrier
    * match dbResults[0].carrier == 'FEDEX'

  @Fedex_Tracker
  Scenario: Push a sample Kafka message to the OCMF topic with a null carrier name and
  a valid tracker number, see if we have the right one chosen,
  and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/fedexTrackerNullCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTrackerNullCarrier' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    #* sleep(15000)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * print "carrier while push the data first time>>>>>>>>>>>" + dbResults[0].carrier
    * match dbResults[0].carrier == 'FEDEX'


  @Fedex_Tracker

  Scenario: Place Shipment End to End When carrier is Fedex
     # set test data for Fedex tracker
    * def testDataAll = read('classpath:payloads/fedexTracker.json')
    * def testData = testDataAll
    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTracker' }
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


   # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(50000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records.fulfillmentOrderNumber
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
   # * match records[0].orderType == 'marketplace'
  #  * match records[0].event.id == 'SHIPMENT-DELIVERED'



  @Fedex_Tracker

  Scenario:Place Shipment End to End when carrier is FEDEX along with EDM Validation
     # set test data for Fedex tracker
    * def testDataAll = read('classpath:payloads/fedexTracker.json')
    * def testData = testDataAll
    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTracker' }
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
    * print "shipmentStatus while fetching the data After creation >>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'

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
   # * match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'
   # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
  #  * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(2000)
   # * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
   # * match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'


  @Fedex_Tracker
  Scenario: Place Shipment when carrier is Fedex when Shipment Message having missing field
    # set test data for Fedex tracker
    * def testDataAll = read('classpath:payloads/FedexTrackerMissingFields.json')
    * def testData = testDataAll
    * print testData

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@ShipmentMissingFields')  { 'payloadName' : 'FedexTrackerMissingFields' }
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "NotFound this shipment details in db ">>>>>>>>>>>" + dbResults[0].orderNumber



  @Fedex_Tracker
  Scenario: Place Shipment End to End when carrier is Fedex and created date before 15 days back
     # set test data for Fedex tracker
    * def testDataAll = read('classpath:payloads/FedexTracker_IgnoredScnario.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@FedexIgonreEvents') { 'payloadName' : 'FedexTracker_IgnoredScnario' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId


     # db valiadation
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }


    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'

    * print dbResults[0].shippedDateTime
    * def dbResult = dbUtils.update_mongoDB_Common(MONGO_URI,'shipment_details','orderNumber',testData.orderId,'createdTS',dbResults[0].shippedDateTime)
    * sleep(500000)
    * def modifieddbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while changed  the data created date  time>>>>>>>>>>>" + modifieddbResult[0].shipmentStatus
   # * match modifieddbResult[0].shipmentStatus == 'SHIPMENT-IGNORED'




  @Fedex_Tracker
  Scenario: Place Shipment when Order type from marketplace and carrier is fedex


     # set test data for fedex tracker
    * def testDataAll = read('classpath:payloads/fedexTracker.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@MarketplaceOrderType') { 'payloadName' : 'fedexTracker' }
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


   # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
    #* match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'

  @Fedex_Tracker
  Scenario: Track the Shipment from OSS to EDM when Order type from marketplace.

     # set test data for fedex tracker
    * def testDataAll = read('classpath:payloads/fedexTracker.json')
    * def testData = testDataAll


    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@MarketplaceOrderType') { 'payloadName' : 'fedexTracker' }
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


   # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
    #* match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'

    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC_MKPL)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    #* print records[0].events[0].eventId
    #* match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'



  @Fedex_Tracker
  Scenario: Place Shipment Forcefully into db after by-pass the OCMF Topic
    # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ManualEntryFedex.json')
    * def testData = testDataAll
        # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
     #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def generatePayload = call read('classpath:services/generatePayload.feature@Manualupdate') { 'payloadName' : 'ManualEntryFedex' }
    * def orderId = generatePayload.orderId
    * def OrderStatusCreation = testData.messageAction
    * print "OrderStatusCreation" + "   " +OrderStatusCreation
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * string payload = generatePayload.EMOM_Payload
    * set testData.orderId = orderId
    * print orderId
    * print fulfillmentOrderId
    * def dbResult = dbUtils.insert_mongoDB(MONGO_URI, 'oslm_mp', 'shipment_details', payload)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(500000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while retrieve the data form db>>>>>>>>>>>"  +dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


     # kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
    #* match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'

  @Fedex_Tracker
  Scenario: Place Shipment Forcefully into db after by-pass the OCMF Topic and track from OSS to EDM
    # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ManualEntryFedex.json')
    * def testData = testDataAll
        # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
     #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def generatePayload = call read('classpath:services/generatePayload.feature@Manualupdate') { 'payloadName' : 'ManualEntryFedex' }
    * def orderId = generatePayload.orderId
    * def OrderStatusCreation = testData.messageAction
    * print "OrderStatusCreation" + "   " +OrderStatusCreation
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * string payload = generatePayload.EMOM_Payload
    * set testData.orderId = orderId
    * print orderId
    * print fulfillmentOrderId
    * def dbResult = dbUtils.insert_mongoDB(MONGO_URI, 'oslm_mp', 'shipment_details', payload)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(500000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while retrieve the data form db>>>>>>>>>>>"  +dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


     # kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
   # * match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'

    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC_MKPL)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print records[0].events[0].eventId
    #* match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'





  @Fedex_Tracker
  Scenario: SHIPMENT-DELIVERY-MISSED Events
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/fedexTracker.json')
    * def testData = testDataAll
     #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTracker' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * print "Fulfillment_orderID>>>>>>>>>>>" + fulfillmentOrderId
    * print dbResults
    * def dbResult = dbUtils.update_mongoDB_Common(MONGO_URI,'shipment_details','orderNumber',testData.orderId,'shipmentStatus','SHIPMENT-DELIVERY-MISSED')
    * print dbResult
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "shipmentStatus while retrieve the modified data form db>>>>>>>>>>>"  +dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERY-MISSED'
 # kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(150000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType




  @Fedex_Tracker
  Scenario: Reassign the same order number with new tracking number
    * def testDataAll = read('classpath:payloads/fedexTracker.json')
    * def testData = testDataAll
    * def testDataAllnew = read('classpath:payloads/NewFedexTracker.json')
    * def testDatanew = testDataAllnew

#Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTracker' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

  # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(500000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


     # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
    #* match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'

    # new tracking Number validation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * print testDatanew.trackingNumber
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * set testDatanew.trackingNumber = '449044304137821'
    * print testDatanew.trackingNumber
    * json payload = read('classpath:payloads/NewFedexTracker.json')
    * print payload
    * def postMessage = call read('classpath:services/postMessageOnKafka.feature@SHIPMENT_QA')

    # new tracking validation
   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','trackingNumber',testDatanew.trackingNumber)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResult[0].shipmentStatus
    * print dbResult[0].trackingNumber
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * print "Fulfillment_orderID>>>>>>>>>>>" + fulfillmentOrderId
    * sleep(500000)
    * def dbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','trackingNumber',testDatanew.trackingNumber)
    * print "shipmentStatus while retrieve the data form db>>>>>>>>>>>"  +dbResult[0].shipmentStatus
    * print dbResult[0].trackingNumber


    # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
   # #* match records[0].orderType == 'marketplace'
   # * match records[0].event.id == 'SHIPMENT-DELIVERED'


  @Fedex_Tracker
  Scenario: Reassign the same order number with new tracking number track till EDM
    * def testDataAll = read('classpath:payloads/fedexTracker.json')
    * def testData = testDataAll
    * def testDataAllnew = read('classpath:payloads/NewFedexTracker.json')
    * def testDatanew = testDataAllnew

#Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'fedexTracker' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

  # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(500000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


     # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
   # * match records[0].orderType == 'marketplace'
  #  * match records[0].event.id == 'SHIPMENT-DELIVERED'


    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC_MKPL)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print records[0].events[0].eventId
   # * match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'

    # new tracking Number validation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * print testDatanew.trackingNumber
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * set testDatanew.trackingNumber = '449044304137821'
    * print testDatanew.trackingNumber
    * json payload = read('classpath:payloads/NewFedexTracker.json')
    * print payload
    * def postMessage = call read('classpath:services/postMessageOnKafka.feature@SHIPMENT_QA')

    # new tracking validation
   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def dbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','trackingNumber',testDatanew.trackingNumber)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResult[0].shipmentStatus
    * print dbResult[0].trackingNumber
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * print "Fulfillment_orderID>>>>>>>>>>>" + fulfillmentOrderId
    * sleep(500000)
    * def dbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','trackingNumber',testDatanew.trackingNumber)
    * print "shipmentStatus while retrieve the data form db>>>>>>>>>>>"  +dbResult[0].shipmentStatus
    * print dbResult[0].trackingNumber


    # kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType

    #* match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'


# EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC_MKPL)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print records[0].events[0].eventId
   # * match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'







