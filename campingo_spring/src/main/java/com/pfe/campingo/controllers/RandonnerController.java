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

import com.pfe.campingo.entities.Evennment;
import com.pfe.campingo.entities.Randonner;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.payload.response.MessageResponse;
import com.pfe.campingo.repository.EvennementRepository;
import com.pfe.campingo.repository.RandonnerRepository;
import com.pfe.campingo.services.RandonnerService;
import com.pfe.campingo.services.RandonnerServiceIml;



@RestController
@RequestMapping("/rand")
public class RandonnerController {

	@Autowired
	private RandonnerServiceIml randonnerService;
 
	@Autowired
	private RandonnerRepository randonnerRepository;
	
	@PostMapping(path = "/add/{iduser}")
	public ResponseEntity<ResponseMessage> createUtilisateur(@RequestParam("adress") String adresse, 
			@RequestParam("programme") String programme,
			@RequestParam("difficult") String difficult,
			@RequestParam("cercuit") String cercuit,
			@RequestParam("date") Date date ,
			@PathVariable("iduser") Long iduser,
			@RequestParam("imageUrl") MultipartFile file) {
		String message = "";
		try {
			randonnerService.createRand(file,adresse, programme,cercuit,iduser,difficult,date);
			message = "Uploaded the file successfully: " + file.getOriginalFilename();
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "Could not upload the file: " + file.getOriginalFilename() + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}
	
	@GetMapping (path = "/all")
	public List<Randonner> getAllUtilisateurs() {
		return randonnerService.getAllRands();
	}
	// localhost:8080/utilisateur/1
	@GetMapping(path = "/{id}") 
	public ResponseEntity<Randonner> findUtilisateurById(@PathVariable Long id) {
		Randonner  randonner = randonnerService.findRandById(id);

		if (randonner == null) {
			return new ResponseEntity<Randonner>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Randonner>( randonner, HttpStatus.OK);
		}
	}
	
//	@PutMapping
//	public Randonner updateEvent(@RequestBody Randonner  randonner) {
//		return randonnerService.updateRand(randonner);
//	} 
	@PutMapping(value="/{idran}")
	public ResponseEntity<?> updateRand(@PathVariable("idran")Long id ,
										@Valid @RequestBody Randonner randonner ) {
		Randonner rand = randonnerRepository.findById(id).get();
		rand.setAdress(randonner.getAdress());
		rand.setProgramme(randonner.getProgramme());
		rand.setCercuit(randonner.getCercuit());
		rand.setDifficult(randonner.getDifficult());
		rand.setDate(randonner.getDate());
		rand.setImageUrl(rand.getImageUrl());
		rand.setUtilisateur(rand.getUtilisateur());
		randonnerRepository.save(rand);
		return ResponseEntity.ok(new MessageResponse("Randonner Modifier successfully!"));
	}

	@DeleteMapping(path = "/{id}") 
	public void deleteRand(@PathVariable Long id) {
		randonnerService.deleteRand(id);
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
