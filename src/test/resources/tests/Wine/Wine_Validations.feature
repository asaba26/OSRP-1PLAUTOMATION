
@Wine_Validation
Feature: Validating wine scenarios

@Wine_Landing @Regular_API @wine-29 @wine-166 @Regression
Scenario: Wine Landing API

* def payload_landing = read('classpath:payloads/Wine/Wine_Shipment_Landing_Payload.json')
* print payload_landing
* call read('classpath:modules/Wine/Wine_Endpoints.feature@landing') { 'payload' : '#(payload_landing)' }

@shipping_rate @Regular_API @wine-166 @Regression
Scenario: Wine shipping rate api
* def payload_shippingrate = read('classpath:payloads/Wine/Wine_Shipping_Rate.json')
* print payload_shippingrate
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Shipping_Rate') { 'payload' : '#(payload_shippingrate)' }

@Wine_Retrieving_Shipment_Label @Regular_API  @wine-123 @Regression
Scenario: Wine api to retrieve shipment lable

* def payload_retrive_shipmentlable = read('classpath:payloads/Wine/Retrieving_Shipmentlable_Payload.json')
* print payload_retrive_shipmentlable
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Retrieve_Shipmentlabel') { 'payload' : '#(payload_retrive_shipmentlable)' }

@Wine_DPA_Promisedate @Regular_API @wine-30 @wine-166 @Regression
Scenario: Wine DPA promise date 
* def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
* print payload_DPA_Promisedate
* call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }
 @wine-166
Scenario: Wine shipping rate api for number of bottles are ther in the wine_shipping_promise_confis collection
      * def payload_shippingrate = read('classpath:payloads/Wine/Shipping_Rate_noofbottles_exists.json')
      * print payload_shippingrate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@Shipping_Rate') { 'payload' : '#(payload_shippingrate)' }
 @wine-166
Scenario: Wine DPA promise date for number of bottles are ther in the wine_shipping_promise_confis collection
* def payload_DPA_Promisedate = read('classpath:payloads/Wine/DPA_Promise_Noofbottles_exists.json')
* print payload_DPA_Promisedate
* call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }

   @storeTimeZone_America/Los_Angeles   @Wine_Promisedate_storeTimeZone @wine-191
   Scenario: Checking error response by giving the invalid delivery zipcode

      * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
      * set payload_DPA_Promisedate.storeTimeZone = 'America/Los_Angeles'
      * print payload_DPA_Promisedate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }

   @storeTimeZone_America/Denver   @Wine_Promisedate_storeTimeZone @wine-191
   Scenario: Checking error response by giving the invalid delivery zipcode

      * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
      * set payload_DPA_Promisedate.storeTimeZone = 'America/Denver'
      * print payload_DPA_Promisedate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }

   @storeTimeZone_America/New_York   @Wine_Promisedate_storeTimeZone @wine-191
   Scenario: Checking error response by giving the invalid delivery zipcode

      * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
      * set payload_DPA_Promisedate.storeTimeZone = 'America/New_York'
      * print payload_DPA_Promisedate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }


   @storeTimeZone_America/Phoenix   @Wine_Promisedate_storeTimeZone @wine-191
   Scenario: Checking error response by giving the invalid delivery zipcode

      * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
      * set payload_DPA_Promisedate.storeTimeZone = 'America/Phoenix'
      * print payload_DPA_Promisedate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }

   @storeTimeZone_America/Chicago   @Wine_Promisedate_storeTimeZone @wine-191
   Scenario: Checking error response by giving the invalid delivery zipcode

      * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
      * set payload_DPA_Promisedate.storeTimeZone = 'America/Chicago'
      * print payload_DPA_Promisedate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }

   @storeTimeZone_Pacific/Honolulu   @Wine_Promisedate_storeTimeZone @wine-191
   Scenario: Checking error response by giving the invalid delivery zipcode

      * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
      * set payload_DPA_Promisedate.storeTimeZone = 'Pacific/Honolulu'
      * print payload_DPA_Promisedate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }
   @storeTimeZone_America/Anchorage   @Wine_Promisedate_storeTimeZone @wine-191
   Scenario: Checking error response by giving the invalid delivery zipcode

      * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
      * set payload_DPA_Promisedate.storeTimeZone = 'America/Anchorage'
      * print payload_DPA_Promisedate
      * call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }
   

 @EDM_payment_Completd @wine-129
Scenario: Validating Shipment status to EDM Shipment delivered

# post payload on OSPK-OSLM-SHIPPING-LABEL-QA
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

# retrive order details from DB wine_shipping_details
 * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_details','orderNumber',orderId)
* print dbResults

#Generate payload to post on OSDT-ORDER-EVENTS-QA

* string payload = read('classpath:payloads/Wine/Wine_Payment_completed.json')
* print payload
* set testData.orderId = orderId
* set testData.fulfillmentOrderId = fulfillmentOrderId 
* def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@payment_completed')

