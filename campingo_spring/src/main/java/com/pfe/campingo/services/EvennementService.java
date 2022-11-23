package com.pfe.campingo.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.pfe.campingo.entities.Evennment;



public interface EvennementService extends UserDetailsService{

	
	//CRUD 
		public List<Evennment> getAllEvents();
		public Evennment findEventById(Long id);
		public Evennment updateEvent(Evennment event);
		public void deleteEvent(Long id);
		public Evennment createEvent(Evennment event);

}
