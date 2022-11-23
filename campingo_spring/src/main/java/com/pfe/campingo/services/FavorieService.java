package com.pfe.campingo.services;

import java.util.List;
import com.pfe.campingo.entities.Favorie;
import com.pfe.campingo.entities.Particip_event;
public interface FavorieService {
	
	
	//CRUD_Particip_event
	public List<Favorie> getAllFavorie();
	public Favorie findFavorieById(Long id);
	public Favorie updateFavorie(Favorie favorie);
	public void deleteFavorie(Long id);
	public Favorie createFavorie(Long iduser,Long idann);
	//public Particip_event createParticipe( Long iduser,Long idevent);
}