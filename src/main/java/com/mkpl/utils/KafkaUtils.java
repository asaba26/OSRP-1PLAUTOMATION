package com.mkpl.utils;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import org.apache.kafka.clients.CommonClientConfigs;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.apache.kafka.common.TopicPartition;
import org.apache.kafka.common.config.SaslConfigs;
import org.apache.kafka.common.config.SslConfigs;
import org.apache.kafka.common.header.Header;
import org.apache.kafka.common.header.Headers;
import org.apache.kafka.common.header.internals.RecordHeaders;
import org.apache.kafka.common.serialization.Serde;
import org.apache.kafka.common.serialization.Serdes;
import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.Topology;
import org.apache.kafka.streams.kstream.Consumed;
import org.apache.kafka.streams.kstream.KStream;

import com.intuit.karate.Json;

import net.minidev.json.JSONObject;

public class KafkaUtils {

	public static Integer postMessageInKafkaTopic(String bootstrapServers, String topicName, String key, String value) {
		Integer messagePartition = null;
		Properties props = new Properties();
		props.setProperty("bootstrap.servers", bootstrapServers);
		props.setProperty("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		// ProducerRecord<String, String> producerRecord = new ProducerRecord<String,
		// String>(topicName, partition, key,
		// value);
		Headers headers = new RecordHeaders();
		headers.add("orderNumber", key.getBytes());
		// headers.add("storeNumber", "0305".getBytes());
		//headers.add("event", "PICKUP-READY".getBytes());
		headers.add("event", "CREATE_SHIPMENT_LABELS".getBytes());
		// headers.add("source", "ECHO".getBytes());
		ProducerRecord<String, String> producerRecord = new ProducerRecord<>(topicName, null, key, value, headers);
		KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);
		Future<RecordMetadata> future = kafkaProducer.send(producerRecord);
		// future.get(500, TimeUnit.MILLISECONDS)

		try {
			messagePartition = future.get().partition();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (future.isDone()) {
			System.out.println("Message Posted successfully on " + topicName);
		} else {
			System.out.println("Could not post message on " + topicName);
		}
		kafkaProducer.close();
		return messagePartition;
	}

	public static Integer postMessageInKafkaTopic(String bootstrapServers, String topicName, String key, String value,Map<String, String> headerMap) {
		Integer messagePartition = null;
		Properties props = new Properties();
		props.setProperty("bootstrap.servers", bootstrapServers);
		props.setProperty("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");
		// ProducerRecord<String, String> producerRecord = new ProducerRecord<String,
		// String>(topicName, partition, key,
		// value);
		Headers headers = new RecordHeaders();
		for (Map.Entry<String, String> entry : headerMap.entrySet()) {
			headers.add(entry.getKey(), entry.getValue().getBytes());
		}
		ProducerRecord<String, String> producerRecord = new ProducerRecord<>(topicName, null, key, value, headers);
		KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);
		Future<RecordMetadata> future = kafkaProducer.send(producerRecord);
		// future.get(500, TimeUnit.MILLISECONDS)

		try {
			messagePartition = future.get().partition();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ExecutionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (future.isDone()) {
			System.out.println("Message Posted successfully on " + topicName);
		} else {
			System.out.println("Could not post message on " + topicName);
		}
		kafkaProducer.close();
		return messagePartition;
	}
	public static void postMessageInKafkaTopicWithConfig(String bootstrapServers, String topicName, String key,
														 String value) {
		Properties props = new Properties();
		props.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
		props.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
				"org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
				"org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty(CommonClientConfigs.SECURITY_PROTOCOL_CONFIG, "SASL_SSL");
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, "src/test/resources/config/trust.jks");
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, "changeit");
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG, "JKS");
		props.setProperty(SaslConfigs.SASL_MECHANISM, "SCRAM-SHA-512");
		props.setProperty(SaslConfigs.SASL_JAAS_CONFIG,
				"org.apache.kafka.common.security.scram.ScramLoginModule required username=\"kc2001\" password=\"Kc$in#123\";");
		ProducerRecord<String, String> producerRecord = new ProducerRecord<String, String>(topicName, key, value);
		KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);
		Future<RecordMetadata> future = kafkaProducer.send(producerRecord);
		if (!future.isDone()) {
			System.out.println("Message Posted successfully on " + topicName);
		} else {
			System.out.println("Could not post message on " + topicName);
		}
		kafkaProducer.close();
	}

	public static void postMessageInKafkaTopicRefundWithConfig(String bootstrapServers,String trustStorePath, String password,String jaasConfig, String topicName,String value) {
Properties props = new Properties();
props.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
props.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
"org.apache.kafka.common.serialization.StringSerializer");
props.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
"org.apache.kafka.common.serialization.StringSerializer");
props.setProperty(CommonClientConfigs.SECURITY_PROTOCOL_CONFIG, "SASL_SSL");
props.setProperty(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, "src/test/resources/config/Refund/trust.jks");
props.setProperty(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, "changeit");
props.setProperty(SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG, "JKS");
props.setProperty(SaslConfigs.SASL_MECHANISM, "SCRAM-SHA-512");
props.setProperty(SaslConfigs.SASL_JAAS_CONFIG,
"org.apache.kafka.common.security.scram.ScramLoginModule required username=\"ca2019\" password=\"Ca1z&1*$z19\";");
ProducerRecord<String, String> producerRecord = new ProducerRecord<String, String>(topicName, value);
KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);
Future<RecordMetadata> future = kafkaProducer.send(producerRecord);
if (!future.isDone()) {
System.out.println("Message Posted successfully on " + topicName);
} else {
System.out.println("Could not post message on " + topicName);
}
kafkaProducer.close();
}


