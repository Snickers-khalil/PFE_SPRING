package com.pfe.campingo.entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.Set;

import javax.persistence.*;

import javax.validation.constraints.Size;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "events")
public class Evennment implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Size(max = 20)
	private String title;

	private String description;

	private Date debut_event;
	private Date fin_event;
	
	@Lob
	@Column(columnDefinition = "MEDIUMBLOB")
	private String imageUrl;
	
	@ManyToOne
	@JsonBackReference
	private Utilisateur utilisateur;
	
	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.ALL, mappedBy = "evenment")
	@JsonIgnore
	private Set<Particip_event> particip_events;
	
	public Evennment() {
	}

	public Evennment(Long id, String title, String description, Date debut_event,
			Date fin_event, String imageUrl,Utilisateur utilisateur, 
			Set<Particip_event> particip_events) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.debut_event = debut_event;
		this.fin_event = fin_event;
		this.imageUrl = imageUrl;
		this.utilisateur = utilisateur;
		this.particip_events = particip_events;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getDebut_event() {
		return debut_event;
	}

	public void setDebut_event(Date debut_event) {
		this.debut_event = debut_event;
	}

	public Date getFin_event() {
		return fin_event;
	}

	public void setFin_event(Date fin_event) {
		this.fin_event = fin_event;
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

	public Set<Particip_event> getParticip_events() {
		return particip_events;
	}

	public void setParticip_events(Set<Particip_event> particip_events) {
		this.particip_events = particip_events;
	}

}
