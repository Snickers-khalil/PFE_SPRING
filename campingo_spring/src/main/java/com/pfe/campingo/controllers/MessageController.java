package com.pfe.campingo.controllers;

import java.io.IOException;
import java.util.stream.Stream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.entities.Message;
import com.pfe.campingo.entities.Particip_event;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.payload.response.MessageResponse;
import com.pfe.campingo.repository.MessageRepository;
import com.pfe.campingo.services.MessageServices;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/message")
public class MessageController {

	@Autowired
	MessageServices messageServices;
	
	@Autowired
	MessageRepository messageRepository;

//	@PostMapping("/addMessage")
//	public ResponseEntity<ResponseMessage> AjouterMessage(@RequestBody Message ch) throws IOException {
	@PostMapping("/addMessage/{iduser}")
	public ResponseEntity<ResponseMessage> AjouterMessage(@RequestParam("contenu") String Contenu,
			 @PathVariable("iduser") Long iduser) {
		String message = "";
		try {
			messageServices.AjouterMessage(Contenu, iduser);
			message = "Message ajouter successfully: ";
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "Could not add Message: " + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}

	@GetMapping("/AllMessage")
	@ResponseBody
	public Stream<Message> retrieveAllMessage() throws IOException {
		return messageServices.retrieveAllMessage();
	}

	@PutMapping(path = "/updateMessage/{idC}")
	public ResponseEntity<?> updateParticipe(@RequestBody Message msg, 
									@PathVariable("idC") Long id) throws IOException {
		Message ms = messageRepository.findById(id).get();
		ms.setContenu(msg.getContenu());
		
		ms.setUtilisateur(ms.getUtilisateur());
		messageRepository.save(ms);
		return ResponseEntity.ok(new MessageResponse("Annonce Modifier successfully!"));
	}

	// return messageServices.updateMessage(msg , id);

	@GetMapping(value = "/{idC}")
	@ResponseBody
	public Message getOneMessage(@PathVariable("idC") Long id) throws IOException {
		return messageServices.getOneMessage(id);
	}

	@DeleteMapping("/deleteMessage/{idC}")
	@ResponseBody
	public ResponseEntity<ResponseMessage> deleteMessage(@PathVariable("idC") Long id) throws IOException {

		String message = "";

		try {
			messageServices.deleteMessage(id);
			message = "Message supprime avec success: ";
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "failed to delete " + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}

}
