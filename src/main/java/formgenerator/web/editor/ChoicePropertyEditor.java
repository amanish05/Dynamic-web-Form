package formgenerator.web.editor;

import java.beans.PropertyEditorSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import formgenerator.model.Choice;
import formgenerator.model.dao.ChoiceDAO;


@Component
@Scope("prototype")
public class ChoicePropertyEditor extends PropertyEditorSupport{

	@Autowired
	ChoiceDAO choiceDao;
	
    @Override
    public void setAsText( String text ) throws IllegalArgumentException
    {
        if( StringUtils.hasText( text ) )
            setValue( choiceDao.getChoice(Integer.parseInt(text)));
    }

    @Override
    public String getAsText()
    {
        Choice choice = (Choice) getValue();
        return choice != null ? choice.getId().toString() : "";
    }
	
}
