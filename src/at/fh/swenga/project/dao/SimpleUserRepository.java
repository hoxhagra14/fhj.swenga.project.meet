package at.fh.swenga.project.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import at.fh.swenga.project.model.User;

@Repository
@Transactional
public interface SimpleUserRepository extends JpaRepository<User, Integer> {
	List<User> findByUsername(String userName);
}