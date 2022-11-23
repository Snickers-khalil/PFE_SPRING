package com.pfe.campingo.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import com.pfe.campingo.entities.Avatar;

public interface AvatarRepository extends JpaRepository<Avatar, Long> {
	
	Optional<Avatar> findById(long id);
}

