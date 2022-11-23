package com.pfe.campingo.services;


import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.pfe.campingo.entities.ERole;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.UserRepository;

@Service
public class UtilisateurServicesImpl implements UtilisateurServices {

	@Autowired
	private UserRepository utilisateurRespository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	@Override
	public List<Utilisateur> getAllUtilisateurs() {

		return utilisateurRespository.findAll();
	}

	@Override
	public Utilisateur findUtilisateurById(Long id) {
		Optional<Utilisateur> utOptional = utilisateurRespository.findById(id);

		if (utOptional.isEmpty()) {
			return null;
		} else {
			return utOptional.get();
		}

	}
	@Override
	public Utilisateur updateUtlisateur(Utilisateur utilisateur) {
		Optional<Utilisateur> utOptional = utilisateurRespository.findById(utilisateur.getId());

		if (utOptional.isEmpty()) {
			return null;
		} else {
			String cryptedPassword = bCryptPasswordEncoder.encode(utilisateur.getPassword());
			utilisateur.setPassword(cryptedPassword);
			return utilisateurRespository.save(utilisateur);
		}
	}

	@Override
	public void deleteUtlisateur(Long id) {
		utilisateurRespository.deleteById(id);

	}
/*
	@Override
	public List<Utilisateur> findByFirstName(String firstname) {
		
		return utilisateurRespository.findByFirstName(firstname);
	}

	@Override
	public List<Utilisateur> findByFirstNameAndLastName(String firstname, String lastname) {
		
		return utilisateurRespository.findByFirstNameAndLastNameWithJPQL(firstname, lastname);
	}

	

	@Override
	public List<Utilisateur> findByRolesName(ERole name) {
		return utilisateurRespository.findByRolesName(name);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Utilisateur utilisateur = utilisateurRespository.findByEmail(email);
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(Role role: utilisateur.getRoles()) {
			GrantedAuthority authority= new SimpleGrantedAuthority(role.getName());
			authorities.add(authority);
		}
		
		return new User(utilisateur.getEmail(),utilisateur.getPassword(),authorities);
	}*/

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

}