# retrive order details from market place DB shipment_details for shipmentStatus is shipment created
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
* def Shipmentstatus = dbResults[0].shipmentStatus
* def ordertype = dbResults[0].orderType
* match Shipmentstatus == 'SHIPMENT-CREATED'
* match ordertype == 'wine'

# Printing shipment delivered status afetr one min for and verify shipmentStatus is shipment delivered
* def sleep = function(pause){ java.lang.Thread.sleep(pause) }
* sleep(60000)
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
* def Shipmentstatus = dbResults[0].shipmentStatus
* def ordertype = dbResults[0].orderType
* match Shipmentstatus == 'SHIPMENT-DELIVERED'
* match ordertype == 'wine'


#Retrive message from kafka ECOM-OSCO-OSS-ORDER-EVENT-TOPIC-QA and verify shipmentStatus is shipment delivered
   * def Message = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSS_DATA')
   * def results = Message.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * def shipmentid = get ourrecord[0].event.id
   * match ourrecord[0].orderType == 'wine'
   * match shipmentid == 'SHIPMENT-DELIVERED'

#Retrive message from kafka OSLM_WINE_SHIPMENTS_STATUS_QA and verify shipmentStatus is shipment delivered
   * def Message = call read('classpath:services/Wine/RetrivedatafromKafka.feature@EDM_DATA')
   * def results = Message.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
     * def shipmentid = get ourrecord[0].event.id
   * match ourrecord[0].orderType == 'wine'
   * match shipmentid == 'SHIPMENT-DELIVERED'
   
 @single_Shipment @wine-77 @shipping_Label @Regression
 Scenario: creating shipment label with single shipment in the payload

# post payload on OSPK-OSLM-SHIPPING-LABEL-QA
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
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'
   * def reference_id = ourrecord[0].shipment[0].id
   * print reference_id
   * match reference_id == referenceNumber

# retrive order details from DB wine_shipping_details
 * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].eventId == 'CREATE_SHIPMENT_LABELS'
* def reference_id = dbResults[0]._id
* print reference_id
* match reference_id == referenceNumber
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
* def reference_id = dbResults[0]._id
* print reference_id
* match reference_id == referenceNumber

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
* def reference_id = dbResults[0]._id
* print reference_id
* match reference_id == referenceNumber

#Retrive message from kafka ECOM-OSCO-OSS-ORDER-EVENT-TOPIC-QA
   * def Message = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSS_DATA')
   * def results = Message.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * def carrier = get ourrecord[0].data.carrier
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].orderType == 'wine'
   * match carrier == 'UPS'
   * def shipmentid = get ourrecord[0].event.id
   * match shipmentid == 'SHIPMENT-DELIVERED'
   * def reference_id = ourrecord[0].data.shipmentId
   * print reference_id
   * match reference_id == referenceNumber
   

#Retrive message from kafka OSLM_WINE_SHIPMENTS_STATUS_QA
   * def Message = call read('classpath:services/Wine/RetrivedatafromKafka.feature@EDM_DATA')
   * def results = Message.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * def carrier = get ourrecord[0].data.carrier
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].orderType == 'wine'
   * match carrier == 'UPS'
   * def shipmentid = get ourrecord[0].event.id
   * match shipmentid == 'SHIPMENT-DELIVERED'
   * def reference_id = ourrecord[0].data.shipmentId
   * print reference_id
   * match reference_id == referenceNumber

@twoshipments @wine-77 @shipping_Label @Regression
Scenario: creating shipment label with two shipments in the payload

# post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Order') { 'payloadName' : 'Create_ShipmentLable_Twoshipments' }
* def orderId = createOrder.orderId
* def fulfillmentOrderId = createOrder.fulfillmentOrderId
* def referenceNumber = createOrder.referenceNumber
* def referenceNumber1 = createOrder.referenceNumber1
* testData.orderId = orderId
* testData.fulfillmentOrderId = fulfillmentOrderId
* testData.referenceNumber = referenceNumber
* testData.referenceNumber1 = referenceNumber1

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
   # first shipment
   * match ourrecord[0].shipment[0].id == referenceNumber
   # Second shipment
   * match ourrecord[0].shipment[1].id  == referenceNumber1
  
 # retrive order details from DB wine_shipping_details
 * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_details','orderNumber',orderId)
* print dbResults
# first shipment
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].eventId == 'CREATE_SHIPMENT_LABELS'
* def firstshipment_ID = dbResults[0]._id
* print firstshipment_ID
 * match firstshipment_ID == referenceNumber
 # Second shipment
* match dbResults[1].activityId == testData.activityId
* match dbResults[1].eventId == 'CREATE_SHIPMENT_LABELS'
* def secondshipment_ID = dbResults[1]._id
* print secondshipment_ID
* match secondshipment_ID == referenceNumber1
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
# first shipment
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].carrier == 'UPS'
* match dbResults[0].orderType == 'wine'
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-CREATED'
* def firstshipment_ID = dbResults[0]._id
* print firstshipment_ID
 * match firstshipment_ID == referenceNumber
