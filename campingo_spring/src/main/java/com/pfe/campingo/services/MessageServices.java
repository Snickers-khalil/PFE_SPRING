package com.pfe.campingo.services;

import java.io.IOException;
import java.util.Date;
import java.util.Optional;
import java.util.stream.Stream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.pfe.campingo.entities.Message;
import com.pfe.campingo.entities.Randonner;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.repository.MessageRepository;
import com.pfe.campingo.repository.UserRepository;

@Service
public class MessageServices {

	@Autowired
	MessageRepository messageRepository;
	@Autowired
	UserRepository userRepository;
	
	public Message AjouterMessage(String contenu,long idUser)  throws IOException {
		Message msg = new Message();
		Utilisateur user = new Utilisateur();
		user = userRepository.findById(idUser).get();
		msg.setContenu(contenu);
		msg.setDate_post(new Date());
		msg.setUtilisateur(user);
		return messageRepository.save(msg);
	}
	
	public Stream<Message> retrieveAllMessage()  throws IOException {
		return messageRepository.findAll().stream();
	}
	
	public Message getOneMessage(Long id)  throws IOException {
		return messageRepository.findById(id).get();
	} 
	
	public void deleteMessage(Long id)  throws IOException {
		Message c = messageRepository.findById(id).get();
		c.setUtilisateur(null);
		messageRepository.save(c);	
		messageRepository.deleteById(id);
	}
	
	public Message updateMessage(Message c,Long id) throws IOException {
		Optional<Message>  chap = messageRepository.findById(c.getIdMessage());
		if (chap.isEmpty()) {
			return null;
		} else {
			return messageRepository.save(c);
		}
		
	}
}
