
Feature: Retrieve Messages from kafka

  @retrieveMessageFromKafka @OSS_ORDER
  Scenario: Retrieve Messages from kafka
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    *  print "Partition Found >>>>>>>>>>>>" + testData.partition
    * def kafkaUtils = Java.type('com.lastmile.utils.KafkaUtils')
    * def kafka_server = env == 'qa' ? KAFKA_SERVERS : KAFKA_SERVERS
    #* def allRecords = env == 'stage' ? kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER_EVENT_TOPIC) : kafkaUtils.retrieveMessagesFromKafka(kafka_server,OSS_ORDER_EVENT_TOPIC,testData.partition)
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER)




		@retriveMessageOnKafkaTopic @OSLM_C02_EVENTS
  Scenario: Retrieve Messages from kafka
    * def kafkaUtils = Java.type('com.lastmile.utils.KafkaUtils')
    *  print "Partition Found >>>>>>>>>>>>" + testData.partition
    * def kafka_server = env == 'stage' ? KAFKA_SERVERS_STAGE : KAFKA_SERVERS
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSLM_C02_EVENTS)
		#* def allRecords = kafkaUtils.retrieveMessagesFromKafka(KAFKA_SERVERS,OSLM_C02_EVENTS,testData.partition)
		* print allRecords
		
	@retriveMessageOnKafkaTopic @OSS_TOPIC_STREAMS
  Scenario: Retrieve Messages from kafka
    * def kafkaUtils = Java.type('com.lastmile.utils.KafkaUtils')
    *  print "Partition Found >>>>>>>>>>>>" + testData.partition
    * def kafka_server = env == 'stage' ? KAFKA_SERVERS_STAGE : KAFKA_SERVERS
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSS_ORDER_EVENT_TOPIC)
		#* def allRecords = kafkaUtils.retrieveMessagesFromKafka(KAFKA_SERVERS,OSLM_C02_EVENTS,testData.partition)
		* print allRecords

  @retriveMessageOnKafkaTopic @OSRP_1PL_TOTES_EVENTS_TOPIC
  Scenario: Retrieve Messages from kafka
    * def kafkaUtils = Java.type('com.lastmile.utils.KafkaUtils')
    *  print "Partition Found >>>>>>>>>>>>" + testData.partition
    * def kafka_server = env == 'stage' ? KAFKA_SERVERS_STAGE : KAFKA_SERVERS
    * def allRecords = kafkaUtils.retrieveMessagesFromKafkaUsingStreams(kafka_server,OSRP_1PL_TOTES_EVENTS_TOPIC)
    * print allRecords