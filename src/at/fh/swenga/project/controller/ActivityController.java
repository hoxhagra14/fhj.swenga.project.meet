package at.fh.swenga.project.controller;

import java.util.List;

import org.fluttercode.datafactory.impl.DataFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import at.fh.swenga.project.dao.ActivityRepository;
import at.fh.swenga.project.dao.CategoryRepository;
import at.fh.swenga.project.dao.SubcategoryRepository;
import at.fh.swenga.project.data.Categories;
import at.fh.swenga.project.data.Sports;
import at.fh.swenga.project.model.Activity;
import at.fh.swenga.project.model.Subcategory;

@Controller
public class ActivityController {
	
	
	@Autowired
	ActivityRepository activityRepository;
	
	@Autowired
	SubcategoryRepository subcategoryRepository;
	
	@RequestMapping(value = { "/", "listActivities" })
	public String index(Model model) {
		List<Activity> activities = activityRepository.findAll();
		List<Subcategory> subcategories = subcategoryRepository.findAll();
		model.addAttribute("activities", activities);
		model.addAttribute("subcategories", subcategories);
		model.addAttribute("type", "findAll");
		return "listActivities";
	}

	
	/*@RequestMapping(value = { "/find" })
	public String find(Model model, @RequestParam String searchString, @ModelAttribute("id")  String id) {
		List<Activity> activities = null;
		
		switch (id) {
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
	}*/
	
	@RequestMapping(value = { "/findByTitleContainingAllIgnoreCase" })
	public String findByTitleContainingAllIgnoreCase(Model model, @RequestParam String searchString ) {
		List<Activity> activities = null;
		activities = activityRepository.findByTitleContainingAllIgnoreCase(searchString);
		model.addAttribute("activities", activities);
		return "listActivities";
	}
	
	@RequestMapping(value = { "/findBySubcategoryNameContainingAllIgnoreCase" })
	public String findBySubcategoryStringContainingAllIgnoreCase(Model model, @RequestParam String searchString ) {
		List<Activity> activities = null;
		activities = activityRepository.findBySubcategoryNameContainingAllIgnoreCase(searchString);
		model.addAttribute("activities", activities);
		return "listActivities";
	}
	
	@RequestMapping("/fill")
	@Transactional
	public String fillData(Model model) {
		
		DataFactory  df = new DataFactory();
		Subcategory subcategory = null;
		
		for(Sports s : Sports.values()){
			subcategory = new Subcategory(s.name());
			//Activity a = new Activity(subcategory, "Graz", "TestTitle", "TestText");
			subcategoryRepository.save(subcategory);
		}
		/*
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
		} */
		
		return "forward:listActivities";
	}
	
	@RequestMapping("/addActivity")
	public String addActivity(Model model) {
		
		List<Subcategory> sub = subcategoryRepository.findAll();
		model.addAttribute("subcategories", sub);
		return "addActivities";
	}
		
	@RequestMapping("/add")
	public String addActivityInDatabase(Model model, @RequestParam String title, @RequestParam String text, @RequestParam int restriction, @RequestParam String type  ) {
		Subcategory s = new Subcategory(type);
		Activity a = new Activity(s, "Graz", text, title);
		activityRepository.save(a);
		System.out.println(title);
		
		return "forward:listActivities";
	}

	@RequestMapping("/delete")
	public String deleteData(Model model, @RequestParam int id) {
		activityRepository.delete(id);

		return "forward:listActivities";
	}

	// @ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {

		return "showError";

	}
	
	
}
