package com.mkpl.reporting;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.List;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.gherkin.model.And;
import com.aventstack.extentreports.gherkin.model.Feature;
import com.aventstack.extentreports.gherkin.model.Given;
import com.aventstack.extentreports.gherkin.model.Scenario;
import com.aventstack.extentreports.gherkin.model.Then;
import com.aventstack.extentreports.gherkin.model.When;
import com.aventstack.extentreports.reporter.ExtentHtmlReporter;
import com.aventstack.extentreports.reporter.configuration.Theme;
import com.intuit.karate.Results;
import com.intuit.karate.core.Result;
import com.intuit.karate.core.ScenarioResult;
import com.intuit.karate.core.Step;

public class CustomExtentReport {

	private ExtentReports extentReports;
	private ExtentHtmlReporter htmlReporter;
	private String reportTitle = "MarketPlace  Karate Test Execution Report";
	private Results testResults;
	private ExtentTest featureNode;
	private String featureTitle = "";
	private ExtentTest scenarioNode;
	private String scenarioTitle = "";

	private static String reportFileName = "MKPL-Automation-Report"+".html";
    private static String fileSeperator = System.getProperty("file.separator");
    private static String reportFilepath = System.getProperty("user.dir") +fileSeperator+ "target"+fileSeperator+ "ExtentReport";
    private static String reportFileLocation =  reportFilepath +fileSeperator+ reportFileName;
	public CustomExtentReport() {
		extentReports = new ExtentReports();
	}

	public CustomExtentReport withKarateResult(Results testResults) {
		this.testResults = testResults;
		return this;
	}

	public CustomExtentReport withReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
		return this;
	}

	private static String getReportPath (String path) {
    	File testDirectory = new File(path);
        if (!testDirectory.exists()) {
        	if (testDirectory.mkdir()) {
                System.out.println("Extent Report Directory: " + path + " is created!" );
                return reportFileLocation;
            } else {
                System.out.println("Failed to create extent report directory: " + path);
                return System.getProperty("user.dir");
            }
        } else {
            System.out.println("Extent Report Directory already exists: " + path);
        }
		return reportFileLocation;
    }
	public void generateExtentReport() throws UnsupportedEncodingException {

		if (this.testResults != null) {
			String fileName = getReportPath(reportFilepath);
			htmlReporter = new ExtentHtmlReporter(fileName);
			extentReports.attachReporter(htmlReporter);
			setConfig();
			List<ScenarioResult> scenarioResults = getScenarioResults();
			scenarioResults.forEach((scenarioResult) -> {
				String featureName = getFeatureName(scenarioResult);
				String featureDesc = getFeatureDesc(scenarioResult);
				ExtentTest featureNode = createFeatureNode(featureName, featureDesc);
				String scenarioTitle = getSecnarioTitle(scenarioResult);
				ExtentTest scenarioNode = createScenarioNode(featureNode, scenarioTitle);
				scenarioResult.getStepResults().forEach((step) -> {
					addScenarioStep(scenarioNode, step.getStep(), step.getResult());
				});
			});
			extentReports.flush();
			return;
		}
		throw new RuntimeException("Missing the Karate Test Result");
	}

	private List<ScenarioResult> getScenarioResults() {
		return this.testResults.getScenarioResults();
	}

	private String getFeatureName(ScenarioResult scenarioResult) {
		return scenarioResult.getScenario().getFeature().getName();
	}

	private String getFeatureDesc(ScenarioResult scenarioResult) {
		return scenarioResult.getScenario().getFeature().getDescription();
	}

	private ExtentTest createFeatureNode(String featureName, String featureDesc) {

		if (this.featureTitle.equalsIgnoreCase(featureName)) {
			return featureNode;
		}
		this.featureTitle = featureName;
		featureNode = extentReports.createTest(Feature.class, featureName, featureDesc);
		return featureNode;
	}

	private ExtentTest createScenarioNode(ExtentTest featureNode, String scenarioTitle) {

		if (this.scenarioTitle.equalsIgnoreCase(scenarioTitle)) {
			return scenarioNode;
		}
		this.scenarioTitle = scenarioTitle;
		scenarioNode = featureNode.createNode(Scenario.class, scenarioTitle);
		return scenarioNode;
	}

	private String getSecnarioTitle(ScenarioResult scenarioResult) {
		return scenarioResult.getScenario().getName();

	}

	private void addScenarioStep(ExtentTest scenarioNode, Step step, Result stepResult) {
		String type = step.getPrefix(); // Given, When or Then
		String stepTitle = step.getText();
		String status = stepResult.getStatus();
		Throwable error = stepResult.getError();
		ExtentTest stepNode;

		switch (type) {
		case "Given":
			stepNode = scenarioNode.createNode(Given.class, stepTitle);
			addStatus(stepNode, status, error);
			break;
		case "When":
			stepNode = scenarioNode.createNode(When.class, stepTitle);
			addStatus(stepNode, status, error);
			break;
		case "Then":
			stepNode = scenarioNode.createNode(Then.class, stepTitle);
			addStatus(stepNode, status, error);
			break;
		case "And":
			stepNode = scenarioNode.createNode(And.class, stepTitle);
			addStatus(stepNode, status, error);
			break;

		default:
			//stepNode = scenarioNode.createNode(type + " " + stepTitle);
			stepNode = scenarioNode.createNode(And.class, stepTitle);
			addStatus(stepNode, status, error);
			break;
		}
	}

	private void addStatus(ExtentTest stepNode, String status, Throwable error) {
		switch (status) {
		case "passed":
			stepNode.pass("");
			break;
		case "failed":
			stepNode.fail(error);
			break;
		default:
			stepNode.skip("");
			break;
		}
	}

	private void setConfig() {

		extentReports.setReportUsesManualConfiguration(true);
		htmlReporter.config().setDocumentTitle(reportTitle);
		htmlReporter.config().setTheme(Theme.DARK);
		//htmlReporter.config().setJS("document.getElementsByClassName('col-sm-12 col-md-4')[0].style.setProperty('min-inline-size','-webkit-fill-available');");
		
        extentReports.setSystemInfo("Project", "Albertsons");
        extentReports.setSystemInfo("Team", "MKPL");
        
//        htmlReporter.config().setChartVisibilityOnOpen(true);
//        htmlReporter.config().setReportName("Test Report");
//        htmlReporter.config().setTestViewChartLocation(ChartLocation.TOP);
	}

}
