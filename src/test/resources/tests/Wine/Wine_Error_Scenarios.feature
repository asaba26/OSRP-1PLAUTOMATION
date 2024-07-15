@Wine_Error
Feature: Validating wine error scenarios

@Wine_Landing_Error1 @Wine_landing_error @wine-122

Scenario: Checking error response without delivery zipcode value in the payload

* def payload_landing = read('classpath:payloads/Wine/Wine_Shipment_Landing_Payload.json')
* remove payload_landing.deliveryZipCode
* print payload_landing
* call read('classpath:modules/Wine/Wine_Error.feature@landing_Error') { 'payload' : '#(payload_landing)' }

@wine-168

Scenario: Checking succes response by giving the invalid deliveryzipcode and winestoreiD

* def payload_landing = read('classpath:payloads/Wine/Wine_Shipment_Landing_Payload.json')
* set payload_landing.deliveryZipCode = '12345'
* set payload_landing.wineStoreId = '34525'
* print payload_landing
* call read('classpath:modules/Wine/Wine_Endpoints.feature@landing') { 'payload' : '#(payload_landing)' }

@Wine_Landing_Error2 @Wine_landing_error @wine-122
Scenario: Checking error response without deliveryTimeZone value in the payload

* def payload_landing = read('classpath:payloads/Wine/Wine_Shipment_Landing_Payload.json')
* remove payload_landing.deliveryTimeZone
* print payload_landing
* call read('classpath:modules/Wine/Wine_Error.feature@landing_Error') { 'payload' : '#(payload_landing)' }

@Wine_Landing_Error3 @Wine_landing_error @wine-122 @wine-166
Scenario:  Checking error response without wineStoreId value in the payload

* def payload_landing = read('classpath:payloads/Wine/Wine_Shipment_Landing_Payload.json')
* remove payload_landing.wineStoreId
* print payload_landing
* call read('classpath:modules/Wine/Wine_Error.feature@landing_Error') { 'payload' : '#(payload_landing)' }

   @Wine_shippingRate_Error1 @Wine_shippingRate_error
   Scenario:  Checking error response without deliveryZipCode value in the payload

      * def payload_shippingRate = read('classpath:payloads/Wine/Wine_Shipping_Rate.json')
      * remove payload_shippingRate.deliveryZipCode
      * print payload_shippingRate
      * call read('classpath:modules/Wine/Wine_Error.feature@ShippingRate_Error') { 'payload' : '#(payload_shippingRate)' }

   @Wine_shippingRate_Error2 @Wine_shippingRate_error
   Scenario:  Checking error response without totalItemQuantity value in the payload

      * def payload_shippingRate = read('classpath:payloads/Wine/Wine_Shipping_Rate.json')
      * remove payload_shippingRate.totalItemQuantity
      * print payload_shippingRate
      * call read('classpath:modules/Wine/Wine_Error.feature@ShippingRate_Error') { 'payload' : '#(payload_shippingRate)' }

   @Wine_shippingRate_Error3 @Wine_shippingRate_error @wine-166
   Scenario:  Checking error response without wineStoreId value in the payload

      * def payload_shippingRate = read('classpath:payloads/Wine/Wine_Shipping_Rate.json')
      * remove payload_shippingRate.wineStoreId
      * print payload_shippingRate
      * call read('classpath:modules/Wine/Wine_Error.feature@ShippingRate_Error') { 'payload' : '#(payload_shippingRate)' }

   @Wine_shippingRate_Error4 @Wine_shippingRate_error
   Scenario:  Checking error response without shippingType value in the payload

      * def payload_shippingRate = read('classpath:payloads/Wine/Wine_Shipping_Rate.json')
      * remove payload_shippingRate.shippingType
      * print payload_shippingRate
      * call read('classpath:modules/Wine/Wine_Error.feature@ShippingRate_Error') { 'payload' : '#(payload_shippingRate)' }
  @wine-166

Scenario: Checking error response with no winestoreId

* def payload_promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
* set payload_promisedate.deliveryZipCode = '12345'
* print payload_promisedate
* call read('classpath:modules/Wine/Wine_Error.feature@PromiseDate_Error') { 'payload' : '#(payload_promisedate)' }


   @Wine_promise_error @Wine_Promisedate_Error1 

Scenario: Checking error response by giving the invalid delivery zipcode

* def payload_promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
* set payload_promisedate.deliveryZipCode = '12345'
* print payload_promisedate
* call read('classpath:modules/Wine/Wine_Error.feature@PromiseDate_Error') { 'payload' : '#(payload_promisedate)' }

@Wine_promise_error @Wine_Promisedate_Error2
Scenario: Checking error response by giving the invalid wine storeid

