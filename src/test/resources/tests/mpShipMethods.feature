
Feature: MP ShipMethods API Scenarios for MKPL


  @MPShipMethods

  Scenario: Happy Scenario

    #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyStageScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@HappyScenariompshipmethods') { 'payload' : '#(payload_landing)' }



  @MPShipMethods
  Scenario: Verification of shippingChargeUPC Fields
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
    #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@shippingChargeUPC') { 'payload' : '#(payload_landing)' }




  @MPShipMethods

  Scenario: Verification of cancelCutoffTimeInMinutes fields in response

    #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@cancelCutoffTimeInMinutes') { 'payload' : '#(payload_landing)' }


  @MPShipMethods

  Scenario: Verification of editCutoffTimeInMinutes fields in response

    #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@editCutoffTimeInMinutes') { 'payload' : '#(payload_landing)' }

  @MPShipMethods

  Scenario: Verification of minCartThresholdValue fields in response

   # * def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@minCartThresholdValue') { 'payload' : '#(payload_landing)' }

  @MPShipMethods

  Scenario: Verification of sellerId fields in response

   # * def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@sellerId') { 'payload' : '#(payload_landing)' }

  @MPShipMethods

  Scenario: Verification of shippingOptionId fields in response

    #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@shippingOptionId') { 'payload' : '#(payload_landing)' }

  @MPShipMethods

  Scenario: Verification of arriveByTS fields in response
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')

   # * def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@arriveByTS') { 'payload' : '#(payload_landing)' }

  @MPShipMethods

  Scenario: Verification of displayArriveByTS fields in response
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
    #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@displayArriveByTS') { 'payload' : '#(payload_landing)' }

  @MPShipMethods

  Scenario: Verification of shippingFee fields in response
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')
       #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@shippingFee') { 'payload' : '#(payload_landing)' }

  @MPShipMethods

  Scenario: Verification of domesticShippingFreeThreshold fields in response
    * def payload_landing = read('classpath:payloads/mpShipmethodHappyScenario.json')

    #* def payload_landing = read('classpath:payloads/mpShipmethodHappyAcceptanceScenario.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@domesticShippingFreeThreshold') { 'payload' : '#(payload_landing)' }



  @MPShipMethods
  Scenario: If delivery ZipCode Value is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodmissingdeliveryZipCodeValue.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingdeliveryZipCodeValue') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'deliveryZipCode is missing.'

  @MPShipMethods
  Scenario: If delivery ZipCode Field is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodmissingdeliveryZipCodeField.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingdeliveryZipCodeField') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'deliveryZipCode is missing.'



  @MPShipMethods
  Scenario: If storeTime Zone Value is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodmissingStoreTimeZoneValue.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingdeliveryZipCodeValue') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'storeTimeZone is missing.'




  @MPShipMethods
  Scenario: If storeTime Zone Field is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodmissingStoreTimeZoneField.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingdeliveryZipCodeField') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'storeTimeZone is missing.'



  @MPShipMethods
  Scenario: If storeTime Zone Field is Invalid value.
    * def payload_landing = read('classpath:payloads/mpShipmethodmissingStoreTimeZoneWrongValue.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@WrongStoreTimeZoneValue') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'storeTimeZone is Invalid. Allowed values are :America/Denver,America/New_York,America/Phoenix,America/Chicago,America/Los_Angeles,Pacific/Honolulu,America/Anchorage,America/Boise'


  @MPShipMethods
  Scenario: If cart Total  Value is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodMissingCartValue.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingCartTotalValue') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'cartTotal is missing'


  @MPShipMethods
  Scenario: If cart Total Field is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodMissingCartValue.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingCartTotalField') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'cartTotal is missing'

  @MPShipMethods
  Scenario: If Seller Id is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodSellerMissing.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingSellerId') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'seller id is missing.'



  @MPShipMethods
  Scenario: If Seller Information  is missing.
    * def payload_landing = read('classpath:payloads/mpShipmethodSellerMissingInfo.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@MissingSellerInfo') { 'payload' : '#(payload_landing)' }
    * match payload.responseStatus == 412
    * match payload.response.errors.errorCode == 'OSLM-MP-SHIPMETHODS-SERVICE-1003'
    * match payload.response.errors.errorMessage == 'sellers is missing.'



  @MPShipMethods
  Scenario: Invalid Resource or path
    * def payload_landing = read('classpath:payloads/mpShipmethodMissingCartValue.json')
    * print payload_landing
    * def payload = call read('classpath:services/MPShipMethodsApi.feature@InvalidPath') { 'payload' : '#(payload_landing)' }













