package com.mkpl.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.TimeZone;

public class CommonUtils {


	public static String CurrentUTCtime() {

		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd'T'HH:mm:ssXXX");
		formatter.setTimeZone(TimeZone.getTimeZone("UTC"));
		String time = formatter.format(new Date());
		return time;
	}


	public static String CurrentUTCdate() {

		SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
		formatter.setTimeZone(TimeZone.getTimeZone("UTC"));
		String time = formatter.format(new Date());
		return time;
	}

	public static String minusDaysToUTC(int days) {
		ZonedDateTime currentUTC = ZonedDateTime.now(ZoneId.of("UTC"));
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd'T'HH:mm:ss.SSSXXX");
		return currentUTC.minusDays(days).format(formatter);

	}

	public static String create_random_referenceNumber() {
		Random Ordnum = new Random();
		String orderId = String.valueOf(Ordnum.nextInt(900000000) + 100000000);
		String orderId1 = String.valueOf(Ordnum.nextInt(90) + 10);
		String orderId2 = String.valueOf(Ordnum.nextInt(900000) + 100000);
		String referenceNumber = orderId + "-BOX-" + orderId1 + "-" + "LL-" + orderId2;
		return referenceNumber;
	}

	public static String addSecondsToUTCtime(int seconds) {

		SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-dd'T'HH:mm:ss.SSSXXX");
		formatter.setTimeZone(TimeZone.getTimeZone("UTC"));
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.SECOND, seconds);
		String time = formatter.format(cal.getTime());
		return time;
	}

	public static String create_random_orderId() {

		Random Ordnum = new Random();
		String orderId = String.valueOf(Ordnum.nextInt(900000000) + 100000000);
		return orderId;

	}

	public static String future_date() {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, 1);
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

	public static String addDaysToUTC(int days) {
		ZonedDateTime currentUTC = ZonedDateTime.now(ZoneId.of("UTC"));
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd'T'HH:mm:ss.SSSXXX");
		return currentUTC.plusDays(days).format(formatter);

	}

	public static String convertUTCtoLocal(String date, String timeZone) {
		Instant utc = Instant.parse(date + ".000Z");
		ZoneId zoneId = ZoneId.of(timeZone);
		ZonedDateTime zonedTime = ZonedDateTime.ofInstant(utc, zoneId);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("YYYY-MM-dd'T'HH:mm:ss");
		return zonedTime.format(formatter);
	}

	public static int convetStringToInteger(String i) {
		Integer number = Integer.valueOf(i);
		//int j=Integer.parseInt(i);
		return number;
	}

	public static String DateFormat(String d) {
		if (d != null) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
				sdf.parse(d);
				return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

			} catch (ParseException e) {
				return "invalid";
			}
		}
		return "invalid";
	}

	public static String DateFromUTC(String d) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		try {

			date = dateFormat.parse(d);
			String output = dateFormat.format(date);
			return output;

		} catch (ParseException e) {
			return "invalid";
		}
	}

	public static String addDaysTogivendate(String Date) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		try{
			cal.setTime(sdf.parse(Date));
		}catch(ParseException e){
			e.printStackTrace();
		}
		cal.add(Calendar.DAY_OF_MONTH, 1);
		String dateAfter = sdf.format(cal.getTime());
		return dateAfter;

	}




}
