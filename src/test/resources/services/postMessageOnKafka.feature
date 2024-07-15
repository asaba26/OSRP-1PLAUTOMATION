@ignore
Feature: Get Order Details from OMS



  @postMessageOnKafkaTopic @SHIPMENT_QA
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS,SHIPMENT_QA,orderId, payload)
    
    
      @postMessageOnKafkaTopic @Refund
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def partition = kafkaUtils.postMessageInKafkaTopicRefundWithConfig(KAFKA_SERVERS_REFUND,REFUND_REQUEST_QA,orderId, payload)
    * print partition
    * set testData.partition = partition

  @postMessageOnKafkaTopic @AKS
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def partition = kafkaUtils.postMessageInKafkaTopicRefundWithConfig(KAFKA_SERVERS_AKS,SHIPMENT_LABEL,orderId, payload)
    * print partition
    * set testData.partition = partition

  @postMessageOnKafkaTopic @SHIPMENT_QAHeaders
  Scenario: Post Message On Kafka Topic based on order type
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def headers = {'source': 'LastMile', 'orderType':'marketplace'}
    * print headers
    * kafkaUtils.postMessageInKafkaTopicForOCMFMarketPlace(KAFKA_SERVERS,SHIPMENT_QA,orderId, payload,headers)

  @postMessageOnKafkaTopic @Wine_QAHeaders
  Scenario: Post Message On Kafka Topic based on order type
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def headers = {'source': 'LastMile', 'orderType':'wine'}
    * print headers
    * kafkaUtils.postMessageInKafkaTopicForOCMFWine(KAFKA_SERVERS,SHIPMENT_QA,orderId, payload,headers)



  @postMessageOnKafkaTopic @OSS_ORDER_EVENT_TOPIC
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'stage' ? KAFKA_SERVERS_STAGE : KAFKA_SERVERS
    * def partition = kafkaUtils.postMessageInKafkaTopic(kafka_server,OSS_ORDER_EVENT_TOPIC,orderId, payload)
    * print partition
    * set testData.partition = partition

  @postMessageOnKafkaTopic @OSDT_ORDER_EVENTS
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def kafka_server = env == 'stage' ? KAFKA_SERVERS_STAGE : KAFKA_SERVERS
    * def partition = kafkaUtils.postMessageInKafkaTopic(kafka_server,OSDT_ORDER_EVENTS,orderId, payload, headers)
    * print partition
    * set testData.partition = partition

  @postMessageOnKafkaTopic @OSPK_C02_ORDER_EVENT_TOPIC
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * kafkaUtils.postMessageInKafkaTopicWithConfig(KAFKA_SERVERS_OMS,OSPK_C02_ORDER_EVENT_TOPIC,orderId, payload)
   
   @postMessageOnKafkaTopic @OSPK_C02_ORDER_EVENT_TOPIC_WITH_HEADER
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * kafkaUtils.postMessageInKafkaTopicWithConfigAndHeaders(KAFKA_SERVERS_OMS,OSPK_C02_ORDER_EVENT_TOPIC,orderId, payload, headers)
     
  @postMessageOnKafkaTopic @APS_PICKSTATUS_TOPIC
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS,APS_PICKSTATUS_TOPIC,orderId, payload)


 
  @postMessageOnKafkaTopic @Flash
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def trustStorePath = 'src/test/resources/config/flash-truststore-qa.jks'
    * def trustStorePassword = 's@feway'
    * def jaasConfig = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="aais-cr-02" password="ew#4ewwu@1";'
    * def random = function(max){ return Math.floor(Math.random() * max) }
    * kafkaUtils.postMessageInKafkaTopicWithConfigAndHeaders(KAFKA_SERVERS_FLASH,trustStorePath,trustStorePassword,jaasConfig,EDDW_TOPIC,random(5), payload, headers)

  @postMessageOnKafkaTopic @REFUND_QA
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def trustStorePath = 'src/test/resources/config/Refund/trust.jks'
    * def trustStorePassword = 'changeit'
    * def topicname = 'OCRR_OSLM_REQUEST_QA'
    
    * def jaasConfig = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="ca2019" password="Ca1z&1*$z19";'
    * def partition = kafkaUtils.postMessageInKafkaTopicRefundWithConfig(KAFKA_SERVERS_REFUND,trustStorePath,trustStorePassword,jaasConfig,topicname, payload)
    * print partition
    * set testData.partition = partition


  @postMessageOnKafkaTopic @RP_QA
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
   # * def trustStorePath = 'src/test/resources/config/Refund/trust.jks'
   # * def trustStorePassword = 'changeit'
    #* def topicname = 'OSRP_1PL_TOTES'
    
   # * def jaasConfig = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="ca2019" password="Ca1z&1*$z19";'
   * def headers = {'orderNumber':'#(orderId)','storeNumber':'1502','orderStatus':'CREATED','source':'OMS','messageType':'OMS','fulfillmentSystem':'APS','isFfmEnabled':'false','messagePublishTime':'#(orderCreatedDate)','fulfillmentOrderNumber':'#(fulfillmentOrderId)','routePlannerReasonCode':'TOTE'} 
   * def partition = kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS_ONEPL,OSRP_1PL_TOTES_TOPIC,orderId, payload, headers)
    * print partition
    * set testData.partition = partition



  @postMessageOnKafkaTopic @AKS_QA
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def trustStorePath = 'src/test/resources/config/Refund/trust.jks'
    * def trustStorePassword = 'changeit'
    * def topicname = 'OSPK_OSLM_REQUEST_QA'
    * def jaasConfig = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="OS03LM" password="8dcTA8nih4SzkBRSsG1L";'
    * def partition = kafkaUtils.postMessageInKafkaTopicRefundWithConfig(KAFKA_SERVERS_AKS,trustStorePath,trustStorePassword,jaasConfig,topicname, payload)
    * print partition
    * set testData.partition = partition

  @postMessageOnKafkaTopic @OSRP_1PL_TOTES_EVENTS_TOPIC
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
    * def commonUtils = Java.type('com.mkpl.utils.CommonUtils')
    * def orderCreatedDate = commonUtils.CurrentUTCtime()
    #* def payload = read('classpath:payloads/OnePL/OSRP_1PL_TOTE.json')
    #* def orderNumber = payload.orderNumber
    #* def fulfillmentOrderNumber = payload.fulfillmentOrderNumber
    * def kafka_server = env == 'stage' ? KAFKA_SERVERS_STAGE : KAFKA_SERVERS
   # * def headers = {}
    * def headers = {'orderNumber':'#(orderId)','storeNumber':'1502','orderStatus':'CREATED','source':'OMS','messageType':'OMS','fulfillmentSystem':'APS','isFfmEnabled':'false','messagePublishTime':'#(orderCreatedDate)','fulfillmentOrderNumber':'#(fulfillmentOrderId)','routePlannerReasonCode':'TOTE'} 
    #* def headers = {'orderNumber': orderNumber,'storeNumber':'1502','orderStatus':'RELEASED','source':'OMS','messageType':'OMS','fulfillmentSystem':'APS','isFfmEnabled':'false','fulfillmentOrderNumber': fulfillmentOrderNumber,'messageType':'FFOrder','routePlannerReasonCode':'TOTE'}
    * def partition = kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS_ONEPL,OSRP_1PL_TOTES_TOPIC,testData.orderId, payload, headers)
   * print payload  
   * print partition
    * set testData.partition = partition


  @postMessageOnKafkaTopic @EMOM_ORDER_TOPIC
  Scenario: Post Message On Kafka Topic
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')
#    * kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS,EMOM_ORDER_TOPIC,testData.orderId, payload)
    * def kafka_server = env == 'stage' ? KAFKA_SERVERS_STAGE : KAFKA_SERVERS
    * def headers = {'event':'CREATED','orderCategory':'1P'}
    * def partition = kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS_ONEPL,EMOM_ORDER_TOPIC,testData.orderId, payload,headers)
    * print partition
    * set testData.partition = partition