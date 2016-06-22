package at.fh.swenga.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.project.model.State;




@Repository

public interface StateRepository extends JpaRepository<State, Integer> {

	public State findByName(String name);  

}
