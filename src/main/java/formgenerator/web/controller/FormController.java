package formgenerator.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.itextpdf.forms.PdfAcroForm;
import com.itextpdf.forms.fields.PdfFormField;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfReader;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;

import org.springframework.web.context.WebApplicationContext;

import formgenerator.model.Answer;
import formgenerator.model.Choice;
import formgenerator.model.DateText;
import formgenerator.model.DateTextAnswer;
import formgenerator.model.ElementsContainer;
import formgenerator.model.FileUploadForm;
import formgenerator.model.Form;
import formgenerator.model.FormElement;
import formgenerator.model.FormFile;
import formgenerator.model.GroupElement;
import formgenerator.model.Member;
import formgenerator.model.MultipleChoice;
import formgenerator.model.MultipleChoiceAnswer;
import formgenerator.model.Page;
import formgenerator.model.Textbox;
import formgenerator.model.TextboxAnswer;
import formgenerator.model.dao.AnswerDAO;
import formgenerator.model.dao.ElementDAO;
import formgenerator.model.dao.FileUploadFormDAO;
import formgenerator.model.dao.FormDAO;
import formgenerator.model.dao.MemberDAO;
import formgenerator.model.dao.ObjectFormDAOI;
import formgenerator.model.dao.PageDAO;
import formgenerator.web.editor.ChoicePropertyEditor;

@Controller
@SessionAttributes({"form", "pdfElementsContainer", "elementsContainer"})
public class FormController {
	
	@Autowired
	private FormDAO formDao;	
	
	@Autowired
	private PageDAO pageDao;
	
	@Autowired
	private MemberDAO memberDao;

	@Autowired
	private AnswerDAO answerDao;	
	
	@Autowired
	private ElementDAO elementDao;
	
	
	@Autowired
	private FileUploadFormDAO fileUploadDao;
	
	@Autowired
	private WebApplicationContext context;
	
	private final ObjectFormDAOI<GroupElement> groupDao;
	private final ObjectFormDAOI<Textbox> textDao;
	private final ObjectFormDAOI<MultipleChoice> multiChoiceDao;
	private final ObjectFormDAOI<FormFile> formfileDao;

	private Map<String, String> availableFields;

	
    @InitBinder
    public void initBinder( WebDataBinder binder )
    {
        binder.registerCustomEditor( Choice.class,
            (ChoicePropertyEditor) context.getBean( "choicePropertyEditor" ) );
    }
	
	@Autowired	
	public FormController(@Qualifier("GroupElementDAO") final ObjectFormDAOI<GroupElement> dao,
			@Qualifier("TextboxDAO") final ObjectFormDAOI<Textbox> textdao,
			@Qualifier("MultipleChoiceDAO") final ObjectFormDAOI<MultipleChoice> multichoicedao,
			@Qualifier("FormFileUpload") final ObjectFormDAOI<FormFile> filedao){
		this.groupDao = dao;
		this.textDao = textdao;
		this.multiChoiceDao = multichoicedao;
		this.formfileDao = filedao;
	}
	
	@RequestMapping(value = { "index.html", "add.html", "edit.html" })
	private String index(ModelMap model) {
		return "redirect:form/list.html";
	}

	@RequestMapping(value = { "form/list.html" })
	private String list(ModelMap model, Principal principal) {
		
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		boolean currentUserRole = false;
		if(authentication != null){
			currentUserRole = authentication.getAuthorities().stream()
			          .anyMatch(role -> role.getAuthority().equals("User"));
		}		
		
		if(currentUserRole){
			
			String currentUser = principal.getName();			
			Member member = memberDao.getMemberbyUserName(currentUser);			
			Map<String, String> param = new HashMap<>(1);			
			param.put("memberId", member.getId().toString());			
			Set<Form> forms = formDao.findByNamedQuery("assignedform.by.named.query", param);			
			model.put("forms", forms);
			
		}else{
			List<Form> forms = formDao.getForms();
			model.put("forms", forms);			
		}		

		return "form/list";

	}
	
