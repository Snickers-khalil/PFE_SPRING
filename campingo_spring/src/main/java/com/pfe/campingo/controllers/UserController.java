package com.pfe.campingo.controllers;

import java.util.Base64;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.pfe.campingo.entities.ERole;
import com.pfe.campingo.entities.Role;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.payload.request.RegisterRequest;
import com.pfe.campingo.payload.response.MessageResponse;
import com.pfe.campingo.repository.RoleRepository;
import com.pfe.campingo.repository.UserRepository;
import com.pfe.campingo.services.UtilisateurServices;

@RestController
@RequestMapping("/utilisateur")
public class UserController {

	@Autowired
	private UtilisateurServices utilisateurService;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	PasswordEncoder encoder;
	
	@Autowired
	RoleRepository roleRepository;
	

	@GetMapping (path = "/all")
	public List<Utilisateur> getAllUtilisateurs() {
		return utilisateurService.getAllUtilisateurs();
	}
	@GetMapping(path = "/allrole") 
	public List<Role> findallRole() {
			return roleRepository.findAll();
	}
	
	@GetMapping(path = "/role/{id}") 
	public Set<Role> userRole(@PathVariable Long id) {
		Utilisateur utilisateur = utilisateurService.findUtilisateurById(id);
		Set<Role> role = utilisateur.getRoles();	
		System.out.println(role);
			return role ;
	}
	
	@PutMapping(path = "/changerrandonneur/{iduser}")
	public ResponseEntity<?>  changerand(@PathVariable("iduser")Long id ,
								         @RequestBody RegisterRequest signUpRequest) {	
		Utilisateur us = userRepository.findById(id).get();
		Set<String> strRoles = signUpRequest.getRole();	
		//System.out.println(strRoles);
		Set<Role> roles = new HashSet<>();
		//System.out.println(signUpRequest);
		if (strRoles == null) {
			Role randRole = roleRepository.findByName(ERole.RANDONNEUR)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(randRole);
		} 
		us.setRoles(roles);
		userRepository.save(us);
		return ResponseEntity.ok(new MessageResponse(" Role Modifier successfully To randonneur!"));
	} 

	@PutMapping(path = "/changeruser/{iduser}")
	public ResponseEntity<?>  changuser(@PathVariable("iduser")Long id ,
								         @RequestBody RegisterRequest signUpRequest) {	
		Utilisateur us = userRepository.findById(id).get();
		Set<String> strRoles = signUpRequest.getRole();	
		//System.out.println(strRoles);
		Set<Role> roles = new HashSet<>();
		//System.out.println(signUpRequest);
		if (strRoles == null) {
			Role userRole = roleRepository.findByName(ERole.USER)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
		} 
		us.setRoles(roles);
		userRepository.save(us);
		return ResponseEntity.ok(new MessageResponse(" Role Modifier successfully To User!"));
	} 
	
	@PutMapping(path = "/changeradmin/{iduser}")
	public ResponseEntity<?>  changadmin(@PathVariable("iduser")Long id ,
								         @RequestBody RegisterRequest signUpRequest) {	
		Utilisateur us = userRepository.findById(id).get();
		Set<String> strRoles = signUpRequest.getRole();			
		Set<Role> roles = new HashSet<>();		
		if (strRoles == null) {
			Role adminRole = roleRepository.findByName(ERole.ADMIN)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(adminRole);
		} 
		us.setRoles(roles);
		userRepository.save(us);
		return ResponseEntity.ok(new MessageResponse(" Role Modifier successfully To Admin!"));
	} 
	
	// localhost:8080/utilisateur/1
	@GetMapping(path = "/{id}") 
	public ResponseEntity<Utilisateur> findUtilisateurById(@PathVariable Long id) {
		Utilisateur utilisateur = utilisateurService.findUtilisateurById(id);

		if (utilisateur == null) {
			return new ResponseEntity<Utilisateur>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Utilisateur>(utilisateur, HttpStatus.OK);
		}
	}
	
//	@PutMapping(path = "/update")
//	public Utilisateur updateUtilisateur(@RequestBody Utilisateur utilisateur) {
//		return utilisateurService.updateUtlisateur(utilisateur);
//	} 
	
