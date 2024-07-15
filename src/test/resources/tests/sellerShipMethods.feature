Feature: Seller ShipMethods API Scenarios for MKPL


  @SellerShipMethods
  Scenario: Happy Use Case
    * def payload_landing = read('classpath:payloads/HappyUseCase.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@HappyScnario') { 'payload' : '#(payload_landing)' }

  @SellerShipMethods
  Scenario: Verification of arriveByTS field in the response.
    * def payload_landing = read('classpath:payloads/HappyUseCase.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@arriveByTS') { 'payload' : '#(payload_landing)' }


  @SellerShipMethods
  Scenario: Verification of displayArriveByTS field in the response.
    * def payload_landing = read('classpath:payloads/HappyUseCase.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@displayArriveByTS') { 'payload' : '#(payload_landing)' }


  @SellerShipMethods
  Scenario: Verification of minCartThresholdValue field in the response.
    * def payload_landing = read('classpath:payloads/HappyUseCase.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@minCartThresholdValue') { 'payload' : '#(payload_landing)' }


  @SellerShipMethods
  Scenario: Verification of sellerId field in the response.
    * def payload_landing = read('classpath:payloads/HappyUseCase.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@sellerId') { 'payload' : '#(payload_landing)' }


  @SellerShipMethods
  Scenario: Verification of shippingFee field in the response.
    * def payload_landing = read('classpath:payloads/HappyUseCase.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@shippingFee') { 'payload' : '#(payload_landing)' }


  @SellerShipMethods
  Scenario: Verification of domesticShippingFreeThreshold field in the response.
    * def payload_landing = read('classpath:payloads/HappyUseCase.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@domesticShippingFreeThreshold') { 'payload' : '#(payload_landing)' }


  @SellerShipMethods
  Scenario: If deliveryTimeZone is a different value other than "America/Denver",
    * def payload_landing = read('classpath:payloads/InvalidDeliveryZone.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@differentdeliveryTimeZone') { 'payload' : '#(payload_landing)' }


  @SellerShipMethods
  Scenario: If seller is missing
    * def payload_landing = read('classpath:payloads/MissingSellerInfo.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@missingSellerInfo') { 'payload' : '#(payload_landing)' }



  @SellerShipMethods
  Scenario: Invalid Resource or path
    * def payload_landing = read('classpath:payloads/MissingSellerInfo.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@InvalidPath') { 'payload' : '#(payload_landing)' }



  @SellerShipMethods
  Scenario: Get the first record for a given sellerId And Zipcode
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def payload_landing = read('classpath:payloads/UniqueInfoSeller.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@firstRecordsBasedSeller') { 'payload' : '#(payload_landing)' }
    * print payload_landing.deliveryZipCode
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','seller_shipping_configs','zipcode',payload_landing.deliveryZipCode)
    * print "sellerId while fetch the data based on zipcode>>>>>>>>>>>" + dbResults[0].sellerId



  @SellerShipMethods
  Scenario: Get the first shippingRate for given seller
    * def dbUtils = Java.type('com.mkpl.utils.DbUtils')
    * def payload_landing = read('classpath:payloads/UniqueInfoSeller.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@firstshiprateseller') { 'payload' : '#(payload_landing)' }
    * print payload_landing.sellers[0]
    * def dbResults = dbUtils.queryDocs_MongoDB_Common(MONGO_URI,'oslm_mp','seller_shipping_configs','sellerId',payload_landing.sellers[0])
    * print dbResults
    * print dbResults[0].shippingRates[0]
    * print dbResults[0].shippingRates[0].shippingFee
    * print dbResults[0].shippingRates[0].deliveryBusinessDays




  @SellerShipMethods
  Scenario: deliveryZipcode should not be empty string
    * def payload_landing = read('classpath:payloads/MissingDeliveryZipCodeValue.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@MissingdeliveryZipCodeValue') { 'payload' : '#(payload_landing)' }



  @SellerShipMethods
  Scenario: deliveryzipcode should not be missing field
    * def payload_landing = read('classpath:payloads/MissingDeliveryZipCode.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@MissingdeliveryZipCode') { 'payload' : '#(payload_landing)' }



  @SellerShipMethods
  Scenario: deliverytimezone should not be missing field in request
    * def payload_landing = read('classpath:payloads/MissingDeliveryTimeZone.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@MissingDeliveryTimeZone') { 'payload' : '#(payload_landing)' }





  @SellerShipMethods
  Scenario: deliverytimezone should not be empty string
    * def payload_landing = read('classpath:payloads/EmptyDeliveryTimeZone.json')
    * print payload_landing
    * def payload = call read('classpath:services/sellerShipMethodsApi.feature@EmptyDeliveryTimeZone') { 'payload' : '#(payload_landing)' }