* def payload_promisedate = read('classpath:payloads/Wine/Wine_DPA_Promise_Payload.json')
* set payload_promisedate.wineStoreId = '2345'
* print payload_promisedate
* call read('classpath:modules/Wine/Wine_Error.feature@PromiseDate_Error') { 'payload' : '#(payload_promisedate)' }

 @shipmentlabel_Error @Shipment_Label_Error1 @wine-123

Scenario: Checking error response by passing the partial valid data

* def ShipmentLabel_Payload = read('classpath:payloads/Wine/Partial_Shipment_Lable_Data.json')
* print ShipmentLabel_Payload
* call read('classpath:modules/Wine/Shipment_Lable_Error.feature@partial_Data') { 'payload' : '#(ShipmentLabel_Payload)' }

@shipmentlabel_Error @Shipment_Label_Error2 @wine-123

Scenario: Checking error response by passing the partial valid data

* def ShipmentLabel_Payload = read('classpath:payloads/Wine/Invalid_Shipment_Label_Data.json')
* print ShipmentLabel_Payload
* call read('classpath:modules/Wine/Shipment_Lable_Error.feature@Data_not_found') { 'payload' : '#(ShipmentLabel_Payload)' }

@shipmentlabel_Error @Shipment_Label_Error3 @wine-123

Scenario: Checking error response by passing the partial valid data

* def ShipmentLabel_Payload = read('classpath:payloads/Wine/Missing_data_Shipment_Label.json')
* print ShipmentLabel_Payload
* call read('classpath:modules/Wine/Shipment_Lable_Error.feature@Reference_number_missing') { 'payload' : '#(ShipmentLabel_Payload)' }



@PaymentDeclined @wine-129
Scenario: Posting payment-decined headder in OSDT-ORDER-EVENTS-QA topic
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

#Generate payload to post on OSDT-ORDER-EVENTS-QA

* string payload = read('classpath:payloads/Wine/Wine_Payment_Declined.json')
* print payload
* set testData.orderId = orderId
* set testData.fulfillmentOrderId = fulfillmentOrderId 
* def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@payment_declined')

# retrive order details from market place DB shipment_details
* def dbUtils = Java.type('com.mkpl.utils.DbUtils')
* def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResults
* match dbResults[0].activityId == testData.activityId
* match dbResults[0].carrier == 'UPS'
* match dbResults[0].orderType == 'wine'
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-IGNORED-PAYMENT-DECLINED'


   

@duplicate @wine-77
Scenario: Validating duplicate error message in OSLM_CARRIER_SHIPMETS_QA
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
   
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Order') { 'payloadName' : 'Create_ShipmentLable_Twoshipments' }
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
   
   # post on OSPK-OSLM-SHIPPING-LABEL-QA with same ordernumber
   * string payload = testData.firstpayload  
   * print payload
   * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')
   
   # Retrieve error message from OSLM_CARRIER_SHIPMENTS_QA
    * def result = call read('classpath:services/Wine/RetrivedatafromKafka.feature@OSLM_ORDER')
   * def results = result.allRecords
   * print results
   * print orderId
   * def records = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.orderNumber=='" + orderId + "')].value")
   * print ourrecord
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-DUPLICATE-REQUEST-ERROR'
   * match ourrecord[0].error.errorMessage == 'OSLM received Duplicate Request for Label generation for Reference number:194631617-BOX-88-LL-579994'
   
  
  
  @wine-77 @Invalid_store
   Scenario: validating error scenario by passing invaid store id in the payload
# post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Invalid_Store') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-INTERNAL-SERVER-ERROR-2001'
   * match ourrecord[0].error.errorMessage == 'Error while calling Shipping promise API -No data found for wineStoreId or deliveryZipCode'
   
@shipment_Error @wine-77 @wine-78 @service_null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the servicelevel as null

# post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_servicelevel') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage
   
 @wine-78 @Data_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the data as null
 
 # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_data') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
   
@wine-78 @StoreId_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the storeId as null
 
 # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_storeid') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 

@wine-78 @shipFromAddress_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the shipFromAddress as null
 
 # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipFromAddress') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
 
 
   
 @wine-78 @shipFromAddress_addressline1_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the addressline1 in shipFromAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipFromAddress_addressline1') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
   
@wine-78 @shipFromAddress_addressline2_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the addressline2 in shipFromAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipFromAddress_addressline2') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'
   
 @wine-78 @SFA_city_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the city in shipFromAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipFromAddress_city') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
@wine-78 @SFA_state_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the state in shipFromAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipFromAddress_state') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage  
   
@wine-78 @SFA_postalcode_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the postalcode in shipFromAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipFromAddress_postalcode') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage  

@wine-78 @ShipToName_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the shiptoname as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShiptoName') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-UPS-API-4XX-ERROR'
   * print ourrecord[0].error.errorMessage  
   
