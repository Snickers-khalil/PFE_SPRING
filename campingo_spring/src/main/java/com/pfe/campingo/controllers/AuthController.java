package com.pfe.campingo.controllers;

import java.util.*;
import java.util.stream.Collectors;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.pfe.campingo.entities.ERole;
import com.pfe.campingo.entities.Role;
import com.pfe.campingo.entities.Utilisateur;
import com.pfe.campingo.message.ResponseMessage;
import com.pfe.campingo.payload.request.LoginRequest;
import com.pfe.campingo.payload.request.RegisterRequest;
import com.pfe.campingo.payload.response.JwtResponse;
import com.pfe.campingo.payload.response.MessageResponse;
import com.pfe.campingo.repository.RoleRepository;
import com.pfe.campingo.repository.UserRepository;
import com.pfe.campingo.security.jwt.JwtUtils;
import com.pfe.campingo.security.services.UserDetailsImpl;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/auth")
public class AuthController {
	@Autowired
	AuthenticationManager authenticationManager;

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	PasswordEncoder encoder;

	@Autowired
	JwtUtils jwtUtils;

	@PostMapping("/login")
	public ResponseEntity<?> authenticateUser(@Valid @RequestBody LoginRequest loginRequest) {
		
	Authentication authentication = authenticationManager.authenticate(
		new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

		SecurityContextHolder.getContext().setAuthentication(authentication);
		String jwt = jwtUtils.generateJwtToken(authentication);
		
		UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();		
		List<String> roles = userDetails.getAuthorities().stream()
				.map(item -> item.getAuthority())
				.collect(Collectors.toList());

		return ResponseEntity.ok(new JwtResponse(jwt, 
												 userDetails.getId(), 
												 userDetails.getFirstname(),
												 userDetails.getLastname(), 
												 userDetails.getUsername(), 
												 userDetails.getEmail(), 
												 userDetails.getCity(), 
												 userDetails.getPhone(),
												 roles,
												 userDetails.getImageUrl() ));
	}
	 @PutMapping(value="/updatePhoto/{iduser}")
	  public ResponseEntity<?> ModifierUserPhoto(@PathVariable("iduser")Long id ,
			  									 @RequestParam("file") MultipartFile file ) {
		  Utilisateur user = new Utilisateur();
		  user = userRepository.findById(id).get();
		  String fileName = StringUtils.cleanPath(file.getOriginalFilename());
			String message = "";
			if(fileName.contains(".."))
			{
				System.out.println("not a a valid file");
			}
			try {
				user.setImageUrl(Base64.getEncoder().encodeToString(file.getBytes()));
				message = "User Photo Modifier successfully! " + file.getOriginalFilename();
				userRepository.save(user);
				return ResponseEntity.status(HttpStatus.OK).body(new ResponseMessage(message));
			} catch (Exception e) {
				message = "Could not upload the Photo: " + file.getOriginalFilename() + "!";
				return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
			}
		}
			
	@PostMapping("/register")
	public ResponseEntity<?> registerUser(@Valid @RequestBody RegisterRequest registerRequest) {
		if (userRepository.existsByUsername(registerRequest.getUsername())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse("Error: Username is already taken!"));
		}

		if (userRepository.existsByEmail(registerRequest.getEmail())) {
			return ResponseEntity
					.badRequest()
					.body(new MessageResponse("Error: Email is already in use!"));
		}

		// Create new user's account
		Utilisateur user = new Utilisateur( 
				registerRequest.getFirstname(),
				registerRequest.getLastname(),
				registerRequest.getUsername(),
				registerRequest.getEmail(),
				registerRequest.getCity(),
				registerRequest.getPhone(),
				registerRequest.getImageUrl(),
				encoder.encode(registerRequest.getPassword())
							 			 );
		Set<String> strRoles = registerRequest.getRole();
		Set<Role> roles = new HashSet<>();
		
		if (strRoles == null) {
			Role userRole = roleRepository.findByName(ERole.USER)
					.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
			roles.add(userRole);
		} else {
			strRoles.forEach(role -> {
				switch (role) {
				case "admin":
					Role adminRole = roleRepository.findByName(ERole.ADMIN)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(adminRole);
					
					break;
				case "rand":
					Role randRole = roleRepository.findByName(ERole.RANDONNEUR)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(randRole);

					break; 
				default:
					Role userRole = roleRepository.findByName(ERole.USER)
							.orElseThrow(() -> new RuntimeException("Error: Role is not found."));
					roles.add(userRole);
				}
			}); 
		}

		user.setRoles(roles);
		userRepository.save(user);
		return ResponseEntity.ok(new MessageResponse("User registered successfully!"));
	}
	
}
