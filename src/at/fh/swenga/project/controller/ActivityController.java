package at.fh.swenga.project.controller;

import java.util.Collection;
import java.util.Collections;
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
import at.fh.swenga.project.data.Games;
import at.fh.swenga.project.data.Sports;
import at.fh.swenga.project.model.Activity;
import at.fh.swenga.project.model.Subcategory;

@Controller
public class ActivityController {
	String lastcategory; 
	
	
	@Autowired
	ActivityRepository activityRepository;
	
	@Autowired
	SubcategoryRepository subcategoryRepository;
	
	@Autowired
	CategoryRepository categoryReposiory;
	
	@RequestMapping(value = { "/" })
	public String index(Model model){	
		subcategoryRepository.save(Categories.FillCategories()); //Erstellen aller Catergories + Subcategories, TODO:Name ändern "Categories"
		
		Activity a = new Activity(subcategoryRepository.findByName("Soccer"), "Graz","Steiermark", "Test", "TestText", 1);
		activityRepository.save(a);
		
		Activity b = new Activity(subcategoryRepository.findByName("Counter Strike"), "Graz","Steiermark", "Test", "TestText", 1);
		activityRepository.save(b);

		
		return "index";
	}
	
	@RequestMapping(value = "/listActivities") //method = RequestMethod.GET
	public String list(Model model, @RequestParam(required=false) String category) {
		if(category==null) category = lastcategory;
		lastcategory = category;
		
		List<Subcategory> subcategories = subcategoryRepository.findByCategoryName(category);
		List<Activity> activities = activityRepository.iwas(category);
		
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
	
	@RequestMapping(value = { "/findByState" })
	public String findByState(Model model, @RequestParam String searchString ) {
		List<Activity> activities = null;
		activities = activityRepository.findByState(searchString);
		model.addAttribute("activities", activities);
		return "listActivities";
	}
	
	@RequestMapping(value = { "/findByLocationContainingAllIgnoreCase" })
	public String findByLocationContainingAllIgnoreCase(Model model, @RequestParam String searchString ) {
		List<Activity> activities = null;
		activities = activityRepository.findByLocationContainingAllIgnoreCase(searchString);
		model.addAttribute("activities", activities);
		return "listActivities";
	}
	
	
	@RequestMapping("/fill")
	@Transactional
	public String fillData(Model model) {
		List<Subcategory> subcategories = subcategoryRepository.findAll();;
		
		for(Subcategory s : subcategories){
			Activity a = new Activity(s, "Graz","Steiermark", "Test", "TestText", 1);
			activityRepository.save(a);
		}
	
		
		return "forward:listActivities";
	}
	
	@RequestMapping("/addActivity")
	public String addActivity(Model model) {
		
		List<Subcategory> sub = subcategoryRepository.findAll(); // TODO: Nur die richtigen Anzeigen
		model.addAttribute("subcategories", sub);
		return "addActivities";
	}
		
	@RequestMapping("/add")
	public String addActivityInDatabase(Model model, @RequestParam String title, @RequestParam String text, @RequestParam String state, @RequestParam String location, @RequestParam int restriction, @RequestParam String type  ) {
		Subcategory s = subcategoryRepository.findByName(type); // TODO: Sonst Error
		Activity a = new Activity(s, location ,state, text, title, restriction);
		activityRepository.save(a);
		
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
