package com.object.form.model;

import java.util.Date;
import java.util.List;

public class Form {
	
	private String formID;
	private String title;
	private String formDescription;
	private String successMessage;	
	private Date createdDate;
	private Date modifiedDate;	
	private Member ownedBy;
	private List<FormElement> formElements;
	private List<Role> roles;

}
