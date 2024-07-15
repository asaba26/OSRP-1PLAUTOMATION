Feature: Create OSS Events through kafka topics

Background:
  #Generate current eventTimeStamp
  * def getISODate = read('classpath:helpers/getISOtime.js')
  * def sleep = function(pause){ java.lang.Thread.sleep(pause) }
  * def calcTime = read('classpath:helpers/getModifiedTimeStampWithGivenDate.js')
  * def generateRndNum = function(min,max){ return Math.floor(min + Math.random() * max).toString() }
  * sleep(5000)
  * def eventTimeStamp = getISODate()
 


  
  #Used only for DELIVERED event
 # * if(payloadName.contains('DELIVERED')) karate.set('testData', '$.deliveredTime', eventTimeStamp)
  * if(payloadName.contains('PICKED-UP')) karate.set('testData', '$.pickedUpTime', eventTimeStamp)
  #Used only for RG event for reviewSubsBy Calculation
  * if(payloadName.contains('CAS_PICK') || payloadName.contains('RECEIPT_GENERATED')) karate.set('testData', '$.rgTime', eventTimeStamp)
  #* def eta = payloadName.contains('DELIVERY-ON-THE-WAY') && testData.plannedArrivedDate!=null ? karate.set('testData', '$.plannedArrivedDate', calcTime(testData.plannedArrivedDate,'minutes',10,'future',"yyyy-MM-dd'T'HH:mm:00'Z'")) : karate.set('testData', '$.plannedArrivedDate', eventTimeStamp)
  #* def etaBS = payloadName.contains('BEHIND-SCHEDULE') && testData.plannedArrivedDateBS!=null ? karate.set('testData', '$.plannedArrivedDateBS', calcTime(testData.plannedArrivedDateBS,'minutes',10,'future',"yyyy-MM-dd'T'HH:mm:00'Z'")) : karate.set('testData', '$.plannedArrivedDateBS', calcTime(testData.endTime,'minutes',20,'future',"yyyy-MM-dd'T'HH:mm:00'Z'"))


@OMSevents
Scenario: Generate Payload and post on OSS Order Event Topic

  #Generate Payload for OMS Event and post on OSS Topic with header source OMS

  * string payload = read('classpath:payloads/'+payloadName+'.json')
  * print payload
  * def orderStatusReasonCode = karate.get('$payload.subOrders[0].subOrderStatusReasonCode','notpresent')
  * def headers = payloadName.contains('CANCELLED') ? {'source': 'OMS','orderStatusReasonCode': orderStatusReasonCode } : {'source': 'OMS'}
  * def postMessage = call read('classpath:services/postMessageOnKafka.feature@OSS_ORDER_EVENT_TOPIC_1')
  
  


  @OnePl_TOTE
  Scenario: Generate Payload for 1PL tote  and post on OSRP_1PL_TOTE Topic
  
    #Generate payload for order creation and post on EMOM order topic
    * def generatePayload = call read('classpath:services/generatePayload.feature@RP') { 'payloadName' : '#(payloadName)' }
    * def orderId = generatePayload.orderId
    * def fulfillmentOrderId = generatePayload.fulfillmentOrderId
    * set testDataAll.orderId = orderId
    * set testDataAll.fulfillmentOrderId = fulfillmentOrderId
    #* def storeId = generatePayload.EMOM_Payload.storeNumber
   # * print "***************>>>>>>>>>>>>>"+storeId
    * string payload = generatePayload.EMOM_Payload
    * print payload 
    * def postMessage = call read('classpath:services/postMessageOnKafka.feature@RP_QA')

      
   @OSRP_1PL_TOTES_EVENTS_TOPIC
Scenario: Generate Payload and post on OSS Order Event Topic

  #Generate Payload for OMS Event and post on OSS Topic with header source OMS
  * string payload = read('classpath:payloads/'+payloadName+'.json')
  * print payload
  * def orderNumber = testData.orderId
  * def fulfillmentOrderNumber = testData.fulfillmentOrderId
  #* set payload.orderNumber = orderNumber
  #* set payload.fulfillmentOrderNumber = fulfillmentOrderNumber
  * print orderNumber
  * print fulfillmentOrderNumber
  * def postMessage = call read('classpath:services/postMessageOnKafka.feature@OSRP_1PL_TOTES_EVENTS_TOPIC')
  
  
@Releasevents_1PL
Scenario: Generate Payload and post on OSS Order Event Topic

  #Generate Payload for OMS Event and post on OSS Topic with header source OMS

  * string payload = read('classpath:payloads/'+payloadName+'.json')
  * print payload
 #* def orderStatusReasonCode = karate.get('$payload.subOrders[0].subOrderStatusReasonCode','notpresent')
 #* def headers = payloadName.contains('CANCELLED') ? {'source': 'OMS','orderStatusReasonCode': orderStatusReasonCode } : {'source': 'OMS'}
  * def postMessage = call read('classpath:services/postMessageOnKafka.feature@OSCO_ORDER_ROUTE_UPDATE_QA_TOPIC')

    
    
    
