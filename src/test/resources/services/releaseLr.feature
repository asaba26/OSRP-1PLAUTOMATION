@ignore
Feature: Release Order from this API

Background:

	* def sleep = function(pause){ java.lang.Thread.sleep(pause) }
	* sleep(2000)
	
	@releaseOrder
  Scenario: Release Order
    Given url OSCO_FF_SERVICES_ENDPOINT + '/api/releaseLr'
		And request 
		"""
		{
		  "changeDateTime": true,
		  "lrNumber": "#(testData.fulfillmentOrderId)",
		  "oscoOrderNumber": "#(testData.orderId)"
		}
		"""
    When method post
    Then status 200
    And print response