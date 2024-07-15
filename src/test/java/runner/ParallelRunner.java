package runner;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.mkpl.reporting.CustomExtentReport;
import org.junit.Test;

import java.io.UnsupportedEncodingException;

import static org.junit.Assert.assertTrue;

@KarateOptions(features = "classpath:tests",						
								tags = "@Test_prod_issue")

public class ParallelRunner {

	@Test
	public void testParallel() {
		
		Results results = Runner.parallel(getClass(), getThreadCount());
		// Results results = Runner.path("classpath:tests").tags("@BHL").parallel(5);
		generateReport(results);
		assertTrue(results.getErrorMessages(), results.getFailCount() == 0);

	}

	public static void generateReport(Results results) {
		CustomExtentReport extentReport = new CustomExtentReport().withKarateResult(results)
				.withReportTitle("Karate Test Execution Report");
		try {
			extentReport.generateExtentReport();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public int getThreadCount() {
		String threadCount = System.getProperty("threads", "1");
		return Integer.parseInt(threadCount);
	}

}