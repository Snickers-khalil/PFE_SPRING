
package com.pfe.campingo.services;

import java.io.IOException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.AnnonceRepository;
import com.pfe.campingo.repository.UserRepository;

@Service
public class AnnonceServicesImpl {

	@Autowired

	private AnnonceRepository annonceRespository;

	@Autowired
	private UserRepository userRepository;

	public Annonce addAnnonce(MultipartFile file,String Titre, String Description,
			double Prix, Long iduser,
			String categorie,String phone,String adresse)throws IOException {
		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
		Annonce ann = new Annonce();
		Utilisateur user = new Utilisateur();
		user = userRepository.findById(iduser).get();
		ann.setTitre(Titre);
		ann.setDescription(Description);
		ann.setDate_ajout(new Date());
		ann.setPrix(Prix);
		ann.setCategorie(categorie);
		ann.setPhone(phone);
		ann.setAdresse(adresse);
		ann.setUtilisateur(user);
		if(fileName.contains(".."))
		{
			System.out.println("not a a valid file");
		}
		try {
			ann.setImageUrl(Base64.getEncoder().encodeToString(file.getBytes()));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return annonceRespository.save(ann);
	}

	public List<Annonce> getAllAnnonces() {
		return annonceRespository.findAll();
	}


	public Annonce findAnnonceById(Long id) {

		Optional<Annonce> utOptional = annonceRespository.findById(id);
		if (utOptional.isEmpty()) {
			return null;
		} else {
			return utOptional.get();
		}
	}



	public Annonce updateAnnonce(Annonce annonce) {
		annonceRespository.findById(annonce.getId());
		return annonceRespository.save(annonce);
	}
	
//	public void updateAnnonce(Long id,String Titre, String Description,
//			double Prix, Long iduser,
//			String categorie,String phone,String adresse)throws IOException {
//		
//    	Annonce ann = new Annonce();
//    	Utilisateur user = new Utilisateur();
//    	ann.setTitre(Titre);
//		ann.setDescription(Description);
//		ann.setDate_ajout(new Date());
//		ann.setPrix(Prix);
//		ann.setCategorie(categorie);
//		ann.setPhone(phone);
//		ann.setAdresse(adresse);
//		ann.setUtilisateur(user);
//    	annonceRespository.save(ann); 
//    }


	public void deleteAnnonce(Long id) throws IOException {
		annonceRespository.deleteById(id);
	}


	// public List<Annonce> findByTitre(String Titre) {

	// return annonceRespository.findByTitre(Titre);

	// }

}