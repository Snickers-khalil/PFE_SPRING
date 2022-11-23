package com.pfe.campingo.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Evennment;
import com.pfe.campingo.entities.Favorie;
import com.pfe.campingo.entities.Particip_event;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.AnnonceRepository;
import com.pfe.campingo.repository.EvennementRepository;
import com.pfe.campingo.repository.FavorieRepository;
import com.pfe.campingo.repository.Particip_randRepository;
import com.pfe.campingo.repository.UserRepository;

@Service
public class FavorieServiceImpl implements FavorieService{

	
	@Autowired
	private FavorieRepository favorieRepository;
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private AnnonceRepository annonceRepository;
	
	@Override
	public List<Favorie> getAllFavorie() {
		
		return favorieRepository.findAll() ;
	}

	@Override
	public Favorie findFavorieById(Long id) {
		Optional<Favorie> utOptional = favorieRepository.findById(id);

		if (utOptional.isEmpty()) {
			return null;
		} else {
			return utOptional.get();
		}
	}

	@Override
	public Favorie updateFavorie(Favorie favorie) {
		Optional<Favorie> utOptional = favorieRepository.findById(favorie.getId());

		if (utOptional.isEmpty()) {
			return null;
		} else {
			
			return favorieRepository.save(favorie);
		}
	}

	@Override
	public void deleteFavorie(Long id) {
		favorieRepository.deleteById(id);
		
	}

	@Override
	public Favorie createFavorie(Long iduser,Long idann) {
		Favorie ann = new Favorie();
		Utilisateur user = new Utilisateur();
		Annonce event= new Annonce();
		user = userRepository.findById(iduser).get();
		ann.setUtilisateur(user);
		event=annonceRepository.findById(idann).get();
		ann.setAnnonce(event);
		ann.setDate_fav(new Date());
		return  favorieRepository.save(ann);
	}

}
