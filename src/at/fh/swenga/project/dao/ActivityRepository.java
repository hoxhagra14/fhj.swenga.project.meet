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

	public List<Activity> findBySubcategory(String subCategory);
	
	//public List<Activity> findByOrt(String ort);
	
	//public List<Activity> findByTitle(String title);
	
	// Unterscheidung zwischen Ersteller und Interessenten?? 
	//public List<Activity> findByUser(String user);
	
	
	
}
