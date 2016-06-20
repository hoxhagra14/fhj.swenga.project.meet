package at.fh.swenga.project.data;

import java.util.ArrayList;
import java.util.List;

import at.fh.swenga.project.model.Category;
import at.fh.swenga.project.model.Subcategory;

public class Categories {
	public static List<Subcategory> FillCategories(){
		List<Subcategory> subcategories = new ArrayList<>();
		
		Category sport = new Category("Sport");
		for(Sports s: Sports.values()) subcategories.add(new Subcategory(s.toString(),sport)); 
		
		Category games = new Category("Games");
		for(Games g: Games.values()) subcategories.add(new Subcategory(g.toString(),games)); 
	
		return subcategories;
	}
}
