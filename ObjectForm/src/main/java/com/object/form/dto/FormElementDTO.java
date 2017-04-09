package com.object.form.dto;

import java.util.Date;
import java.util.List;

import com.object.form.model.MultipleChoice;
import com.object.form.model.Textbox;

public class FormElementDTO {
	
	private String elementType;
    private Integer id;
    private Boolean is_enabled;
    private Boolean is_multiple_answer_allowed;
    private Boolean is_required;
    private String name;
    private String title;
    private Integer group_Id;
    private String default_value;
    private Integer max_length ;
    private Integer size ;
    private Integer column_value ;
    private Integer min_length ;
    private Integer row_value ;
    private Date date_format ;
    private Date default_date ;
    private Integer multiple_choice_type ;
    private Integer number_of_allowed_select ;
    private Integer form_Id;
    
    private List<MultipleChoice> choices;
	
    public String getElementType() {
		return elementType;
	}
	public void setElementType(String elementType) {
		this.elementType = elementType;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Boolean getIs_enabled() {
		return is_enabled;
	}
	public void setIs_enabled(Boolean is_enabled) {
		this.is_enabled = is_enabled;
	}
	public Boolean getIs_multiple_answer_allowed() {
		return is_multiple_answer_allowed;
	}
	public void setIs_multiple_answer_allowed(Boolean is_multiple_answer_allowed) {
		this.is_multiple_answer_allowed = is_multiple_answer_allowed;
	}
	public Boolean getIs_required() {
		return is_required;
	}
	public void setIs_required(Boolean is_required) {
		this.is_required = is_required;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getGroup_Id() {
		return group_Id;
	}
	public void setGroup_Id(Integer group_Id) {
		this.group_Id = group_Id;
	}
	public String getDefault_value() {
		return default_value;
	}
	public void setDefault_value(String default_value) {
		this.default_value = default_value;
	}
	public Integer getMax_length() {
		return max_length;
	}
	public void setMax_length(Integer max_length) {
		this.max_length = max_length;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getColumn_value() {
		return column_value;
	}
	public void setColumn_value(Integer column_value) {
		this.column_value = column_value;
	}
	public Integer getMin_length() {
		return min_length;
	}
	public void setMin_length(Integer min_length) {
		this.min_length = min_length;
	}
	public Integer getRow_value() {
		return row_value;
	}
	public void setRow_value(Integer row_value) {
		this.row_value = row_value;
	}
	public Date getDate_format() {
		return date_format;
	}
	public void setDate_format(Date date_format) {
		this.date_format = date_format;
	}
	public Date getDefault_date() {
		return default_date;
	}
	public void setDefault_date(Date default_date) {
		this.default_date = default_date;
	}
	public Integer getMultiple_choice_type() {
		return multiple_choice_type;
	}
	public void setMultiple_choice_type(Integer multiple_choice_type) {
		this.multiple_choice_type = multiple_choice_type;
	}
	public Integer getNumber_of_allowed_select() {
		return number_of_allowed_select;
	}
	public void setNumber_of_allowed_select(Integer number_of_allowed_select) {
		this.number_of_allowed_select = number_of_allowed_select;
	}
	public Integer getForm_Id() {
		return form_Id;
	}
	public void setForm_Id(Integer form_Id) {
		this.form_Id = form_Id;
	}
	public Textbox getTextbox(FormElementDTO dto) {
		Textbox box = new Textbox();
		box.setId(dto.getId());
		box.setIsRequired(dto.getIs_required());
		box.setTitle(dto.getTitle());
		box.setMaxLength(dto.getMax_length());		
		return box;
	}
    
    

}
