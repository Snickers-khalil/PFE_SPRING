package com.pfe.campingo.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;


@Entity
@Table(name = "Demandes")
public class Demande implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

		@ManyToOne(cascade = CascadeType.ALL)
		@JsonBackReference
		@JsonIgnore
		private Utilisateur utilisateur;
		
		@Temporal(TemporalType.DATE)
		private Date date_demande;

		
		public Demande() {
			super();
		}
		public Demande(Long id, Utilisateur utilisateur, Date date_demande) {
			super();
			this.id = id;
			this.utilisateur = utilisateur;
			this.date_demande = date_demande;
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
		public Date getDate_demande() {
			return date_demande;
		}
		public void setDate_demande(Date date_demande) {
			this.date_demande = date_demande;
		}
		
}
