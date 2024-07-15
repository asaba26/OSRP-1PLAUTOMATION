@ignore
Feature: Shipping and handling fee and promise api endpoints

@landing
Scenario: Posting landing API
Given url Wine_Landing_api
And request payload
And print payload
And header Content-Type = 'application/json'
#And header ocp-apim-subscription-key = 'a8c9b838205e4ae1a317f819b01e97a1'
#And header ocp-apim-subscription-key = 'f77a942901444c67b802a7563dd4ec3f'
When method post
Then status 200
And print response
And print response.shipMethods 
And print response.shipMethods[0].minArriveByTS
And print response.shipMethods[0].displayMinArriveByTS
And match response.shipMethods[0].shippingType == 'REGULAR'
And match response.shipMethods[0].minArriveByTS contains '00Z'
And match response.shipMethods[0].arriveByTS contains '00Z'
Then print 'working fine'

@dpa_Promisedate
Scenario: Post api to get DPA promise date
Given url Wine_DPA_Promise
And request payload
And print payload
And header Content-Type = 'application/json'
#And header ocp-apim-subscription-key = 'a8c9b838205e4ae1a317f819b01e97a1'
#And header ocp-apim-subscription-key = 'f77a942901444c67b802a7563dd4ec3f'
When method post
Then status 200
And print response
And match response.shipMethods[0].shippingOptions[0].shippingRates[0].tillByTime contains '00Z'
And match response.shipMethods[0].shippingOptions[0].shippingRates[0].estShippingDate contains '00Z'
And match response.shipMethods[0].shippingOptions[0].shippingRates[0].orderProcessingDay contains '00Z'
  And match response.shipMethods[0].shippingOptions[0].shippingRates[0].stageByTime contains '00Z'
  And match response.shipMethods[0].shippingOptions[0].shippingRates[0].minArriveByTS contains '00Z'
  And match response.shipMethods[0].shippingOptions[0].shippingRates[0].arriveByTS contains '00Z'
And match response.shipMethods[0].shippingOptions[0].shippingRates[0].shippingType == 'REGULAR'
And match response.shipMethods[0].shippingOptions[0].shippingRates[0].shippingFee == '#notnull'
And match response.shipMethods[0].shippingOptions[0].shippingRates[0].handlingFee == '#notnull'


@Shipping_Rate

Scenario: Post api to get Shipping rate
Given url Shipping_Rate

And request payload
And print payload
And header Content-Type = 'application/json'
When method post
Then status 200
And print response
And match response.handlingFee == '#notnull'
And match response.shippingFee == '#notnull'

@Retrieve_Shipmentlabel

Scenario: Post api to retrieve the shipment labke
Given url Retieve_Shipment_Label

And request payload
And print payload
And header Content-Type = 'application/json'
#And header Ocp-Apim-Subscription-Key = '5af679ed650b4b7e99d68c9d99644e29'
#And header ocp-apim-subscription-key = '08442a793abb467989ab6b8c0b095938'
When method post
Then status 200
And print response

@FunConfig_Post
Scenario: Posting landing API
Given url Fnconfig_Post
And request payload
And print payload
And print response.carrierWorkingDays
And header Content-Type = 'application/json'
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
When method post
Then status 200
And print response
And match response.status == 'success'

@FunConfig_get
Scenario: Posting landing API
Given url Fnconfig_get
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
When method get
And print response
Then status 200
* def cwd = response.carrierDeliveryWorkingDays
* def ctw = response.carrierTransitWorkingDays
* def cpwd = response.carrierPickupWorkingDays
* def coh = response.carrierObservedHolidays
* def WfcNode = response.wfcNode
* def WfcCEC = response.wfcCapacityExceptionCalendar
* def OCT = response.orderCutoffTime
* def WfcHC = response.wfcHolidayCalendar
* def WfcOC = response.wfcOperatingCalendar
* def LT = response.leadTime
* def WfcTZ = response.wfcTimeZone
* def CCT = response.cancelCutOffTime
* def ECT = response.editCutoffTime
* def Carrier = response.carrier
* def ProccessingTime = response.processingTimeInMinutes

@upsert_TransitDays
Scenario: Upserting Transitdays
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Upser_TransitDays.xlsx', filename:'Upser_TransitDays.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 200

@Updated_TransitDays
Scenario: Inserting updated Transitdays
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Updated_TransitDays.xlsx', filename:'Updated_TransitDays.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 200

@Trasitdays_standard
Scenario: Inserting Transit days with standard as shipmethod
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Transitdays_Standard_Shipmethod.xlsx', filename:'Transitdays_Standard_Shipmethod.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Trasitdays_RandomShipmethod
Scenario: Inserting Transit days with standard as shipmethod
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Transitdays_Random_Shipmethod.xlsx', filename:'Transitdays_Random_Shipmethod.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@upsert_ShippingData
Scenario: Upserting Shipping data
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Upser_ShippingData.xlsx', filename:'Upser_ShippingData.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 200

@Updated_ShippingData
Scenario: updated Shipping data
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/Updated_ShippingData.xlsx', filename:'Updated_ShippingData.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 200

