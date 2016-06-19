package at.fh.swenga.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.project.model.Activity;


@Repository

public interface ActivityRepository extends JpaRepository<Activity, Integer> {

	public List<Activity> findBySubcategoryName(String subCategory);
	
	public List<Activity> findByLocation(String ort);
	
	public List<Activity> findByTitleContainingAllIgnoreCase(String title);
	
	// Unterscheidung zwischen Ersteller und Interessenten?? 
	//public List<Activity> findByOwner(String user);
	
	public List<Activity> findBySubcategoryStringContainingAllIgnoreCase(String subCategory);
	
	public List<Activity> findBySubcategoryNameContainingAllIgnoreCase(String subCategory);
	
}
