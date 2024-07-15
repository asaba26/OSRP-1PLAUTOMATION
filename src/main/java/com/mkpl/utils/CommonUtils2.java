package com.mkpl.utils;
import java.util.Scanner;

public class CommonUtils2 {

		public static String[] sub(String str)
		{
			String[] arrOfstr = str.split(":");
			for(String a : arrOfstr)
			{
				System.out.println(a);
			}
			return arrOfstr;

		}
		public static void main(String[] args)
		{
			Scanner sc = new Scanner(System.in);
			String str = sc.nextLine();
			String[] result = sub(str);
		}
		
		
	}



