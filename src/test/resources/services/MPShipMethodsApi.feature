Feature: Promise API


  @HappyScenariompshipmethods
  Scenario: Happy Scenario
      Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response

@shippingChargeUPC
  Scenario: Verification of shippingChargeUPC Fields
  Given url mpshipmethodsApiUrl
  And print mpshipmethodsApiUrl
  And request payload
  And print payload
  When method POST
  Then status 200
  And print response
   And print  response.shipMethods[0].shippingChargeUPC

  @cancelCutoffTimeInMinutes
    Scenario: Verification of cancelCutoffTimeInMinutes fields in response
      Given url mpshipmethodsApiUrl
      And print mpshipmethodsApiUrl
      And request payload
      And print payload
      When method POST
      Then status 200
      And print response
      And print response.shipMethods[0].cancelCutoffTimeInMinutes
      * def canceltime = response.shipMethods[0].cancelCutoffTimeInMinutes
      * print canceltime
      * match response.shipMethods[0].cancelCutoffTimeInMinutes == canceltime


  @editCutoffTimeInMinutes
  Scenario: Verification of editCutoffTimeInMinutes fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].editCutoffTimeInMinutes
    * def edittime = response.shipMethods[0].editCutoffTimeInMinutes
    * print edittime
    * match response.shipMethods[0].editCutoffTimeInMinutes == edittime

  @minCartThresholdValue
  Scenario: Verification of minCartThresholdValue fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].minCartThresholdValue
    * def minCartThresholdValue = response.shipMethods[0].minCartThresholdValue
    * print minCartThresholdValue
    * match response.shipMethods[0].minCartThresholdValue == minCartThresholdValue

  @sellerId
  Scenario: Verification of sellerId fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].sellerId
    * def sellerId = response.shipMethods[0].sellerId
    * print sellerId
    * match response.shipMethods[0].sellerId == sellerId


  @shippingOptionId
  Scenario: Verification of shippingOptionId fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].shippingOptions[0].shippingOptionId
    * def shippingOptionId = response.shipMethods[0].shippingOptions[0].shippingOptionId
    * print shippingOptionId
    * match response.shipMethods[0].shippingOptions[0].shippingOptionId == shippingOptionId

  @arriveByTS
  Scenario: Verification of arriveByTS fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].shippingOptions[0].shippingRates[0].arriveByTS
    * def arriveByTS = response.shipMethods[0].shippingOptions[0].shippingRates[0].arriveByTS
    * print arriveByTS
    * match response.shipMethods[0].shippingOptions[0].shippingRates[0].arriveByTS == arriveByTS


  @displayArriveByTS
  Scenario: Verification of displayArriveByTS fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].shippingOptions[0].shippingRates[0].displayArriveByTS
    * def displayArriveByTS = response.shipMethods[0].shippingOptions[0].shippingRates[0].displayArriveByTS
    * print displayArriveByTS
    * match response.shipMethods[0].shippingOptions[0].shippingRates[0].displayArriveByTS == displayArriveByTS


  @shippingFee
  Scenario: Verification of shippingFee fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].shippingOptions[0].shippingRates[0].shippingFee
    * def shippingFee = response.shipMethods[0].shippingOptions[0].shippingRates[0].shippingFee
    * print shippingFee
    * match response.shipMethods[0].shippingOptions[0].shippingRates[0].shippingFee == shippingFee


  @domesticShippingFreeThreshold
  Scenario: Verification of domesticShippingFreeThreshold fields in response
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].shippingOptions[0].shippingRates[0].domesticShippingFreeThreshold
    * def domesticShippingFreeThreshold = response.shipMethods[0].shippingOptions[0].shippingRates[0].domesticShippingFreeThreshold
    * print domesticShippingFreeThreshold
    * match response.shipMethods[0].shippingOptions[0].shippingRates[0].domesticShippingFreeThreshold == domesticShippingFreeThreshold


  @MissingdeliveryZipCodeValue
  Scenario: If delivery ZipCode Value is missing.
    Given url mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode



  @MissingdeliveryZipCodeField
  Scenario: If delivery ZipCode Field is missing.
    Given url mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode



  @MissingStoreTimeZoneField
  Scenario: If Store Time Zone Field is missing.
    Given url mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode


  @MissingStoreTimeZoneValue
  Scenario: If Store Time Zone Value is missing.
    Given url mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode

  @WrongStoreTimeZoneValue
  Scenario: If storeTime Zone Field is Invalid value.
    Given url mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode



  @MissingCartTotalValue
  Scenario: If cart Total  Value is missing.
    Given url mpshipmethodsApiUrl
    And print mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode



  @InvalidPath
  Scenario: Invalid Resource or path ,
    Given url invalidmpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 404
    And print response.timestamp
    And print response.status
    And print response.error
    And print response.message
    And print response.path



  @MissingCartTotalField
      Scenario: If cart Total Field is missing.
    Given url mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode



  @MissingSellerId
  Scenario: If Seller Id is missing.
    Given url mpshipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 412
    And print response
    And print response.errors.errorMessage
    And print response.errors.errorCode


    @MissingSellerInfo
     Scenario: If Seller Information  is missing.
      Given url mpshipmethodsApiUrl
      And request payload
      And print payload
      When method POST
      Then status 412
      And print response
      And print response.errors.errorMessage
      And print response.errors.errorCode