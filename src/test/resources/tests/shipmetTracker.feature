
Feature: Shipment Tracker Scenarios for MKPL



  @Shipment_Tracker
  Scenario: Push a sample Kafka message to the OCMF topic with an empty carrier name
            and a valid tracker number, see if we have the right one chosen,
             and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ShipmentTrackerEmptyCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'ShipmentTrackerEmptyCarrier' }
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
    * match dbResults[0].carrier == 'UPS'


  @Shipment_Tracker
  Scenario: Push a sample Kafka message to the OCMF topic with an incorrect carrier name
            and a valid tracker number,
            see if we have the right one chosen, and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ShipmentTrackerIncorrectCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'ShipmentTrackerIncorrectCarrier' }
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
    * match dbResults[0].carrier == 'UPS'

  @Shipment_Tracker
  Scenario: Push a sample Kafka message to the OCMF topic with a null carrier name and
              a valid tracker number, see if we have the right one chosen,
             and save it in the shipment_details collection.
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ShipmentTrackerNullCarrier.json')
    * def testData = testDataAll

    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@Reschedule') { 'payloadName' : 'ShipmentTrackerNullCarrier' }
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
    * print "carrier while push the data first time>>>>>>>>>>>" + dbResults[0].carrier
    * match dbResults[0].carrier == 'UPS'


  @Shipment_Tracker
  Scenario: Place Shipment End to End When Carrier is UPS
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

    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(150000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


    # OSS kafka validation

    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    * sleep(150000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records
    * print records.fulfillmentOrderNumber
    * print records[0].fulfillmentOrderNumber
    * print "orderShipmentStatus in OSS Kafka >>>>>>>"+ records[0].event.id
    * print "order type in OSS Kafka >>>>>>>"+ records[0].orderType
    * match records[0].orderType == 'marketplace'
    #* match records[0].event.id == 'SHIPMENT-DELIVERED'


  @Shipment_Tracker
  Scenario: Place Shipment End to End when carrier is UPS along with EDM Validation
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
    #* sleep(15000)
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * sleep(500000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while Fetching the data from updated Database ! >>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-DELIVERED'


    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records
    * print records[0].fulfillmentOrderNumber
    * print records.fulfillmentOrderNumber
    * print records[0].events[0].eventId
    #* match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'



    # OSS kafka validation

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







  @Shipment_Tracker
  Scenario: Place Shipment when carrier is UPS and Shipment Message having missing field
    # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ShipmentTrackerMissingFields.json')
    * def testData = testDataAll
    * print testData
    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@ShipmentMissingFields')  { 'payloadName' : 'ShipmentTrackerMissingFields' }
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
    * print "NotFound this shipment details in db ">>>>>>>>>>>" + dbResults[0].orderNumber




  @Shipment_Tracker
  Scenario: Place Shipment when carrier is UPS and Invalid Tracking number
    # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/InvalidTrackingNumber.json')
    * def testData = testDataAll
    * print testData
    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@ShipmentMissingFields')  { 'payloadName' : 'InvalidTrackingNumber' }
    * def orderId = createOrder.orderId
    * set testData.orderId = orderId
    * def fulfillmentOrderId = createOrder.fulfillmentOrderId
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * print testData.orderId
    #* sleep(15000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * sleep(15000)
    * print dbResults
    * print "shipmentStatus while push the data first time>>>>>>>>>>>" + dbResults[0].shipmentStatus
    * match dbResults[0].shipmentStatus == 'SHIPMENT-CREATED'
    * def trackingNumber = testData.shipment.trackingNumber
    * call read('classpath:services/UPSApi.feature@triggerUPSInvalid')
    * def Response = response
    * print "UPS API Response>>>>>>>>>>>" + Response.response.errors[0].message
    * match Response.response.errors[0].message == 'Invalid inquiry number'


  @Shipment_Tracker
  Scenario: Place Shipment End to End when carrier is UPS and created date before 15 days back
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ShipmentTracker_IgnoredScnario.json')
    * def testData = testDataAll
    #Generate shipment for MP_SHIPMENT_QA
    * def createOrder = call read('classpath:modules/createOrder.feature@IgonredEvents') { 'payloadName' : 'ShipmentTracker_IgnoredScnario' }
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
    * sleep(150000)
    * def dbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print "shipmentStatus while changed  the data created date  time>>>>>>>>>>>" + dbResult[0].shipmentStatus
    * match dbResult[0].shipmentStatus == 'SHIPMENT-IGNORED'


  @Shipment_Tracker
  Scenario: SHIPMENT-DELIVERY-MISSED Events
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
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print "OrderShipmentStatus in OSS Kafka  is not appears >>>>>>>"+ records[0].event.id


  @Shipment_Tracker
  Scenario: When Order type from marketplace
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'



  @Shipment_Tracker
  Scenario: Track the Shipment from OSS to EDM when Order type from marketplace.
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print records[0].events[0].eventId
    * match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'





  @Shipment_Tracker
  Scenario: Reassign the same order number with new tracking number
    * def testDataAll = read('classpath:payloads/ShipmentTracker.json')
    * def testData = testDataAll
    * def testDataAllnew = read('classpath:payloads/NewShipmentTracker.json')
    * def testDatanew = testDataAllnew
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'



    # new tracking Number validation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * print testDatanew.trackingNumber
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * set testDatanew.trackingNumber = '7798339175'
    * print testDatanew.trackingNumber
    * json payload = read('classpath:payloads/NewShipmentTracker.json')
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


  @Shipment_Tracker
  Scenario: Reassign the same order number with new tracking number and track till EDM topic
    * def testDataAll = read('classpath:payloads/ShipmentTracker.json')
    * def testData = testDataAll
    * def testDataAllnew = read('classpath:payloads/NewShipmentTracker.json')
    * def testDatanew = testDataAllnew
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print records[0].events[0].eventId
    * match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'

    # new tracking Number validation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
    * print testDatanew.trackingNumber
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * set testDatanew.trackingNumber = '7798339175'
    * print testDatanew.trackingNumber
    * json payload = read('classpath:payloads/NewShipmentTracker.json')
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print records[0].events[0].eventId
    * match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'





  @Shipment_Tracker
  Scenario: Place Shipment Forcefully into db after by-pass the OCMF Topic
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ManualEntry.json')
    * def testData = testDataAll
        # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
     #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def generatePayload = call read('classpath:services/generatePayload.feature@Manualupdate') { 'payloadName' : 'ManualEntry' }
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
    * sleep(500000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


  @Shipment_Tracker
  Scenario: Place Shipment Forcefully into db after by-pass the OCMF Topic and track from OSS to EDM
     # set test data for shipment tracker
    * def testDataAll = read('classpath:payloads/ManualEntry.json')
    * def testData = testDataAll
        # db valiadation
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * print testData.orderId
     #Generate payload for order creation and post on EMOM order topic
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * def generatePayload = call read('classpath:services/generatePayload.feature@Manualupdate') { 'payloadName' : 'ManualEntry' }
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
    * sleep(500000)
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',testData.orderId)
    * print dbResults
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
    * match records[0].orderType == 'marketplace'
    * match records[0].event.id == 'SHIPMENT-DELIVERED'


    # EDM kafka validation
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? EDM_KAFKA_SERVERS : EDM_KAFKA_SERVERS
    * sleep(500000)
    * def results = kafkaUtils.retrieveMessagesFromKafkaUsingStream(kafka_server,EDM_TOPIC)
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')]")
    * sleep(150000)
    * set testData.kafkaMessages = records
    * def records = karate.jsonPath(results, "$.[?(@.key=='" + fulfillmentOrderId + "')].value")
    * print records[0].fulfillmentOrderNumber
    * print records[0].events[0].eventId
    * match records[0].events[0].eventId == 'SHIPMENT-DELIVERED'














