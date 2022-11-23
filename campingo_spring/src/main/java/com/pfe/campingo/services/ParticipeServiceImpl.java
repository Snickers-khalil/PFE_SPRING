package com.pfe.campingo.services;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pfe.campingo.entities.Evennment;
import com.pfe.campingo.entities.Particip_event;
import com.pfe.campingo.entities.Particip_rand;
import com.pfe.campingo.entities.Randonner;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.EvennementRepository;
import com.pfe.campingo.repository.Particip_eventRepository;
import com.pfe.campingo.repository.Particip_randRepository;
import com.pfe.campingo.repository.RandonnerRepository;
import com.pfe.campingo.repository.UserRepository;

@Service
public class ParticipeServiceImpl implements ParticipeService {

	@Autowired
	private Particip_randRepository particip_randRepository;

	@Autowired
	private Particip_eventRepository particip_eventRepository;

	@Autowired
	private EvennementRepository evennementRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RandonnerRepository randonnerRepository;
    
	//GETALL
	@Override
	public List<Particip_event> getAllParti_event() {
		return particip_eventRepository.findAll();
	}
	//GETALL
	@Override
	public List<Particip_rand> getAllParti_rand() {
		return particip_randRepository.findAll();
	}
	
	@Override
	public Particip_event findParti_eventById(Long id) {
		Optional<Particip_event> utOptional = particip_eventRepository.findById(id);

		if (utOptional.isEmpty()) {
			return null;
		} else {
			return utOptional.get();
		}
	}

	@Override
	public Particip_event createParticipe(Long iduser, Long idevent) {
		Particip_event ann = new Particip_event();
		Utilisateur user = new Utilisateur();
		Evennment event = new Evennment();
		user = userRepository.findById(iduser).get();
		ann.setUtilisateur(user);
		event = evennementRepository.findById(idevent).get();
		ann.setEvenment(event);
		ann.setDate_particip(new Date());
		return particip_eventRepository.save(ann);
	}

	@Override
	public Particip_event updateParti_event(Particip_event particip_event) {
		Optional<Particip_event> utOptional = particip_eventRepository.findById(particip_event.getId());

		if (utOptional.isEmpty()) {
			return null;
		} else {

			return particip_eventRepository.save(particip_event);
		}
	}

	// DELETE
	@Override
	public void deleteParti_event(Long id) {
		particip_eventRepository.deleteById(id);
	}

	// DELETE
	@Override
	public void deleteParti_rand(Long id) {
		particip_randRepository.deleteById(id);
	}

	public Particip_rand findParti_randById(Long id) {
		Optional<Particip_rand> utOptional = particip_randRepository.findById(id);

		if (utOptional.isEmpty()) {
			return null;
		} else {
			return utOptional.get();
		}
	}

	@Override
	public Particip_rand updateParti_rand(Particip_rand particip_rand) {
		Optional<Particip_rand> utOptional = particip_randRepository.findById(particip_rand.getId());

		if (utOptional.isEmpty()) {
			return null;
		} else {

			return particip_randRepository.save(particip_rand);
		}
	}

//	@Override
//	public Particip_rand createParti_rand(Particip_rand particip_rand) {
//		return particip_randRepository.save(particip_rand);
//	}
	@Override
	public Particip_rand createParticiperand(Long iduser, Long idrand) {
		Particip_rand ann = new Particip_rand();
		Utilisateur user = new Utilisateur();
		Randonner rand = new Randonner();
		user = userRepository.findById(iduser).get();
		ann.setUtilisateur(user);
		rand = randonnerRepository.findById(idrand).get();
		ann.setRandonner(rand);
		ann.setDate_particip(new Date());
		return particip_randRepository.save(ann);
	}

	/*
	 * 
	 * 
	 * @Override public Participe findParticipeById(Long id) { Optional<Participe>
	 * utOptional = participeRepository.findById(id);
	 * 
	 * if (utOptional.isEmpty()) { return null; } else { return utOptional.get(); }
	 * }
	 * 
	 * @Override public Participe updateParticipe(Participe participe) {
	 * Optional<Participe> utOptional =
	 * participeRepository.findById(participe.getId());
	 * 
	 * if (utOptional.isEmpty()) { return null; } else {
	 * 
	 * return participeRepository.save(participe); } }
	 * 
	 * @Override public void deleteParticipe(Long id) {
	 * participeRepository.deleteById(id);
	 * 
	 * }
	 * 
	 * @Override public Participe createParticipe(Participe participe) { return
	 * participeRepository.save(participe); }
	 * 
	 * @Override public UserDetails loadUserByUsername(String username) throws
	 * UsernameNotFoundException { // TODO Auto-generated method stub return null; }
	 * 
	 * @Override public List<Particip_event> getAllParti_event() { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * @Override public Particip_event findParti_eventById(Long id) { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * @Override public Particip_event updateParti_event(Particip_event
	 * particip_event) { // TODO Auto-generated method stub return null; }
	 * 
	 * @Override public void deleteParti_event(Long id) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 * 
	 * @Override public Particip_event createParticipe(Particip_event
	 * particip_event) { // TODO Auto-generated method stub return null; }
	 * 
	 * @Override public List<Particip_rand> getAllParti_rand() { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * @Override public Particip_rand findParti_randById(Long id) { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * @Override public Particip_rand updateParti_rand(Particip_event particip_rand)
	 * { // TODO Auto-generated method stub return null; }
	 * 
	 * @Override public void deleteParti_rand(Long id) { // TODO Auto-generated
	 * method stub
	 * 
	 * }
	 * 
	 * @Override public Particip_rand createParti_rand(Particip_rand particip_rand)
	 * { // TODO Auto-generated method stub return null; }
	 */

}
