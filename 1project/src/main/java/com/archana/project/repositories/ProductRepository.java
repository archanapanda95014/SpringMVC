package com.archana.project.repositories;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.archana.project.models.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{
	List<Product> findAll();   
    Optional<Product> findById(Long id);
    List <Product> findByProductNameContaining (String product);
	List <Product> findByProdPriceLessThanEqual (BigDecimal price);
	List <Product> findByProdDescContaining (String description);
	List <Product> findByProdCategory(String category);

}