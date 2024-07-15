@ignore
Feature: Shipping label error scenarios
Background: 

@partial_Data

Scenario: Post api to found partial data found error
Given url Retieve_Shipment_Label
And header Ocp-Apim-Subscription-Key = '5af679ed650b4b7e99d68c9d99644e29'
And request payload
And print payload
And header Content-Type = 'application/json'
When method post
Then status 206
And print response
And def output = response.error
And match output.errorCode == 'OSLM-WINE-SHIPPING-GET-LABEL-1004'
And match output.errorMessage == 'Partial Data Found'

@Data_not_found

Scenario: Post api to get data not found error
Given url Retieve_Shipment_Label
And header Ocp-Apim-Subscription-Key = '5af679ed650b4b7e99d68c9d99644e29'
And request payload
And print payload
And header Content-Type = 'application/json'
When method post
Then status 404
And print response
And def output = response.error
And match output.errorCode == 'OSLM-WINE-SHIPPING-GET-LABEL-1003'
And match output.errorMessage == 'No Data found'

@Reference_number_missing

Scenario: Post api to get data not found error
Given url Retieve_Shipment_Label
And header Ocp-Apim-Subscription-Key = '5af679ed650b4b7e99d68c9d99644e29'
And request payload
And print payload
And header Content-Type = 'application/json'
When method post
Then status 412
And print response
And def output = response.error
And match output.errorCode == 'OSLM-WINE-SHIPPING-GET-LABEL-1001'
And match output.errorMessage == 'reference numbers are missing'