public static void postMessageInKafkaTopicAKSWithConfig(String bootstrapServers,String trustStorePath, String password,String jaasConfig, String topicName, String key,
String value,Map<String, String> headerMap ) {
	Properties props = new Properties();
	props.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
	props.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
	"org.apache.kafka.common.serialization.StringSerializer");
	props.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
	"org.apache.kafka.common.serialization.StringSerializer");
	props.setProperty(CommonClientConfigs.SECURITY_PROTOCOL_CONFIG, "SASL_SSL");
	props.setProperty(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, "src/test/resources/config/Refund/trust.jks");
	props.setProperty(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, "changeit");
	props.setProperty(SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG, "JKS");
	props.setProperty(SaslConfigs.SASL_MECHANISM, "PLAIN");
	props.setProperty(SaslConfigs.SASL_JAAS_CONFIG,
	"org.apache.kafka.common.security.scram.ScramLoginModule required username=\"OS03LM\" password=\"8dcTA8nih4SzkBRSsG1L\";");
	Headers headers = new RecordHeaders();
		//Map<String, String> headerMap = new HashMap<String, String>();
		//headerMap.put("msgSource", "OSLM");
	//	for (Map.Entry<String, String> entry : headerMap.entrySet()) {
	//		headers.add(entry.getKey(), entry.getValue().getBytes());
