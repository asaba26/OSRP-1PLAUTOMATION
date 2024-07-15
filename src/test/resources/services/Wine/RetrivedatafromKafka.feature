Feature: 
@retrieveMessageFromKafka @OSLM_ORDER
  Scenario: Retrieve Messages from kafka OSLM-CARRIER-SHIPMENT-QA
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(KAFKA_SERVERS,OSLM_DATA)
    
    @retrieveMessageFromKafka @OSS_DATA
  Scenario: Retrieve Messages from kafka OSLM-CARRIER-SHIPMENT-QA
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(KAFKA_SERVERS,OSS_TOPIC)
     @retrieveMessageFromKafka @EDM_DATA
  Scenario: Retrieve Messages from kafka OSLM-CARRIER-SHIPMENT-QA
     * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(KAFKA_SERVERS,EDM_TOPIC)
    

  @retrieveMessageFromKafka @OSRP_TOTE
  Scenario: Retrieve Messages from kafka OSLM-CARRIER-SHIPMENT-QA
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(KAFKA_SERVERS,OSLM_DATA)