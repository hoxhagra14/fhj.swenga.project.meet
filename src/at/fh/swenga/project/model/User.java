package at.fh.swenga.project.model;

import java.util.Date;


public class User {

	private int id;
	private String name;
	private String city;
	private Date birthDate;
	// Interessen
	// Bewertung
	// Veranstaltung
	
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