# Second shipment
* match dbResults[1].activityId == testData.activityId
* match dbResults[1].carrier == 'UPS'
* match dbResults[1].orderType == 'wine'
* def Shipmentstatus = dbResults[1].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-CREATED'
* def secondshipment_ID = dbResults[1]._id
* print secondshipment_ID
* match secondshipment_ID == referenceNumber1

# Printing shipment delivered status afetr one min
* def sleep = function(pause){ java.lang.Thread.sleep(pause) }
* sleep(60000)
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
# first shipment
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].carrier == 'UPS'
* match dbResults[0].orderType == 'wine'
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-DELIVERED'
* def firstshipment_ID = dbResults[0]._id
* print firstshipment_ID
 * match firstshipment_ID == referenceNumber
# Second shipment
* match dbResults[1].activityId == testData.activityId
* match dbResults[1].carrier == 'UPS'
* match dbResults[1].orderType == 'wine'
* def Shipmentstatus = dbResults[1].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-DELIVERED'
* def secondshipment_ID = dbResults[1]._id
* print secondshipment_ID
* match secondshipment_ID == referenceNumber1


#Retrive message from kafka ECOM-OSCO-OSS-ORDER-EVENT-TOPIC-QA
   * def Message = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSS_DATA')
   * def results = Message.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
    # first shipment
   * def carrier = get ourrecord[0].data.carrier
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].orderType == 'wine'
   * match carrier == 'UPS'
   * def Eventtid = get ourrecord[0].event.id
   * match Eventtid == 'SHIPMENT-DELIVERED'
   * def firstshipment_ID = ourrecord[0].data.shipmentId
   * print firstshipment_ID
  * match firstshipment_ID == referenceNumber
   # Second shipment
   * def carrier = get ourrecord[1].data.carrier
   * match ourrecord[1].activityId == testData.activityId
   * match ourrecord[1].orderType == 'wine'
   * match carrier == 'UPS'
   * def Eventtid = get ourrecord[1].event.id
   * match Eventtid == 'SHIPMENT-DELIVERED'
   * def secondshipment_ID = ourrecord[1].data.shipmentId
   * print secondshipment_ID
   * match secondshipment_ID == referenceNumber1

#Retrive message from kafka OSLM_WINE_SHIPMENTS_STATUS_QA
   * def Message = call read('classpath:services/Wine/RetrivedatafromKafka.feature@EDM_DATA')
   * def results = Message.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * def carrier = get ourrecord[0].data.carrier
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].orderType == 'wine'
   * match carrier == 'UPS'
   * def shipmentid = get ourrecord[0].event.id
   * match shipmentid == 'SHIPMENT-DELIVERED'
   # first shipment
   * def carrier = get ourrecord[0].data.carrier
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].orderType == 'wine'
   * match carrier == 'UPS'
   * def Eventtid = get ourrecord[0].event.id
   * match Eventtid == 'SHIPMENT-DELIVERED'
   * def firstshipment_ID = ourrecord[0].data.shipmentId
   * print firstshipment_ID
   * match firstshipment_ID == referenceNumber
   # Second shipment
   * def carrier = get ourrecord[1].data.carrier
   * match ourrecord[1].activityId == testData.activityId
   * match ourrecord[1].orderType == 'wine'
   * match carrier == 'UPS'
   * def Eventtid = get ourrecord[1].event.id
   * match Eventtid == 'SHIPMENT-DELIVERED'
    * def secondshipment_ID = ourrecord[1].data.shipmentId
   * print secondshipment_ID
   * match secondshipment_ID == referenceNumber1
 
 @wine-146 @Functionconfig @post @Regression @Config_Service
Scenario: wine shippig functional config Post method
* def Functional_Config = read('classpath:payloads/Wine/Funconfig_payload.json')
* print Functional_Config
* def cwd = Functional_Config.carrierDeliveryWorkingDays
* def ctw = Functional_Config.carrierTransitWorkingDays
* def cpwd = Functional_Config.carrierPickupWorkingDays
* def coh = Functional_Config.carrierObservedHolidays
* def WfcNode = Functional_Config.wfcNode
* def WfcCEC = Functional_Config.wfcCapacityExceptionCalendar
* def OCT = Functional_Config.orderCutoffTime
* def WfcHC = Functional_Config.wfcHolidayCalendar
* def WfcOC = Functional_Config.wfcOperatingCalendar
* def LT = Functional_Config.leadTime
* def WfcTZ = Functional_Config.wfcTimeZone
* def CCT = Functional_Config.cancelCutOffTime
* def ECT = Functional_Config.editCutoffTime
* def Carrier = Functional_Config.carrier
* def ProccessingTime = Functional_Config.processingTimeInMinutes
* call read('classpath:modules/Wine/Wine_Endpoints.feature@FunConfig_Post') { 'payload' : '#(Functional_Config)' } 

