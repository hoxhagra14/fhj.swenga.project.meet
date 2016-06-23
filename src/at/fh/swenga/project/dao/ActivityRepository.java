package at.fh.swenga.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.project.model.Activity;
import at.fh.swenga.project.model.User;


@Repository

public interface ActivityRepository extends JpaRepository<Activity, Integer> {

	public Activity findById(int id);
	
	public List<Activity> findBySubcategoryName(String subCategory);
	
	public List<Activity> findByLocationContainingAllIgnoreCase(String location);
	
	public List<Activity> findByTitleContainingAllIgnoreCase(String title);
	
	// Unterscheidung zwischen Ersteller und Interessenten?? 
	//public List<Activity> findByOwner(String user);
	
	//search for other subcategories
	public List<Activity> findBySubcategoryStringContainingAllIgnoreCase(String subCategory);
	
	public List<Activity> findBySubcategoryNameContainingAllIgnoreCase(String subCategory);
	
	public List<Activity> findByStateNameContainingAllIgnoreCase(String state);
	
	@Query("select a from Activity a inner join a.subcategory s where s.category.name = :name")
	public List<Activity> getCatActivities(@Param("name")String name); //TODO: SQLInjection?!!!
	
	@Query("select a from Activity a inner join a.subcategory s where s.category.name = :name and a.id in :activitiesId")
	public List<Activity> getFilteredActivities(@Param("name")String name, @Param("activitiesId") List<Integer> activitiesId);
	
}
