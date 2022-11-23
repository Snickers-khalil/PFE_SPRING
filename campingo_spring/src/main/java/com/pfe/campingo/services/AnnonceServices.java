package com.pfe.campingo.services;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import com.pfe.campingo.entities.Annonce;

public interface AnnonceServices {

	// CRUD Annonce

	public Annonce addAnnonce(String Titre, String Description, Date date_ajout, 
			double Prix, Long iduser,String imageUrl,String categorie);
		
	public List<Annonce> getAllAnnonces();

	public Annonce findAnnonceById(Long id);

	public Annonce updateAnnonce(Annonce annonce);

	public void deleteAnnonce(Long id) throws IOException;

	
	// Other Methode

	// public List<Annonce> findByTitre(String Titre);

}