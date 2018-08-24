package com.archana.project.models;

import java.math.BigDecimal;
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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Size;


@Entity
@Table(name="products")
public class Product {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id;
	@Size(min=3,message="Product name must be greater than 3 characters")
	private String productName;
	private BigDecimal prodPrice;
	@Size(min=3,message="Product description must be greater than 3 characters")
	private String prodDesc;
	private String prodImg;
	@Size(min=3,message="Product category must be greater than 3 characters")
	private String prodCategory;
	private int prodQtyInStock;
	private int prodQtySold;
	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;
	
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "selectors_products",
		joinColumns = @JoinColumn(name="product_id"),
		inverseJoinColumns = @JoinColumn(name = "user_id")
		)
	private List<User> selectors;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "buyers_products",
		joinColumns = @JoinColumn(name="product_id"),
		inverseJoinColumns = @JoinColumn(name = "user_id")
		)
	private List<User> buyers;
	
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "wishListers_products",
		joinColumns = @JoinColumn(name="product_id"),
		inverseJoinColumns = @JoinColumn(name = "user_id")
		)
	private List<User> wishListers;
	
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
		name = "orders_products",
		joinColumns = @JoinColumn(name="product_id"),
		inverseJoinColumns = @JoinColumn(name = "order_id")
		)
	private List<Order> orderList;
	
	
	public Product() {

	}

	public Product(String productName,BigDecimal prodPrice, String prodDesc, String prodCategory) {
		super();
		this.productName = productName;
		this.prodPrice = prodPrice;
		this.prodDesc = prodDesc;
		this.prodCategory = prodCategory;
	}

	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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
	public boolean didYouLike(List<User> users, User user) {
		for(int i=0;i<users.size();i++) {
			if(users.get(i).equals(user)) {
				return false;
			}			
		}
		return true;
	}

	public String getProdDesc() {
		return prodDesc;
	}

	public void setProdDesc(String prodDesc) {
		this.prodDesc = prodDesc;
	}

	public String getProdImg() {
		return prodImg;
	}

	public void setProdImg(String prodImg) {
		this.prodImg = prodImg;
	}

	public List<User> getBuyers() {
		return buyers;
	}

	public void setBuyers(List<User> buyers) {
		this.buyers = buyers;
	}

	public BigDecimal getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(BigDecimal prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getProdCategory() {
		return prodCategory;
	}

	public void setProdCategory(String prodCategory) {
		this.prodCategory = prodCategory;
	}

	public List<User> getSelectors() {
		return selectors;
	}

	public void setSelectors(List<User> selectors) {
		this.selectors = selectors;
	}

	public List<User> getWishListers() {
		return wishListers;
	}

	public void setWishListers(List<User> wishListers) {
		this.wishListers = wishListers;
	}

	public int getProdQtyInStock() {
		return prodQtyInStock;
	}

	public void setProdQtyInStock(int prodQtyInStock) {
		this.prodQtyInStock = prodQtyInStock;
	}

	public int getProdQtySold() {
		return prodQtySold;
	}

	public void setProdQtySold(int prodQtySold) {
		this.prodQtySold = prodQtySold;
	}

	public List<Order> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}

}