	@RequestMapping(value = { "/form/publish.html" }, method = RequestMethod.GET)
	private String publish(ModelMap model, HttpServletRequest request) {
		
		Set<Form> forms = formDao.findByNamedQuery("published.form.by.named.query", new HashMap<>(1));
		model.put("forms", forms);
		
		String flag = (String)request.getAttribute("updateFlag");
		System.out.println("Flag is: "+request.getAttribute("updateFlag"));
		System.out.println("Flag is: "+model.get("updateFlag"));
		if(flag != null && flag != ""){
			model.put("flag", flag);
			model.put("FormTitle", (String)request.getAttribute("FormTitle"));
		}
		System.out.print("Publish Get");
		return "form/publish";
	}
	
	@RequestMapping(value = { "/form/publish.html" }, method = RequestMethod.POST)
	private String publish( @RequestParam int formID, ModelMap model) {
		
		Form form = formDao.getForm(formID);
		Date myDate = new Date();
		form.setSubmitDate(new java.sql.Timestamp(myDate.getTime()));
		formDao.saveForm(form);		
		
		model.put("updateFlag",true);
		model.put("FormTitle",form.getTitle());
		Set<Form> forms = formDao.findByNamedQuery("published.form.by.named.query", new HashMap<>(1));
		model.put("forms", forms);
		
		System.out.print("Publish POST");
		return "form/publish";
		
	}

	@RequestMapping(value = { "/form/add.html" }, method = RequestMethod.GET)
	private String add(ModelMap model) {		

		model.put("form", new Form());
		model.put("numofpages", 1);
		
		return "form/add";
	}

	@RequestMapping(value = { "/form/add.html" }, method = RequestMethod.POST)
	private String add(@ModelAttribute Form form, @RequestParam int numofpages, Principal principal) {
		
		Date myDate = new Date();
		form.setCreatedDate(new java.sql.Timestamp(myDate.getTime()));
									
		form.setOwnedBy(memberDao.getMemberbyUserName(principal.getName()));		
		List<Page> pages = new ArrayList<Page>();
		for(int i = 1; i <= numofpages; i++) {
			Page page = new Page();
			page.setNumber((byte) i);
			page.setForm(form);
			pages.add(page);
		}
		
		form.setPages(pages);		
		formDao.saveForm(form);

		return "redirect:list.html";
	}

	@RequestMapping(value = { "/form/edit.html" }, method = RequestMethod.GET)
	private String edit(@RequestParam Integer id, ModelMap model) {

		model.put("form", formDao.getForm(id));
		return "form/edit";
	}

