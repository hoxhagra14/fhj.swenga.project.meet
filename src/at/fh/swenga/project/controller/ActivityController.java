package at.fh.swenga.project.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import at.fh.swenga.project.dao.ActivityRepository;
import at.fh.swenga.project.dao.CategoryRepository;
import at.fh.swenga.project.dao.SimpleUserRepository;
import at.fh.swenga.project.dao.StateRepository;
import at.fh.swenga.project.dao.SubcategoryRepository;
import at.fh.swenga.project.dao.UserRoleRepository;
import at.fh.swenga.project.model.Activity;
import at.fh.swenga.project.model.State;
import at.fh.swenga.project.model.Subcategory;
import at.fh.swenga.project.model.User;
import at.fh.swenga.project.model.UserRole;

@Controller
public class ActivityController {
	String lastcategory;
	String currentUser;
	boolean categoriesCreated = false;

	@Autowired
	ActivityRepository activityRepository;

	@Autowired
	SubcategoryRepository subcategoryRepository;

	@Autowired
	CategoryRepository categoryReposiory;

	@Autowired
	SimpleUserRepository userRepository;

	@Autowired
	UserRoleRepository userRoleRepository;

	@Autowired
	StateRepository stateRepository;
	
	
	
	@RequestMapping(value = { "/" })
	public String index(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        currentUser = auth.getName();
        
		categoriesCreated = true;

		model.addAttribute("currentUser", currentUser);
		return "index";
	}

	@RequestMapping(value = "/listActivities")
	public String list(Model model, @RequestParam(required = false) String category) {
		if (category == null)
			category = lastcategory;
		lastcategory = category;

		List<Activity> activities = (List<Activity>) model.asMap().get("activities");
		List<Subcategory> subcategories = subcategoryRepository.findByCategoryName(category);
		List<State> states = stateRepository.findAll();
		List<Integer> activitiesInt = new ArrayList<>();
		
		if (activities != null) { 
			if(!activities.isEmpty()) { //Falls nicht Empty: Nach Kategorie filtern, sonst mit leerer Liste weiterarbeiten
				for (Activity a : activities) {
					activitiesInt.add(a.getId());
				}
				activities = activityRepository.getFilteredActivities(category, activitiesInt);
			}
		}
		else
			activities = activityRepository.getCatActivities(category);

		model.addAttribute("states", states);
		model.addAttribute("activities", activities);
		model.addAttribute("subcategories", subcategories);
		model.addAttribute("type", "findAll");
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("category", category);
		return "listActivities";
	}

	@RequestMapping(value = { "/find" })
	public String find(Model model, @RequestParam(required = false) String searchString, @RequestParam String type, RedirectAttributes redirectAttributes) {
		List<Activity> activities = null;
		if (searchString == null)
			type = "default"; // Falls kein Filter ausgewählt wurde, werden alle ausgegeben

		switch (type) {
		case "findTitle":
			activities = activityRepository.findByTitleContainingAllIgnoreCase(searchString);
			break;
		case "findSubcategory":
			activities = activityRepository.findBySubcategoryNameContainingAllIgnoreCase(searchString);
			break;
		case "findState":
			activities = activityRepository.findByStateNameContainingAllIgnoreCase(searchString);
			break;
		case "findLocation":
			activities = activityRepository.findByLocationContainingAllIgnoreCase(searchString);
			break;

		default:
			activities = activityRepository.findAll();
		}
		redirectAttributes.addFlashAttribute("activities", activities);

		return "redirect:listActivities";
	}

	@RequestMapping("/addActivity")
	public String addActivity(Model model, @RequestParam(required = false) Integer id, @RequestParam(required = false) String category) { 
		if(category==null) category = lastcategory; 
		List<Subcategory> sub = subcategoryRepository.findByCategoryName(category);
		
		Activity a;
		if(id!=null){ 
			a = activityRepository.findById(id); 
			model.addAttribute("activity", a);
		}
		List<State> states = stateRepository.findAll();
		
		model.addAttribute("states", states);
		model.addAttribute("subcategories", sub);
		return "addActivities";
	}

