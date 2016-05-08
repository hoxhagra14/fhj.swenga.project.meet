package at.fh.swenga.project.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Version;



@Entity
@Table(name = "Activity")
public class Activity {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	//Creater??
	@ManyToMany(mappedBy="activities", fetch=FetchType.EAGER)
	private List<User> users;
	
	@ManyToOne(cascade = CascadeType.PERSIST)
	Subcategory subcategory;
	
	private String ort; // Wie Subcategory?
	// Zusätzlich für zocken Kommunikationskanal?
	private Date date;
	private String title;
	private String text;
	private boolean closed;
	private int limit; // Count der Teilnehmer für limitierte Activitäten
	private boolean deprecated; // In der Datenbank behalten selbst nach ablauf 
								// damit Bewertungen durchgeführt werden können
								// überprüfen mit Systdatetime? 
	private String subcategoryString; // Falls eine Andere Activity; Also nicht in Liste vorhanden
	
	@Version
	long version;
	
	public Activity() {
		super();
	}
	public Activity(String ort, Date date, String title, String text,
			boolean closed, int limit, boolean deprecated) {
		super();
		this.ort = ort;
		this.date = date;
		this.title = title;
		this.text = text;
		this.closed = closed;
		this.limit = limit;
		this.deprecated = deprecated;
	}
	public String getOrt() {
		return ort;
	}
	public void setOrt(String ort) {
		this.ort = ort;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String gettitle() {
		return title;
	}
	public void settitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public boolean isClosed() {
		return closed;
	}
	public void setClosed(boolean closed) {
		this.closed = closed;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public boolean isDeprecated() {
		return deprecated;
	}
	public void setDeprecated(boolean deprecated) {
		this.deprecated = deprecated;
	}
	public Subcategory getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(Subcategory subcategory) {
		this.subcategory = subcategory;
	}
	
}
