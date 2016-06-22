package at.fh.swenga.project.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User implements java.io.Serializable {
	private static final long serialVersionUID = 8198173157518983615L;
	
	private String username;
	private String password;
	private boolean enabled;
	@Column(name="name")
	private String name;
	@Column(name="age")
	private int age;
	@Column(name="city")
	private String city;

	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	
//	@OneToMany(mappedBy = "owner", fetch = FetchType.EAGER)
//	List<Activity> ownedActivities;
	
//	@ManyToMany(cascade = CascadeType.PERSIST, fetch=FetchType.EAGER)
//	List<Activity> activities;

	public User() {
	}

	public User(String username, String password, boolean enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public User(String username, String password, boolean enabled,
			Set<UserRole> userRole) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.userRole = userRole;
	}
	
	public User(String username, String password, boolean enabled, String name, int age, String city) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.name = name;
		this.age = age;
		this.city = city;
	}
	
	public User(String username, String password, boolean enabled, String name, int age, String city, Set<UserRole> userRole)
	{
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.name = name;
		this.age = age;
		this.city = city;
		this.userRole = userRole;
	}
	
	public void addRole(Set<UserRole> userRole)
	{
		this.userRole = userRole;
	}
	
	@Id
	@Column(name = "username", unique = true, nullable = false, length = 45)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password", nullable = false, length = 60)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "enabled", nullable = false)
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<UserRole> getUserRole() {
		return userRole;
	}

	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
}
