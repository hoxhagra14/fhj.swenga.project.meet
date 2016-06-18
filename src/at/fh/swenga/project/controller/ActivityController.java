package at.fh.swenga.project.controller;

import java.util.List;

import org.fluttercode.datafactory.impl.DataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.project.dao.ActivityRepository;
import at.fh.swenga.project.dao.SubcategoryRepository;
import at.fh.swenga.project.model.Activity;
import at.fh.swenga.project.model.Subcategory;

@Controller
public class ActivityController {
	
	
	@Autowired
	ActivityRepository activityRepository;
	
	@Autowired
	SubcategoryRepository subcategoryRepository;
	
	@RequestMapping(value = { "/", "list" })
	public String index(Model model) {
		List<Activity> activities = activityRepository.findAll();
		model.addAttribute("activities", activities);
		model.addAttribute("type", "findAll");
		return "listActivities";
	}

	
	@RequestMapping(value = { "/find" })
	public String find(Model model, @RequestParam String searchString, @ModelAttribute("type")  String type) {
		List<Activity> activities = null;
		
		switch (type) {
		case "findAll":
			activities = activityRepository.findAll();
			break;
		case "findBySubcategoryName":
			activities = activityRepository.findBySubcategoryName(searchString);
			break;
		case "findByTitleContainingAllIgnoreCase":
			activities = activityRepository.findByTitleContainingAllIgnoreCase(searchString);
			break;
		case "findByLocation":
			activities = activityRepository.findByLocation(searchString);
			break;
		case "findBySubcategoryStringContainingAllIgnoreCase":
			activities = activityRepository.findBySubcategoryStringContainingAllIgnoreCase(searchString);
			break;
							
		default:
			activities = activityRepository.findAll();
		}
		
		model.addAttribute("activities", activities);
		
	
		
		return "listActivities"; 
	}
	
	
	@RequestMapping("/fill")
	@Transactional
	public String fillData(Model model) {
		
		DataFactory  df = new DataFactory();
		Subcategory subcategory = null;
		
		for(int i=0;i<100; i++){
			if(i%10==0){
				String subcategoryName = df.getBusinessName();
				subcategory = subcategoryRepository.findFirstByName(subcategoryName);
				if(subcategory == null){
					subcategory = new Subcategory(subcategoryName);
				}
			}
			Activity a = new Activity(df.getFirstName(),df.getBirthDate(),df.getRandomText(4), df.getRandomText(4), true, 10, true  ); 
			a.setSubcategory(subcategory);
			activityRepository.save(a);
		}
		
		return "forward:list";
	}

	@RequestMapping("/delete")
	public String deleteData(Model model, @RequestParam int id) {
		activityRepository.delete(id);

		return "forward:list";
	}

	// @ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {

		return "showError";

	}
}
