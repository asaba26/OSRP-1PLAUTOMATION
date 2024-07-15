package com.mkpl.utils;

import static com.mongodb.client.model.Sorts.descending;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mongodb.client.result.DeleteResult;
import org.bson.Document;

import com.intuit.karate.Json;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.util.JSON;

public class DbUtils {
	static Map<Object, Object> results = new HashMap<Object, Object>();
	static List<Map<Object, Object>> resultsList = new ArrayList<Map<Object, Object>>();

	@SuppressWarnings("unchecked")
	public static List<Map<Object, Object>> queryDocs_MongoDB_withoutBson(String mongoURI, String dbName,
			String collectionName, String orderId) throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		@SuppressWarnings("deprecation")
		DB database = mongoClient.getDB(dbName);
		DBCollection collection = database.getCollection(collectionName);
		DBCursor cursor = collection.find(new BasicDBObject("orderId", orderId));
		results.clear();
		resultsList.clear();
		while (cursor.hasNext()) {
			results = cursor.next().toMap();
			resultsList.add(results);
		}
		mongoClient.close();
		return resultsList;
	}

	public static List<Map<String, Object>> queryDocs_MongoDB(String mongoURI, String dbName, String collectionName,
			String orderId) throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		List<Map<String, Object>> resultsList = new ArrayList<Map<String, Object>>();
		try {
			MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
			MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
			
			// MongoCursor<Document> cursor = collection.find(new Document("orderId",
			// orderId)).sort(Sorts.ascending("_id")).cursor();
			MongoCursor<Document> cursor = collection.find(new Document("orderId", orderId)).iterator();
			while (cursor.hasNext()) {
				resultsList.add(new Json(cursor.next().toJson()).asMap());
			}
			mongoClient.close();
			return resultsList;
			
		} catch (Exception e) {
			System.out.println("Closing Mongo client on Catch Block");
			// TODO: handle exception
			mongoClient.close();
		}
		return resultsList;
		
	}
	
	public static List<Map<String, Object>> queryDocs_MongoDB_Common(String mongoURI, String dbName, String collectionName, String key,
			String value) throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		List<Map<String, Object>> resultsList = new ArrayList<Map<String, Object>>();
		try {
			MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
			MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
			
			// MongoCursor<Document> cursor = collection.find(new Document("orderId",
			// orderId)).sort(Sorts.ascending("_id")).cursor();
			MongoCursor<Document> cursor = collection.find(new Document(key, value)).iterator();
			while (cursor.hasNext()) {
				resultsList.add(new Json(cursor.next().toJson()).asMap());
			}
			mongoClient.close();
			return resultsList;
			
		} catch (Exception e) {
			System.out.println("Closing Mongo client on Catch Block");
			// TODO: handle exception
			mongoClient.close();
		}
		return resultsList;
		
	}
	public static List<Map<String, Object>> queryDocs_MongoDB_Common1(String mongoURI, String dbName, String collectionName, String key,
																	 String value, String key1, String value1) throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		List<Map<String, Object>> resultsList = new ArrayList<Map<String, Object>>();
		try {
			MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
			MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);

			// MongoCursor<Document> cursor = collection.find(new Document("orderId",
			// orderId)).sort(Sorts.ascending("_id")).cursor();
			MongoCursor<Document> cursor = collection.find(new Document(key, value).append(key1, value1)).iterator();
			//MongoCursor<Document> cursor = collection.find(new Document(key1, value1)).iterator();
			while (cursor.hasNext()) {
				resultsList.add(new Json(cursor.next().toJson()).asMap());
			}
			mongoClient.close();
			return resultsList;

		} catch (Exception e) {
			System.out.println("Closing Mongo client on Catch Block");
			// TODO: handle exception
			mongoClient.close();
		}
		return resultsList;

	}
	public static List<Map<String, Object>> queryDocs_MongoDB_Common(String mongoURI, String dbName, String collectionName) throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		List<Map<String, Object>> resultsList = new ArrayList<Map<String, Object>>();
		try {
			MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
			MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);

			MongoCursor<Document> cursor = collection.find().iterator();
			while (cursor.hasNext()) {
				resultsList.add(new Json(cursor.next().toJson()).asMap());
			}
			mongoClient.close();
			return resultsList;

		} catch (Exception e) {
			System.out.println("Closing Mongo client on Catch Block");
			// TODO: handle exception
			mongoClient.close();
		}
		return resultsList;

	}

	public static List<Map<String, Object>> queryDocs_DMR__MongoDB(String mongoURI, String dbName, String collectionName,
			String orderId) throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
		MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
		List<Map<String, Object>> resultsList = new ArrayList<Map<String, Object>>();
		// MongoCursor<Document> cursor = collection.find(new Document("orderId",
		// orderId)).sort(Sorts.ascending("_id")).cursor();
		MongoCursor<Document> cursor = collection.find(new Document("customerOrderId", orderId)).iterator();
		while (cursor.hasNext()) {
			resultsList.add(new Json(cursor.next().toJson()).asMap());
		}
		mongoClient.close();
		return resultsList;
	}
	public static void updateDocs_MongoDB(String mongoURI, String dbName, String collectionName, BasicDBObject filter,
			BasicDBObject updateObject) {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
		MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);

		UpdateResult result = collection.updateOne(filter, updateObject);
		if (result.getModifiedCount() > 0) {
			System.out.println("Document updated successfully");
		} else if (result.getModifiedCount() == 0) {
			System.out.println("No Documents Updated, Please verify filter or update object");
		}
		mongoClient.close();

	}

	public static void updateTS_eventTracker(String mongoURI, String orderId, String key, String value) {
		BasicDBObject filter = new BasicDBObject();
		filter.put("orderId", orderId);
		filter.put("eventTrackerDetails.eventName", key);
		BasicDBObject newDocument = new BasicDBObject();
		newDocument.put("eventTrackerDetails.$.expectedTS", value);
		BasicDBObject updateObject = new BasicDBObject();
		updateObject.put("$set", newDocument);
		updateDocs_MongoDB(mongoURI, "oslm_mp", "eventTracker", filter, updateObject);
	}
	
	public static void update_mongoDB(String mongoURI,String collection, String orderId, String key, String value) {
		BasicDBObject filter = new BasicDBObject();
		filter.put("orderId", orderId);
		//filter.put("eventTrackerDetails.eventName", key);
		BasicDBObject newDocument = new BasicDBObject();
		newDocument.put(key, value);
		BasicDBObject updateObject = new BasicDBObject();
		updateObject.put("$set", newDocument);
		updateDocs_MongoDB(mongoURI, "oslm_mp", collection, filter, updateObject);
	}

	public static void update_mongoDB_Common(String mongoURI,String collection, String filterKey,String filterValue, String key, Object value) {
		BasicDBObject filter = new BasicDBObject();
		filter.put(filterKey, filterValue);
		//filter.put("eventTrackerDetails.eventName", key);
		BasicDBObject newDocument = new BasicDBObject();
		newDocument.put(key, value);
		BasicDBObject updateObject = new BasicDBObject();
		updateObject.put("$set", newDocument);
		updateDocs_MongoDB(mongoURI, "oslm_mp", collection, filter, updateObject);
	}

	public static void insert_mongoDB(String mongoURI, String dbName, String collectionName, String jsonString) {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
		MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
		DBObject dbObject = (DBObject)JSON.parse(jsonString);
		
		collection.insertOne(Document.parse(jsonString));
		System.out.println("Document inserted successfully");
		mongoClient.close();

	}
	
	public static void deleteDocument(String mongoURI, String dbName, String collectionName, String filterKey, String filterValue) {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
		MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
		BasicDBObject filter = new BasicDBObject();
		filter.put(filterKey, filterValue);
		Document sss = collection.findOneAndDelete(filter);
		if (sss == null) {
			System.out.println("No Document deleted");
		}else {
			System.out.println("Document deleted");
		}
		mongoClient.close();
	}

	public static void deleteAllDocuments(String mongoURI, String dbName, String collectionName, String filterKey, String filterValue) {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
		MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
		BasicDBObject filter = new BasicDBObject();
		filter.put(filterKey, filterValue);
		DeleteResult sss = collection.deleteMany(filter);
		if (sss.getDeletedCount() == 0) {
			System.out.println("No Document deleted");
		}else {
			System.out.println(sss.getDeletedCount() + " Documents deleted");
		}
		mongoClient.close();
	}

	public static List<Map<String, Object>> query_getWineShippingConfig(String mongoURI, String dbName, String collectionName,
			String configType) throws UnknownHostException {
		MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
		MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
		MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
		List<Map<String, Object>> resultsList = new ArrayList<Map<String, Object>>();
		MongoCursor<Document> cursor = collection.find(new Document("configType", configType)).sort(descending("updatedTS")).limit(3).iterator();
		while (cursor.hasNext()) {
			resultsList.add(new Json(cursor.next().toJson()).asMap());
		}
		mongoClient.close();
		System.out.println("*****************************************");
		for (Map<String, Object> map : resultsList) {
			System.out.println(map);
		}
		System.out.println("*****************************************");
		return resultsList;
	}


	

	public static void main(String[] args) {
		String mongoURI = "mongodb://mongodb-osms3pqa1:s6xhIqLefM4zg8L2kLkQEnQBXeeBeCG6sUFnWnNNnGpWWbzScb7u0GPpcrWwecwNw35RFr5PxQOsMi3JczhHDQ==@mongodb-osms3pqa1.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-osms3pqa1@&maxPoolSize=100&waitQueueMultiple=1000";
		deleteDocument(mongoURI, "3porders", "customerdetails", "customerId", "1234567");
	}

}