	@RequestMapping(value = { "/form/edit.html" }, method = RequestMethod.POST)
	private String edit(@ModelAttribute Form form, SessionStatus status) {
		
		Date myDate = new Date();
		form.setModifiedDate(new java.sql.Timestamp(myDate.getTime()));				
		
		formDao.saveForm(form);
		status.setComplete();

		return "redirect:list.html";
	}
	
	

		
	@RequestMapping(value = { "/form/formsheet.html" }, method = RequestMethod.GET)
	private String getFormsheet(ModelMap model, @RequestParam Integer formId, @RequestParam(required = false) Integer fpId, Principal principal) {
		
		boolean isReadOnly=false;
		
		System.out.println();
		if (fpId == null) {
			fpId = 0;
		}
		
		int counter = 1, defaultPage = 0;
		boolean isValid = false;
		Form curForm = formDao.getForm(formId);
		List<Page> pages = curForm.getPages();
		
		List<String> pageLinks = new ArrayList<>(pages.size());
		for (Page p : pages) {
			if (counter == 1){
				defaultPage = p.getId();
			}
				
			if (fpId == p.getId()){
				isValid = true;
			}				
			pageLinks.add("formsheet.html?fpId=" + p.getId() + "&formId=" + formId);
			counter++;
		}

		Page p;
		if (fpId > 0 && isValid) {
			p = pageDao.getPage(fpId);

		} else {
			p = pageDao.getPage(defaultPage);
		}
		
		Member curMember = memberDao.getMemberbyUserName(principal.getName());
		
		List<FormElement> elements = new ArrayList<>();
				
 		for (FormElement e : p.getElements()) {
					
			if(e.getType().equals("GroupElement")){
				Map<String, String> params = new HashMap<>();
				params.put("id", e.getId().toString());
				GroupElement ge = groupDao.findByCriteria(params, GroupElement.class);
				elements.add(ge);				
			}
			
			if(e.getType().equals("DateText")){
				
				DateText ge = (DateText)e;				
				DateTextAnswer answer = new DateTextAnswer();
				
				answer.setUser(curMember);
				answer.setForm(curForm);
				List<FormElement> elList = new ArrayList<FormElement>();
				elList.add(ge);
				answer.setFormElements(elList);
				List<Answer> answers= new ArrayList<Answer>();
				answers.add(answer);
				ge.setAnswers(answers);
				elements.add(ge);							
			}
			
			if(e.getType().equals("Textbox")){
				
				Textbox ge = (Textbox)e;				
				TextboxAnswer answer = new TextboxAnswer();
				
				answer.setUser(curMember);
				answer.setForm(curForm);
				List<FormElement> elList = new ArrayList<FormElement>();
				elList.add(ge);
				answer.setFormElements(elList);
				List<Answer> answers= new ArrayList<Answer>();
				answers.add(answer);
				ge.setAnswers(answers);
				elements.add(ge);							
			}
			
			if(e.getType().equals("MultipleChoice")){
				
				MultipleChoice ge = (MultipleChoice)e;
				
				MultipleChoiceAnswer answer = new MultipleChoiceAnswer();
				answer.setUser(curMember);
				answer.setForm(curForm);
				List<FormElement> elList = new ArrayList<FormElement>();
				elList.add(ge);
				answer.setFormElements(elList);
				answer.setChoiceAnswers(null);
				List<Answer> answers= new ArrayList<Answer>();
				answers.add(answer);
				ge.setAnswers(answers);
				elements.add(ge);								
			}
			
			if(e.getType().equals("FormFile")){
				
				FormFile ge = (FormFile)e;			
				elements.add(ge);								
			}
						
			System.out.println("The type is: " +e.getType());
		}
		
		ElementsContainer elementsContainer = new ElementsContainer(elements);
		model.put("elementsContainer", elementsContainer);
		model.addAttribute("form", curForm);
		model.addAttribute("pageLinks", pageLinks);
		if (isReadOnly)
			model.addAttribute("isReadonly", true);
		else
			model.addAttribute("isReadonly", false);
			
		
		return "form/formsheet";
	}

	
	
	
	@RequestMapping(value = { "/form/preview.html" }, method = RequestMethod.GET)
	private String preview(ModelMap model, @RequestParam Integer formId, @RequestParam(required = false) Integer fpId) {
		
		if (fpId == null) {
			fpId = 0;
		}
		
		int counter = 1, defaultPage = 0;
		boolean isValid = false;
		Form curForm = formDao.getForm(formId);
		List<Page> pages = curForm.getPages();
		
		List<String> pageLinks = new ArrayList<>(pages.size());
		for (Page p : pages) {
			if (counter == 1){
				defaultPage = p.getId();
			}
				
			if (fpId == p.getId()){
				isValid = true;
			}				
			pageLinks.add("preview.html?fpId=" + p.getId() + "&formId=" + formId);
			counter++;
		}

		Page p;
		if (fpId > 0 && isValid) {
			p = pageDao.getPage(fpId);

		} else {
			p = pageDao.getPage(defaultPage);
		}
		
		List<FormElement> elements = new ArrayList<>();
		for (FormElement e : p.getElements()) {
			
			if(e.getType().equals("GroupElement")){
				Map<String, String> params = new HashMap<>();
				params.put("id", e.getId().toString());
				GroupElement ge = groupDao.findByCriteria(params, GroupElement.class);
				elements.add(ge);				
			}
			
			if(e.getType().equals("Textbox")){
				Map<String, String> params = new HashMap<>();
				params.put("id", e.getId().toString());
				Textbox ge = textDao.findByCriteria(params, Textbox.class);
				elements.add(ge);								
			}
			
			if(e.getType().equals("MultipleChoice")){
				Map<String, String> params = new HashMap<>();
				params.put("id", e.getId().toString());
				MultipleChoice ge = multiChoiceDao.findByCriteria(params, MultipleChoice.class);
				elements.add(ge);								
			}
			
			if(e.getType().equals("FormFile")){
				Map<String, String> params = new HashMap<>();
				params.put("id", e.getId().toString());
				FormFile ge = formfileDao.findByCriteria(params, FormFile.class);
				elements.add(ge);								
			}
			
			if(e.getType().equals("DateText")){
				
				DateText ge = (DateText)elementDao.getElement(e.getId());
				elements.add(ge);								
			}
			
			System.out.println("The type is: " +e.getType());
		}

		model.put("form", curForm);		
		model.addAttribute("elements", elements);
		model.addAttribute("pageLinks", pageLinks);

		return "form/preview";
	}
	
