package com.pfe.campingo.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity(name = "messages")
public class Message implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idMessage;
	private String contenu;
	@Temporal(TemporalType.DATE)
	private Date date_post;
	@ManyToOne
	// @JsonBackReference
	private Utilisateur utilisateur;

	public Message() {
		super();
	}

	

	public Message(Long idMessage, String contenu, Date date_post, Utilisateur utilisateur) {
		super();
		this.idMessage = idMessage;
		this.contenu = contenu;
		this.date_post = date_post;
		this.utilisateur = utilisateur;
	}



	public Long getIdMessage() {
		return idMessage;
	}

	public void setIdMessage(Long idMessage) {
		this.idMessage = idMessage;
	}


	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}



	public Date getDate_post() {
		return date_post;
	}



	public void setDate_post(Date date_post) {
		this.date_post = date_post;
	}

}