* def dbUtils = Java.type('com.mkpl.utils.DbUtils')

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierDeliveryWorkingDays')
* print dbResults
* match dbResults[0].value == cwd

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierTransitWorkingDays')
* print dbResults
* match dbResults[0].value == ctw

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierPickupWorkingDays')
* print dbResults
* match dbResults[0].value == cpwd

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierObservedHolidays')
* print dbResults
* match dbResults[0].value == coh

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','capacityExceptionCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcCEC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','orderCutoffTime_5799')
* print dbResults
* match dbResults[0].value == OCT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcHolidayCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcHC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcOperatingCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcOC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','leadTime_5799')
* print dbResults
* match dbResults[0].value == LT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcTimeZone_5799')
* print dbResults
* match dbResults[0].value == WfcTZ

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','cancelCutoffTimeInMinutes_5799')
* print dbResults
* match dbResults[0].value == CCT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','processingTimeInMinutes_5799')
* print dbResults
* match dbResults[0].value == ProccessingTime





@wine-146 @Functionconfig @get @Regression @Config_Service
Scenario: Retrieving data from wine shippig functional configs

* call read('classpath:modules/Wine/Wine_Endpoints.feature@FunConfig_get')
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierDeliveryWorkingDays')
* print dbResults
* match dbResults[0].value == cwd

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierTransitWorkingDays')
* print dbResults
* match dbResults[0].value == ctw

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierPickupWorkingDays')
* print dbResults
* match dbResults[0].value == cpwd


* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierObservedHolidays')
* print dbResults
* match dbResults[0].value == coh

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','capacityExceptionCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcCEC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','orderCutoffTime_5799')
* print dbResults
* match dbResults[0].value == OCT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcHolidayCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcHC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcOperatingCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcOC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','leadTime_5799')
* print dbResults
* match dbResults[0].value == LT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcTimeZone_5799')
* print dbResults
* match dbResults[0].value == WfcTZ

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','cancelCutoffTimeInMinutes_5799')
* print dbResults
* match dbResults[0].value == CCT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','processingTimeInMinutes_5799')
* print dbResults
* match dbResults[0].value == ProccessingTime

@TransitDays_Insert @Insert @Config_Service
Scenario: Inserting transit days

* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_TransitDays') 
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','2525')
* print dbResults
* match response.response.message == 'Data Upload in progress in background'



@ShippingData_Insert @Insert @Config_Service
Scenario: Inserting shipping data

* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_ShippingData') 
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','4747')
* print dbResults
* match response.response.message == 'Data Upload in progress in background'

@PackageRates_Insert @Insert @Config_Service
Scenario: Inserting Package data

* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_PackageRates') 
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_package_rates_configs','wfcNode','2525')
* print dbResults
* match response.response.message == 'Data Upload in progress in background'

@Processing_Day @Regression
Scenario: Validating processing date when order placed before and after cut off time
* def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
* print payload_DPA_Promisedate
* call read('classpath:modules/Wine/Wine_Endpoints.feature@dpa_Promisedate') { 'payload' : '#(payload_DPA_Promisedate)' }
* def commonutils = Java.type('com.mkpl.utils.CommonUtils3')
* def orderPlacingtime = commonutils.CurrentPSTtime()
* print orderPlacingtime
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','cancelCutoffTimeInMinutes_5799')
* print dbResults
* def CancelTime = dbResults[0].value
* print CancelTime 
* def commonutils = Java.type('com.mkpl.utils.CommonUtils')
* def CCTInt = commonutils.convetStringToInteger(CancelTime)
* print CCTInt
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','processingTimeInMinutes_5799')
* print dbResults
* def ProccessingTime = dbResults[0].value
* print ProccessingTime
* def commonutils = Java.type('com.mkpl.utils.CommonUtils')
* def ProTimeInt = commonutils.convetStringToInteger(ProccessingTime)
* print ProTimeInt
* def MinutesAdd = CCTInt+ProTimeInt
* print MinutesAdd
* def commonutils = Java.type('com.mkpl.utils.CommonUtils3')
* def orderprocessingtime = commonutils.addMinutesToPSTtime(MinutesAdd)
* print orderprocessingtime 

* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','orderCutoffTime_5799')
* print dbResults
* def Stagebytime = dbResults[0].value
* print Stagebytime

* if (orderprocessingtime < Cutofftime) karate.call('classpath:tests/Wine/Wine_Validations.feature@Same_Day')
* if (orderprocessingtime > Cutofftime) karate.call('classpath:tests/Wine/Wine_Validations.feature@Next_Day')

@Same_Day
Scenario: Getting sameday as order processing day
* def commonutils = Java.type('com.mkpl.utils.CommonUtils3')
* def same_day = commonutils.CurrentPSTdate()
* print same_day

@Next_Day
Scenario: Printing Next working day as order processing day
* print "next working day"


