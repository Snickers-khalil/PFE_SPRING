package com.pfe.campingo.entities;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "users", uniqueConstraints = { @UniqueConstraint(columnNames = "username"),
		@UniqueConstraint(columnNames = "email") })
public class Utilisateur {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(max = 20)
	private String firstname;

	@Size(max = 20)
	private String lastname;

	@NotBlank
	@Size(max = 20)
	private String username;

	@NotBlank
	@Size(max = 50)
	@Email
	private String email;

	@NotBlank
	@Size(max = 120)
	private String password;

	@NotBlank
	@Size(max = 30)
	private String city;

	@NotBlank
	@Size(max = 20)
	private String phone;

//	@OneToMany(fetch= FetchType.EAGER,cascade = CascadeType.ALL ,
//			mappedBy="utilisateur")
//	private List<Annonce> annances;

	@OneToMany(mappedBy = "utilisateur")
	private List<Annonce> annances;
	
	@OneToMany(mappedBy="utilisateur")
	//@JsonIgnore
	private Set<Evennment> evenements;
	
	@OneToMany(mappedBy="utilisateur")
	//@JsonIgnore
	private Set<Randonner> randonners;
	
	@OneToMany(mappedBy = "utilisateur")
	private List<Message> message;
	
	@OneToMany(fetch = FetchType.EAGER,cascade = {CascadeType.REMOVE }, mappedBy = "utilisateur")
	private List<Demande> demande;
	
	@OneToMany(cascade = { CascadeType.ALL, CascadeType.MERGE,
			CascadeType.REMOVE }, mappedBy = "utilisateur")
	private Set<Favorie> favorie;

	@OneToMany(cascade = { CascadeType.ALL, CascadeType.MERGE,
			CascadeType.REMOVE }, mappedBy = "utilisateur")
	//@JsonIgnore
	private Set<Particip_event> particip_events;

	 @OneToMany(cascade = { CascadeType.ALL, CascadeType.MERGE,
				CascadeType.REMOVE }, mappedBy = "utilisateur")
	 private Set<Particip_rand> particip_rands;
	 
//	@OneToMany(fetch = FetchType.EAGER, mappedBy = "utilisateur",cascade = { CascadeType.PERSIST, CascadeType.MERGE,
//			CascadeType.REMOVE })
//	private Set<Favorie> favorie;

	
	@Lob
	@Column(columnDefinition = "MEDIUMBLOB")
	private String imageUrl;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))

	private Set<Role> roles = new HashSet<>();

	public Utilisateur() {
	}

	public Utilisateur(String username, String email, String password) {
		this.username = username;
		this.email = email;
		this.password = password;
	}

	public Utilisateur(String firstname, String lastname, String username, String email, String city, String phone,
			String imageUrl, String password) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.email = email;
		this.password = password;
		this.city = city;
		this.phone = phone;
		this.imageUrl = imageUrl;
	}

	public Utilisateur(String firstname, String lastname, String username, String email, String password, String city,
			String phone, List<Annonce> annances, Set<Favorie> favorie, String imageUrl, Set<Evennment> evennments,
			Set<Randonner> randonners, Set<Particip_event> particip_events, List<Message> message,List<Demande> demande) {

		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.email = email;
		this.password = password;
		this.city = city;
		this.phone = phone;
//		this.annances = annances;
//		this.evenements = evennments;
//		this.randonners = randonners;
		this.favorie = favorie;
		this.message = message;
		this.demande = demande;
		this.imageUrl = imageUrl;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	@Override
	public String toString() {
		return "Utilisateur [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", username="
				+ username + ", email=" + email + ", password=" + password + ", city=" + city + ", phone=" + phone
				+ ", annances=" + annances + ", message=" + message + ", favorie=" + favorie + ", imageUrl=" + imageUrl
				+ ", roles=" + roles + "]";
	}

	

}
