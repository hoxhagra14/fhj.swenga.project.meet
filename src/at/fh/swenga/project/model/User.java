package at.fh.swenga.project.model;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
@Table(name = "users")
public class User implements java.io.Serializable {
	private static final long serialVersionUID = 8198173157518983615L;
	
	
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
	
	@Column(name = "username", unique = true, nullable = false, length = 45)
	private String username;
	
	@Column(name = "password", nullable = false, length = 60)
	private String password;
	
	@Column(name = "enabled", nullable = false)
	private boolean enabled;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	

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

	
	public User(String name, String city, int age) {
		super();
		this.name = name;
		this.city = city;
		this.age = age;
	}
	
	public User(String name, String city, int age, List<Activity> ownedActivities, List<Activity> activities) {
		super();
		this.name = name;
		this.city = city;
		this.age = age;
		this.ownedActivities = ownedActivities;
		this.activities = activities;
	}
	
	public void addRole(Set<UserRole> userRole)
	{
		this.userRole = userRole;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
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

