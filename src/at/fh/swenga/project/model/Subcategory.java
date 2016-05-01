package at.fh.swenga.project.model;

public class Subcategory {

	private int id;
	private String name;
	// Category

	public Subcategory(){
	}

	public Subcategory(String name) {
		super();
		this.name = name;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
