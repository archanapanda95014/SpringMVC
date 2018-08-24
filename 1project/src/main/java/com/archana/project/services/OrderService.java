package com.archana.project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.archana.project.models.Order;
import com.archana.project.repositories.OrderRepository;

@Service
public class OrderService {
	private final OrderRepository orderRepository;

	public OrderService(OrderRepository orderRepository) {
		super();
		this.orderRepository = orderRepository;
	}
	
	// returns all values
    public List<Order> allOrders() {
        return orderRepository.findAll();
    }
	public Order createOrder(Order order){
        return orderRepository.save(order);
	}
	
	public Order findOrderById(Long id){
		Optional<Order> u = orderRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }

	public Order update(Order e) {
		return orderRepository.save(e);		
	}

	public void deleteById(Long id) {
		orderRepository.deleteById(id);	
	}

	public Order update(Long id, String orderName) {
		Order q = findOrderById(id);
		q.setOrderName(orderName);
		return orderRepository.save(q);	
	}

	public Order createOrder(String orderName, String string) {
		Order o = new Order(orderName,string);
		return orderRepository.save(o);		
	}
	public List<Order>  findStatus(String status){
		return orderRepository.findByOrderStatus(status);
	}

}
