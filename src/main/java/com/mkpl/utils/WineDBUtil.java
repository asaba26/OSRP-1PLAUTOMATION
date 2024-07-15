package com.mkpl.utils;


	import static com.mongodb.client.model.Sorts.descending;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.json.JSONArray;
import org.json.JSONObject;

import com.intuit.karate.Json;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

	public class WineDBUtil {
		
		public static List<ConfigsAuditResponse> query_getWineShippingConfig(String mongoURI, String dbName, String collectionName,
				String configType, int limit) throws UnknownHostException {
			MongoClient mongoClient = new MongoClient(new MongoClientURI(mongoURI));
			MongoDatabase mongoDatabase = mongoClient.getDatabase(dbName);
			MongoCollection<Document> collection = mongoDatabase.getCollection(collectionName);
			List<Map<String, Object>> resultsList = new ArrayList<Map<String, Object>>();
			MongoCursor<Document> cursor = collection.find(new Document("configType", configType)).sort(descending("updatedTS")).limit(limit).iterator();
			while (cursor.hasNext()) {
				resultsList.add(new Json(cursor.next().toJson()).asMap());
			}
			mongoClient.close();
			List<ConfigsAuditResponse> configsAuditResponseList = new ArrayList<ConfigsAuditResponse>();
			
			System.out.println("*****************************************");
			for (Map<String, Object> map : resultsList) {
				JSONObject jsonObj = new JSONObject(map);
				if(jsonObj != null && jsonObj.getString("configType").equalsIgnoreCase("transitConfigs")) {
					checkTransitConfigs(configsAuditResponseList, jsonObj);
				} else if(jsonObj != null && jsonObj.getString("configType").equalsIgnoreCase("shippingFeeConfigs")) {
					checkShippingFeeConfigs(configsAuditResponseList, jsonObj);
				} else if(jsonObj != null && jsonObj.getString("configType").equalsIgnoreCase("packageConfigs")) {
					checkPackageConfigs(configsAuditResponseList, jsonObj);
				}
				
			}
			System.out.println(configsAuditResponseList.size());
			System.out.println("*****************************************");
			return configsAuditResponseList;
		}
		
		private static void checkPackageConfigs(List<ConfigsAuditResponse> configsAuditResponseList,
				JSONObject jsonObj) {
			JSONArray packageRates = jsonObj.has("packageRates") ? jsonObj.getJSONArray("packageRates") :null;
			for(int i=0; i<packageRates.length(); i++) {
				JSONObject numberOfItems = packageRates.getJSONObject(i).getJSONObject("numberOfItems");
				JSONObject packageRate = packageRates.getJSONObject(i).getJSONObject("packageRate");
				ConfigsAuditResponse configsAuditResponse = buildConfigsAuditResponse(jsonObj,
						packageRate, "packageRate", numberOfItems);
				configsAuditResponseList.add(configsAuditResponse);
			}
			
		}
		
		private static void checkShippingFeeConfigs(List<ConfigsAuditResponse> configsAuditResponseList,
				JSONObject jsonObj) {
			JSONArray ratesByItemQuantity = jsonObj.getJSONObject("shippingConfigs").has("ratesByItemQuantity") ? jsonObj.getJSONObject("shippingConfigs").getJSONArray("ratesByItemQuantity") :null;
			for(int i=0; i<ratesByItemQuantity.length(); i++) {
				JSONObject noOfBottles = ratesByItemQuantity.getJSONObject(i).getJSONObject("noOfBottles");
				JSONObject shipRate = ratesByItemQuantity.getJSONObject(i).getJSONObject("shipRate");
				ConfigsAuditResponse configsAuditResponse = buildConfigsAuditResponse(jsonObj,
						shipRate, "shipRate", noOfBottles);
				configsAuditResponseList.add(configsAuditResponse);
			}
			
		}

		private static void checkTransitConfigs(List<ConfigsAuditResponse> configsAuditResponseList,
				JSONObject jsonObj) {
			JSONObject maxTransitDays = jsonObj.getJSONObject("shippingConfigs").has("maxTransitDays") ? jsonObj.getJSONObject("shippingConfigs").getJSONObject("maxTransitDays") : null;
			JSONObject minTransitDays = jsonObj.getJSONObject("shippingConfigs").has("minTransitDays") ? jsonObj.getJSONObject("shippingConfigs").getJSONObject("minTransitDays") : null;
			JSONObject calendarEligible = jsonObj.getJSONObject("shippingConfigs").has("calendarEligible") ? jsonObj.getJSONObject("shippingConfigs").getJSONObject("calendarEligible") : null;
			if(maxTransitDays != null) {
				ConfigsAuditResponse configsAuditResponse = buildConfigsAuditResponse(jsonObj,
						maxTransitDays, "Max Transit Days", null);
				configsAuditResponseList.add(configsAuditResponse);
			}
			
			if(minTransitDays != null) {
				ConfigsAuditResponse configsAuditResponse = buildConfigsAuditResponse(jsonObj,
						minTransitDays,"Min Transit Days", null);
				configsAuditResponseList.add(configsAuditResponse);
			}
			
			if(calendarEligible != null) {
				ConfigsAuditResponse configsAuditResponse = buildConfigsAuditResponse(jsonObj,
						calendarEligible,"Delivery_Transit_Operating_Calendar_Eligible", null);
				configsAuditResponseList.add(configsAuditResponse);
			}
		}

		private static ConfigsAuditResponse buildConfigsAuditResponse(JSONObject jsonObj, JSONObject value, String fieldName, JSONObject noOfBottles) {
			ConfigsAuditResponse configsAuditResponse = new ConfigsAuditResponse();
			configsAuditResponse.setWfcNode(jsonObj.getString("wfcNode")); 
			
			configsAuditResponse.setConfigType(jsonObj.getString("configType")); 
			configsAuditResponse.setAction("Insert"); 
			configsAuditResponse.setFieldname(fieldName); 
			configsAuditResponse.setPreviousValue(value.has("prevValue") ? value.getString("prevValue"): "NA"); 
			configsAuditResponse.setNewValue(value.getString("newValue")); 
			configsAuditResponse.setUpdatedTS(jsonObj.getString("updatedTS")); 
			configsAuditResponse.setUpdatedBy(jsonObj.getString("updatedBy")); 
			
			if(jsonObj != null && jsonObj.getString("configType").equalsIgnoreCase("transitConfigs")) {
				configsAuditResponse.setShipMethod(jsonObj.getJSONObject("shippingConfigs").getString("shipMethod")); 
				configsAuditResponse.setZipCode(jsonObj.getString("zipCode")); 
			}
			if(jsonObj != null && jsonObj.getString("configType").equalsIgnoreCase("shippingFeeConfigs")) {
				configsAuditResponse.setShipMethod(jsonObj.getJSONObject("shippingConfigs").getString("shipMethod")); 
				configsAuditResponse.setNumberOfItems(noOfBottles.getString("newValue"));
			}
			if(jsonObj != null && jsonObj.getString("configType").equalsIgnoreCase("packageConfigs")) {
				configsAuditResponse.setNumberOfItems(noOfBottles.getString("newValue"));
			}
			System.out.println(configsAuditResponse.toString());
			return configsAuditResponse;
		}
		
	   /*public static void main( String args[] ) throws UnknownHostException {
		   String mongoURI="mongodb://mongodb-oslmqa:wCvpPHQoMwIQrdpYt32xCA1ixjKgMAM4z8s4uGFgfo3nc8sn0dCRNgCpAUv39TDZNIH7P3yRWtxDlzg1S80R4g%3D%3D@mongodb-oslmqa.mongo.cosmos.azure.com:10255/?authSource=admin&replicaSet=globaldb&maxIdleTimeMS=120000&readPreference=primary&appname=%40mongodb-oslmqa%40&retryWrites=false&ssl=true";
		   String mongoURI_acc = "mongodb://mongodb-oslmaccp:NpvXk0gxArtssHsGg3iVJlfe5ACHwvJMeUoZhd1ollZMcZYV4rXCVL4tX7XfA3v9wVXtGLAdAFyFscpLIoeDAw==@mongodb-oslmaccp.mongo.cosmos.azure.com:10255/?ssl=true&replicaSet=globaldb&retrywrites=false&maxIdleTimeMS=120000&appName=@mongodb-oslmaccp@";
			query_getWineShippingConfig(mongoURI, "oslm_dtc", "wine_shipping_configs_audit", "packageConfigs");
			//shippingFeeConfigs   //transitConfigs // functionalConfigs packageConfigs
	   }*/
	}