//		}
	ProducerRecord<String, String> producerRecord = new ProducerRecord<String, String>(topicName, value);
	KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);
	Future<RecordMetadata> future = kafkaProducer.send(producerRecord);
	if (!future.isDone()) {
	System.out.println("Message Posted successfully on " + topicName);
	} else {
	System.out.println("Could not post message on " + topicName);
	}
	kafkaProducer.close();
	}


	public static void postMessageInKafkaTopicWithConfigAndHeaders(String bootstrapServers, String topicName, String key,String value,Map<String, String> headerMap) {
		Properties props = new Properties();
		props.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
		props.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
				"org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
				"org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty(CommonClientConfigs.SECURITY_PROTOCOL_CONFIG, "SASL_SSL");
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, "src/test/resources/config/trust.jks");
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, "changeit");
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG, "JKS");
		props.setProperty(SaslConfigs.SASL_MECHANISM, "SCRAM-SHA-512");
		props.setProperty(SaslConfigs.SASL_JAAS_CONFIG,
				"org.apache.kafka.common.security.scram.ScramLoginModule required username=\"kc2001\" password=\"Kc$in#123\";");
		Headers headers = new RecordHeaders();
		//Map<String, String> headerMap = new HashMap<String, String>();
		//headerMap.put("msgSource", "OSLM");
		for (Map.Entry<String, String> entry : headerMap.entrySet()) {
			headers.add(entry.getKey(), entry.getValue().getBytes());
		}
		ProducerRecord<String, String> producerRecord = new ProducerRecord<String, String>(topicName, null, key, value,headers);
		KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);
		Future<RecordMetadata> future = kafkaProducer.send(producerRecord);
		if (!future.isDone()) {
			System.out.println("Message Posted successfully on " + topicName);
		} else {
			System.out.println("Could not post message on " + topicName);
		}
		kafkaProducer.close();
	}
	public static void postMessageInKafkaTopicWithConfigAndHeaders(String bootstrapServers, String trustStorePath, String password,String jaasConfig, String topicName, String key,
																   String value,Map<String, String> headerMap) {
		Properties props = new Properties();
		props.setProperty(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
		props.setProperty(ProducerConfig.KEY_SERIALIZER_CLASS_CONFIG,
				"org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty(ProducerConfig.VALUE_SERIALIZER_CLASS_CONFIG,
				"org.apache.kafka.common.serialization.StringSerializer");
		props.setProperty(CommonClientConfigs.SECURITY_PROTOCOL_CONFIG, "SASL_SSL");
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_LOCATION_CONFIG, trustStorePath);
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_PASSWORD_CONFIG, password);
		props.setProperty(SslConfigs.SSL_TRUSTSTORE_TYPE_CONFIG, "JKS");
		props.setProperty(SaslConfigs.SASL_MECHANISM, "SCRAM-SHA-512");
		props.setProperty(SaslConfigs.SASL_JAAS_CONFIG,	jaasConfig);
		Headers headers = new RecordHeaders();
		//Map<String, String> headerMap = new HashMap<String, String>();
		//headerMap.put("msgSource", "OSLM");
		for (Map.Entry<String, String> entry : headerMap.entrySet()) {
			headers.add(entry.getKey(), entry.getValue().getBytes());
		}
		ProducerRecord<String, String> producerRecord = new ProducerRecord<String, String>(topicName, null, key, value,headers);
		KafkaProducer<String, String> kafkaProducer = new KafkaProducer<String, String>(props);
		Future<RecordMetadata> future = kafkaProducer.send(producerRecord);
		if (!future.isDone()) {
			System.out.println("Message Posted successfully on " + topicName);
		} else {
			System.out.println("Could not post message on " + topicName);
		}
		kafkaProducer.close();
	}
	public static List<HashMap<String, Object>> retrieveMessagesFromKafka_test(String bootstrapServers, String topicName , Integer partition) {
	/*@Test
	public void kafkaretriveTest(){
		String bootstrapServers="172.21.224.153:9092";
		String topicName="ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_QA";
		int partition=0;*/

		KafkaConsumer<String, String> kafkaConsumer = null;
		List<HashMap<String, Object>> resultMap = new ArrayList<>();
		boolean flag = true;
		List<JSONObject> messagesFromKafka = new ArrayList<>();
		int recordCount = 0;
		int i = 0;
		int maxMessagesToReturn = 5000;
		Properties props = new Properties();
		props.put("bootstrap.servers", bootstrapServers);
		props.put("group.id", topicName + "_automation"+ String.valueOf(new Random().nextInt(90000000) + 10000000));
		props.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");
		props.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
		props.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, "1000");
		props.put(ConsumerConfig.MAX_POLL_INTERVAL_MS_CONFIG, 900000);
		//props.put(ConsumerConfig.AUTO_COMMIT_INTERVAL_MS_CONFIG, 5000);
		props.put(ConsumerConfig.ISOLATION_LEVEL_CONFIG, "read_committed");
		props.put("max.partition.fetch.bytes", "1048576000");
		props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
		props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
		kafkaConsumer = new KafkaConsumer<>(props);

		// kafkaConsumer.subscribe(Arrays.asList(kafkaTopicName));
		// TopicPartition topicPartition1 = new TopicPartition(topicName, 0);
		//TopicPartition topicPartition = new TopicPartition(topicName, partition);
		// kafkaConsumer.assign(Collections.singletonList(topicPartition));
		//kafkaConsumer.assign(Arrays.asList(topicPartition));
		kafkaConsumer.subscribe(Arrays.asList(topicName));
		while (flag) {

			//kafkaConsumer.seekToBeginning(Collections.singletonList(topicPartition));

			// will consume all the messages and store in records
			ConsumerRecords<String, String> records = kafkaConsumer.poll(100);

			// getting total records count
			recordCount = records.count();
			System.out.println("recordCount " + recordCount);
			for (ConsumerRecord<String, String> record : records) {
				if (record.value() != null) {
					if (i >= recordCount - maxMessagesToReturn) {
						// adding last 20 messages to messagesFromKafka
						System.out.println("kafkaMessage " + record.value());
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("key", record.key());
						if (record.value().startsWith("{")) {
							map.put("value", new Json(record.value()).asMap());
						} else {
							map.put("value", record.value());
						}

						// messagesFromKafka.add(new JSONObject(map));\
						resultMap.add(map);
					}
					i++;
				}
			}
			if (recordCount > 0) {
				flag = false;
			}
		}
		kafkaConsumer.close();
		// return messagesFromKafka;
		return resultMap;
	}

	public static List<HashMap<String, Object>> retrieveMessagesFromKafka(String bootstrapServers, String topicName,
																		  Integer partition) {
	/*@Test
	public void kafkaretriveTest(){
		String bootstrapServers="172.21.224.153:9092";
		String topicName="ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_QA";
		int partition=0;*/

		KafkaConsumer<String, String> kafkaConsumer = null;
		List<HashMap<String, Object>> resultMap = new ArrayList<>();
		boolean flag = true;
		List<JSONObject> messagesFromKafka = new ArrayList<>();
		int recordCount = 0;
		int i = 0;
		int maxMessagesToReturn = 50;

		Properties props = new Properties();
		props.put("bootstrap.servers", bootstrapServers);
		props.put("group.id", topicName + "_automation");
		props.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");
		props.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
		props.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, "1000");
		props.put(ConsumerConfig.MAX_POLL_INTERVAL_MS_CONFIG, 900000);
		props.put(ConsumerConfig.AUTO_COMMIT_INTERVAL_MS_CONFIG, 5000);
		// props.put("max.partition.fetch.bytes", "1048576000");
		props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
		props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
		kafkaConsumer = new KafkaConsumer<>(props);

		// kafkaConsumer.subscribe(Arrays.asList(kafkaTopicName));
		// TopicPartition topicPartition1 = new TopicPartition(topicName, 0);
		TopicPartition topicPartition = new TopicPartition(topicName, partition);
		// kafkaConsumer.assign(Collections.singletonList(topicPartition));
		kafkaConsumer.assign(Arrays.asList(topicPartition));
		while (flag) {

			kafkaConsumer.seekToBeginning(Collections.singletonList(topicPartition));

			// will consume all the messages and store in records
			ConsumerRecords<String, String> records = kafkaConsumer.poll(1000);

			// getting total records count
			recordCount = records.count();
			System.out.println("recordCount " + recordCount);
			for (ConsumerRecord<String, String> record : records) {
				if (record.value() != null) {
					if (i >= recordCount - maxMessagesToReturn) {
						// adding last 20 messages to messagesFromKafka
						System.out.println("kafkaMessage " + record.value());
						HashMap<String, Object> map = new HashMap<String, Object>();
						map.put("key", record.key());
						if (record.value().startsWith("{")) {
							map.put("value", new Json(record.value()).asMap());
						} else {
							map.put("value", record.value());
						}
						HashMap<String, String> headerMap = new HashMap<String, String>();
						for (Header header : record.headers()) {
							headerMap.put(header.key(), new String(header.value()));
						}
						map.put("headers", headerMap);
						// messagesFromKafka.add(new JSONObject(map));\
						resultMap.add(map);
					}
					i++;
				}
			}
			if (recordCount > 0) {
				flag = false;
			}
		}
		kafkaConsumer.close();
		// return messagesFromKafka;
		return resultMap;
	}

	public static List<HashMap<String, Object>> retrieveMessagesFromKafkaUsingStreams(String bootstrapServers, String topicName) {

		List<HashMap<String, Object>> resultMap = new ArrayList<>();
		boolean flag = true;
		List<JSONObject> messagesFromKafka = new ArrayList<>();
		int recordCount = 0;
		int i = 0;
		int maxMessagesToReturn = 5000;

		Properties props = new Properties();
		props.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
		//props.put("group.id", "ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_DEV-895");
		props.put(StreamsConfig.APPLICATION_ID_CONFIG, "app-id-automation"+ String.valueOf(new Random().nextInt(90000000) + 10000000));
		props.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
		props.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());

		//props.put(ConsumerConfig.GROUP_ID_CONFIG, "automation_streams_cons1");
		props.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
		props.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");
		props.put(ConsumerConfig.ISOLATION_LEVEL_CONFIG, "read_committed");
		props.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, "1000");
		props.put(ConsumerConfig.MAX_PARTITION_FETCH_BYTES_CONFIG, "1048576000");

		StreamsBuilder streamsBuilder = new StreamsBuilder();
		// Serializers/deserializers (serde) for String and Long types
		final Serde<String> stringSerde = Serdes.String();
		final Serde<Long> longSerde = Serdes.Long();
		KStream<String, String> kStream = streamsBuilder.stream(topicName,Consumed.with(stringSerde, stringSerde));
		//String s = null;
		kStream.foreach((k, v) -> {
			System.out.println("Key : " + k + " Value :" + v);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("key", k);
			if (v.startsWith("{")) {
				map.put("value", new Json(v).asMap());
			} else {
				map.put("value", v);
			}

			// messagesFromKafka.add(new JSONObject(map));\
			resultMap.add(map);

		});


		//kStream.to(s);
		Topology topology = streamsBuilder.build();
		KafkaStreams streams = new KafkaStreams(topology, props);
		streams.start();

		try {
			Thread.sleep(30000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		streams.close();
		// return messagesFromKafka;
		return resultMap;
	}




	public static List<HashMap<String, Object>> retrieveMessagesFromKafkaUsingStream(String bootstrapServers, String topicName) {

		List<HashMap<String, Object>> resultMap = new ArrayList<>();
		boolean flag = true;
		List<JSONObject> messagesFromKafka = new ArrayList<>();
		int recordCount = 0;
		int i = 0;
		int maxMessagesToReturn = 5000;

		Properties props = new Properties();
		props.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, bootstrapServers);
		//props.put("group.id", "ECOM_OSCO_OSS_ORDER_EVENT_TOPIC_DEV-895");
		props.put(StreamsConfig.APPLICATION_ID_CONFIG, "app-id-automation"+ String.valueOf(new Random().nextInt(90000000) + 10000000));
		props.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG, Serdes.String().getClass());
		props.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG, Serdes.String().getClass());

		//props.put(ConsumerConfig.GROUP_ID_CONFIG, "automation_streams_cons1");
		props.put(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
		props.put(ConsumerConfig.ENABLE_AUTO_COMMIT_CONFIG, "false");
		props.put(ConsumerConfig.ISOLATION_LEVEL_CONFIG, "read_committed");
		props.put(ConsumerConfig.MAX_POLL_RECORDS_CONFIG, "1000");
		props.put(ConsumerConfig.MAX_PARTITION_FETCH_BYTES_CONFIG, "1048576000");

		StreamsBuilder streamsBuilder = new StreamsBuilder();
		// Serializers/deserializers (serde) for String and Long types
		final Serde<String> stringSerde = Serdes.String();
		final Serde<Long> longSerde = Serdes.Long();
		KStream<String, String> kStream = streamsBuilder.stream(topicName,Consumed.with(stringSerde, stringSerde));
		//String s = null;
		kStream.foreach((k, v) -> {
			System.out.println("Key : " + k + " Value :" + v);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("key", k);
			if (v.startsWith("{")) {
				map.put("value", new Json(v).asMap());
			} else {
				map.put("value", v);
			}

			// messagesFromKafka.add(new JSONObject(map));\
			resultMap.add(map);

		});


		//kStream.to(s);
		Topology topology = streamsBuilder.build();
		KafkaStreams streams = new KafkaStreams(topology, props);
		streams.start();

		try {
			Thread.sleep(30000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		streams.close();
		// return messagesFromKafka;
		return resultMap;
	}

}