@Functional_Audit @Config_Service
Scenario: Validating Audit collection DB for functional configs
* def Functional_Config = read('classpath:payloads/Wine/Funconfig_payload.json')
* print Functional_Config
* def cwd = Functional_Config.carrierDeliveryWorkingDays
* def ctw = Functional_Config.carrierTransitWorkingDays
* def cpwd = Functional_Config.carrierPickupWorkingDays
* def coh = Functional_Config.carrierObservedHolidays
* def WfcNode = Functional_Config.wfcNode
* def WfcCEC = Functional_Config.wfcCapacityExceptionCalendar
* def OCT = Functional_Config.orderCutoffTime
* def WfcHC = Functional_Config.wfcHolidayCalendar
* def WfcOC = Functional_Config.wfcOperatingCalendar
* def LT = Functional_Config.leadTime
* def WfcTZ = Functional_Config.wfcTimeZone
* def Original_CCT = Functional_Config.cancelCutOffTime
* def ECT = Functional_Config.editCutoffTime
* def Carrier = Functional_Config.carrier
* def original_ProccessingTime = Functional_Config.processingTimeInMinutes
* call read('classpath:modules/Wine/Wine_Endpoints.feature@FunConfig_Post') { 'payload' : '#(Functional_Config)' } 
#Checking the data in DB wine_shipping_functional_config collection 
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierDeliveryWorkingDays')
* print dbResults
* match dbResults[0].value == cwd

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierTransitWorkingDays')
* print dbResults
* match dbResults[0].value == ctw

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierPickupWorkingDays')
* print dbResults
* match dbResults[0].value == cpwd

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','carrierObservedHolidays')
* print dbResults
* match dbResults[0].value == coh

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','capacityExceptionCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcCEC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','orderCutoffTime_5799')
* print dbResults
* match dbResults[0].value == OCT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcHolidayCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcHC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcOperatingCalendar_5799')
* print dbResults
* match dbResults[0].value == WfcOC

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','leadTime_5799')
* print dbResults
* match dbResults[0].value == LT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','wfcTimeZone_5799')
* print dbResults
* match dbResults[0].value == WfcTZ

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','cancelCutoffTimeInMinutes_5799')
* print dbResults
* match dbResults[0].value == Original_CCT

* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key','processingTimeInMinutes_5799')
* print dbResults
* match dbResults[0].value == original_ProccessingTime

# checking the values in wine_shipping_configs_audit before updating
 * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode', WfcNode)
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.configType == 'functionalConfigs'

 #Checking wine_shipping_configs_audit for updated processing value 
* set Functional_Config.processingTimeInMinutes = '10'
* set Functional_Config.cancelCutOffTime = '30'
* call read('classpath:modules/Wine/Wine_Endpoints.feature@FunConfig_Post') { 'payload' : '#(Functional_Config)' }
* def Updated_ProcessingTime = payload.processingTimeInMinutes
* def Updated_CCT = payload.cancelCutOffTime
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key', 'processingTimeInMinutes_5799')
* print dbResults
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_functional_configs','key', 'cancelCutoffTimeInMinutes_5799')
* print dbResults


* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode', WfcNode)
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.configType == 'functionalConfigs'
* match ourrecord.updatedTS == '#notnull'
* match ourrecord.updatedBy == 'Automation'
# validating the processing time previous and next value
* def PreviousProcessing_Vlaue =  ourrecord.functionalConfigs[0].processingTimeInMinutes_5799.prevValue
* print PreviousProcessing_Vlaue
* def NewProcessing_Value =  ourrecord.functionalConfigs[0].processingTimeInMinutes_5799.newValue
* print NewProcessing_Value
* print original_ProccessingTime
* print Updated_ProcessingTime
* match PreviousProcessing_Vlaue == original_ProccessingTime
* match NewProcessing_Value == Updated_ProcessingTime


@Package_Audit @Config_Service
Scenario: Validating updating package rates in audit collection
# when we insert package rates first time
* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_PackageRates') 
* match response.response.message == 'Data Upload in progress in background'
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_package_rates_configs','wfcNode','2525')
* print dbResults
* def db_wfc = dbResults[0].wfcNode
* def db_id = dbResults[0]._id
* def db_packagerates = dbResults[0].packageRates
* print db_packagerates
* print db_wfc
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode','2525')
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.configType == 'packageConfigs'
* match ourrecord.updatedTS == '#notnull'
* match ourrecord.updatedBy == 'Automation'


# update the package rates in the excel and checkin the audit collection
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Updated_PackageRates') 
* match response.response.message == 'Data Upload in progress in background'
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_package_rates_configs','wfcNode','2525')
* print dbResults
* def db_wfc = dbResults[0].wfcNode
* def db_id = dbResults[0]._id
* def db_packagerates = dbResults[0].packageRates
* print db_packagerates
* print db_wfc
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode','2525')
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.configType == 'packageConfigs'
* match ourrecord.updatedTS == '#notnull'
* match ourrecord.updatedBy == 'Automation'

