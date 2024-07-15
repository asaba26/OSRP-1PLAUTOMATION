package com.mkpl.utils;

import java.text.DecimalFormat;

public class GetLatAndLng {


	
	public static String getLat() {
	 double minLat = -90.00;
	    double maxLat = 90.00;      
	    double latitude = minLat + (double)(Math.random() * ((maxLat - minLat) + 1));   

	    DecimalFormat df = new DecimalFormat("#.#####"); 
	    String lat = df.format(latitude);
	    System.out.println("Lat is " + lat);
	    return lat;

	}
	
	public static String getLng() {
     

		    double minLon = 0.00;
		    double maxLon = 180.00;     
		    double longitude = minLon + (double)(Math.random() * ((maxLon - minLon) + 1));
		    DecimalFormat df = new DecimalFormat("#.#####"); 
		    String lng= df.format(longitude);
		    System.out.println("lng is "+ lng);
		    return lng;
		}
}
