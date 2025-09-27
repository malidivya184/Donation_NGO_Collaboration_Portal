package com.r3sys.model;

import javax.persistence.*;

@Entity
@Table(name = "donor")
public class Donor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String name;
    private String contact;
    private String email;
    private String password;
    private String city;
    private String address;

    // ✅ No-arg constructor
    public Donor() {}

    // ✅ Constructor with all fields
    public Donor(Integer id, String name, String contact, String email, String password, String city, String address) {
        this.id = id;
        this.name = name;
        this.contact = contact;
        this.email = email;
        this.password = password;
        this.city = city;
        this.address = address;
    }

    // ✅ Getters and Setters with correct Integer usage
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Donor [id=" + id + ", name=" + name + ", contact=" + contact + ", email=" + email
                + ", password=" + password + ", city=" + city + ", address=" + address + "]";
    }
}
