package com.example.demo;

import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.lang.reflect.Type;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@RestController
@RequestMapping("api")
public class Webservices {
    List<Contact> contacts = readFromJSON();

    @GetMapping(value = "/contacts")
    List<Contact> getContacts() {
        return contacts;
    }

    @GetMapping(value = "/contact/{id}")
    Contact getContact(@PathVariable int id) {
        Contact contact = null;
        for(int i = 0; i<contacts.size()-1; i++){
            if(id == contacts.get(i).getId()){
                contact = contacts.get(i);
            }
        }
        return contact;
    }

    @PostMapping(value = "/contacts", consumes = "application/json")
    List<Contact> newContact(@RequestBody Contact contact) {
        int lastId = 0;
        System.out.println("test");
        int maxId = 0;
        for(int i = 0; i<=contacts.size()-1; i++){
            lastId = contacts.get(i).getId();
            if(lastId > maxId){
                maxId = lastId;
            }
        }
        lastId += 1;
        contact.setId(lastId);
        contacts.add(contact);
        writeToJSON(contacts);
        return contacts;
    }

    @DeleteMapping(value="/contact/{id}")
    ResponseEntity<List<Contact>> deleteContact(@PathVariable int id) {
        boolean contactDeleted = false;
        for(int i = 0; i<contacts.size(); i++){
            if(id == contacts.get(i).getId()){
                contacts.remove(contacts.get(i));
                writeToJSON(contacts);
                contactDeleted = true;
            }
        }
        if (!contactDeleted) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @PutMapping(value="/contact/{id}")
    ResponseEntity<List<Contact>> editContact(@RequestBody Contact contact, @PathVariable int id) {
        boolean contactEdited = false;
        for(int i = 0; i<contacts.size(); i++){
            if(id == contacts.get(i).getId()){
                contacts.set(i, contact);
                writeToJSON(contacts);
                contactEdited = true;
            }
        }
        if (!contactEdited) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
    
    private void writeToJSON(List<Contact> contacts) {
        try {
            FileWriter file = new FileWriter("contacts.json");
            new Gson().toJson(contacts, file);
            file.close();
        }
        catch (Exception ex ) {
            System.out.println("Erreur écriture du fichier:"+ex.getMessage());
            ex.printStackTrace();
        }
        }

    private List<Contact> readFromJSON() {
        Type listType = new TypeToken<ArrayList<Contact>>(){}.getType();
        try {
            return new Gson().fromJson(new FileReader("contacts.json"),
            listType);
        } catch (Exception ex ) {
            System.out.println("Erreur lecture du fichier:"+ex.getMessage());
            ex.printStackTrace();
            return new ArrayList<>();
            }
        }

}