	@RequestMapping(value = { "/form/preview.html" }, method = RequestMethod.POST)
	private String preview(@ModelAttribute Form form, SessionStatus status)
	{
		return "form/list";
	}

	@RequestMapping(value = "/form/delete.html", method = RequestMethod.GET)
	private String edit(@RequestParam Integer formId) {
		Form form = formDao.getForm(formId);
		formDao.delete(form);

		return "redirect:list.html";
	}
	
	@RequestMapping(value = "/form/reset.html")
	private String reset(ModelMap model) {
		Form form = new Form();
		model.put("form", form);
		return "redirect:add.html";
	}

	
	
	@RequestMapping(value = { "/form/respondents.html" }, method = RequestMethod.GET)
	private String preview(ModelMap model, @RequestParam Integer id) {
		
		List<Member> members = formDao.getFormRespondants(id);
		Form curForm = formDao.getForm(id);
		model.put("members", members);
		model.put("form", curForm);
		
		return "form/respondents";
	}
	
	@RequestMapping(value = "/pdfmap/pdfupload.html", method = RequestMethod.GET)
	private String PdfManipulation(ModelMap model) throws Exception {		
		
		model.put("forms", formDao.getForms());			
		return "pdfmap/upload";
	}
	
	@RequestMapping(value = "/pdfmap/upload.html", method = RequestMethod.POST)
	private String PdfManipulation(@RequestParam Integer formId, List<MultipartFile> pdfs, ModelMap model , SessionStatus status) throws Exception {
		
		System.out.println("received form Id : " +formId +" and pdf size: "+pdfs.size());		
		String location = "C:/Users/Kumar/Downloads/CS5220/PDFs";		
		
		try {		
			pdfs.forEach(received -> {				
				
				Path SRC = Paths.get(location + File.separator + received.getName());				
				
				try {					
					Files.write(SRC, received.getBytes());
					availableFields = createPdf(SRC.toString());
					model.put("desc", SRC.toString());
				} catch (Exception e) {					
					e.printStackTrace();
				}				
			});
		} catch (Exception e) {			
			e.printStackTrace();
		}
		
		
		Form curForm = formDao.getForm(formId);		
		
		List<FormElement> formElements = new ArrayList<>();
				
		curForm.getPages().forEach(page ->{
			
			List<FormElement> elements = page.getElements();
			elements.forEach( element -> {	
				
				if(element.getType().equals("MultipleChoice")){
					
					Map<String, String> params = new HashMap<>();
					params.put("id", element.getId().toString());					
					MultipleChoice mc = multiChoiceDao.findByCriteria(params, MultipleChoice.class);
					
					System.out.println("MC size of element is: " + mc.getChoices().size());
					
					formElements.add((MultipleChoice)element);
									
				}else if(element.getType().equals("DateText")){
					
					formElements.add((DateText) element);					
					
				} else if(element.getType().equals("Textbox")){					
					formElements.add((Textbox)element);
				}
			});			
		});
		
		ElementsContainer pdfElementsContainer = new ElementsContainer(formElements);
		model.put("formId", formId);	
		model.put("members", memberDao.getMembers());
		model.put("availableFields", availableFields);
		model.addAttribute("pdfElementsContainer", pdfElementsContainer);
		
		return "pdfmap/pdfElementMapping";
		
	}
	
	
	@RequestMapping(value = "/pdfmap/pdfElementMapping.html", method = RequestMethod.POST)
	private void mapPdfFields(@ModelAttribute("pdfElementsContainer") ElementsContainer pdfElementsContainer, @RequestParam Integer formId, @RequestParam String desc, @RequestParam Integer memberId,  SessionStatus status,
			HttpServletRequest request, HttpServletResponse response) throws Exception {		
				
		pdfElementsContainer.getElements().forEach(element -> {	
			elementDao.saveElement(element);			
		});
		
				
		String destination = "C:/Users/Kumar/Downloads/CS5220/PDFs";
		Path SRC = Paths.get(destination + File.separator + formId);
		
		downloadPdf(desc, SRC.toString(), memberId, formId, request, response);
	}
	
