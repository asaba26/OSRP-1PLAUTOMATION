Feature: OnePL RoutePlanner service flow 

@RP_UI
Scenario: Validating  order placement and verifying mandatory fields In RP UI

# set test data for  RP UI
    * def testDataAll = read('classpath:payloads/OnePL/OnePL_EMOM.json')
    * def testData = testDataAll

# post payload on EMOM TOPIC
 * def createOrder = call read('classpath:modules/createOrder.feature@OnePL_EMOM') { 'payloadName' : 'OnePL/OnePL_EMOM' }
 * def orderId = createOrder.orderId
 * set testData.orderId = orderId
 * def fulfillmentOrderId = createOrder.fulfillmentOrderId
 
 * print orderId
 * print fulfillmentOrderId
 

 @RP_UI_TOTE
Scenario: Validating  order in totes topic  and verifying mandatory fields In RP UI
    Given url RPUI_DBURL_ENDPOINT + '/listener/DocRequestTaskCombinedListener.asp'
    And header Content-Type = 'application/xml; charset=utf-8'
    And header Ocp-Apim-Subscription-Key = 'd80fa7062ee84096bf06caed0d812296'
    And header storeId = '1502'
# post payload on OSRP OnePL TOTE TOPIC
# set test data for  RP UI
 * def testDataAll = read('classpath:payloads/OnePL/OSRP_1PL_TOTE.json')
 * def testData = testDataAll

# set test data for RP UI 
 * def createOrder = call read('classpath:modules/createOrder.feature@OnePl_TOTE') { 'payloadName' : 'OnePL/OSRP_1PL_TOTE' }
 * def orderId = createOrder.orderId
 * set testData.orderId = orderId
 * def fulfillmentOrderId = createOrder.fulfillmentOrderId
# * def DocBol_Criteria = "FWStop.OrderKey like'"+orderId+"%'"
 * def DocBol_Criteria = "FWStop.OrderKey like '"+orderId+"%'"
 * print DocBol_Criteria
  # db validation
And request 
"""
<?xml version="1.0" encoding="UTF-8"?> 
<DocFWImport> 
<Header CompanyName="Safeway" LoginName="FW-Interface" Password="changeme" ReceiverID="MyCompany001" SendDateTime="8/2/2017 10:55:15 AM" extDocControlID="xxBOLSourceMessageID" senderID="SFFODLL"/> 
<Request>
<DocRequestTask MessagePurpose="1005" ProcessCode="" ScheduleKey="">
<DocCriteria>
<DocBOL Criteria="#(DocBol_Criteria)"/>
</DocCriteria>
</DocRequestTask>
</Request>
</DocFWImport>
"""
And print request 
When method post 
 Then status 200
 And print response
# And match response contains fulfillmentOrderId
 
 @DbValidation
 Scenario: Validating  order in sql db 
 Given url RPUI_DBURL_ENDPOINT + '/listener/DocRequestTaskCombinedListener.asp'
 And header Content-Type = 'application/xml; charset=utf-8'
 And header Ocp-Apim-Subscription-Key = 'd80fa7062ee84096bf06caed0d812296'
 And header storeId = '1502'
 And request 
 """
	<?xml version="1.0" encoding="UTF-8"?> 
<DocFWImport> 
<Header senderID="SFFODLL" ReceiverID="MyCompany001" SendDateTime="8/2/2017 10:55:15 AM" extDocControlID="xxBOLSourceMessageID" CompanyName="Safeway" LoginName="FW-Interface" Password="changeme" /> 
<Request>
<DocRequestTask ScheduleKey="" MessagePurpose="1005" ProcessCode="">
<DocCriteria>
<DocBOL Criteria="FWStop.OrderKey like '324997479%'"/>
</DocCriteria>
</DocRequestTask>
</Request>
</DocFWImport>
		"""
 When method post
 Then status 200
 And print response
 And match response contains '324997479'