@wine-78 @ShipToAddress_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the shiptoname as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShiptoAddress') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage  
   
@wine-78 @OrderNumber_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with order number as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_OrderNumber') { 'payloadName' : 'Create_Shipment_Label' }
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
   * def records = karate.jsonPath(results, "$.[?(@.value.fulfillmentOrderNumber=='" + fulfillmentOrderId + "')]")
   * set testData.kafkaMessages = records
   * def ourrecord = karate.jsonPath(results, "$.[?(@.value.fulfillmentOrderNumber=='" + fulfillmentOrderId + "')].value")
   * print ourrecord
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage  
   


@wine-78 @ShipToAddress_addressline1_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the addressline1 in shiptoaddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShiptoAddress_addressline1') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
   

@wine-78 @ShipToAddress_addressline2_Null @wine-184
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Ship to address line2 as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShiptoAddress_addressline2') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'
   
@wine-78 @Shipments_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the shipments as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage  
   
@wine-78 @Shipments_packageWeight_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_packageWeight as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_packageWeight') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
    
@wine-78 @Shipments_packageWeightUOM_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_packageWeightUOM as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_packageWeightUOM') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
@wine-78 @Shipments_referenceNumber_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_referenceNumber as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_referenceNumber') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage   
@wine-78 @Shipments_pckgDimensionsUOM_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_pckgDimensionsUOM as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_pckgDimensionsUOM') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
@wine-78 @Shipments_packageHeight_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_packageHeight as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_packageHeight') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
@wine-78 @Shipments_packageWidth_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_packageWidth as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_packageWidth') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
@wine-78 @Shipments_packageLength_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_packageLength as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_packageLength') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
@wine-78 @Shipments_shipmentMonetaryValue_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_shipmentMonetaryValue as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_shipmentMonetaryValue') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'
@wine-78 @Shipments_signatureRequired_Null @shipment
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the Shipments_signatureRequired as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_signatureRequired') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPMENT_LABEL_CREATED'
@wine-78 @ShipToAddress_city_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the city in shipFromAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipToAddress_city') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage 
@wine-78 @ShipToAddress_state_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the state in shipToAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipToAddress_state') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage  
   
@wine-78 @ShipToAddress_postalcode_Null
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA with the postalcode in shipToAddress as null
 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_ShipToAddress_postalcode') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord[0].event.id == 'SHIPPING_LABEL_CREATION_ERROR'
   * match ourrecord[0].error.errorCode == 'OSLM-WINE-SHIPPING-LABEL-VALIDATION-ERROR'
   * print ourrecord[0].error.errorMessage  
   
@wine-78 @fulfilledQtyForWholeOrder_remove
 
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA without fulfilledQtyForWholeOrder 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@Error_Shipments_fulfilledQtyForWholeOrder') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord == []
  
@wine-78 @Headder_Null
 
 Scenario: validating error scenario by posting payload to OSPK-OSLM-SHIPPING-LABEL-QA without fulfilledQtyForWholeOrder 
  # post payload on OSPK-OSLM-SHIPPING-LABEL-QA
* def testData = {}
* def createOrder = call read('classpath:modules/Wine/Ordercreation.feature@headder_null') { 'payloadName' : 'Create_Shipment_Label' }
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
   * match ourrecord == []
@Shipment_Ignored @wine-83

Scenario: validating shipment ignored case


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
* print dbResults[0].createdTS
* def Shipmentstatus = dbResults[0].shipmentStatus
* match Shipmentstatus == 'SHIPMENT-CREATED'
* def createdtime = dbResults[0].createdTS
* print createdtime
* def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
 * def backdate = commonUtils.minusDaysToUTC(15)
 * print backdate
 * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
 * def dbResult = dbUtils.update_mongoDB_Common(MONGO_URI,'shipment_details','orderNumber',orderId,'createdTS',backdate)
 * sleep(150000)
 * def dbResult = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','shipment_details','orderNumber',orderId)
* print dbResult
 * def Shipmentstatus = dbResult[0].shipmentStatus
* print Shipmentstatus
* match Shipmentstatus == 'SHIPMENT-IGNORED'

@ShippingFee_Error @Wine-306
Scenario: Validating error scenarios for Shipping Fee
#TC01: validating error message for wfcnode is missing 
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_wfc_Missing') 
* match response.errors.errorMessage == 'WFC Node missing in excel'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC02: validating error message when wfcnode is non numeric value 
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_wfc_NonNumeric') 
* match response.errors.errorMessage == 'WFC node must be numeric'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC03: validating error message if no data available 
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_No_Data') 
* match response.errors.errorMessage == 'No Wine Shipping Promise Configs found'
* match response.errors.errorCode == 'VALIDATION_ERROR'
#TC04: validating error message when empty cell 
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_Empty_Cell') 
* match response.errors.errorMessage == 'Row number 6 has empty cells'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC05: validating error message fro shipmethos is missing scenarion 
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_Shipmethod_Missing') 
* match response.errors.errorMessage == 'Ship Method missing in excel'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC06: validating error message for shipmethod is non string value
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_Shipmethod_NonString') 
* match response.errors.errorMessage == 'shipMethod must be String'
* match response.errors.errorCode == 'PARSING_ERROR'

