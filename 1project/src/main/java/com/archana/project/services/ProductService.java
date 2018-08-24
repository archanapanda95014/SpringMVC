package com.archana.project.services;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.archana.project.models.Product;
import com.archana.project.repositories.ProductRepository;


@Service
public class ProductService {
	private ProductRepository productRepository;
	
	public ProductService(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}
	
	// returns all values
    public List<Product> allProducts() {
        return productRepository.findAll();
    }
	public Product createProduct(Product product){
        return productRepository.save(product);
	}
	
	public Product findProductById(Long id){
		Optional<Product> u = productRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }


	public Product update(Product e) {
		return productRepository.save(e);		
	}

	public void deleteById(Long id) {
		productRepository.deleteById(id);	
	}

	public Product update(Long id, String productName) {
		Product q = findProductById(id);
		q.setProductName(productName);
		return productRepository.save(q);	
	}

	public Product update(Long id, String productName, String prodPrice, String prodDesc, String prodCategory) {
		Product q = findProductById(id);
		q.setProductName(productName);
		BigDecimal bd = new BigDecimal(prodPrice);
		q.setProdPrice(bd);
		q.setProdDesc(prodDesc);
		q.setProdCategory(prodCategory);		
		return productRepository.save(q);
		
	}
	public List <Product> findProducts (String product) {
		return productRepository.findByProductNameContaining(product);
	}
	
	public List <Product> findPrice (BigDecimal price) {
		return productRepository.findByProdPriceLessThanEqual(price);
	}
	
	
	public List <Product> findDescription (String description) {
		return productRepository.findByProdDescContaining(description);
	}
	
	public List <Product> findJewels (String category) {
		return productRepository.findByProdCategory(category);
	}
}

