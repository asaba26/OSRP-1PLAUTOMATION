
Feature: USPS Scenarios for MKPL

  @Shipment_Tracker_USPS1
  Scenario:  Scenario: Push a sample Kafka message to the OCMF topic with an empty carrier name
  and a valid tracker number, see if we have the right one chosen,
  and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPSEmptyCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'USPSEmptyCarrier' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * sleep(1500)

    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * print "carrier while push the data first time>>>>>>>>>>>" + dbResults[0].carrier
    * match dbResults[0].carrier == 'USPS'
    

  @Shipment_Tracker_USPS1
  Scenario: Scenario: Push a sample Kafka message to the OCMF topic with an incorrect carrier name
  and a valid tracker number,
  see if we have the right one chosen, and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPSIncorrectCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'USPSIncorrectCarrier' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * sleep(1500)

    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * print "carrier while push the data first time>>>>>>>>>>>" + dbResults[0].carrier
    * match dbResults[0].carrier == 'USPS'
    * karate.abort()


  @Shipment_Tracker_USPS1
  Scenario: Scenario: Push a sample Kafka message to the OCMF topic with a null carrier name and
  a valid tracker number, see if we have the right one chosen,
  and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPSNullCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'USPSNullCarrier' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * sleep(1500)

    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * print "carrier while push the data first time>>>>>>>>>>>" + dbResults[0].carrier
    * match dbResults[0].carrier == 'USPS'

  @Shipment_Tracker_USPS
  Scenario: Place Shipment End to End when carrier is USPS
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPS.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'USPS' }
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
    * sleep(30000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while fetch the data >>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


    # OSS kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS

    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")

    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records
    * print records[0]
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


  @Shipment_Tracker_USPS
  Scenario: Place Shipment End to End when carrier is USPS along with EDM Validation
          # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPS.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'USPS' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId

   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * sleep(20000)

    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(50000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while fetch the data >>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


    # OSS kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(500000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * sleep(2000)
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,EDM_TOPIC_MKPL)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(2000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records
    * print records[0].fulfillmentOrderNumber
    * print records.fulfillmentOrderNumber
    * print records[0].events[0].eventId
    #* match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'





  @Shipment_Tracker_USPS
  Scenario: Place Shipment when carrier is USPS and Shipment Message having missing field
    # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPSMissingFields.json')
    * def testData = testDataAll
    * print testData
    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@ShipmentMissingFields')  { 'payloadName' : 'USPSMissingFields' }
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "NotFound this shipment details in db ">>>>>>>>>>>" + dbResults[0].orderNumber


  @Shipment_Tracker_USPS
  Scenario: Place Shipment End to End when carrier is USPS and created date before 15 days back
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPS_IgnoredScnario.json')
    * def testData = testDataAll
    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@IgonredEvents') { 'payloadName' : 'USPS_IgnoredScnario' }
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
    * def dbResult = dbUtils.update_mongoDB_Common(MONGO_URI,'shipment_details','orderNumber',testData.orderId,'createdTS',dbResults[0].shippedDateTime)
    * sleep(20000)
    * def dbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while changed  the data created date  time>>>>>>>>>>>" + dbResult[0].shipmentStatus
    * match dbResult[0].shipmentStatus == 'SHIPMENT-IGNORED'


  @Shipment_Tracker_USPS
  Scenario: SHIPMENT-DELIVERY-MISSED Events
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPS.json')
    * def testData = testDataAll
     #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'USPS' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
     # db valiadation
   # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * sleep(15000)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'

    * def dbResult = dbUtils.update_mongoDB_Common(MONGO_URI,'shipment_details','orderNumber',testData.orderId,'shipmentStatus','SHIPMENT-DELIVERY-MISSED')
    * print dbResult
    * sleep(40000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "shipmentStatus while retrieve the modified data form db>>>>>>>>>>>"  +dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERY-MISSED'
         # kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(15000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka  is not appears >>>>>>>"+ records[0].event.id



  @Shipment_Tracker_USPS
  Scenario: Place Shipment Forcefully into db after by-pass the OCMF Topic
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPSManualEntry.json')
    * def testData = testDataAll
        # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
     #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def generatePayload = call read('classpath:services/generatePayload.feature@Manualupdate') { 'payloadName' : 'USPSManualEntry' }
    * def orderId = generatePayload.orderId
    * def OrderStatusCreation = testData.messageAction
    * print "OrderStatusCreation" + "   " +OrderStatusCreation
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * string payload = generatePayload.EMOM_Payload
    * set testData.orderId = orderId
    * print orderId
    * print fulfillmentOrderId
    * def dbResult = dbUtils.insert_mongoDB(MONGO_URI, 'oslm_mp', 'shipment_details', payload)
    * print dbResult
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(50000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "shipmentStatus while retrieve the data form db>>>>>>>>>>>"  +dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


    # kafka validation
 # OSS kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS

    #* sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(2000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "Order type in OSS Kafka >>>>>>>"+ records[0].orderType
    #* match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'

  @Shipment_Tracker_USPS
  Scenario: Place Shipment Forcefully into db after by-pass the OCMF Topic and track from OSS to EDM
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/USPSManualEntry.json')
    * def testData = testDataAll
        # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
     #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def generatePayload = call read('classpath:services/generatePayload.feature@Manualupdate') { 'payloadName' : 'USPSManualEntry' }
    * def orderId = generatePayload.orderId
    * def OrderStatusCreation = testData.messageAction
    * print "OrderStatusCreation" + "   " +OrderStatusCreation
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * string payload = generatePayload.EMOM_Payload
    * set testData.orderId = orderId
    * print orderId
    * print fulfillmentOrderId
    * def dbResult = dbUtils.insert_mongoDB(MONGO_URI, 'oslm_mp', 'shipment_details', payload)
    * print dbResult
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(50000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "shipmentStatus while retrieve the data form db>>>>>>>>>>>"  +dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


     # OSS kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS

    #* sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(2000)
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
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,EDM_TOPIC_MKPL)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(2000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records
    * print records[0].fulfillmentOrderNumber
    * print records.fulfillmentOrderNumber
    * print records[0].events[0].eventId
    #* match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'













