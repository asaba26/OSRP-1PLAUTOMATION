
package com.mkpl.utils;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class FetchDateFormat {

    private static final String[] formats = { 
                "yyyy-MM-dd'T'HH:mm:ss'Z'",   "yyyy-MM-dd'T'HH:mm:ssZ",
                "yyyy-MM-dd'T'HH:mm:ss",      "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                "yyyy-MM-dd'T'HH:mm:ss.SSSZ", "yyyy-MM-dd HH:mm:ss", 
                "MM/dd/yyyy HH:mm:ss",        "MM/dd/yyyy'T'HH:mm:ss.SSS'Z'", 
                "MM/dd/yyyy'T'HH:mm:ss.SSSZ", "MM/dd/yyyy'T'HH:mm:ss.SSS", 
                "MM/dd/yyyy'T'HH:mm:ssZ",     "MM/dd/yyyy'T'HH:mm:ss", 
                "yyyy:MM:dd HH:mm:ss",        "yyyyMMdd", };

        /*
         * @param args

    public static void main(String[] args) {
        String yyyyMMdd = "2023-08-25T07:37:17.617Z";   
        System.out.println(getDateFormat(yyyyMMdd));
    } */

    public static String getDateFormat(String d) {
    	 Date date = null;
    	 String dateFormat = "";
        if (d != null) {
            for (String parse : formats) {
                SimpleDateFormat sdf = new SimpleDateFormat(parse);
                try {
                    date = sdf.parse(d);
                    if (d.equals(sdf.format(date))) {
                        date = null;
                        dateFormat =  parse;
                    }
                } catch (ParseException e) {

                }
            }
        }
        return dateFormat;
    }
}