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
		categoryReposiory.save(Categories.FillCategories()); //Erstellen aller Catergories + Subcategories
		
		return "index";
	}
	
	@RequestMapping(value = "/listActivities", method = RequestMethod.GET)
	public String list(Model model, @RequestParam(required=false) String category) {
		if(category==null) category = lastcategory;
		
		List<Subcategory> subcategories = subcategoryRepository.findByCategoryName(category); //TODO: only right activities; Join? 
		/*List<String> subcategorynames = Collections.<String>emptyList();
		for(Subcategory sub : subcategories){subcategorynames.add(sub.getName());}*/
		List<Activity> activities = activityRepository.iwas(category);
		
		lastcategory = category;
		
		model.addAttribute("activities", activities);
		model.addAttribute("subcategories", subcategories);
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
		List<Subcategory> subcategories = subcategoryRepository.findAll();;
		
		for(Subcategory s : subcategories){
			Activity a = new Activity(s, "Graz", "Test", "TestText");
			activityRepository.save(a);
		}
	
		
		return "forward:listActivities";
	}
	
	@RequestMapping("/addActivity")
	public String addActivity(Model model) {
		
		return "addActivities";
	}
		
	@RequestMapping("/add")
	public String addActivityInDatabase(Model model, @RequestParam String title, @RequestParam String text, @RequestParam int restriction  ) {
		Subcategory s = null;
		Activity a = new Activity(s, "Graz", text, title );
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