	@RequestMapping("/fullActivity")
	public String fullActivity(Model model, @RequestParam(required = false) int id) {
		Activity a = activityRepository.findById(id);
		
		model.addAttribute("activity", a);
		model.addAttribute("currentUser", currentUser);
		return "activity";
	}
	
	@RequestMapping("/editUser")
	public String editUser(Model model, @RequestParam String name, @RequestParam String age, @RequestParam String city) {
		
		User userobject = userRepository.findByUsername(currentUser).get(0);
		model.addAttribute("currentUser", currentUser);
		
		userobject.setName(name);
		userobject.setAge(Integer.parseInt(age));
		userobject.setCity(city);
		
		userRepository.save(userobject);
		
		return "index";
	}
	
	@RequestMapping("/editUserForm")
	public String editUserForm(Model model) {
		User userobject = userRepository.findByUsername(currentUser).get(0);
		model.addAttribute("userobject", userobject);
		return "editUser";
	}

	/*
	@RequestMapping("/edit")
	public String editActivityInDatabase(Model model, @RequestParam String title, @RequestParam String text,
			@RequestParam String state, @RequestParam String location,
			@RequestParam @DateTimeFormat(pattern = "dd.MM.yyyy") Date date, @RequestParam int restriction,
			@RequestParam String type, @RequestParam(required = false) boolean closed) {
		Subcategory s = subcategoryRepository.findByName(type);
		State stateName = stateRepository.findByName(state);
		
		
		
		Activity a = new Activity(s, location ,stateName, title, date,  text, restriction, closed);
		activityRepository.save(a);

		return "forward:listActivities";
	}*/

	@RequestMapping("/add")
	public String addActivityInDatabase(Model model, @RequestParam String title, @RequestParam String text,
			@RequestParam String state, @RequestParam String location,
			@RequestParam @DateTimeFormat(pattern = "dd.MM.yyyy") Date date, @RequestParam int restriction,
			@RequestParam String type, @RequestParam(required = false) boolean closed) {
		Subcategory s = subcategoryRepository.findByName(type);
		
		State stateName = stateRepository.findByName(state);
		Activity a = new Activity(s, location ,stateName, title, date,  text, restriction, closed);
		activityRepository.save(a);

		return "forward:listActivities";
	}

	@RequestMapping("/user")
	public String showUserProfile(Model model) {
		User userobject = userRepository.findByUsername(currentUser).get(0);
		model.addAttribute("currentUser", currentUser);
		
		model.addAttribute("userobject", userobject);
		return "showUserProfile";
	}

	@RequestMapping("/delete")
	public String deleteData(Model model, @RequestParam int id) {
		Activity a = activityRepository.findById(id);
		if(a.getOwner().getUsername().equals(currentUser)){
			activityRepository.delete(id);
			model.addAttribute("warningMessage", "Activity " + id + " deleted");
		}
		else
			model.addAttribute("errorMessage", "Not permitted ");
		
		return "forward:listActivities";
	}

	@ExceptionHandler(Exception.class)
	public String handleAllException(Exception ex) {
		return "showError";
	}

	@RequestMapping("/registrationForm")
	public String registration() {
		return "registrationForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String handleLogin() {

		return "login";
	}

	@RequestMapping("/registrate")
	public String registrateUser(Model model, @RequestParam String username, @RequestParam String password,
			@RequestParam String name, @RequestParam String age, @RequestParam String city) {

		String pw_hash = BCrypt.hashpw(password, BCrypt.gensalt());
		Set<UserRole> userRole = new HashSet<UserRole>();

		User u = new User(username, pw_hash, true, name, Integer.parseInt(age), city);
		userRepository.save(u);

		UserRole role = new UserRole(u, "ROLE_USER");
		userRoleRepository.save(role);

		userRole.add(role);
		u.addRole(userRole);

		return "login";
	}

}
