@ignore
Feature: UPS API

  Background:
   * def headersJson = {'AccessLicenseNumber':'5DB7CE0FD8D0B581' ,'Username':'absdotecomm','Password':'Albertsons1#'}
    * def testDataAll = read('classpath:payloads/InvalidTrackingNumber.json')
    * def testData = testDataAll



  @triggerUPS
  Scenario: Call UPS API
    Given url upsApiUrl + trackingNumber
    And headers headersJson
    When method GET
    Then status 200
    And print response



    @triggerUPSInvalid
  Scenario: Call UPS API
    Given url upsApiUrl + trackingNumber
      And headers headersJson
    When method GET
      Then status 400
    And print response




