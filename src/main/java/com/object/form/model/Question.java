/*
 * This Form java class shall contain all the information the form has after converting it
 * 
 * id: a unique identifier
 * title: the title of the form
 * description: a brief description of what the form is
 * createdDate: a date object that tells us the creation date of the form
 * modifiedDate: a date object that tells us the last date in which the form was modified
 * submitDate: a date object that tells us the date that this form has to be submitted by
 * ownedBy: a member object that signifies who the owner is
 * roles: a role object
 * pages: a list of page objects that contains the actual form
 */
package com.object.form.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "t_question")
public class Question implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name = "c_id", unique = true, nullable = false)
	private Integer id;

	@Column(name = "c_description", length = 1000)
	private String description;

	@Column(name = "c_type")
	private Integer type = 0;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "c_questionid")
	private List<Options> options;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public List<Options> getOptions() {
		return options;
	}

	public void setOptions(List<Options> options) {
		this.options = options;
	}

}
