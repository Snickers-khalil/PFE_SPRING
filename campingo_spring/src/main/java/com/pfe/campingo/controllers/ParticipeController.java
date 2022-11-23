package com.pfe.campingo.controllers;

import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Evennment;
import com.pfe.campingo.entities.Favorie;
import com.pfe.campingo.entities.Particip_event;
import com.pfe.campingo.entities.Particip_rand;
import com.pfe.campingo.entities.Participe;
import com.pfe.campingo.entities.Randonner;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.repository.EvennementRepository;
import com.pfe.campingo.repository.Particip_eventRepository;
import com.pfe.campingo.repository.Particip_randRepository;
import com.pfe.campingo.repository.RandonnerRepository;
import com.pfe.campingo.repository.UserRepository;
import com.pfe.campingo.services.ParticipeService;



@RestController
@RequestMapping("/particip")
public class ParticipeController {

	@Autowired
	private ParticipeService participeService;
 
	@Autowired
	private Particip_randRepository particip_randRepository;
	@Autowired
	private Particip_eventRepository particip_eventRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private EvennementRepository eventRepository;
	@Autowired
	private RandonnerRepository randRepository;
	
	@GetMapping (path = "/all_pe")
	public List<Particip_event> getAllpe() {
		return participeService.getAllParti_event();
	}

	// Participer evennment si n'existe pas
		@PostMapping("/add/{iduser}/{ideve}")
		public ResponseEntity<?> ParticipeEvent(@PathVariable("ideve") Long ideve,
				@PathVariable("iduser") Long iduser) {
			//return demandeService.envoyerDemande(iduser);
			String message = "";
			Utilisateur user = userRepository.findById(iduser).get();
			Evennment eve = eventRepository.findById(ideve).get();
		System.out.println(user);
			if (particip_eventRepository.existe(eve.getId(),user.getId())!=null  ) {
				message = "allready Participate ...!";
				return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
			}else
			{
				participeService.createParticipe(iduser, ideve);
				message = "Participate Successfully ";
				return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
			}
		}
		
		
		
		
//				try {
					
//				} catch (Exception e) {
//					message = "failed to Participe " + "!";
//					return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
//				}
		
	
//	@PostMapping("/add/{iduser}/{idevent}")
//	public Particip_event createParticipe( 
//		  @PathVariable("idevent") Long idevent,
//			@PathVariable("iduser") Long iduser) {  
//		return participeService.createParticipe( iduser,idevent);
//	}
	
	@GetMapping("/myev/{id}")
	public List<Particip_event> getAlleventByid(@PathVariable Long id) {
		return particip_eventRepository.findMesEvent(id);
	}
	
	@GetMapping("/myran/{id}")
	public List<Particip_rand> getAllByid(@PathVariable Long id) {
		return particip_randRepository.findMesrand(id);
	}
	

	// localhost:8080/particip/getpe/1
	@GetMapping(path = "/getpe/{id}") 
	public ResponseEntity<Particip_event> findPeById(@PathVariable Long id) {
		Particip_event  participe = participeService.findParti_eventById(id);

		if (participe == null) {
			return new ResponseEntity<Particip_event>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Particip_event>( participe, HttpStatus.OK);
		}
	}
	
	@PutMapping(path = "/update_pe") 
	public Particip_event updateParticipe(@RequestBody Particip_event  particip_event) {
		return participeService.updateParti_event(particip_event);
	} 

	@DeleteMapping(path = "/de/{id}") 
	public void deletePe(@PathVariable Long id) {
		participeService.deleteParti_event(id);
	}
	
	@DeleteMapping(path = "/dr/{id}") 
	public void deletePr(@PathVariable Long id) {
		participeService.deleteParti_rand(id);
		
		//particip_randRepository.deleteById(id);
	}
	
	@GetMapping (path = "/all_pr")
	public List<Particip_rand> getAllpr() {
		return participeService.getAllParti_rand();
	}

	
//	@PostMapping(path = "/add_pr")
//	public Particip_rand createPr(@RequestBody Particip_rand particip_rand) {
//		return participeService.createParti_rand(particip_rand);
//	}
	
	
	
	// Participer a randonner si n'existe pas
			@PostMapping("/add_pr/{iduser}/{idrand}")
			public ResponseEntity<?> ParticipeRand(@PathVariable("idrand") Long idrand,
					@PathVariable("iduser") Long iduser) {
				String message = "";
				Utilisateur user = userRepository.findById(iduser).get();
				Randonner rand = randRepository.findById(idrand).get();
			System.out.println(user);
				if (particip_randRepository.existp(rand.getId(),user.getId())!=null ) {
					message = "allready Participe ...!";
					return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
				}else
				{
					try {
						participeService.createParticiperand(iduser, idrand);
						message = "Participate Successfully ";
						return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
					} catch (Exception e) {
						message = "failed to Participe " + "!";
						return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
					}
				}
			}
//	@PostMapping("/add_pr/{iduser}/{idrand}")
//	public Particip_rand createParticiperand( 
//		  @PathVariable("idrand") Long idrand,
//			@PathVariable("iduser") Long iduser) {
//		return participeService.createParticiperand( iduser,idrand);
//	}

	// localhost:8080/particip/getpe/1
	@GetMapping(path = "/getpr/{id}") 
	public ResponseEntity<Particip_rand> findPrById(@PathVariable Long id) {
		Particip_rand  participe = participeService.findParti_randById(id);

		if (participe == null) {
			return new ResponseEntity<Particip_rand>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Particip_rand>( participe, HttpStatus.OK);
		}
	}
	
	@PutMapping(path = "/update_pr") 
	public Particip_rand updatePr(@RequestBody Particip_rand  particip_rand) {
		return participeService.updateParti_rand(particip_rand);
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
