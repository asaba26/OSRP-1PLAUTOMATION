Feature: AKS migration  for marketplace retuns flow - Shipement Flow 

@AKS_Regression_UPS 
Scenario: Validating E2E refund  shipment flow and verifying mandatory fields

## post payload on OSPK-OSLM-SHIPPING-LABEL-QA

* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Order') { 'payloadName' : 'Create_Shipment_Label' }
* def orderId = createOrder.orderId
* def fulfillmentOrderId = createOrder.fulfillmentOrderId
* def referenceNumber = createOrder.referenceNumber
* testData.orderId = orderId
* testData.fulfillmentOrderId = fulfillmentOrderId
* testData.referenceNumber = referenceNumber

#Retrive message from kafka OSLM-CARRIER-SHIMENT-QA
   * def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSLM_ORDER')
   * def results = result.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * match ourrecord[0].shipment[0].carrier == 'UPS'
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'
   * def eventTS = ourrecord[0].event.eventTs
   * print eventTS
   * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
   * def DateFormate = commonUtils.DateFormat(eventTS)
   * print DateFormate
   * match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

# retrive order details from DB wine_shipping_details
 * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].eventId == 'CREATE_SHIPMENT_LABELS'
   * match dbResults[0].transportationCharge == '#notnull'
   * match dbResults[0].serviceOptionsCharge == '#notnull'
   * match dbResults[0].negotiatedRateCharges == '#notnull'
   * match dbResults[0].carrier == 'UPS'
   * match dbResults[0].totalCharge == '#notnull'
   * match dbResults[0].shipToName == 'Wine Automation'

#Generate payload to post on OSDT-ORDER-EVENTS-QA

* string payload = read('classpath:payloads/Wine/Wine_Payment_completed.json')
* print payload
* set testData.orderId = orderId
* set testData.fulfillmentOrderId = fulfillmentOrderId
* def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@payment_completed')

# retrive order details from market place DB shipment_details
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].carrier == 'UPS'
* match dbResults[0].orderType == 'wine'
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-CREATED'
   * def createdts = dbResults[0].createdTS
   * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
   * def DateFormate = commonUtils.DateFormat(createdts)
   * print DateFormate
   * match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

# Printing shipment delivered status afetr one min
* def sleep = function(pause){ java.lang.Thread.sleep(pause) }
* sleep(60000)
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].carrier == 'UPS'
* match dbResults[0].orderType == 'wine'
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-DELIVERED'
   * def createdts = dbResults[0].createdTS
   * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
   * def DateFormate = commonUtils.DateFormat(createdts)
   * print DateFormate
   * match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"


#Retrive message from kafka OSLM_WINE_SHIPMENTS_STATUS_QA

   * def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSS_DATA')
   * def results = result.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
  # * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * def carrier = get ourrecord[0].data.carrier
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].orderType == 'wine'
   * match ourrecord[0].data.carrier == 'UPS'
   * def shipmentid = get ourrecord[0].event.id
   * match shipmentid == 'SHIPMENT-DELIVERED'
   * def events = get ourrecord[0].event.eventTs
   * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
   * def DateFormate = commonUtils.DateFormat(events)
   * print DateFormate
   * match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
 
   
#Retrive message from kafka ECOM-OSCO-OSS-ORDER-EVENT-TOPIC-QA
   * def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@EDM_DATA')
   * def results = result.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * def carrier = get ourrecord[0].data.carrier
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].orderType == 'wine'
   * match ourrecord[0].data.carrier == 'UPS'
   * def shipmentid = get ourrecord[0].event.id
   * match shipmentid == 'SHIPMENT-DELIVERED'

 @AKS_Regression_USPS
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
# post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Order') { 'payloadName' : 'ShipmentLable_FEDEX' }
* def orderId = createOrder.orderId
* def fulfillmentOrderId = createOrder.fulfillmentOrderId
* def referenceNumber = createOrder.referenceNumber
* testData.orderId = orderId
* testData.fulfillmentOrderId = fulfillmentOrderId
* testData.referenceNumber = referenceNumber

#Retrive message from kafka OSLM-CARRIER-SHIMENT-QA
* def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSLM_ORDER')
* def results = result.allRecords
* print results
* print orderId
* def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
* set testData.kafkaMessages = records
* def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
* print ourrecord
* match ourrecord[0].activityId == testData.activityId
* match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'
* match ourrecord[0].shipment[0].carrier == 'FEDEX'
* def eventTS = ourrecord[0].event.eventTs
* print eventTS
* def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
* def DateFormate = commonUtils.DateFormat(eventTS)
* print DateFormate
* match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

# retrive order details from DB wine_shipping_details
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].eventId == 'CREATE_SHIPMENT_LABELS'
* match dbResults[0].transportationCharge == '#notnull'
* match dbResults[0].serviceOptionsCharge == '#notnull'
* match dbResults[0].negotiatedRateCharges == '#notnull'
* match dbResults[0].totalCharge == '#notnull'
# * match dbResults[0].shipToName == 'Wine Automation'
* karate.abort()

#Generate payload to post on OSDT-ORDER-EVENTS-QA

* string payload = read('classpath:payloads/Wine/Wine_Payment_completed.json')
* print payload
* set testData.orderId = orderId
* set testData.fulfillmentOrderId = fulfillmentOrderId
* def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@payment_completed')

# retrive order details from market place DB shipment_details
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].carrier == 'FEDEX'
* match dbResults[0].orderType == 'wine'
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-CREATED'
* def createdts = dbResults[0].createdTS
* def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
* def DateFormate = commonUtils.DateFormat(createdts)
* print DateFormate
* match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"

# Printing shipment delivered status afetr one min
* def sleep = function(pause){ java.lang.Thread.sleep(pause) }
* sleep(60000)
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].carrier == 'FEDEX'
* match dbResults[0].orderType == 'wine'
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-DELIVERED'
* def createdts = dbResults[0].createdTS
* def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
* def DateFormate = commonUtils.DateFormat(createdts)
* print DateFormate
* match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"


#Retrive message from kafka OSLM_WINE_SHIPMENTS_STATUS_QA

* def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSS_DATA')
* def results = result.allRecords
* print results
* print orderId
* def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
# * set testData.kafkaMessages = records
* def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
* print ourrecord
* def carrier = get ourrecord[0].data.carrier
* match ourrecord[0].activityId == testData.activityId
* match ourrecord[0].orderType == 'wine'
* match carrier == 'FEDEX'
* def shipmentid = get ourrecord[0].event.id
* match shipmentid == 'SHIPMENT-DELIVERED'
* def events = get ourrecord[0].event.eventTs
* def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
* def DateFormate = commonUtils.DateFormat(events)
* print DateFormate
* match DateFormate == "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"


#Retrive message from kafka ECOM-OSCO-OSS-ORDER-EVENT-TOPIC-QA
* def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@EDM_DATA')
* def results = result.allRecords
* print results
* print orderId
* def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
* set testData.kafkaMessages = records
* def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
* print ourrecord
* def carrier = get ourrecord[0].data.carrier
* match ourrecord[0].activityId == testData.activityId
* match ourrecord[0].orderType == 'wine'
* match carrier == 'FEDEX'
* def shipmentid = get ourrecord[0].event.id
* match shipmentid == 'SHIPMENT-DELIVERED'