@shippingFee_audit @Config_Service
Scenario: validating audit collection for shipping fee
#TC01: Inserting the shipping fee data into the DB for the first time
* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_ShippingData') 
* match response.response.message == 'Data Upload in progress in background'
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','4747')
* print dbResults
* def db_wfc = dbResults[0].wfcNode
* def db_id = dbResults[0]._id
* def db_shippingConfig = dbResults[0].shippingConfigs
* print db_shippingConfig
* print db_wfc
* match dbResults[0].shippingConfigs[0].shipMethod == 'REGULAR'
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode','4747')
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.shippingConfigs.shipMethod == 'REGULAR'
* match ourrecord.configType == 'shippingFeeConfigs'
* match ourrecord.updatedTS == '#notnull'
* match ourrecord.updatedBy == 'Automation'
#Tc02: Verifying audit collection after inserting the updated shippingfee data
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Updated_ShippingData') 
* match response.response.message == 'Data Upload in progress in background'
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','4747')
* print dbResults
* def db_wfc = dbResults[0].wfcNode
* def db_id = dbResults[0]._id
* def db_shippingConfig = dbResults[0].shippingConfigs
* print db_shippingConfig
* print db_wfc
* match dbResults[0].shippingConfigs[0].shipMethod == 'REGULAR'
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode','4747')
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.shippingConfigs.shipMethod == 'REGULAR'
* match ourrecord.configType == 'shippingFeeConfigs'
* match ourrecord.updatedTS == '#notnull'
* match ourrecord.updatedBy == 'Automation'

@TransitConfig_audit @Config_Service
Scenario: validating audit collection for Transitdays
#TC01: Inserting the Transit days into the DB for the first time
* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_TransitDays')
* match response.response.message == 'Data Upload in progress in background'
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','2525')
* print dbResults
* def db_wfc = dbResults[0].wfcNode
* def db_id = dbResults[0]._id
* def db_shippingConfig = dbResults[0].shippingConfigs
* print db_shippingConfig
* print db_wfc
* match dbResults[0].shippingConfigs[0].shipMethod == 'REGULAR'
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode','2525')
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.shippingConfigs.shipMethod == 'REGULAR'
* match ourrecord.configType == 'transitConfigs'
* match ourrecord.updatedTS == '#notnull'
* match ourrecord.updatedBy == 'Automation'
#Tc02: Verifying audit collection after inserting the updated Transit days
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Updated_TransitDays') 
* match response.response.message == 'Data Upload in progress in background'
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','2525')
* print dbResults
* def db_wfc = dbResults[0].wfcNode
* def db_id = dbResults[0]._id
* def db_shippingConfig = dbResults[0].shippingConfigs
* print db_shippingConfig
* print db_wfc
* match dbResults[0].shippingConfigs[0].shipMethod == 'REGULAR'
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','wfcNode','2525')
* print dbResults
* def n = dbResults.length
* print n
* def ourrecord = dbResults[n-1]
* print ourrecord
* match ourrecord.shippingConfigs.shipMethod == 'REGULAR'
* match ourrecord.configType == 'transitConfigs'
* match ourrecord.updatedTS == '#notnull'
* match ourrecord.updatedBy == 'Automation'

@Ship_Method
Scenario:
#TC01:Verifying ship method for Transit days upload
* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_TransitDays') 
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','2525')
* print dbResults
* match response.response.message == 'Data Upload in progress in background'
* match dbResults[0].shippingConfigs[0].shipMethod == 'REGULAR'

#TC02:Verifying ship method for Shipping fee upload
* call read('classpath:modules/Wine/Wine_Endpoints.feature@upsert_ShippingData') 
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','wfcNode','4747')
* print dbResults
* match response.response.message == 'Data Upload in progress in background'
* match dbResults[0].shippingConfigs[0].shipMethod == 'REGULAR'

#TC03:Verify ship method for Transit days upload for ship method other than Regular(checking for standard)
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Trasitdays_standard') 
* match response.errors.errorCode == 'VALIDATION_ERROR'
* match response.errors.errorMessage == 'Invalid value for Ship Method. Allowed value [REGULAR]'


#TC04:Verify ship method for Shipping fee upload for ship method other than Regular(checking for standard)
* call read('classpath:modules/Wine/Wine_Endpoints.feature@ShippingFee_Standard_Shipmethod') 
* match response.errors.errorCode == 'VALIDATION_ERROR'
* match response.errors.errorMessage == 'Invalid value for Ship Method. Allowed value [REGULAR]'

#TC05: Checking the transit API with random data as ship method
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Trasitdays_RandomShipmethod') 
* match response.errors.errorCode == 'VALIDATION_ERROR'
* match response.errors.errorMessage == 'Invalid value for Ship Method. Allowed value [REGULAR]'

#TC06:Checking the Shipping fee API with random string as ship method
* call read('classpath:modules/Wine/Wine_Endpoints.feature@ShippingFee_Random_Shipmethod') 
* match response.errors.errorCode == 'VALIDATION_ERROR'
* match response.errors.errorMessage == 'Invalid value for Ship Method. Allowed value [REGULAR]'

