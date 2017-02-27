/*
 * The Member java class is the class for our users that has their necessary information.
 * 
 * id: a unique identifier to differentiate between members with the same name
 * firstName: the first name of the member
 * lastName: the last name of the member
 * middleName: the middle name of the member
 * email: the email address of the member
 * address: the address object that contains where the member lives
 * passcode: an array of characters that contain the password for our member's login
 * roles: the role of the member
 */
package com.object.form.model;

import java.io.Serializable;
import java.util.List;

@Entity
@table(name= "Member")
public class Member implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name="MEMBER_ID")
	private String id;
	
	@Column(name="FIRST_NAME")
	private String firstName;
	
	@Column(name="LAST_NAME")
	private String lastName;
	
	@Column(name="MIDDLE_NAME")
	private String middleName;
	
	@Column(name="EMAIL")
	private String email;
	
	@Embedded
	@Column(name="ADDRESS")
	private Address address;
	
	@Column(type="string", name="PASSCODE")	
	private char[] passcode;
	
	@OneToOne(cascade = CascadeType.ALL, mappedBy="Member")
	@Column(name="ROLES")
	private Role roles;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public char[] getPasscode() {
		return passcode;
	}
	public void setPasscode(char[] passcode) {
		this.passcode = passcode;
	}
	public Role getRoles() {
		return roles;
	}
	public void setRoles(Role roles) {
		this.roles = roles;
	}
	
}
