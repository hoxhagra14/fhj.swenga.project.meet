package at.fh.swenga.project.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Version;


@Entity
@Table(name = "User")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String city;
	private int age;
	// Interessen
	// Bewertung
	
	@OneToMany(mappedBy = "owner", fetch = FetchType.EAGER)
	List<Activity> ownedActivities;

	@ManyToMany(cascade = CascadeType.PERSIST, fetch=FetchType.EAGER)
	List<Activity> activities;
	
	@Version
	long version;
	
	public User() {
		super();
	}

	public User(String name, String city, int age, List<Activity> activities) {
		super();
		this.name = name;
		this.city = city;
		this.age = age;
		this.activities = activities;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
	public List<Activity> getOwnedActivities() {
		return ownedActivities;
	}

	public void setOwnedActivities(List<Activity> ownedActivities) {
		this.ownedActivities = ownedActivities;
	}


	public List<Activity> getActivities() {
		return activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}
	
	
	
}