@ShippingFee_Standard_Shipmethod
Scenario: Inserting shipping data with standard shipmethod
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/ShippingFee_Standard_Shipmethod.xlsx', filename:'ShippingFee_Standard_Shipmethod.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_Random_Shipmethod
Scenario: Inserting shipping data with standard shipmethod
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/ShippingFee_Standard_Shipmethod.xlsx', filename:'ShippingFee_Standard_Shipmethod.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@upsert_PackageRates
Scenario: Upserting Shipping data
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Upsert_PackageRates.xlsx', filename:'Upsert_PackageRates.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 200

@Updated_PackageRates
Scenario: Upserting Shipping data
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Updated_PackageRates.xlsx', filename:'Updated_PackageRates.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 200

@wfc_Missing
Scenario: Validating error scenario for wfc node is missing 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/wfc_missing.xlsx', filename:'wfc_missing.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@wfc_NonNumeric
Scenario: If numeric cell have non numeric value
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/wfc_NonNumeric.xlsx', filename:'wfc_NonNumeric.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@No_Data
Scenario: No data available in the payload
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/No_Data.xlsx', filename:'No_Data.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Empty_Cell
Scenario: No data available in the payload
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Empty_Cell.xlsx', filename:'Empty_Cell.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Shipmethod_Missing
Scenario: No data available in the payload
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Shipmethod_Missing.xlsx', filename:'Shipmethod_Missing.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Shipmethod_NonString
Scenario: No data available in the payload
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'Automation'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Shipmethod_NonString.xlsx', filename:'Shipmethod_NonString.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@shippinglabel_Get
Scenario: Retrieving shipping details
Given url Shippinglabel_get+Ordernumber
And header Content-Type = 'application/json'
#And header ocp-apim-subscription-key = '5af679ed650b4b7e99d68c9d99644e29'
#And header ocp-apim-subscription-key = '08442a793abb467989ab6b8c0b095938'
When method get
And print response
Then status 200

@configType_functionalConfig
Scenario: Retrieving shipping details with config tyoe as functionalConfig
Given url CONFIGTYPE_FUNCTIONALCONFIG
And header Content-Type = 'application/json'
And header configType = 'functionalConfigs'
When method get
And print response
Then status 200

@configType_PackageRates
Scenario: Retrieving shipping details with config tyoe as PackageRates
Given url CONFIGTYPE_PACKAGERATES
And header Content-Type = 'application/json'
And header configType = 'packageConfigs'
When method get
And print response
Then status 200

@configType_TransitDays
Scenario: Retrieving shipping details with config tyoe as TransitDays
Given url CONFIGTYPE_TRANSITDAYS
And header Content-Type = 'application/json'
And header configType = 'transitConfigs'
When method get
And print response
Then status 200

@configType_ShippinfingFee
Scenario: Retrieving shipping details with config tyoe as ShippinfingFee
Given url CONFIGTYPE_SHIPPINGRATES
And header Content-Type = 'application/json'
And header configType = 'shippingFeeConfigs'
When method get
And print response
Then status 200

@configType_Invalid
Scenario: Retrieving shipping details with config tyoe as Invalid
Given url CONFIGTYPE_INVALID
And header Content-Type = 'application/json'
And header configType = 'Invalid'
When method get
And print response
Then status 412

@Regenerate_ShippingLabel
Scenario:
Given url REGENERATE_SHIPPINGLABEL
And request payload
And print payload
And header Content-Type = 'application/json'
#And header ocp-apim-subscription-key = '5af679ed650b4b7e99d68c9d99644e29'
#And header ocp-apim-subscription-key = '08442a793abb467989ab6b8c0b095938'
When method post
Then status 200
And print response
And match response == 'Label regeneration successfully completed!'



  @UPS_ShipRate
  Scenario: calculating shipping rate from UPS
    Given url ShippingRate_UPS
    And header Content-Type = 'application/json'
    And header AccessLicenseNumber = '5DB7CE0FD8D0B581'
    And header Username = 'absdotecomm'
    And header Password = 'Albertsons1#'
    And request payload
    And print payload
    When method post
    Then status 200
    And print response
    And def shiprate_response = response.RateResponse.RatedShipment.NegotiatedRateCharges.TotalCharge.MonetaryValue
    And print shiprate_response

  @ShipRate_Scheduler
  Scenario: API to run shipping rate scheduler from UPS
    Given url UPS_SHIPRATE_SCHEDULER
    And header Content-Type = 'application/json'
    When method get
    And print response
    Then status 200
  @Scheduler_EDD
  Scenario: API to run edd scheduler
    Given url EDD_SCHEDULER
    And header Content-Type = 'application/json'
    When method get
    And print response
    Then status 200
  @EDD_DPA_PROMISE
    Scenario: Post api to get DPA promise date
      Given url Wine_DPA_Promise
      And request payload
      And print payload
      And header Content-Type = 'application/json'
#And header ocp-apim-subscription-key = 'a8c9b838205e4ae1a317f819b01e97a1'
#And header ocp-apim-subscription-key = 'f77a942901444c67b802a7563dd4ec3f'
      When method post
      Then status 200
      And print response










