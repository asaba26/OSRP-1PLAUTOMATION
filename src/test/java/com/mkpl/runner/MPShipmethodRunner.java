package com.mkpl.runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;


@KarateOptions(features = "classpath:tests",tags = "@MPShipMethods")
//@KarateOptions(features = "classpath:tests")




@RunWith(Karate.class)
public class MPShipmethodRunner {
	@BeforeClass
	public static void before() {

		 String env ="karate.env";

		System.setProperty(env, "qa");

		//System.setProperty("karate.env", "acceptance");

		//acceptance



		//@ShakeDown,@ShakeDown_accp
	}

}