package com.pfe.campingo.controllers;

import java.sql.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Evennment;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.payload.response.MessageResponse;
import com.pfe.campingo.repository.EvennementRepository;
import com.pfe.campingo.services.EvennementService;
import com.pfe.campingo.services.EvennementServiceImpl;
@RestController
@RequestMapping("/event")

public class EvennementController {

	@Autowired
	private EvennementServiceImpl evennementService;
	@Autowired
	private EvennementRepository evennementRepository;
	
	@GetMapping (path = "/all")
	public List<Evennment> getAllevents() {
		return evennementService.getAllEvents();
	}
	
	@PostMapping(path = "/add/{iduser}")
	public ResponseEntity<ResponseMessage> createUtilisateur(@RequestParam("title") String Titre, 
			@RequestParam("description") String Description,
			@RequestParam("debut_event") Date debut_event,
			@RequestParam("fin_event") Date fin_event,
			@PathVariable("iduser") Long iduser,
			@RequestParam("imageUrl") MultipartFile file) {
		String message = "";
		try {
			evennementService.createEvent(file,Titre, Description, debut_event,fin_event,iduser);
			message = "Uploaded the file successfully: " + file.getOriginalFilename();
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "Could not upload the file: " + file.getOriginalFilename() + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}

	// localhost:8080/utilisateur/1
	@GetMapping(path = "/{id}") 
	public ResponseEntity<Evennment> findUtilisateurById(@PathVariable Long id) {
		Evennment  evennement = evennementService.findEventById(id);

		if (evennement == null) {
			return new ResponseEntity<Evennment>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Evennment>( evennement, HttpStatus.OK);
		}
	}
	
//	@PutMapping
//	public Evennment updateEvent(@RequestBody Evennment  evennement) {
//		return evennementService.updateEvent(evennement);
//	} 
	@PutMapping(value="/{ideve}")
	public ResponseEntity<?> updateEvent(@PathVariable("ideve")Long id ,
										@Valid @RequestBody Evennment evennment ) {
		Evennment event = evennementRepository.findById(id).get();
		
		event.setTitle(evennment.getTitle());
		event.setDescription(evennment.getDescription());
		event.setDebut_event(evennment.getDebut_event());
		event.setFin_event(evennment.getFin_event());
		event.setImageUrl(event.getImageUrl());
		event.setUtilisateur(event.getUtilisateur());
		evennementRepository.save(event);
		return ResponseEntity.ok(new MessageResponse("Evennement Modifier successfully!"));
	}

	@DeleteMapping(path = "/{id}") 
	public void deleteEvent(@PathVariable Long id) {
		evennementService.deleteEvent(id);
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
	
	// localhost:8080/utilisateur/findByRoleTitre/ADMIN
	@GetMapping(path = "/findByRoleTitre/{titre}") 
	public ResponseEntity<List<Utilisateur>> findUtilisateurByRole(@PathVariable String titre) {
		List<Utilisateur> utilisateurs = utilisateurService.findByRolesTitre(titre);

		if (utilisateurs.isEmpty()) {
			return new ResponseEntity<List<Utilisateur>>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<List<Utilisateur>>(utilisateurs, HttpStatus.OK);
		}
	}
	
*/
}