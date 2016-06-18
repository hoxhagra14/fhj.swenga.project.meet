package at.fh.swenga.project.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Version;


@Entity
@Table(name = "Subcategory")
public class Subcategory {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	Category category;

	@OneToMany(mappedBy = "subcategory", fetch = FetchType.EAGER)
	private Set<Activity> activities; // Set?
	
	@Version
	long version;

	public Subcategory() {
		super();
	}
	
	public Subcategory(String name){
		this.name = name;
	}

	public Subcategory(String name, Category category, Set<Activity> activities) {
		super();
		this.name = name;
		this.category = category;
		this.activities = activities;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Set<Activity> getActivities() {
		return activities;
	}

	public void setActivities(Set<Activity> activities) {
		this.activities = activities;
	}
	
	
}
