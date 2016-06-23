package at.fh.swenga.project.controller;

import java.util.HashSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
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
import at.fh.swenga.project.data.Categories;
import at.fh.swenga.project.data.Sports;
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
		// if(!categoriesCreated)
		// subcategoryRepository.save(Categories.FillCategories()); //Erstellen
		// aller Catergories + Subcategories; TODO: l�schen!!
		// auslesen der aktuell eingeloggten person
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
			for (Activity a : activities) {
				activitiesInt.add(a.getId());
			}
		}

		if(activities==null) activities = activityRepository.getCatActivities(category); // Falls keine Activties �bergeben wurden (also keine herausgefiltert wurden)
		else activities = activityRepository.getFilteredActivities(category, activitiesInt);
		
		model.addAttribute("states", states);
		model.addAttribute("activities", activities);
		model.addAttribute("subcategories", subcategories);
		model.addAttribute("type", "findAll");
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("category", category);
		return "listActivities";
	}

	@RequestMapping(value = { "/find" })
	public String find(Model model, @RequestParam(required = false) String searchString, @RequestParam String type,
			RedirectAttributes redirectAttributes) { // TODO: Es werden alle passenden angezeigt nicht nur die der jeweiligen Categorie-Liste
		List<Activity> activities = null;
		if (searchString == null)
			type = "default"; // Falls kein Filter ausgew�hlt wurde, werden alle ausgegeben

		switch (type) {
		case "findTitle":
			activities = activityRepository.findByTitleContainingAllIgnoreCase(searchString);
			break;
		case "findSubcategory":
			activities = activityRepository.findBySubcategoryNameContainingAllIgnoreCase(searchString);
			break;
		case "findState":
			activities = activityRepository.findByState(searchString);
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

	@RequestMapping("/fill")
	@Transactional
	public String fillData(Model model) {

		
		Activity a = new Activity(subcategoryRepository.findByName("Soccer"), "Graz", stateRepository.findByName("Wien"), "Test", "TestText", 1);
		activityRepository.save(a);

		Activity c = new Activity(subcategoryRepository.findByName("Tennis"), "Wien", stateRepository.findByName("Burgenland"), "ka", "KaText", 1);
		activityRepository.save(c);
	
		Activity b = new Activity(subcategoryRepository.findByName("Counter Strike"), "Graz",stateRepository.findByName("Steiermark"), "Test", "TestText", 1);
		activityRepository.save(b);

		return "forward:listActivities";
	}

	//TODO: Edit nur gewissen Personen erlauben
	@RequestMapping("/addActivity")
	public String addActivity(Model model, @RequestParam(required = false) int id) { 
		List<Subcategory> sub = subcategoryRepository.findByCategoryName(lastcategory);
		Activity a = activityRepository.findById(id);
		List<State> states = stateRepository.findAll();
		
		model.addAttribute("activity", a);
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

	@RequestMapping("/add")
	public String addActivityInDatabase(Model model, @RequestParam String title, @RequestParam String text,
			@RequestParam String state, @RequestParam String location,
			@RequestParam @DateTimeFormat(pattern = "dd.MM.yyyy") Date date, @RequestParam int restriction,
			@RequestParam String type, @RequestParam(required = false) boolean closed) {
		Subcategory s = subcategoryRepository.findByName(type); // TODO: Sonst Error
		
		State stateName = stateRepository.findByName(state);
		Activity a = new Activity(s, location ,stateName, title, date,  text, restriction, closed);
		activityRepository.save(a);

		return "forward:listActivities";
	}

	@RequestMapping("/user")
	public String showUserProfile(Model model) {
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

	// @ExceptionHandler(Exception.class) TODO: Wieder aktivieren nach fertigstellung
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
