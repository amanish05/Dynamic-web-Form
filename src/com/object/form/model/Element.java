package com.object.form.model;

import java.util.List;

import com.object.form.enums.Size;
import com.object.form.enums.Type;

public class Element {
	
	private String elementId;
	private String elementTitle;
	private Boolean isElementRequired;
	private Type elementType;
	private String elementDefaultValue;
	private Integer minRange;
	private Integer maxRange;
	private List<Choice> choices;
	private Size size;
	

}
