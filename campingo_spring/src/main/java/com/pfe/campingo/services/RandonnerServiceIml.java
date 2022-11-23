package com.pfe.campingo.services;

import java.io.IOException;
import java.sql.Date;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Randonner;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.RandonnerRepository;
import com.pfe.campingo.repository.UserRepository;
@Service
public class RandonnerServiceIml  {

	@Autowired
	private RandonnerRepository randonnerRepository;
	@Autowired
	private UserRepository userRepository;
	
	
	public Randonner createRand(MultipartFile file,String adress,String programme, String cercuit,
	     Long iduser,String difficult,Date date)throws IOException {

		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		Randonner rand = new Randonner();
		Utilisateur user = new Utilisateur();
		user = userRepository.findById(iduser).get();
		rand.setAdress(adress);
		rand.setProgramme(programme);
		rand.setCercuit(cercuit );
		rand.setDifficult(difficult);
		rand.setDate(date);
		rand.setUtilisateur(user);
		
		if(fileName.contains(".."))
		{
			System.out.println("not a a valid file");
		}
		try {
			rand.setImageUrl(Base64.getEncoder().encodeToString(file.getBytes()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return randonnerRepository.save(rand);
	}
	
	public List<Randonner>getAllRands() {
		return randonnerRepository.findAll();
	}

	
	public Randonner findRandById(Long id) {
		Optional<Randonner> utOptional = randonnerRepository.findById(id);
		if (utOptional.isEmpty()) {
			return null;
		} else {
			return utOptional.get();
		}
	}

	
	public Randonner updateRand(Randonner Rand) {
		Optional<Randonner> utOptional = randonnerRepository.findById(Rand.getId());
		if (utOptional.isEmpty()) {
			return null;
		} else {
			
			return randonnerRepository.save(Rand);
		}
	}

	
	public void deleteRand(Long id) {
		randonnerRepository.deleteById(id);
		
	}

	
	

	

}
