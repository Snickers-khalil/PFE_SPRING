package com.pfe.campingo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Favorie;
import com.pfe.campingo.entities.Particip_event;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.repository.AnnonceRepository;
import com.pfe.campingo.repository.FavorieRepository;
import com.pfe.campingo.repository.UserRepository;
import com.pfe.campingo.services.FavorieService;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping("/favorie")
public class FavorieController {

	@Autowired
	private FavorieService favorieService;
	@Autowired
	private FavorieRepository favorieRepository;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private AnnonceRepository annonceRepository;
	@GetMapping (path = "/all")
	public List<Favorie> getAllFavories() {
		return favorieService.getAllFavorie();
	}

	
//	@PostMapping(path = "/add")
//	public Favorie createFavorie(@RequestBody Favorie favorie) {
//		return favorieService.createFavorie(favorie);
//	}
//	 add to favoris si n'existe pas
		@PostMapping("/add/{iduser}/{idann}")
		public ResponseEntity<?> ajoutfavorie(@PathVariable("idann") Long idann,
				@PathVariable("iduser") Long iduser) {
			//return demandeService.envoyerDemande(iduser);
			String message = "";
			Utilisateur user = userRepository.findById(iduser).get();
			Annonce ann = annonceRepository.findById(idann).get();
		System.out.println(user);
			if (favorieRepository.exists(ann.getId(),user.getId())!=null  ) {
				message = "allready in your favoris ...!";
				return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
			}else
			{
				try {
					favorieService.createFavorie(iduser, idann);
					message = "Add Successfully to Favoris: ";
					return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
				} catch (Exception e) {
					message = "failed to add to favoris " + "!";
					return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
				}
			}
		}
//	@PostMapping("/add/{iduser}/{idann}")
//	public Favorie createParticipe( 
//		  @PathVariable("idann") Long idann,
//			@PathVariable("iduser") Long iduser) {  
//		return favorieService.createFavorie( iduser,idann);
//	}

	// localhost:8080/favorie/1
	@GetMapping(path = "/{id}") 
	public ResponseEntity<Favorie> findFavorieById(@PathVariable Long id) {
		Favorie  favorie = favorieService.findFavorieById(id);

		if (favorie == null) {
			return new ResponseEntity<Favorie>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Favorie>( favorie, HttpStatus.OK);
		}
	}
	
	@GetMapping("/isfavorie/{iduser}/{idann}")
	public Boolean isfavorie(@PathVariable("idann") Long idann,
			@PathVariable("iduser") Long iduser) {
		String message = "";
		Utilisateur user = userRepository.findById(iduser).get();
		Annonce ann = annonceRepository.findById(idann).get();
	System.out.println(user);
		if (favorieRepository.exists(ann.getId(),user.getId())!=null  ) {
			message = "allready in your favoris ...!";
			return true;
		}else
		{
			try {
//				message = "Ajouter  avec success: ";
				return false;
			} catch (Exception e) {
				message = "failed to add to favoris " + "!";
				return false;	
				}
		}
	}
	
	@GetMapping("/myfav/{id}")
	public List<Favorie> getAllByid(@PathVariable Long id) {
		return favorieRepository.findMesFavoris(id);
	}
	
	@PutMapping(path = "/update") 
	public Favorie updateFavorie(@RequestBody Favorie  favorie) {
		return favorieService.updateFavorie(favorie);
	} 

	@DeleteMapping(path = "/{id}") 
	public void deleteFavorie(@PathVariable Long id) {
		favorieService.deleteFavorie(id);
	}
}
