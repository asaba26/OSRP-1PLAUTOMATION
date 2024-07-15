package com.mkpl.utils;

public class ConfigsAuditResponse {

	private String wfcNode;
	private String zipCode;
	private String shipMethod;
	private String configType;
	private String action;
	private String fieldname;
	private String numberOfItems;
	private String previousValue;
	private String newValue;
	private String updatedTS;
	private String updatedBy;
	
	public String getWfcNode() {
		return wfcNode;
	}
	public void setWfcNode(String wfcNode) {
		this.wfcNode = wfcNode;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getShipMethod() {
		return shipMethod;
	}
	public void setShipMethod(String shipMethod) {
		this.shipMethod = shipMethod;
	}
	public String getConfigType() {
		return configType;
	}
	public void setConfigType(String configType) {
		this.configType = configType;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getFieldname() {
		return fieldname;
	}
	public void setFieldname(String fieldname) {
		this.fieldname = fieldname;
	}
	public String getNumberOfItems() {
		return numberOfItems;
	}
	public void setNumberOfItems(String numberOfItems) {
		this.numberOfItems = numberOfItems;
	}
	public String getPreviousValue() {
		return previousValue;
	}
	public void setPreviousValue(String previousValue) {
		this.previousValue = previousValue;
	}
	public String getNewValue() {
		return newValue;
	}
	public void setNewValue(String newValue) {
		this.newValue = newValue;
	}
	public String getUpdatedTS() {
		return updatedTS;
	}
	public void setUpdatedTS(String updatedTS) {
		this.updatedTS = updatedTS;
	}
	public String getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	public String toString()
    {
        return "wfcNode :" +wfcNode + " zipCode : " + zipCode + " shipMethod : " + shipMethod + " configType: "
            + configType + " action : " + action + " fieldname :"
                    + fieldname + " numberOfItems : " + numberOfItems + " previousValue : "
                            + previousValue + " newValue : " + newValue + " updatedTS :"
                            + updatedTS + " updatedBy :" + updatedBy;
    }
}
