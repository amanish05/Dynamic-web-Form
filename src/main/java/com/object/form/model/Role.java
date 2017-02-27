/*
 * The Role class serves as a way to distinguish between regular members and administrators.
 * 
 * id: a unique identifier for the role
 * name: the name of the role.
 */

package com.object.form.model;

import java.io.Serializable;

@Entity
@table(name="Role")
public class Role implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private String id;
	
	@Column(name="NAME")
	private String name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
