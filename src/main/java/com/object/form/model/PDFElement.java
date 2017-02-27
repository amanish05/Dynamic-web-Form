package objectform.model;

import java.io.Serializable;

public class PDFElement implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private Integer name;
	private FormElement formElement;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getName() {
		return name;
	}
	public void setName(Integer name) {
		this.name = name;
	}
	public FormElement getFormElement() {
		return formElement;
	}
	public void setFormElement(FormElement formElement) {
		this.formElement = formElement;
	}
  
}