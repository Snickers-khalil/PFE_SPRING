package com.pfe.campingo.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pfe.campingo.entities.ERole;
import com.pfe.campingo.entities.Utilisateur;

@Repository
public interface UserRepository extends JpaRepository<Utilisateur, Long> {
	 
	 //Auth,register repo
	 Optional<Utilisateur> findByUsername(String username);
	 Boolean existsByUsername(String username);
	 Boolean existsByEmail(String email);
	 
//	 @Query("SELECT u FROM users u JOIN u.roles r WHERE r.name=:x")
//	  public List<Utilisateur> findAll(@Param("x")ERole role);
	 
	 //Users methodes
	 /*
	    public List<Utilisateur> findByFirstName(String firstname);
		public Utilisateur findByEmail(String email);
		public List<Utilisateur> findByFirstNameAndLastName(String firstname, String lastname);
		@Query("SELECT u FROM Utilisateur u WHERE u.firstName = ?1 OR u.lastName = ?2 ")
		public List<Utilisateur> findByFirstNameAndLastNameWithJPQL(String firstname, String lastname);
		
		@Query("SELECT u FROM Utilisateur u WHERE u.firstname LIKE :myFirstname OR u.lastname LIKE :mylastname")
		public List<Utilisateur> findByFirstNameAndLastNameWithJPQLWithNamedParameters
		(@Param(value = "myFirstname") String firstName,@Param(value = "myLastname") String lastname);*/
		
	 public List<Utilisateur> findByRolesName(ERole name);
		
}
