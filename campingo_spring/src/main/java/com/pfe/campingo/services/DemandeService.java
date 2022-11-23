package com.pfe.campingo.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Demande;
import com.pfe.campingo.entities.Favorie;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.DemandeRepository;
import com.pfe.campingo.repository.FavorieRepository;
import com.pfe.campingo.repository.UserRepository;

@Service
public class DemandeService {

	
	@Autowired
	private DemandeRepository demandeRepository;
	@Autowired
	private UserRepository userRepository;

	
	public Demande envoyerDemande(Long iduser) {
		Demande dem = new Demande();
		Utilisateur user = new Utilisateur();
		user = userRepository.findById(iduser).get();
		dem.setUtilisateur(user);
		dem.setDate_demande(new Date());
		return  demandeRepository.save(dem);
	}
}
