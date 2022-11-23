package com.pfe.campingo.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.pfe.campingo.entities.Randonner;

public interface RandonnerService {
	//CRUD 
			public List<Randonner> getAllRands();
			public Randonner findRandById(Long id);
			public Randonner updateRand(Randonner Rand);
			public void deleteRand(Long id);
			public Randonner createRand(Randonner Rand);
			

}
