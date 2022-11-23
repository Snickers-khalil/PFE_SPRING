package com.pfe.campingo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.pfe.campingo.entities.Demande;
import com.pfe.campingo.entities.Favorie;


@Repository
public interface FavorieRepository extends JpaRepository<Favorie, Long > {

	
	@Query("SELECT a FROM Favorie a WHERE utilisateur_id= ?1")
	    public List<Favorie> findMesFavoris(Long id);
	
//	@Query("SELECT a FROM Favorie a WHERE annonce_id= ?1")
//    public Boolean FavoriAnn(Long id);
	
	 @Query("SELECT a FROM Favorie a WHERE annonce_id= ?1 AND utilisateur_id= ?2 ")
	    public Favorie exists(Long ida,Long idu);
}
