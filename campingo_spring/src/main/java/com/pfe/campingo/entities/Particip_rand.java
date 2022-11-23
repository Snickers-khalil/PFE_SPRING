package com.pfe.campingo.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Particip_rand implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	//@JsonBackReference
	//@JsonIgnore
	private Utilisateur utilisateur;

	@ManyToOne
	//@JsonIgnore
	private Randonner randonner;
	
	@Temporal(TemporalType.DATE)
	private Date date_particip;

	public Particip_rand() {
	}

	public Particip_rand(Long id, Utilisateur utilisateur, Randonner randonner, Date date_particip) {
		super();
		this.id = id;
		this.utilisateur = utilisateur;
		this.randonner = randonner;
		this.date_particip = date_particip;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public Randonner getRandonner() {
		return randonner;
	}

	public void setRandonner(Randonner randonner) {
		this.randonner = randonner;
	}

	public Date getDate_particip() {
		return date_particip;
	}

	public void setDate_particip(Date date_particip) {
		this.date_particip = date_particip;
	}

}
