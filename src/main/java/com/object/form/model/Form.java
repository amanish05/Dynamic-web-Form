package com.object.form.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Form implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	private String title;
	private String description;
	private Date createdDate;
	private Date modifiedDate;
	private Date submitDate;
	private Member ownedBy;
	private Role roles;
	private List<Page> pages;
	
	
	public List<Page> getPages() {
		return pages;
	}
	public void setPages(List<Page> pages) {
		this.pages = pages;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public Date getModifiedDate() {
		return modifiedDate;
	}
	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}
	public Date getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	public Member getOwnedBy() {
		return ownedBy;
	}
	public void setOwnedBy(Member ownedBy) {
		this.ownedBy = ownedBy;
	}
	public Role getRoles() {
		return roles;
	}
	public void setRoles(Role roles) {
		this.roles = roles;
	}
}
