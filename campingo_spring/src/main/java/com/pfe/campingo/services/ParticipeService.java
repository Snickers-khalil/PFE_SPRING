package com.pfe.campingo.services;

import java.util.List;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.pfe.campingo.entities.Particip_event;
import com.pfe.campingo.entities.Particip_rand;



public interface ParticipeService{
	
	
	//CRUD_Particip_event
	public List<Particip_event> getAllParti_event();
	public Particip_event findParti_eventById(Long id);
	public Particip_event updateParti_event(Particip_event particip_event);
	public void deleteParti_event(Long id);
	public Particip_event createParticipe( Long iduser,Long idevent);
	
	//CRUD_Particip_rand
		public List<Particip_rand> getAllParti_rand();
		public Particip_rand findParti_randById(Long id);
		public Particip_rand updateParti_rand(Particip_rand particip_rand);
		public void deleteParti_rand(Long id);
		public Particip_rand createParticiperand(Long iduser,Long idrand);
}
