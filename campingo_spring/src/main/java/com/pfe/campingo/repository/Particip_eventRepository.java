package com.pfe.campingo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.pfe.campingo.entities.Favorie;
import com.pfe.campingo.entities.Particip_event;


@Repository
public interface Particip_eventRepository extends JpaRepository<Particip_event, Long >{
	 @Query("SELECT a FROM Particip_event a WHERE utilisateur_id= ?1")
	    public List<Particip_event> findMesEvent(Long id);
	    
	    @Query("SELECT a FROM Particip_event a WHERE evenment_id= ?1 AND utilisateur_id= ?2 ")
	    public Particip_event existe(Long idp,Long idu);
}
