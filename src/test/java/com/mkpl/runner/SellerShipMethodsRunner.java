package com.mkpl.runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


@KarateOptions(features = "classpath:tests",tags = "@SellerShipMethods")
//@KarateOptions(features = "classpath:tests")




@RunWith(Karate.class)
public class SellerShipMethodsRunner {
	@BeforeClass
	public static void before() {

	//	System.setProperty("karate.env", "qa");

		System.setProperty("karate.env", "acceptance");



		//@ShakeDown,@ShakeDown_accp
	}

}