	public Map<String, String> createPdf(String src) throws IOException {
		 
        PdfDocument pdf = new PdfDocument(new PdfReader(src));
        
        boolean createIfNotExist = true;
        PdfAcroForm form = PdfAcroForm.getAcroForm(pdf, createIfNotExist); // represents the static form technology       
        Map<String, PdfFormField> fields = form.getFormFields();
        
        Map<String, String> data = new HashMap<>(fields.size());
        fields.forEach((value, field) -> {
        	System.out.println("Field is: " + value);
        	System.out.println("Containing Value is: " + field.getValueAsString());        	
        	data.put(value, field.getValueAsString());
        });        
        
        pdf.close();       
        return data;
 
    }
	
	@RequestMapping(value = { "/form/userAnswers.html" }, method = RequestMethod.GET)
	private String getUserAnswers(ModelMap model, @RequestParam Integer formId, @RequestParam Integer memberId, 
			@RequestParam(required = false) Integer fpId, Principal principal) {
		
		boolean isReadOnly=true;
		
		System.out.println();
		if (fpId == null) {
			fpId = 0;
		}
		
		int counter = 1, defaultPage = 0;
		boolean isValid = false;
		Form curForm = formDao.getForm(formId);
		List<Page> pages = curForm.getPages();
				
		List<String> pageLinks = new ArrayList<>(pages.size());
		for (Page p : pages) {
			if (counter == 1){
				defaultPage = p.getId();
			}
				
			if (fpId == p.getId()){
				isValid = true;
			}				
			pageLinks.add("userAnswers.html?fpId=" + p.getId() + "&formId=" + formId + "&memberId=" + memberId);
			counter++;
		}

		Page p;
		if (fpId > 0 && isValid) {
			p = pageDao.getPage(fpId);

		} else {
			p = pageDao.getPage(defaultPage);
		}
		
		
		Member curMember = memberDao.getMemberbyUserName(principal.getName());	
		List<FormElement> elements = new ArrayList<>();
				
		for (FormElement e : p.getElements()) {
					
			if(e.getType().equals("GroupElement")){
				Map<String, String> params = new HashMap<>();
				params.put("id", e.getId().toString());
				GroupElement ge = groupDao.findByCriteria(params, GroupElement.class);
				elements.add(ge);				
			}
			
			if(e.getType().equals("Textbox")){
				
				Textbox ge = (Textbox)e;
			 	List<Answer> answers = answerDao.getAnswers(ge.getId(), memberDao.getMember(memberId).getId());
				
				if (answers==null)
				{
					answers = new ArrayList<Answer>(); 
					TextboxAnswer answer = new TextboxAnswer();
					answer.setUser(curMember);
					answer.setForm(curForm);
					answers.add(answer);
				}

				ge.setAnswers(answers); 
				elements.add(ge);							
			}
			
			if(e.getType().equals("MultipleChoice")){
				
				MultipleChoice ge = (MultipleChoice) e;
				List<Answer> answers = answerDao.getAnswers(ge.getId(), memberDao.getMember(memberId).getId());
				
				if (answers==null)
				{
					answers = new ArrayList<Answer>();
					MultipleChoiceAnswer answer = new MultipleChoiceAnswer();
					answer.setUser(curMember);
					answer.setForm(curForm);
					answer.setChoiceAnswers(null);
					answers.add(answer);
				}
				ge.setAnswers(answers); 
				elements.add(ge);								
			}
			
			if(e.getType().equals("DateText")){
												
				DateText ge = (DateText)e;
			 	List<Answer> answers = answerDao.getAnswers(ge.getId(), memberDao.getMember(memberId).getId());
			 				 	
				if (answers==null){
					
					answers = new ArrayList<Answer>(); 
					DateTextAnswer answer = new DateTextAnswer();
					answer.setUser(curMember);
					answer.setForm(curForm);
					answers.add(answer);
				}

				ge.setAnswers(answers); 
				elements.add(ge);
			}
			
			if(e.getType().equals("FormFile")){
												
				Map<String, String> params = new HashMap<>();
				params.put("elementId", e.getId().toString());
				params.put("memberId", memberId.toString());
				
				System.out.println("Element id is : " +e.getId().toString()+" Member id is: " +memberId.toString());
				
				List<FileUploadForm> files = fileUploadDao.findByNamedQuery("fileUploadForm.by.named.query", params);
				
				System.out.println("Total number of records for file upload " +files.size());
				
				model.put("files", files);				
				model.put("fromanswer", true);
				elements.add((FormFile)e);
			}
			
			System.out.println("The type is: " +e.getType());
		}
		
		ElementsContainer elementsContainer = new ElementsContainer(elements);
		model.put("elementsContainer", elementsContainer);
		model.addAttribute("form", curForm);
		model.addAttribute("pageLinks", pageLinks);
		if (isReadOnly)
			model.addAttribute("isReadonly", true);
		else
			model.addAttribute("isReadonly", false);
			
		
		return "form/formsheet";
	}
	
