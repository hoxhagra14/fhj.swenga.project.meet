package at.fh.swenga.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.project.model.Subcategory;


@Repository

public interface SubcategoryRepository extends JpaRepository<Subcategory, Integer> {

	@Transactional
	public Subcategory findFirstByName(String name);
	
	public List<Subcategory> findByCategoryName(String category);
	


}
