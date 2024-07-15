@ignore
Feature: Shipping and handling fee and promise api endpoints


@landing_Error
Scenario: Posting landing API
Given url Wine_Landing_api
And request payload
And print payload
And header Content-Type = 'application/json'
When method post
Then status 412
And print response
And def output = response.errors 
And match output.errorCode == '412 PRECONDITION_FAILED'
And print output.errorMessage
And print 'working fine'

  @ShippingRate_Error
  Scenario: caluculating shipping rate by missing the field
    Given url Shipping_Rate
    And request payload
    And print payload
    And header Content-Type = 'application/json'
    When method post
    Then status 412
    And print response
    And def output = response.errors
    And match output.errorCode == '412 PRECONDITION_FAILED'
    And print output.errorMessage
    And print 'working fine'

@PromiseDate_Error
Scenario: Post api to get eero scenarios for promise date
Given url Wine_DPA_Promise
And request payload
And print payload
And header Content-Type = 'application/json'
When method post
Then status 206
And print response
And def output = response.errors
And match output.errorCode == 'OSLM-WINE-SHIPPING-PROMISE-1003'
And match output.errorMessage == 'Unable to calculate shipping fee due to Internal server error.'

###########################################
@Transit_wfc_Missing
Scenario: Validating error scenario for wfc node is missing 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/wfc_missing.xlsx', filename:'wfc_missing.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_wfc_NonNumeric
Scenario: If numeric cell have non numeric value
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/wfc_NonNumeric.xlsx', filename:'wfc_NonNumeric.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_No_Data
Scenario: No data available in the payload
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/No_Data.xlsx', filename:'No_Data.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_Empty_Cell
Scenario:
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Empty_Cell.xlsx', filename:'Empty_Cell.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_Shipmethod_Missing
Scenario: 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Shipmethod_Missing.xlsx', filename:'Shipmethod_Missing.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_Shipmethod_NonString
Scenario: 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Shipmethod_NonString.xlsx', filename:'Shipmethod_NonString.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_Invalid_TransitWorkDays
Scenario: 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Invalid_TransitWorkingDays.xlsx', filename:'Invalid_TransitWorkingDays.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_More_Columns
Scenario: 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/More_Columns.xlsx', filename:'More_Columns.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_Numeric_NonNumeric
Scenario: 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Numeric_NonNumeric.xlsx', filename:'Numeric_NonNumeric.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_Random_Text
Scenario: 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/Random_Data.xlsx', filename:'Random_Data.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Transit_Invalid_ColumnName
Scenario: 
Given url UPSERT_TRANSITDAYS
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Transit_Days/InvalidColumn_Name.xlsx', filename:'InvalidColumn_Name.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

#############################
@ShippingFee_wfc_Missing
Scenario: Validating error scenario for wfc node is missing 
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/wfc_missing.xlsx', filename:'wfc_missing.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_wfc_NonNumeric
Scenario: If numeric cell have non numeric value
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/ShippingFee_wfc_NonNumeric.xlsx', filename:'ShippingFee_wfc_NonNumeric.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_No_Data
Scenario: No data available in the payload
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/No_Data.xlsx', filename:'No_Data.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_Empty_Cell
Scenario:
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/Empty_Cell.xlsx', filename:'Empty_Cell.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_Shipmethod_Missing
Scenario: 
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/Shipmethod_Missing.xlsx', filename:'Shipmethod_Missing.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_Shipmethod_NonString
Scenario: 
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/Shipmethod_NonString.xlsx', filename:'Shipmethod_NonString.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_More_Columns
Scenario: 
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/More_Columns.xlsx', filename:'More_Columns.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_Numeric_NonNumeric
Scenario: 
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/Numeric_NonNumeric.xlsx', filename:'Numeric_NonNumeric.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_Random_Text
Scenario: 
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/Random_Data.xlsx', filename:'Random_Data.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@ShippingFee_Invalid_ColumnName
Scenario: 
Given url UPSERT_SHIPPINGDATA
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Shipping_Fee/InvalidColumn_Name.xlsx', filename:'InvalidColumn_Name.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400
#######################################

@PackageRates_wfc_Missing
Scenario: Validating error scenario for wfc node is missing 
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/wfc_missing.xlsx', filename:'wfc_missing.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@PackageRates_wfc_NonNumeric
Scenario: If numeric cell have non numeric value
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/wfc_NonNumeric.xlsx', filename:'wfc_NonNumeric.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@PackageRates_No_Data
Scenario: No data available in the payload
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/No_Data.xlsx', filename:'No_Data.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@PackageRates_Empty_Cell
Scenario:
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/Empty_Cell.xlsx', filename:'Empty_Cell.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@PackageRates_More_Columns
Scenario: 
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/More_Columns.xlsx', filename:'More_Columns.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@PackageRates_Numeric_NonNumeric
Scenario: 
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/Numeric_NonNumeric.xlsx', filename:'Numeric_NonNumeric.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@PackageRatese_Random_Text
Scenario: 
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/Random_Data.xlsx', filename:'Random_Data.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@PackageRates_Invalid_ColumnName
Scenario: 
Given url UPSERT_PACKAGERATES
#And header Ocp-Apim-Subscription-Key = '3f0890db28474bf9848427d0325d1af9'
#And header ocp-apim-subscription-key = '7e7c5468176e4328b39f8f2ffb8823d5'
And header UserId = 'spall09'
And header Content-Type = 'multipart/form-data'
And multipart file file = { read: 'classpath:payloads/Wine/Package_Rates/InvalidColumn_Name.xlsx', filename:'InvalidColumn_Name.xlsx', contentType: 'multipart/form-data' }
When method post
And print response
Then status 400

@Shippinglabel_Get_error
Scenario: Retrieving shipping details
Given url Shippinglabel_get+Ordernumber
And header Content-Type = 'application/json'
#And header ocp-apim-subscription-key = '5af679ed650b4b7e99d68c9d99644e29'
#And header ocp-apim-subscription-key = '08442a793abb467989ab6b8c0b095938'
When method get
And print response
Then status 404




@Regenerate_ShippingLabel_Error
Scenario:
Given url REGENERATE_SHIPPINGLABEL
And request payload
And print payload
And header Content-Type = 'application/json'
#And header ocp-apim-subscription-key = '5af679ed650b4b7e99d68c9d99644e29'
#And header ocp-apim-subscription-key = '08442a793abb467989ab6b8c0b095938'
When method post
Then status 412
And print response





