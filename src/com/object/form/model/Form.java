package com.object.form.model;

import java.util.Date;
import java.util.List;

public class Form {
	
	private String formID;
	private String title;
	private String ownedBy;
	private Date createdDate;
	private Date modifiedDate;
	private Boolean required;
	private String formDescription;
	private String successMessage;
	List<FormElement> formElements;
	
	

}
