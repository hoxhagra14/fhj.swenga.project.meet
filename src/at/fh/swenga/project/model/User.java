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
	private Date birthDate;
	// Interessen
	// Bewertung
	
	@ManyToMany(cascade = CascadeType.PERSIST, fetch=FetchType.EAGER)
	List<Activity> activities;
	
	@Version
	long version;
	
	public User() {
		super();
	}
	public User(String name, String city, Date birthDate) {
		super();
		this.name = name;
		this.city = city;
		this.birthDate = birthDate;
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
	public Date getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	
}
