package com.r3sys.model;

import javax.persistence.*;

@Entity
@Table(name = "request")
public class Request {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "ngoId")
    private Ngo ngo;

    private String itemType; // e.g., "Item" or "Money"
    private String itemName;
    private int quantity_or_amount;
    private String description;
    private String status; // "pending", "approved", etc.

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    @Override
	public String toString() {
		return "Request [id=" + id + ", ngo=" + ngo + ", itemType=" + itemType + ", itemName=" + itemName
				+ ", quantity_or_amount=" + quantity_or_amount + ", description=" + description + ", status=" + status
				+ "]";
	}
	public Ngo getNgo() { return ngo; }
    public void setNgo(Ngo ngo) { this.ngo = ngo; }

    public String getItemType() { return itemType; }
    public void setItemType(String itemType) { this.itemType = itemType; }

    public String getItemName() { return itemName; }
    public void setItemName(String itemName) { this.itemName = itemName; }

    public Request(int id, Ngo ngo, String itemType, String itemName, int quantity_or_amount, String description,
			String status) {
		super();
		this.id = id;
		this.ngo = ngo;
		this.itemType = itemType;
		this.itemName = itemName;
		this.quantity_or_amount = quantity_or_amount;
		this.description = description;
		this.status = status;
	}
	public int getQuantity_or_amount() { return quantity_or_amount; }
    public void setQuantity_or_amount(int quantity_or_amount) { this.quantity_or_amount = quantity_or_amount; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
	public Request() {
		super();
		// TODO Auto-generated constructor stub
	}
}
