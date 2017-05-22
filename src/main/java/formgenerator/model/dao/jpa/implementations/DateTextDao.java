package formgenerator.model.dao.jpa.implementations;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import formgenerator.model.DateText;
import formgenerator.model.dao.ObjectFormDAOI;
import formgenerator.model.dao.jpa.AbstractObjectFormDAO;

@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE )
public class DateTextDao extends AbstractObjectFormDAO<DateText> implements ObjectFormDAOI<DateText>{

}
