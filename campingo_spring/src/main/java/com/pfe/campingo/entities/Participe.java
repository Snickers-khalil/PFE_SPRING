package com.pfe.campingo.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
@Entity
@Table(	name = "participe")
public class Participe {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Size(max = 20)
	private String firstname;
	
	@Size(max = 20)
	private String lastname;
	
	
	@Size(max = 20)
	private String nbr_gens;
	
	
	@Size(max = 20)
	private String phone;
	
	public Participe(Long id, String firstname, String lastname,
		 String nbr_gens, String phone) {
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.nbr_gens = nbr_gens;
		this.phone = phone;
		
		
	}
	public Participe() {
		
		// TODO Auto-generated constructor stub
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public String getNbr_gens() {
		return nbr_gens;
	}
	public void setNbr_gens(String nbr_gens) {
		this.nbr_gens = nbr_gens;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	
	
}

