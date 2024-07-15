package com.mkpl.utils;

import java.io.File;  
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import org.apache.poi.ss.usermodel.Cell;  
import org.apache.poi.ss.usermodel.Row;  
import org.apache.poi.xssf.usermodel.XSSFSheet;  
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import net.minidev.json.JSONObject; 

public class Excel_Reader {
	
	
	//public static  Map<String,String> StoreDetails = new HashMap<String, String>();
	
	public static  Map<String,String> StorefinalDetails = new TreeMap<String, String>();
	//public static List<HashMap<String,String>> all_Store_details= new ArrayList<HashMap<String, String>>();
	
	public static Map<String,String> all_Store_details= new TreeMap<String, String>();
	
	public static Map<String,String> Readxlxs_file(){
	
	//public static void main(String args[])

		Map<String,String> StoreDetails = null;
		int i=1;
	try  
	{  
	File file = new File(System.getProperty("user.dir")+"\\src\\test\\resources\\Resources\\Store_info.xlsx");   //creating a new file instance  
	FileInputStream fis = new FileInputStream(file);  
	XSSFWorkbook wb = new XSSFWorkbook(fis);   
	XSSFSheet sheet = wb.getSheetAt(0);  
	Iterator<Row> itr = sheet.iterator();  
	while (itr.hasNext())                 
	{  
	Row row = itr.next(); 
	StoreDetails= new HashMap<String, String>();

	if(row.getRowNum()==0) {
		
	}
	else {
		
	Iterator<Cell> cellIterator = row.cellIterator();   //iterating over each column  
	while (cellIterator.hasNext())   
	{  
		
	Cell cell = cellIterator.next();  
int collumn_number=cell.getColumnIndex();

	switch (cell.getCellType())               
	{  
	case Cell.CELL_TYPE_STRING:    //field that represents string cell type  
	 
	if(collumn_number==0)
	{
		//StoreDetails.put("storeId"+row.getRowNum(),cell.getStringCellValue());
		StoreDetails.put("storeId",cell.getStringCellValue());
		System.out.print(cell.getStringCellValue() + "\t\t\t"); 
	}
	else if (collumn_number==3) {
		
		//StoreDetails.put("Address"+row.getRowNum(),cell.getStringCellValue());
		StoreDetails.put("Address",cell.getStringCellValue());
		System.out.print(cell.getStringCellValue() + "\t\t\t"); 
	}
else if (collumn_number==4) {
		
		//StoreDetails.put("City"+row.getRowNum(),cell.getStringCellValue());
		StoreDetails.put("City",cell.getStringCellValue());
		System.out.print(cell.getStringCellValue() + "\t\t\t"); 
	}
else if (collumn_number==5) {
	
	//StoreDetails.put("State"+row.getRowNum(),cell.getStringCellValue());
	StoreDetails.put("State"+row.getRowNum(),cell.getStringCellValue());
	System.out.print(cell.getStringCellValue() + "\t\t\t"); 
}
else if (collumn_number==6) {
	
	//StoreDetails.put("Zip"+row.getRowNum(),cell.getStringCellValue());
	StoreDetails.put("Zip",cell.getStringCellValue());
	System.out.print(cell.getStringCellValue() + "\t\t\t"); 
}
else if (collumn_number==10) {
	
	//StoreDetails.put("Default_Vendor"+row.getRowNum(),cell.getStringCellValue());
	StoreDetails.put("Default_Vendor",cell.getStringCellValue());
	System.out.print(cell.getStringCellValue() + "\t\t\t"); 
}
	break;  
	case Cell.CELL_TYPE_NUMERIC:    //field that represents number cell type  
	System.out.print(cell.getNumericCellValue() + "\t\t\t");  
	break;  
	default:  
	}} 
	
	
	} 
	System.out.println("");
	if(StoreDetails.isEmpty()){
		
		
	}
	else {
		all_Store_details.put("Store"+i, StoreDetails.toString());
		
		i++;
	}
	//all_Store_details.add((HashMap<String, String>) StoreDetails);
	
	
	}
	
	}  
	catch(Exception e)  
	{  
	e.printStackTrace();  
	} 
	System.out.println(all_Store_details.toString());
	return all_Store_details;
	
	}
	//return StoreDetails;  
	

	

	
	public static int  Store_Excel_data() {
		StorefinalDetails = Readxlxs_file();
		
		int rowMaxnumber=StorefinalDetails.size();
		
		JSONObject json= new JSONObject();
		json.putAll(StorefinalDetails);
		
		System.out.println(json.toJSONString());
		
		try {
	         FileWriter file = new FileWriter(System.getProperty("user.dir")+"\\src\\test\\resources\\tests\\Storeinfo.json");
	         file.write(json.toJSONString());
	         file.close();
	      } catch (IOException e) {
	        
	         e.printStackTrace();
	      }
		System.out.println("maxRecord"+rowMaxnumber);
		return rowMaxnumber;
	}

}

