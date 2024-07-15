Feature: 
 @paylodgeneration
  Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
      * def referenceNumber1 = commonUtils.create_random_referenceNumber()
    * print referenceNumber1
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
    * print Create_Shipment_Label_Payload 
    * def activityId = Create_Shipment_Label_Payload.activityId
    * set testData.activityId = activityId
  
@ordernumber_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.orderNumber = null
    * print Create_Shipment_Label_Payload
  
     @servicelevel_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.serviceLevel = null
    * print Create_Shipment_Label_Payload
    
     @storeid_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.storeId = null
    * print Create_Shipment_Label_Payload
    
  @data_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data = null
    * print Create_Shipment_Label_Payload
    
  @shipFromaddress_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipFromAddress = null
    * print Create_Shipment_Label_Payload
    
 @shiptoaddress_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipToAddress = null
    * print Create_Shipment_Label_Payload
    
   @shipFromaddressline1_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipFromAddress.addressLine1 = ""
    * print Create_Shipment_Label_Payload


@shipFromaddressline2_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipFromAddress.addressLine2 = ""
    * print Create_Shipment_Label_Payload
    
@shipFromaddress_city_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipFromAddress.city = ""
    * print Create_Shipment_Label_Payload
    
@shipFromaddress_state_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipFromAddress.state = ""
    * print Create_Shipment_Label_Payload   
@shipFromaddress_postalcode_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipFromAddress.postalCode = ""
    * print Create_Shipment_Label_Payload

@shiptoaddressline1_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipToAddress.addressLine1 = ""
    * print Create_Shipment_Label_Payload
        
@shiptoaddressline2_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipToAddress.addressLine2 = ""
    * print Create_Shipment_Label_Payload

@shiptoaddress_city_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipToAddress.city = ""
    * print Create_Shipment_Label_Payload
    
@shiptoaddress_state_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipToAddress.state = ""
    * print Create_Shipment_Label_Payload   
@shiptoaddress_postalcode_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipToAddress.postalCode = ""
    * print Create_Shipment_Label_Payload

@shiptoName_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipToName = ""
    * print Create_Shipment_Label_Payload
    
@shipments_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments = null
    * print Create_Shipment_Label_Payload

@shipments_packageWeight_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].packageWeight = ""
    * print Create_Shipment_Label_Payload

@shipments_packageWeightUOM_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].packageWeightUOM = ""
    * print Create_Shipment_Label_Payload

@shipments_referenceNumber_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].referenceNumber = ""
    * print Create_Shipment_Label_Payload

@shipments_pckgDimensionsUOM_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].pckgDimensionsUOM = ""
    * print Create_Shipment_Label_Payload
@shipments_packageHeight_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].packageHeight = ""
    * print Create_Shipment_Label_Payload
@shipments_packageWidth_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].packageWidth = ""
    * print Create_Shipment_Label_Payload
@shipments_packageLength_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].packageLength = ""
    * print Create_Shipment_Label_Payload
@shipments_shipmentMonetaryValue_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].shipmentMonetaryValue = ""
    * print Create_Shipment_Label_Payload
@shipments_signatureRequired_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.shipments[0].signatureRequired = ""
    * print Create_Shipment_Label_Payload
    
 @shipments_fulfilledQtyForWholeOrder_null
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * remove Create_Shipment_Label_Payload.data.fulfilledQtyForWholeOrder 
    * print Create_Shipment_Label_Payload
@invalid_storeNo
    Scenario: Generate Payload for Placing Order
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderId = commonUtils.create_random_orderId()
    * def fulfillmentOrderId = orderId + '011'
    * print orderId
    * print fulfillmentOrderId
    * def referenceNumber = commonUtils.create_random_referenceNumber()
    * print referenceNumber
    * json Create_Shipment_Label_Payload  = read('classpath:payloads/Wine/'+payloadName+'.json') 
   * set Create_Shipment_Label_Payload.data.storeId = '1234'
    * print Create_Shipment_Label_Payload  
    
    
 
  
   
    
    
   
    
    






 