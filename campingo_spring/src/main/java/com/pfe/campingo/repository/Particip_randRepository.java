package com.pfe.campingo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.pfe.campingo.entities.Favorie;
import com.pfe.campingo.entities.Particip_event;
import com.pfe.campingo.entities.Particip_rand;


@Repository
public interface Particip_randRepository extends JpaRepository<Particip_rand, Long >{
	 @Query("SELECT a FROM Particip_rand a WHERE utilisateur_id= ?1")
	    public List<Particip_rand> findMesrand(Long id);
	    
	    @Query("SELECT pr FROM Particip_rand pr WHERE randonner_id= ?1 AND utilisateur_id= ?2 ")
	    public Particip_rand existp(Long idr,Long idu);
}
