package Extra;

import java.io.File;
import java.io.FileInputStream;


import com.mkpl.utils.Excel_Reader;

import net.minidev.json.JSONObject;
import net.minidev.json.parser.JSONParser;

public class Store_Validation {
	
	Excel_Reader xlread;
	
	public JSONObject StoreJSON_Reading() throws Exception {
		
		FileInputStream fs= new FileInputStream(new File(System.getProperty("user.dir")+"\\src\\test\\resources\\tests\\Storeinfo.json"));
		JSONParser parser = new JSONParser();
		JSONObject obj= (JSONObject) parser.parse(fs);
		
		
		return obj;
	
	}
	
	
	

}
