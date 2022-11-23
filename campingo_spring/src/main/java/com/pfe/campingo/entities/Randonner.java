package com.pfe.campingo.entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

import javax.persistence.*;

import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "rand")

public class Randonner implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

//	@Size(max = 100)
	private String adress;
	private String programme;
	private String cercuit;
	private String difficult;
	private Date date;
	@Lob
	@Column(columnDefinition = "MEDIUMBLOB")
	private String imageUrl;

	@ManyToOne
	@JsonBackReference
	private Utilisateur utilisateur;

	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "randonner")
	@JsonIgnore
	private Set<Particip_rand> particip_rands;
	
	public Randonner() {
	}

	public Randonner(Long id, String adress, String programme, String cercuit, String difficult, Date date,
			String imageUrl, Utilisateur utilisateur,Set<Particip_rand> particip_rands) {
		this.id = id;
		this.adress = adress;
		this.programme = programme;
		this.cercuit = cercuit;
		this.difficult = difficult;
		this.date = date;
		this.imageUrl = imageUrl;
		this.utilisateur = utilisateur;
		this.particip_rands = particip_rands;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getProgramme() {
		return programme;
	}

	public void setProgramme(String programme) {
		this.programme = programme;
	}

	public String getCercuit() {
		return cercuit;
	}

	public void setCercuit(String cercuit) {
		this.cercuit = cercuit;
	}

	public String getDifficult() {
		return difficult;
	}

	public void setDifficult(String difficult) {
		this.difficult = difficult;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Utilisateur getUtilisateur() {
		return utilisateur;
	}

	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

	public Set<Particip_rand> getParticip_rands() {
		return particip_rands;
	}

	public void setParticip_rands(Set<Particip_rand> particip_rands) {
		this.particip_rands = particip_rands;
	}

}
