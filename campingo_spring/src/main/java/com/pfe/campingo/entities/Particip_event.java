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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Particip_event implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@ManyToOne
	//@JsonBackReference
	private Utilisateur utilisateur;

	@ManyToOne
	//@JsonIgnore
	private Evennment evenment;
	
	@Temporal(TemporalType.DATE)
	private Date date_particip;

	public Particip_event() {
	}
 
	public Particip_event(Long id, Utilisateur utilisateur, Evennment evenment, Date date_particip) {
		super();
		this.id = id;
		this.utilisateur = utilisateur;
		this.evenment = evenment;
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

	public Evennment getEvenment() {
		return evenment;
	}

	public void setEvenment(Evennment evenment) {
		this.evenment = evenment;
	}

	public Date getDate_particip() {
		return date_particip;
	}

	public void setDate_particip(Date date_particip) {
		this.date_particip = date_particip;
	}

	@Override
	public String toString() {
		return "Particip_event [id=" + id + ", utilisateur=" + utilisateur + ", evenment=" + evenment
				+ ", date_particip=" + date_particip + "]";
	}

}
