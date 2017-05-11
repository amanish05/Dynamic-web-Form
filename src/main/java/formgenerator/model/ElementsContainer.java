package formgenerator.model;
import java.io.Serializable;
import java.util.*;

public class ElementsContainer implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private List<FormElement> elements= new ArrayList<FormElement>();
	
	public ElementsContainer()
	{
		
	}
	
	public ElementsContainer(List<FormElement> elements)
	{
		this.elements = elements;
	}
	
	public List<FormElement> getElements()
	{
		return elements;
	}
	
	public void setElements(List<FormElement> elements)
	{
		this.elements = elements;
	}
	
}
