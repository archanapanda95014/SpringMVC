package com.archana.project.models;

import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;


@Entity
@Table(name="users")

public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id;
	@Size(min=3,message="First Name must be greater than 2 characters")
	private String firstName;
	@Size(min=3,max=50,message="Last name must be greater than 2 characters")
	private String lastName;
	@Size(min=1, message="Email cannot be blank")
	@Email(message="Email must be valid")
	private String email;
	@Size(min=1,message="Location cannot be blank")
	private String location;
	@Size(min=1,message="State cannot be blank")
	private String state;
	@Size(min=2, message="Password must be greater than 2 characters")
	private String password;
	@Transient
	private String passwordConfirmation;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
		
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "selectors_products",
		joinColumns = @JoinColumn(name="user_id"),
		inverseJoinColumns = @JoinColumn(name = "product_id")
		)
	private List<Product> shopProducts;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "buyers_products",
		joinColumns = @JoinColumn(name="user_id"),
		inverseJoinColumns = @JoinColumn(name = "product_id")
		)
	private List<Product> buyProducts;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "wishListers_products",
		joinColumns = @JoinColumn(name="user_id"),
		inverseJoinColumns = @JoinColumn(name = "product_id")
		)
	private List<Product> wishProducts;
		
	@OneToMany(mappedBy="orderer", fetch = FetchType.LAZY)
	private List<Order> orderList;
    
	
	public User() {

	}

	public User(String firstName,String lastName,String email,String location,String state,String password) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.location = location;
		this.state = state;
		this.password = password;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }


	public List<Product> getWishProducts() {
		return wishProducts;
	}

	public void setWishProducts(Product prod) {
		this.wishProducts.add(prod);
	}

	public List<Product> getBuyProducts() {
		return buyProducts;
	}

	public void setBuyProducts(List<Product> buyProducts) {
		this.buyProducts = buyProducts;
	}

	public List<Product> getShopProducts() {
		return shopProducts;
	}

	public void setShopProducts(List<Product> shopProducts) {
		this.shopProducts = shopProducts;
	}

	public void setWishProducts(List<Product> wishProducts) {
		this.wishProducts = wishProducts;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

}



