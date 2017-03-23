/*
 * The Page class is used to contain an individual page of the form.
 * 
 * id: a unique identifier for the page
 * isSubmited: a boolean value that determines if that page has been submitted.
 * number: the page number of the form.
 * form: a reference to the Form object where this page belongs to
 * elements: a list of form elements that are in this page
 */

package com.object.form.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "t_options")
public class Options implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	@Column(name = "c_id")
	private Integer id;

	@Column(name = "c_content", length = 1000)
	private String content;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
