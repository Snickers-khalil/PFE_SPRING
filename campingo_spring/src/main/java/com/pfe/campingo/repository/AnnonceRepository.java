 

package com.pfe.campingo.repository;

 

import java.util.List;

 

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.pfe.campingo.entities.Annonce;

 
@Repository
public interface AnnonceRepository extends JpaRepository<Annonce, Long> {

    //SELECT * FROM `annonce` WHERE utilisateur_id=5;
    @Query("SELECT a FROM Annonce a WHERE utilisateur_id= ?1")
    public List<Annonce> findMesAnnonce(Long id);
	
           // public List<Annonce> findByTitre(String Titre);

}

