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
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "Favorie")
public class Favorie implements Serializable{
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

	@ManyToOne
	@JsonBackReference
	private Utilisateur utilisateur;
	
	@ManyToOne
	private Annonce annonce;
	
	private Date date_fav;

	public Favorie() {
	}
	
	

	public Favorie(Long id, Utilisateur utilisateur, Annonce annonce, Date date_fav) {
		super();
		this.id = id;
		this.utilisateur = utilisateur;
		this.annonce = annonce;
		this.date_fav = date_fav;
	}



	public Favorie(Date date_fav) {
		this.date_fav = date_fav;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}
	public Annonce getAnnonce() {
		return annonce;
	}

	public void setAnnonce(Annonce annonce) {
		this.annonce = annonce;
	}
	


	public Date getDate_fav() {
		return date_fav;
	}

	public void setDate_fav(Date date_fav) {
		this.date_fav = date_fav;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

}
