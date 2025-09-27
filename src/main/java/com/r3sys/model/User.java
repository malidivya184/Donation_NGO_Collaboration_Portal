package com.r3sys.model;

import javax.persistence.*;

@Entity
@Table(name = "user")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", role=" + role + ", email=" + email + ", password=" + password
				+ ", contact=" + contact + ", city=" + city + ", address=" + address + "]";
	}

	@Column(nullable = false)
    private String role; // admin, donor, ngo, volunteer

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String contact;

    @Column
    private String city;

    @Column
    private String address;

    // ===== Constructors =====
    public User() {
    }

    public User(String name, String role, String email, String password, String contact, String city, String address) {
        this.name = name;
        this.role = role;
        this.email = email;
        this.password = password;
        this.contact = contact;
        this.city = city;
        this.address = address;
    }

    // ===== Getters and Setters =====

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
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

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
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
}
