package objectform.model;

import java.io.Serializable;
import java.util.List;

public class PDFForm implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Integer id;
 	private Form form;
	private String path;
	private Member owner;
	private List<PDFElement> pdfElements;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Member getOwner() {
		return owner;
	}
	public void setOwner(Member owner) {
		this.owner = owner;
	}
	public List<PDFElement> getPdfElements() {
		return pdfElements;
	}
	public void setPdfElements(List<PDFElement> pdfElements) {
		this.pdfElements = pdfElements;
	}

}

