/*
 * The Choice java class 
 * 
 * id: a unique number that helps identify choices from one another
 * text: the text that the choice contains
 */
package com.object.form.model;

import java.io.Serializable;

public class Choice implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String id;	
	private String text;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
	
	

}
