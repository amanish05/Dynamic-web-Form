package formgenerator.model;


import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("TextDateA")
public class DateTextAnswer extends Answer {

	private static final long serialVersionUID = 1L;
	
	@Column(name = "date_value")
	private String date;

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	} 
}
