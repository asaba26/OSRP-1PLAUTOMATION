Feature: 
    @Order
    Scenario: Generate Payload for Order Creation and post on EMOM Order Topic  
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@paylodgeneration') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber 
     * def referenceNumber1 =  generatePayload.referenceNumber1 
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * set testData.referenceNumber1 = referenceNumber1
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * set testData.firstpayload = payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
     
  @headder_null
    Scenario: Generate Payload for Order Creation and post on EMOM Order Topic  
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@paylodgeneration') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber 
     * def referenceNumber1 =  generatePayload.referenceNumber1 
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * set testData.referenceNumber1 = referenceNumber1
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * set testData.firstpayload = payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Headder_null') 
     
 @Error_OrderNumber
    Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with servicelevel as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@ordernumber_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')
  
  @Error_servicelevel
    Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with servicelevel as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@servicelevel_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')
@Error_data
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with data as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@data_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')  
   
  @Error_storeid
    Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with storeid as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@storeid_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')
 
@Error_ShipFromAddress
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with ShipFromAddress as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipFromaddress_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * json payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')  
     
 @Error_ShipFromAddress_addressline1
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with ShipFromAddress_addressline1 as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipFromaddressline1_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
     
@Error_ShipFromAddress_addressline2
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with ShipFromAddress_addressline2 as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipFromaddressline2_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')   

@Error_ShipFromAddress_city
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with Error_ShipFromAddress_city as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipFromaddress_city_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')       
      
@Error_ShipFromAddress_state
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with ShipFromAddress_state as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipFromaddress_state_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')  

@Error_ShipFromAddress_postalcode
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with ShipFromAddress_postalcode as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipFromaddress_postalcode_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')

@Error_ShiptoName
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with shiptomane as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shiptoName_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')                 


@Error_ShiptoAddress_addressline1
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with shipto address as null as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shiptoaddressline1_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 

@Error_ShiptoAddress_addressline2
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with shipto address as null as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shiptoaddressline2_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
     
@Error_ShipToAddress_city
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with Error_ShipFromAddress_city as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shiptoaddress_city_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')       
      
@Error_ShipToAddress_state
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with ShipFromAddress_state as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shiptoaddress_state_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')  

@Error_ShipToAddress_postalcode
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with ShipFromAddress_postalcode as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shiptoaddress_postalcode_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label')

@Error_ShiptoAddress
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with shipto address as null as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shiptoaddress_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 

@Error_Shipments
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 

@Error_Shipments_packageWeight
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_packageWeight_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_packageWeightUOM
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with packageWeightUOM in Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_packageWeightUOM_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_referenceNumber
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with referenceNumber inShipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_referenceNumber_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_pckgDimensionsUOM
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with pckgDimensionsUOM in Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_pckgDimensionsUOM_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_packageHeight
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with packageHeight in Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_packageHeight_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_packageWidth
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with packageWidth in Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_packageWidth_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_packageLength
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with packageLength in Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_packageLength_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_shipmentMonetaryValue
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with shipmentMonetaryValue in Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_shipmentMonetaryValue_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_signatureRequired
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with signatureRequired_ in Shipments as null
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_signatureRequired_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Error_Shipments_fulfilledQtyForWholeOrder
Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic without fulfilledQtyForWholeOrder
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@shipments_fulfilledQtyForWholeOrder_null') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
@Invalid_Store
    Scenario: Generate Payload for Order Creation and post on OSPK_OSLM_SHIPPING_LABEL_QA topic with invalid store no 
    #Generate payload for order creation and post OSPK_OSLM_SHIPPING_LABEL_QA topic 
    
     * def generatePayload = call read('classpath:services/Wine/GeneratePayload.feature@invalid_storeNo') { 'payloadName' : '#(payloadName)' }  
     * def orderId = generatePayload.orderId 
     * def fulfillmentOrderId = generatePayload.fulfillmentOrderId  
     * def referenceNumber = generatePayload.referenceNumber  
     * set testData.orderId = orderId  
     * set testData.fulfillmentOrderId = fulfillmentOrderId 
     * set testData.referenceNumber = referenceNumber 
     * string payload = generatePayload.Create_Shipment_Label_Payload  
     * print payload
     * def postMessage = call read('classpath:services/Wine/postmessgaeonKafka.feature@Shipment_Label') 
	 