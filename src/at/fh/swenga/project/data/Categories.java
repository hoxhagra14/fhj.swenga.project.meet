package at.fh.swenga.project.data;

import java.util.ArrayList;
import java.util.List;

import at.fh.swenga.project.model.Category;

public class Categories {
	public static List<Category> FillCategories(){
		List<Category> categories = new ArrayList<>();
		
		Category sport = new Category("Sport");
		for(Sports s: Sports.values()) sport.addSubcategory(s.name());	
		categories.add(sport);
		
		Category games = new Category("Games");
		for(Games g: Games.values()) games.addSubcategory(g.name());	
		categories.add(games);
		
		return categories;
	}
}
