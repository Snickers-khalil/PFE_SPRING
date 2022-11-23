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
import com.pfe.campingo.entities.Evennment;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.EvennementRepository;
import com.pfe.campingo.repository.UserRepository;


@Service
public class EvennementServiceImpl {

	@Autowired
	private EvennementRepository evennementRepository;

	@Autowired
	private UserRepository userRepository;
	
	public Evennment createEvent(MultipartFile file,String Title, String Description,
			          Date debut_event,Date fin_event, Long iduser)throws IOException{
		
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
	
		Evennment eve = new Evennment();
		Utilisateur user = new Utilisateur();
		user = userRepository.findById(iduser).get();
		eve.setTitle(Title);
		eve.setDescription(Description);
		eve.setDebut_event(debut_event);
		eve.setFin_event(fin_event);
		eve.setUtilisateur(user);
		if(fileName.contains(".."))
		{
			System.out.println("not a a valid file");
		}
		try {
			eve.setImageUrl(Base64.getEncoder().encodeToString(file.getBytes()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return evennementRepository.save(eve);
	}

	public List<Evennment> getAllEvents() {
		return evennementRepository.findAll();
	}

	
	public Evennment findEventById(Long id) {
		Optional<Evennment> utOptional = evennementRepository.findById(id);

		if (utOptional.isEmpty()) {
			return null;
		} else {
			return utOptional.get();
		}
	}

	
	public Evennment updateEvent(Evennment event) {
		Optional<Evennment> utOptional = evennementRepository.findById(event.getId());

		if (utOptional.isEmpty()) {
			return null;
		} else {
			
			return evennementRepository.save(event);
		}
	}

	
	public void deleteEvent(Long id) {
		evennementRepository.deleteById(id);
		
	}
		
}