	 @PutMapping(value="/update/{iduser}")
		public ResponseEntity<?> ModifierUser(@PathVariable("iduser")Long id ,
											@Valid @RequestBody RegisterRequest signUpRequest ) {
			//Set<String> strRoles = signUpRequest.getRole();
			//Set<Role> roles = new HashSet<>();
			Utilisateur user2 = userRepository.findById(id).get();
			user2.setFirstname(signUpRequest.getFirstname());
			user2.setLastname(signUpRequest.getLastname());
			user2.setUsername(signUpRequest.getUsername());
			user2.setEmail(signUpRequest.getEmail());
			encoder.encode(signUpRequest.getPassword());
			user2.setPhone(signUpRequest.getPhone());
			user2.setCity(signUpRequest.getCity());
			user2.setRoles(user2.getRoles());
			user2.setImageUrl(user2.getImageUrl());
			userRepository.save(user2);
			return ResponseEntity.ok(new MessageResponse("User Modifier successfully!"));
		}
	 
	@DeleteMapping(path = "/{id}") 
	public void deleteUtilisateur(@PathVariable Long id) {
		utilisateurService.deleteUtlisateur(id);
	}
	
	/* localhost:8080/utilisateur/findByFirstName/amin
	@GetMapping(path = "/findByFirstName/{firstName}") 
	public ResponseEntity<List<Utilisateur>> findUtilisateurByFirstName(@PathVariable String firstName) {
		List<Utilisateur> utilisateurs = utilisateurService.findByFirstName(firstname);

		if (utilisateurs.isEmpty()) {
			return new ResponseEntity<List<Utilisateur>>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<List<Utilisateur>>(utilisateurs, HttpStatus.OK);
		}
	}
	// localhost:8080/utilisateur/findByFirstNameAndLastName/khalil
	@GetMapping(path = "/findByFirstNameAndLastName/{firstName}/{lastName}") 
	public ResponseEntity<List<Utilisateur>> findUtilisateurByFirstNameAndLastName(@PathVariable String firstName,
			@PathVariable String lastName) {
		List<Utilisateur> utilisateurs = utilisateurService.findByFirstNameAndLastName(firstName, lastName);

		if (utilisateurs.isEmpty()) {
			return new ResponseEntity<List<Utilisateur>>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<List<Utilisateur>>(utilisateurs, HttpStatus.OK);
		}
	}
	 // localhost:8080/utilisateur/findByFirstNameAndLastNameWithRB
	@GetMapping(path = "/findByFirstNameAndLastNameWithRB")
	public ResponseEntity<List<Utilisateur>> findUtilisateurByFirstNameAndLastName(
			@RequestBody FirstNameAndLastNameRequest firstNameAndLastNameRequest) {
		List<Utilisateur> utilisateurs = utilisateurService.findByFirstNameAndLastName(
				firstNameAndLastNameRequest.getFirstName(), firstNameAndLastNameRequest.getLastName());

		if (utilisateurs.isEmpty()) {
			return new ResponseEntity<List<Utilisateur>>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<List<Utilisateur>>(utilisateurs, HttpStatus.OK);
		}
	}
	*/
	
	
	
	// localhost:8080/utilisateur/findByRoleTitre/ADMIN
//	@GetMapping(path = "/findByRoleTitre/{titre}") 
//	public ResponseEntity<List<Utilisateur>> findUtilisateurByRole(@PathVariable ERole titre) {
//		List<Utilisateur> utilisateurs = utilisateurService.findByRolesName(titre);
//
//		if (utilisateurs.isEmpty()) {
//			return new ResponseEntity<List<Utilisateur>>(HttpStatus.NO_CONTENT);
//		} else {
//			return new ResponseEntity<List<Utilisateur>>(utilisateurs, HttpStatus.OK);
//		}
//	}
	

}

