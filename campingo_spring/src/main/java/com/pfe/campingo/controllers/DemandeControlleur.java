package com.pfe.campingo.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.pfe.campingo.entities.Demande;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.repository.DemandeRepository;
import com.pfe.campingo.repository.UserRepository;
import com.pfe.campingo.services.DemandeService;
import com.pfe.campingo.services.UtilisateurServices;

@RestController
@RequestMapping("/demande")
public class DemandeControlleur {

	@Autowired
	private DemandeRepository demandeRepository;
	@Autowired
	private DemandeService demandeService;
	@Autowired
	private UserRepository userRepository;
	// Tout les demande
	@GetMapping(path = "/all")
	public List<Demande> getAllDemandes() {
		return demandeRepository.findAll();
	}

	// envoyer une demande
	@PostMapping("/add1/{iduser}")
	public ResponseEntity<?> envoyerDemande(@PathVariable("iduser") Long iduser) {
		String message = "";
		try {
			demandeService.envoyerDemande(iduser);
			message = "Demande Envoyer avec success: ";
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "failed D'Envoyer une Demande " + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}

	// supprimer ou refuser demande
	@DeleteMapping(path = "/{id}")
	public ResponseEntity<ResponseMessage> SupprimerDemande(@PathVariable Long id) {
		String message = "";
		try {
			demandeRepository.deleteById(id);
			message = "Demande supprime avec success: ";
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "failed to supprimer la Demande " + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}

	// supprimer ou refuser Tout les demande
	@DeleteMapping(path = "/toutlesdemande")
	public  ResponseEntity<ResponseMessage> SupprimerToutLesDemande() {
		String message = "";
		try {
			demandeRepository.deleteAll();
			message = " Tout les Demande supprimer avec success: ";
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "failed to supprimer les Demande " + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}
//	 envoyer une demande si n'existe pas
		@PostMapping("/add/{iduser}")
		public ResponseEntity<?> envoyerDemande(@PathVariable("iduser") Long iduser,Long id) {
			//return demandeService.envoyerDemande(iduser);
			String message = "";
			Utilisateur user = userRepository.findById(iduser).get();
		System.out.println(user);
			if (demandeRepository.exists(user.getId())!=null) {
				message = "votre Demande Encours ...!";
				return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
			}else
			{
				try {
					demandeService.envoyerDemande(iduser);
					message = "Demande Envoyer avec success: ";
					return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
				} catch (Exception e) {
					message = "failed D'Envoyer une Demande " + "!";
					return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
				}
			}
		}
}
