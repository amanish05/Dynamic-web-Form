package objectform.model;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;


//using table per concrete class inheritance strategy

@MappedSuperclass
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Answer {
	
	@Id
	@GeneratedValue
	private String id;
	
	private Member user;
	
	@OneToMany
	private Form form;
	
	@ManyToMany
	private FormElement formElements;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Member getUser() {
		return user;
	}
	public void setUser(Member user) {
		this.user = user;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}
	public FormElement getFormElements() {
		return formElements;
	}
	public void setFormElements(FormElement formElements) {
		this.formElements = formElements;
	}
}