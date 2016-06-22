package at.fh.swenga.project.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import at.fh.swenga.project.model.UserRole;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole, Integer>{

}
