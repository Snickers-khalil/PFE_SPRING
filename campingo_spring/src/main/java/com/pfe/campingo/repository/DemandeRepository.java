package com.pfe.campingo.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Demande;
import com.pfe.campingo.entities.Utilisateur;

@Repository
public interface DemandeRepository extends JpaRepository<Demande, Long> {
	
	
	@Query("SELECT d FROM Demande d WHERE utilisateur_id= ?1")
    public Demande exists(Long id);
	//public Boolean exists(Utilisateur utilisateur);
}
