Feature: Promise API




  @HappyScnario
  Scenario: Happy Use Case
    Given url sellershipmethodsApiUrl
   And  print sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response



  @arriveByTS
  Scenario: Verification of arriveByTS field in the response.
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].arriveByTS
    * def arriveByTS = response.shipMethods[0].arriveByTS
    * print arriveByTS
    * match response.shipMethods[0].arriveByTS == arriveByTS

  @displayArriveByTS
  Scenario: Verification of displayArriveByTS field in the response.
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].displayArriveByTS
    * def displayArriveByTS = response.shipMethods[0].displayArriveByTS
    * print displayArriveByTS
    * match response.shipMethods[0].displayArriveByTS == displayArriveByTS

  @minCartThresholdValue
  Scenario: Verification of minCartThresholdValue field in the response.
    Given url sellershipmethodsApiUrl
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
  Scenario: Verification of sellerId field in the response.
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].sellerId
    * def sellerId = response.shipMethods[0].sellerId
    * print sellerId
    * match response.shipMethods[0].sellerId == sellerId

  @shippingFee
  Scenario: Verification of shippingFee field in the response.
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].shippingFee
    * def shippingFee = response.shipMethods[0].shippingFee
    * print shippingFee
    * match response.shipMethods[0].shippingFee == shippingFee

  @domesticShippingFreeThreshold
  Scenario: Verification of domesticShippingFreeThreshold field in the response.
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
    And print response
    And print response.shipMethods[0].domesticShippingFreeThreshold
    * def domesticShippingFreeThreshold = response.shipMethods[0].domesticShippingFreeThreshold
    * print arriveByTS
    * match response.shipMethods[0].domesticShippingFreeThreshold == domesticShippingFreeThreshold



  @differentdeliveryTimeZone
  Scenario: If deliveryTimeZone is a different value other than "America/Denver",
      Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 400
    And print response.errors.errorCode
    And print response.errors.errorMessage



  @missingSellerInfo
  Scenario: If seller is missing ,
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 400
    And print response.errors.errorCode
    And print response.errors.errorMessage




  @InvalidPath
  Scenario: Invalid Resource or path ,
    Given url invalidSellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 404
    And print response.timestamp
    And print response.status
    And print response.error
    And print response.message
    And print response.path



    @firstRecordsBasedSeller
    Scenario: Get the first record for a given sellerId
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 200
      And print response
    And print response.shipMethods[0].sellerId

      @firstshiprateseller
      Scenario: Get the first shippingRate for given seller
        Given url sellershipmethodsApiUrl
        And request payload
        And print payload
        When method POST
        Then status 200
        And print response



        @MissingdeliveryZipCodeValue
        Scenario: deliveryZipcode should not be empty string
          Given url sellershipmethodsApiUrl
          And request payload
          And print payload
          When method POST
          Then status 400
          And print response
          And print response.errors.errorCode
          And print response.errors.errorMessage



  @MissingdeliveryZipCode
  Scenario: deliveryzipcode should not be missing field
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 400
    And print response
    And print response.errors.errorCode
    And print response.errors.errorMessage


  @MissingDeliveryTimeZone
  Scenario: deliverytimezone should not be missing field in request
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 400
    And print response
    And print response.timestamp
    And print response.status
    And print response.error
    And print response.message
    And print response.path


    @EmptyDeliveryTimeZone
   Scenario: deliverytimezone  should not be empty string
    Given url sellershipmethodsApiUrl
    And request payload
    And print payload
    When method POST
    Then status 400
    And print response
    And print response.errors.errorCode
    And print response.errors.errorMessage
