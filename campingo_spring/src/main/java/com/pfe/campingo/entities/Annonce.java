package com.pfe.campingo.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Annonce implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String Titre;

	private String Description;
	
	@Temporal(TemporalType.DATE)
	private Date date_ajout;

	private double Prix;

	@Size(max = 20)
	private String adresse;

	@Size(max = 20)
	private String phone;

	@Size(max = 300)
	private String Categorie;
	
	@Lob
	@Column(columnDefinition = "MEDIUMBLOB")
	private String imageUrl;

	@ManyToOne
	//(cascade = CascadeType.ALL)
	//@JsonBackReference
	private Utilisateur utilisateur;

	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "annonce")
	private Set<Favorie> favorie;

	public Annonce() {
	}

	public Annonce(Long id, String titre, String description, Date date_ajout, double prix, String adresse,
			String phone, String categorie, String imageUrl, Utilisateur utilisateur, Set<Favorie> favorie) {
		this.id = id;
		Titre = titre;
		Description = description;
		this.date_ajout = date_ajout;
		Prix = prix;
		this.adresse = adresse;
		this.phone = phone;
		Categorie = categorie;
		this.imageUrl = imageUrl;
		this.utilisateur = utilisateur;
		//this.favorie = favorie;
	}

//	public Set<Favorie> getFavorie() {
//		return favorie;
//	}
//
//	public void setFavorie(Set<Favorie> favorie) {
//		this.favorie = favorie;
//	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitre() {
		return Titre;
	}

	public void setTitre(String titre) {
		Titre = titre;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

	public Date getDate_ajout() {
		return date_ajout;
	}

	public void setDate_ajout(Date date) {
		this.date_ajout = date;
	}

	public double getPrix() {
		return Prix;
	}

	public void setPrix(double prix) {
		Prix = prix;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCategorie() {
		return Categorie;
	}

	public void setCategorie(String categorie) {
		Categorie = categorie;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

//	@Override
//	public String toString() {
//		return "Annonce [id=" + id + ", Titre=" + Titre + ", Description=" + Description + ", date_ajout=" + date_ajout
//				+ ", Prix=" + Prix + ", adresse=" + adresse + ", phone=" + phone + ", Categorie=" + Categorie
//				+ ", imageUrl=" + imageUrl + ", utilisateur=" + utilisateur + "]";
//	}
	

}
