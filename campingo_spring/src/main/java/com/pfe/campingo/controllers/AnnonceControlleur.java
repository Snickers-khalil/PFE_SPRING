package com.pfe.campingo.controllers;

import java.util.Base64;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.pfe.campingo.entities.Annonce;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.payload.response.MessageResponse;
import com.pfe.campingo.repository.AnnonceRepository;
import com.pfe.campingo.services.AnnonceServicesImpl;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
@RequestMapping("/annonce")
public class AnnonceControlleur {

	@Autowired
	private AnnonceServicesImpl annonceService;
	@Autowired
	private AnnonceRepository annonceRepository;
	
	@PostMapping("/add/{iduser}")
	//@PostMapping("/add")
	public ResponseEntity<ResponseMessage> addAnnonce(@RequestParam("titre") String Titre, 
			@RequestParam("description") String Description,
			@RequestParam("Prix") double Prix,
			@PathVariable("iduser") Long iduser,
			@RequestParam("phone") String phone,
			@RequestParam("adresse") String adresse,
			@RequestParam("categorie") String Categorie,
			@RequestParam("imageUrl") MultipartFile file) {
		String message = "";
		try {
			 annonceService.addAnnonce(file,Titre, Description, Prix, iduser,Categorie,phone,adresse);
			message = "Uploaded the file successfully: " + file.getOriginalFilename();
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "Could not upload the file: " + file.getOriginalFilename() + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}
	
	@PutMapping(value="/{idann}")
	public ResponseEntity<?> UpdateAnnonce(@PathVariable("idann")Long id ,
										@Valid @RequestBody Annonce annonce ) {
		Annonce annonce2 = annonceRepository.findById(id).get();
		annonce2.setTitre(annonce.getTitre());
		annonce2.setDescription(annonce.getDescription());
		annonce2.setCategorie(annonce.getCategorie());
		annonce2.setAdresse(annonce.getAdresse());
		annonce2.setPhone(annonce.getPhone());
		annonce2.setDate_ajout(annonce2.getDate_ajout());
		annonce2.setImageUrl(annonce2.getImageUrl());
		annonce2.setUtilisateur(annonce2.getUtilisateur());
		annonceRepository.save(annonce2);
		return ResponseEntity.ok(new MessageResponse("Annonce Modifier successfully!"));
	}
	
	@GetMapping("/all")
	public List<Annonce> getAllAnnonces() {
		return annonceService.getAllAnnonces();
	}
	
	@GetMapping("/myann/{id}")
	public List<Annonce> getAllByid(@PathVariable Long id) {
		return annonceRepository.findMesAnnonce(id);
	}

	// localhost:8080/annonce/1
	@GetMapping("/{id}")
	public ResponseEntity<Annonce> findAnnonceById(@PathVariable Long id) {
		Annonce annonce = annonceService.findAnnonceById(id);
		if (annonce == null) {
			return new ResponseEntity<Annonce>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Annonce>(annonce, HttpStatus.OK);
		}
	}

	 @PutMapping(value="/updateann/{idann}")
	  public ResponseEntity<?> ModifierUserPhoto(@PathVariable("idann")Long id ,
			  									@RequestParam("file") MultipartFile file ) {
		 Annonce user = new Annonce();
		  user = annonceRepository.findById(id).get();
		  
		  String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			String message = "";
			if(fileName.contains(".."))
			{
				System.out.println("not a a valid file");
			}
			try {
				user.setImageUrl(Base64.getEncoder().encodeToString(file.getBytes()));
				message = "User Photo Modifier successfully! " + file.getOriginalFilename();
				annonceRepository.save(user);
				return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
			} catch (Exception e) {
				message = "Could not upload the Photo: " + file.getOriginalFilename() + "!";
				return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
			}
	  }
	 
	@DeleteMapping("/{id}")
	public ResponseEntity<ResponseMessage> deleteAnnonce(@PathVariable Long id) {
		String message = "";
		try {
			annonceRepository.deleteById(id);
			//annonceService.deleteAnnonce(id);
			message = "Annonce supprimer avec success: ";
			return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
		} catch (Exception e) {
			message = "failed to delete " + "!";
			return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
		}
	}
	

}
