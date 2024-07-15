package com.mkpl.utils;

import com.intuit.karate.driver.chrome.ChromeWebDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;

public class CommonUtils3 {

	public static String CurrentPSTtime( ) {

		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
		formatter.setTimeZone(TimeZone.getTimeZone("PST"));
		 String time = formatter.format(new Date());
		return time;
	}
	public static String addMinutesToPSTtime(int minutes) {

		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss'D'YYYY-MM-dd");
		formatter.setTimeZone(TimeZone.getTimeZone("PST"));
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MINUTE, minutes);
		String time = formatter.format(cal.getTime());
		return time;
	}
	public static String addSecondsToPSTtime(int Seconds) {

		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd'T'HH:mm:ss.SSSXXX");
		formatter.setTimeZone(TimeZone.getTimeZone("PST"));
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.SECOND, Seconds);
		String time = formatter.format(cal.getTime());
		return time;
	
	}
	public static String CurrentPSTdate() {

		SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		formatter.setTimeZone(TimeZone.getTimeZone("PST"));
		String time = formatter.format(new Date());
		return time;
	}
	
	
	
	public static String addDaysToPST(int days) {
		ZonedDateTime currentPST = ZonedDateTime.now(ZoneId.of("PST"));
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
		return currentPST.plusDays(days).format(formatter);
		
	}
	
	

	public static String future_date() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd'T'HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 2);
		String convertedDate = dateFormat.format(cal.getTime());
		return convertedDate.toString();

	}

	public static String Current_date() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 0);
		String convertedDate = dateFormat.format(cal.getTime());
		return convertedDate.toString();

	}
	
	
	
	
	
	public static String convertPSTtoLocal(String date, String timeZone) {
		Instant pst = Instant.parse(date+".000Z");
		ZoneId zoneId = ZoneId.of(timeZone);
		ZonedDateTime zonedTime = ZonedDateTime.ofInstant(pst, zoneId);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd'T'HH:mm:ss");
		return zonedTime.format(formatter);
	}




}
