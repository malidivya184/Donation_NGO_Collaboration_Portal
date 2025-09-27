package com.r3sys.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "donation")
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "donorId")
    private Donor donor;

    @ManyToOne
    @JoinColumn(name = "ngoId") // 🔧 Foreign key to track which NGO receives the donation
    private Ngo ngo;

    private String itemType; // "Item" or "Money"

    private String itemName;

    private double quantity_or_amount;
    @Temporal(TemporalType.DATE)
    @Column(name = "donated_on")
    private Date donatedOn;
    public Date getDonatedOn() {
		return donatedOn;
	}
	public void setDonatedOn(Date donatedOn) {
		this.donatedOn = donatedOn;
	}
	private String status; // e.g., "pending", "completed"

    // --- Getters and Setters ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public Donor getDonor() { return donor; }
    public void setDonor(Donor donor) { this.donor = donor; }

    public Ngo getNgo() { return ngo; }
    public void setNgo(Ngo ngo) { this.ngo = ngo; }

    public String getItemType() { return itemType; }
    public void setItemType(String itemType) { this.itemType = itemType; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public Donation(int id, Donor donor, Ngo ngo, String itemType, String itemName, double quantity_or_amount,
			Date donatedOn, String status) {
		super();
		this.id = id;
		this.donor = donor;
		this.ngo = ngo;
		this.itemType = itemType;
		this.itemName = itemName;
		this.quantity_or_amount = quantity_or_amount;
		this.donatedOn = donatedOn;
		this.status = status;
	}
	public double getQuantity_or_amount() { return quantity_or_amount; }
   
	public Donation() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setQuantity_or_amount(double quantity_or_amount) { this.quantity_or_amount = quantity_or_amount; }

   
    @Override
	public String toString() {
		return "Donation [id=" + id + ", donor=" + donor + ", ngo=" + ngo + ", itemType=" + itemType + ", itemName="
				+ itemName + ", quantity_or_amount=" + quantity_or_amount + ", donatedOn=" + donatedOn + ", status="
				+ status + "]";
	}
	public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