	public void downloadPdf(String SRC, String DEST, Integer memberId, Integer formId,  HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//Initialize PDF document		
   	 	PdfDocument pdf = new PdfDocument(new PdfReader(SRC), new PdfWriter(DEST));

       // Initialize document
       Document doc = new Document(pdf);
       boolean createIfNotExist = true;
       PdfAcroForm form = PdfAcroForm.getAcroForm(pdf, createIfNotExist);
       
       Map<String, PdfFormField> fields = form.getFormFields();
       
       Form curForm = formDao.getForm(formId);
       
       curForm.getPages().forEach( page -> {
    	   
    	   List<FormElement> elements = page.getElements();
    	   elements.forEach( element -> {    		   
    		   
			if(element.getType().equals("Textbox")){
				
				Textbox ge = (Textbox)element;
				List<Answer> answers = answerDao.getAnswers(ge.getId(), memberDao.getMember(memberId).getId());
				
				System.out.println("Textbox answer size is: " + answers.size());
				answers.forEach(answer -> {						
					
					TextboxAnswer tbAnswer = (TextboxAnswer) answer;
					
					System.out.println("Textbox PDF element is: " + element.getPdfElementName());
					System.out.println("Textbox PDF element value is : " + tbAnswer.getValue());
										
					if(null != element.getPdfElementName() && !element.getPdfElementName().equals("")){
						fields.get(element.getPdfElementName()).setValue(null == tbAnswer.getValue() ? "" : tbAnswer.getValue());
					}																
				});					
			}
			
			if(element.getType().equals("MultipleChoice")){
					
				MultipleChoice ge = (MultipleChoice)element;
				List<Answer> answers = answerDao.getAnswers(ge.getId(), memberDao.getMember(memberId).getId());				
				
				answers.forEach(answer -> {						
					MultipleChoiceAnswer mcAnswer = (MultipleChoiceAnswer) answer;
											
					mcAnswer.getChoiceAnswers().forEach(choice ->{
					
						if(null != choice.getPdfElementName() && !choice.getPdfElementName().equals(""))
							fields.get(choice.getPdfElementName()).setValue(choice.getText() == null ? "" : choice.getText());
					});											
				});					
			}
			
			if(element.getType().equals("DateText")){
				
				DateText ge = (DateText)element;
				List<Answer> answers = answerDao.getAnswers(ge.getId(), memberDao.getMember(memberId).getId());	
				
				System.out.println("Answer Size is : " + answers.size());
				
				answers.forEach(answer -> {						
					DateTextAnswer dtAnswer = (DateTextAnswer) answer;	
					if(null != element.getPdfElementName() && !element.getPdfElementName().equals(""))
						fields.get(element.getPdfElementName()).setValue(dtAnswer.getDate()== null ? "" : dtAnswer.getDate());															
				});					
			}
    		   
    	   });    	   
       });  
       
       doc.close();
       
       PdfReader reader = new PdfReader(DEST);
       int length = (int) reader.getFileLength();
       reader.close();
	   
	   response.setContentType("application/pdf");
	   response.addHeader("Content-Disposition", "attachment; filename=test.pdf" );
	   response.setContentLength(length);
	   
	   FileInputStream fileInputStream = new FileInputStream(DEST);
	   OutputStream responseOutputStream = response.getOutputStream();
	   int bytes;
	   while ((bytes = fileInputStream.read()) != -1) {
		   responseOutputStream.write(bytes);
	   }
	   fileInputStream.close();
	   pdf.close();
	   File file = new File(DEST);
	   file.deleteOnExit();
	}
	
