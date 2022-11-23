package com.pfe.campingo.services;

import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;
import com.pfe.campingo.entities.Utilisateur;

public interface UtilisateurServices extends UserDetailsService {
	
	//CRUD 
	public List<Utilisateur> getAllUtilisateurs();
	public Utilisateur findUtilisateurById(Long id);
	public Utilisateur updateUtlisateur(Utilisateur utilisateur);
	public void deleteUtlisateur(Long id);
	

	
	
	//Other 
	//public List<Utilisateur> findByFirstName(String firstname);
	//public List<Utilisateur> findByFirstNameAndLastName(String firstname, String lastname);
	//public List<Utilisateur> findByRolesName(ERole name);
	
	
	

}

