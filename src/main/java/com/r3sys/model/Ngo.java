package com.r3sys.model;

import javax.persistence.*;

@Entity
@Table(name = "ngo")
public class Ngo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String email;
    private String contact;
    private String city;
    private String address;
    private String password;
    // Status: pending / approved / rejected
    private String status;

    // ===== Constructors =====
    public Ngo() {}

    public Ngo(String name, String email, String contact, String city, String address, String status, String password) {
        this.name = name;
        this.email = email;
        this.contact = contact;
        this.city = city;
        this.address = address;
        this.password=password;
        this.status = status;
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

    public String getStatus() {
        return status;
    }

    @Override
	public String toString() {
		return "Ngo [id=" + id + ", name=" + name + ", email=" + email + ", contact=" + contact + ", city=" + city
				+ ", address=" + address + ", password=" + password + ", status=" + status + "]";
	}

	public Ngo(int id, String name, String email, String contact, String city, String address, String password,
			String status) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.contact = contact;
		this.city = city;
		this.address = address;
		this.password = password;
		this.status = status;
	}

	public void setStatus(String status) {
        this.status = status;
    }
}