	@RequestMapping(value = { "/form/formsheet.html" }, method = RequestMethod.POST)
	private String getFormsheet(@ModelAttribute ElementsContainer elementsContainer, @RequestParam(required = false) Integer elementId, 
			@RequestParam(required = false) Integer formId, SessionStatus status,  List<MultipartFile> files, Principal principal) {
		
		System.out.print("Before upload call");
		if(files != null && files.size() > 0 ){
			System.out.print("Calling file upload");
			upload(elementId, formId, files, principal);
			System.out.print("file upload Done");
		}
		
		try{	
			List<FormElement> elements = elementsContainer.getElements();
			elements.forEach( fe -> {
				fe.getAnswers().forEach(ans -> answerDao.saveAnswer(ans));
			});			
			
		}catch(Exception e){
			System.out.print("Error While saving answers" +e.getMessage());
		}	
		
		status.setComplete();
		return "redirect:list.html";
	}
	
	
	private void upload(@RequestParam Integer elementId, @RequestParam Integer formId,  List<MultipartFile> files, Principal principal ) {
		
		System.out.print("Received Call At /form/Upload. No of files is " + files.size());
		       
		 if (null != files && files.size() > 0) {
			 
			 for (MultipartFile file : files) {			
		        	
		        	System.out.println(file.getOriginalFilename() +" uploaded! ");
		        	FileUploadForm formFile = new FileUploadForm();
		        	formFile.setFileName(file.getOriginalFilename());
		    		try {
						formFile.setFileContent(file.getBytes());
					} catch (IOException e) {				
						e.printStackTrace();
					}
		    		
		    		Date createdDate = new Date();
		    		formFile.setCreatedDate(new java.sql.Timestamp(createdDate.getTime()));
		    		formFile.setModifiedDate(new java.sql.Timestamp(createdDate.getTime()));
		    		formFile.setOwner(memberDao.getMemberbyUserName(principal.getName()));
		    		formFile.setElement(elementDao.getElement(elementId));
		    		formDao.saveFormFile(formFile);
			 }       	
    	}  
        
	}

	@RequestMapping(value = "/form/download.html")
	private String download(@RequestParam Integer fileId, HttpServletResponse response) throws Exception {
		
		FileUploadForm file = formDao.getFormFile(fileId);
		byte[] bytes = file.getFileContent();
		response.addHeader("Content-Disposition", "attachment;filename=" + file.getFileName());
		OutputStream os = response.getOutputStream();
		os.write(bytes);

		return null;
	}
}