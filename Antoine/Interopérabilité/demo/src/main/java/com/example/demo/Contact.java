package com.example.demo;

import java.util.ArrayList;
import java.util.List;

public class Contact {
    
    private String nom;
    private String prenom;
    private int annee;
    private int id;

    public Contact(){
    }
    
    public String getNom() {
        return this.nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return this.prenom;
    }
    
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public int getAnnee() {
        return this.annee;
    }

    public void setAnnee(int annee) {
        this.annee = annee;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString(){
        return this.getNom()+" "+this.getPrenom()+" "+this.getAnnee()+ " "+this.getId();
    }
}