@ShippingLabel_Get
Scenario: Retrieving shipping order details using get method
#TC01:Happy path
* def Ordernumber = 333495289
* call read('classpath:modules/Wine/Wine_Endpoints.feature@shippinglabel_Get')
#TC02: Error scenario
* def Ordernumber = 1234
* call read('classpath:modules/Wine/Wine_Error.feature@Shippinglabel_Get_error')

@configType @Config_Service
Scenario: Retrieving data from DB based on the config Type
#Tc01: Retrieving data from DB with conFigType as functionalConfig
#* call read('classpath:modules/Wine/Wine_Endpoints.feature@configType_functionalConfig')



#Tc02: Retrieving data from DB with conFigType as transitConfigs
* call read('classpath:modules/Wine/Wine_Endpoints.feature@configType_TransitDays')
* print  responseLength = response.configsAuditResponse.length
* def dbUtils = Java.type('com.mkpl.utils.WineDBUtil')
* def dbResults = dbUtils.query_getWineShippingConfig(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','transitConfigs',3)
* print dbResults
* print dbLength = dbResults.length
  * match responseLength == dbLength
#Tc03: Retrieving data from DB with conFigType as packageRates
* call read('classpath:modules/Wine/Wine_Endpoints.feature@configType_PackageRates')
  * print  responseLength = response.configsAuditResponse.length
  * def dbUtils = Java.type('com.mkpl.utils.WineDBUtil')
  * def dbResults = dbUtils.query_getWineShippingConfig(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','packageConfigs',3)
  * print dbResults
  * print dbLength = dbResults.length
  * match responseLength == dbLength
#Tc04: Retrieving data from DB with conFigType as ShippingFee
* call read('classpath:modules/Wine/Wine_Endpoints.feature@configType_ShippinfingFee')
  * print  responseLength = response.configsAuditResponse.length
  * def dbUtils = Java.type('com.mkpl.utils.WineDBUtil')
  * def dbResults = dbUtils.query_getWineShippingConfig(MONGO_URI,'oslm_dtc','wine_shipping_configs_audit','shippingFeeConfigs',3)
  * print dbResults
  * print dbLength = dbResults.length
  * match responseLength == dbLength
#Tc05: Retrieving data from DB with conFigType as Invalid
* call read('classpath:modules/Wine/Wine_Endpoints.feature@configType_Invalid')
  * match response.errors.errorMessage == 'Invalid config type Invalid'




@ShippingLabel_Regeneration
Scenario: Validating Shipping label Regeneration scenarios
# Creating order with random order ID
# post payload on OSPK-OSLM-SHIPPING-LABEL-QA
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
   * match ourrecord[0].activityId == testData.activityId
   * match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'

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
   * match dbResults[0].shipToName == 'Wine Automation'
  
 # get the shipping label data from DB using GET method 
  * def Ordernumber = orderId
  * call read('classpath:modules/Wine/Wine_Endpoints.feature@shippinglabel_Get')
  
# Regenerate the label using regenerate shipping label POST method

* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Endpoints.feature@Regenerate_ShippingLabel') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Label regeneration successfully completed!'
# Error Scenarios
#TC01: Validating error message for shipping label regeneration when Data as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Data section missing in the request body'

#TC02: Validating error message for shipping label regeneration when shipToAddress as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Ship to Address missing in the request body'

#TC03: Validating error message for shipping label regeneration when shipToAddress-address line1 as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.addressLine1 = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Ship to Address - addressLine1 missing'

#TC04: Validating error message for shipping label regeneration when shipToAddress-city as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.city = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Ship to Address - city missing'

#TC05: Validating error message for shipping label regeneration when shipToAddress-state as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.state = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Ship to Address - State missing'

#TC06: Validating error message for shipping label regeneration when shipToAddress-postalCode as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.postalCode = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Ship to Address - postcalCode missing'

#TC07: Validating error message for shipping label regeneration shipToAddress-addressLine1 is more than 35 charactes the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.addressLine1 = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuv'
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Invalid value of: Ship to Address addressLine1'

#TC08: Validating error message for shipping label regeneration when shipToAddress-city is more than 35 charactes the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.city = 'abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstubvwxyz'
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Invalid value of: Ship to Address city'

#TC09: Validating error message for shipping label regeneration when shipToAddress-postal code is greater than 9digits in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.postalCode = 9456694566
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Invalid value of: Ship to Address postalCode'

#TC10: Validating error message for shipping label regeneration when shipToAddress-state is more than 2 charactes the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipToAddress.state = 'CAC'
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Invalid value of: Ship to Address state'

#TC11: Validating error message for shipping label regeneration when shipment as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipments = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Missing Shipment Information. No Shipments info found'

#TC12: Validating error message for shipping label regeneration when shipment-packageWeight as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipments[0].packageWeight = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'packageWeight is missing'

#TC13: Validating error message for shipping label regeneration when shipment-packageWeightUOM as null in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipments[0].packageWeightUOM = null
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'packageWeighUOM is missing'

#TC14: Validating error message for shipping label regeneration when shipment-packageWeight more than 150 in the payload
* def payload_RegenerateLabel = read('classpath:payloads/Wine/Regenerate_ShippingLabel.json')
* print payload_RegenerateLabel
* set payload_RegenerateLabel.data.shipments[0].packageWeight = 160
* print payload_RegenerateLabel
* call read('classpath:modules/Wine/Wine_Error.feature@Regenerate_ShippingLabel_Error') { 'payload' : '#(payload_RegenerateLabel)' }
* match response == 'Invalid value of:160.0 for field:packageWeight'

#UPS-API for shipping rate
@Rate_Scheduler
  Scenario: Scenario to run the scheduler to update the shipping fee with the UPS values
  * call read('classpath:modules/Wine/Wine_Endpoints.feature@ShipRate_Scheduler')
  * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
  * sleep(60000)
  @Rate_Scheduler
  Scenario Outline:  calculating shipping rate from UPS
    * def payload_UPS = read('classpath:payloads/Wine/UPS_ShipRate.json')
    * print payload_UPS
    * set payload_UPS.RateRequest.Shipment.Package.Dimensions.Length = <lenth>
    * set payload_UPS.RateRequest.Shipment.Package.Dimensions.Height = <height>
    * set payload_UPS.RateRequest.Shipment.Package.Dimensions.Width = <width>
    * set payload_UPS.RateRequest.Shipment.Package.PackageWeight.Weight = <weight>
    * call read('classpath:modules/Wine/Wine_Endpoints.feature@UPS_ShipRate') { 'payload' : '#(payload_UPS)' }
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_dtc','wine_shipping_promise_configs','_id','5799_94566')
    * print dbResults
    * def Shiprate_DB = dbResults[0].shippingConfigs[0].ratesByItemQuantity
    * print Shiprate_DB
    * set Shiprate_DB[i] = <iterator>
    * print Shiprate_DB[iterator].shipRate
    * match shiprate_response == Shiprate_DB[iterator].shipRate
Examples:
    | lenth   | height   | width  | weight  | iterator|
    |"14.625" | "5.125"  | "5.125"| "3.25" | 0 |
    |"19.75"  | "6.25"   | "12.375"| "6.50" | 1 |
    |"19.75"  | "6.25"   | "12.375"| "9.75" |2  |
    |"19.75"  | "9.187"  | "12.375"| "13.00"|3  |
    |"19.75"  | "9.1875" | "12.375"| "16.25"|4  |
    |"19.75"  | "9.187"  | "12.375"| "19.75"|5  |
    |"19.75"  | "12.125" | "12.375"| "23.00"|6  |
    |"19.75"  | "12.125" | "12.375"| "26.25"|7  |
    |"19.75"  | "12.125" | "12.375"| "29.50"|8  |
    |"19.75"  | "15.062" | "12.375"| "32.50"|9  |
    |"19.75"  | "15.062" | "12.375"| "35.75"|10 |
    |"19.75"  | "15.062" | "12.375"| "39.00"|11 |

# EDD Scheuler
  @EDD_SCHEDULER
  Scenario: Scenario to run the EDD scheduler and validate the minArrivebyTS and arriveByTS
    * call read('classpath:modules/Wine/Wine_Endpoints.feature@Scheduler_EDD')
    * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
    * sleep(6000)
    * def payload_DPA_Promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
    * print payload_DPA_Promisedate
    * call read('classpath:modules/Wine/Wine_Endpoints.feature@EDD_DPA_PROMISE') { 'payload' : '#(payload_DPA_Promisedate)' }
    * def ordProcessingday = response.shipMethods[0].shippingOptions[0].shippingRates[0].orderProcessingDay
    * def minArriveTS = response.shipMethods[0].shippingOptions[0].shippingRates[0].minArriveByTS
    * def arriveTS = response.shipMethods[0].shippingOptions[0].shippingRates[0].arriveByTS
    * print arriveTS
    * print minArriveTS
    * print ordProcessingday
    * def commonutils = Java.type('com.mkpl.utils.CommonUtils')
    * def ordProcessingday1 = commonutils.DateFromUTC(ordProcessingday)
    * def MinArriveTS = commonutils.DateFromUTC(minArriveTS)
    * def ArriveTS = commonutils.DateFromUTC(arriveTS)
    * print ordProcessingday1
    * print ArriveTS
    * print MinArriveTS
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def dbResults = dbUtils.queryDocs_MongoDB_Common1(MONGO_URI,'oslm_dtc','wineshipping_edd','toZipCode','94566','shipDate',ordProcessingday1)
    * print dbResults
    * def deliverydate = dbResults[0].deliveryDate
    * print deliverydate
    * def commonutils = Java.type('com.mkpl.utils.CommonUtils')
    * def AddOneDay_deliverydate = commonutils.addDaysTogivendate(deliverydate)
    * print AddOneDay_deliverydate
    * match deliverydate == MinArriveTS
    * match AddOneDay_deliverydate == ArriveTS



