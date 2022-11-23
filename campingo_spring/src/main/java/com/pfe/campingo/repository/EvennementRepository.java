package com.pfe.campingo.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pfe.campingo.entities.Evennment;



@Repository
public interface EvennementRepository extends JpaRepository<Evennment, Long>{
	
}
