   
    Feature: 
    
    @postMessageOnKafkaTopic @Shipment_Label
    Scenario: Post Message On Kafka Topic  
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')   
    * def headers = {'eventId': 'CREATE_SHIPMENT_LABELS'}
    #* def headers = {'orderNumber': orderId}
      #* def headers = {'orderType': 'WINE'}
      #* def headers = {'eventSource': 'ACUPICK'}
      #* def headers = {'storeId': '5799'}
      * kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS,SHIPMENT_LABEL,orderId, payload, headers)
    
    @postMessageOnKafkaTopic @payment_completed
    Scenario: Post Message On Kafka Topic  
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')  
    * def headers = {'eventId': 'PAYMENT_COMPLETED'}  
    * kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS,SHIP_STATUS,orderId, payload, headers)
    
    @postMessageOnKafkaTopic @payment_declined
    Scenario: Post Message On Kafka Topic  
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')  
    * def headers = {'eventId': 'PAYMENT_DECLINED'}  
    * kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS,SHIP_STATUS,orderId, payload, headers)
    
    
  @postMessageOnKafkaTopic @Headder_null
    Scenario: Post Message On Kafka Topic  
    * def kafkaUtils = Java.type('com.mkpl.utils.KafkaUtils')   
    * def headers = {'eventId': ''}  
    * kafkaUtils.postMessageInKafkaTopic(KAFKA_SERVERS,SHIPMENTLABLE_QA,orderId, payload, headers)
    