#TC07: If Excel has more column than expected
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_More_Columns') 
* match response.errors.errorMessage == 'Excel has invalid columns'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC08: If numeric cell have non numeric value
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_Numeric_NonNumeric') 
* match response.errors.errorMessage == 'Row number 6 has non numeric value'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC09: If Excel has some random text in the cell
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_Random_Text') 
* match response.errors.errorMessage == 'Row number 8 has extra cells'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC10: If Excel has wrong column name
* call read('classpath:modules/Wine/Wine_Error.feature@ShippingFee_Invalid_ColumnName') 
* match response.errors.errorMessage == 'Excel has invalid columns'
* match response.errors.errorCode == 'PARSING_ERROR'


@TransitDays_Error @Wine-306
Scenario: Validating error scenarios for transit days API
#TC01: validating error message for wfcnode is missing 
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_wfc_Missing') 
* match response.errors.errorMessage == 'WFC Node missing in excel'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC02: validating error message when wfcnode is non numeric value 
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_wfc_NonNumeric') 
* match response.errors.errorMessage == 'WFC node must be numeric'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC03: validating error message if no data available 
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_No_Data') 
* match response.errors.errorMessage == 'No Wine Shipping Promise Configs found'
* match response.errors.errorCode == 'VALIDATION_ERROR'
#TC04: validating error message when empty cell 
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_Empty_Cell') 
* match response.errors.errorMessage == 'Row number 5 has empty cells'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC05: validating error message fro shipmethos is missing scenarion 
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_Shipmethod_Missing') 
* match response.errors.errorMessage == 'Ship Method missing in excel'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC06: validating error message for shipmethod is non string value
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_Shipmethod_NonString') 
* match response.errors.errorMessage == 'shipMethod must be String'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC07:applyDeliveryTransitWorkDays must be Y or N 
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_Invalid_TransitWorkDays') 
* match response.errors.errorMessage == 'applyDeliveryTransitWorkDays must be Y or N at row number 5'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC08: If Excel has more column than expected
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_More_Columns') 
* match response.errors.errorMessage == 'Excel has invalid columns'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC09: If numeric cell have non numeric value
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_Numeric_NonNumeric') 
* match response.errors.errorMessage == 'Row number 5 has non numeric value'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC10: If Excel has some random text in the cell
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_Random_Text') 
* match response.errors.errorMessage == 'Row number 6 has extra cells'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC11: If Excel has wrong column name
* call read('classpath:modules/Wine/Wine_Error.feature@Transit_Invalid_ColumnName') 
* match response.errors.errorMessage == 'Excel has invalid columns'
* match response.errors.errorCode == 'PARSING_ERROR'

@PackageRates_Error @Wine-306
Scenario: Validating error scenarios for Shipping Fee
#TC01: validating error message for wfcnode is missing 
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRates_wfc_Missing') 
* match response.errors.errorMessage == 'WFC Node missing in excel'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC02: validating error message when wfcnode is non numeric value 
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRates_wfc_NonNumeric') 
* match response.errors.errorMessage == 'WFC node must be numeric'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC03: validating error message if no data available 
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRates_No_Data') 
* match response.errors.errorMessage == 'No Wine Shipping Package Configs found'
* match response.errors.errorCode == 'VALIDATION_ERROR'
#TC04: validating error message when empty cell 
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRates_Empty_Cell') 
* match response.errors.errorMessage == 'Row number 5 has empty cells'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC05: If Excel has more column than expected
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRates_More_Columns') 
* match response.errors.errorMessage == 'Excel has invalid columns'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC06: If numeric cell have non numeric value
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRates_Numeric_NonNumeric') 
* match response.errors.errorMessage == 'Row number 6 has non numeric value'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC07: If Excel has some random text in the cell
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRatese_Random_Text') 
* match response.errors.errorMessage == 'Row number 6 has extra cells'
* match response.errors.errorCode == 'PARSING_ERROR'
#TC08: If Excel has wrong column name
* call read('classpath:modules/Wine/Wine_Error.feature@PackageRates_Invalid_ColumnName') 
* match response.errors.errorMessage == 'Excel has invalid columns'
* match response.errors.errorCode == 'PARSING_ERROR'







 
 


   