/**
   [ UserProductController.java is the controller class with logic to receive requests and redirect response to the server. 
   It connects with the back end via the  service, repository and the  model.]
     
   @author <A HREF="mailto:panda_archana@yahoo.com]">[Archana Panda]</A>
   @version $Revision: 1.1.1.1 
   @author archanapanda
   @Created on Aug 24, 2018

**/


package com.archana.project.controllers;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.archana.project.models.Order;
import com.archana.project.models.Product;
import com.archana.project.models.User;
import com.archana.project.services.OrderService;
import com.archana.project.services.ProductService;
import com.archana.project.services.UserService;
import com.archana.project.validators.UserValidator;

@Controller
public class UserProductController {
	private final UserService userService;
	private final ProductService productService;
	private final UserValidator userValidator;
	private final OrderService orderService;
	
	
	public UserProductController(UserService userService, ProductService productService, UserValidator userValidator,OrderService orderService) {
		super();
		this.userService = userService;
		this.productService = productService;
		this.userValidator = userValidator;
		this.orderService = orderService;
	}
	@RequestMapping("/")
    public String index(@ModelAttribute("user") User user) {
        return "index.jsp";

    }
	
	@RequestMapping("/register")
    public String registerForm(@ModelAttribute("user") User user) {
		return "regLog.jsp";
	}
	
	@RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        // if result has errors, return the registration page (don't worry about validations just now)
        // else, save the user in the database, save the user id in session, and redirect them to the /home route
    	userValidator.validate(user, result);
    	 if (result.hasErrors()) {
 	        return "/index.jsp";
 	    } else {
 	    	userService.registerUser(user);
 	    	session.setAttribute("user", user);
 	    	session.setAttribute("id", user.getId());
 	    	return "redirect:/products";
 	    }
    }
	@RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session,RedirectAttributes redirectAttributes) {
        // if the user is authenticated, save their user id in session else, add error messages and return the login page
    	if(userService.authenticateUser(email,password)) {
    		User curUser = userService.findByEmail(email);
    		session.setAttribute("user", curUser);
    		if (curUser.getId()==1) {
    			return "redirect:/admin";
    		}   		
    		return "redirect:/products";
    	}
    	else {
    		redirectAttributes.addFlashAttribute("error", "Invalid credentials");
    		return "redirect:/";
    	}
    }
	@RequestMapping("/products")
    public String products(HttpSession session, Model model,@Valid @ModelAttribute("product") Product product, BindingResult result) {
        // get user from session, save them in the model and return the home page
    	List<Product> productAll = productService.allProducts();				
		model.addAttribute("productAll",productAll);
		
		if(session.getAttribute("user")!=null) {
			User suser = (User) session.getAttribute("user");
	    	model.addAttribute(suser);
		}
    	
    	return "/products.jsp";
    }
	
	@RequestMapping(value="/showProduct/{id}")
    public String showProduct(@PathVariable("id") Long id,Model model) {   	
	    Product product = productService.findProductById(id);
	    model.addAttribute("product",product);	    
	    return "prodDetail.jsp";
    }
	
	 @RequestMapping(value="/addToCart/{id}")
	    public String addToCart(@PathVariable("id") Long id,HttpSession session) {
	    	
		 if (session.getAttribute("user")==null) {
			 return "redirect:/register";
		 }
		 else {
//			 Long user_id = (Long) session.getAttribute("id");
//			 User user = userService.findUserById(user_id);
//			 System.out.println(user.getFirstName());
			 
			 	User suser = (User) session.getAttribute("user");
			    User newuser = userService.findUserById(suser.getId());	 
			    System.out.println(newuser.getFirstName());

			    Product productA = productService.findProductById(id);
			    System.out.println(productA.getProductName());
			    productA.getSelectors().add(newuser);
			    productService.update(productA);
			    
			    return "redirect:/cart/"+id;
		 }
	    	
	    }
	 @RequestMapping(value="/removeFromCart/{id}")
	    public String removeFromCart(@PathVariable("id") Long id,HttpSession session) {
	    	
		 	Long user_id = (Long) session.getAttribute("id");
	    	User suser = (User) session.getAttribute("user");
		    User newuser = userService.findUserById(suser.getId());	 
		    
		    Product productA = productService.findProductById(id);
		    productA.getSelectors().remove(newuser);
		    productService.update(productA);
		    
		    return "redirect:/cart/"+id;
	    }
	 
	//https://jqueryui.com/autocomplete/
		
		@RequestMapping (value = "/products/search", method = RequestMethod.POST)
		public String findProduct (HttpSession session, @RequestParam("input") String input,
				 @RequestParam("selection") String selection) {
			if (selection.equals("productName")) {
				List <Product> products = productService.findProducts(input);
				session.setAttribute("products", products);
				return "redirect:/products/" + input;
			}
			else if (selection.equals("prodDesc")){
				List <Product> products = productService.findDescription(input);
				session.setAttribute("products", products);
				return "redirect:/products/" + input;
			}
			else {
				BigDecimal price = new BigDecimal(input);
				List <Product> products = productService.findPrice(price);
				session.setAttribute("products", products);
				return "redirect:/products/" + input;
			}
		}
		
		@SuppressWarnings("unchecked")
		@RequestMapping("/products/{input}")
		public String artistSongs(@PathVariable("input") String input, HttpSession session, Model model) {
			List <Product> products = (List<Product>) session.getAttribute("products");
			model.addAttribute("products", products);
			return "search.jsp";
		}

	 @RequestMapping("/cart/{id}")
	    public String productWaitlisted(@PathVariable("id") Long id,HttpSession session, Model model,@Valid @ModelAttribute("product") Product product, BindingResult result) {
		 
		 User suser = (User) session.getAttribute("user");
		 User newuser = userService.findUserById(suser.getId());	
		 model.addAttribute("user", newuser);
			
		 List<Product> selectList = newuser.getShopProducts();
		 model.addAttribute("selectList",selectList);
		 
		 BigDecimal price = new BigDecimal(0);
		 BigDecimal sum = new BigDecimal(0);
		 for (int i=0;i<selectList.size();i++) {
			 price = selectList.get(i).getProdPrice();
			 sum=sum.add(price);
		 }
		 model.addAttribute("sumTotal",sum);
		 session.setAttribute("sumTotal",sum);
			 
		 return "/shoppingCart.jsp";
	    } 
	 
	 @RequestMapping("/checkout")
	 public String checkout(HttpSession session) {
		 User suser = (User) session.getAttribute("user");
		 User newuser = userService.findUserById(suser.getId());	
		 List<Product> selectList = newuser.getShopProducts();
		 
		 Date date = new Date();
		 String orderName = "OrderBy_"+newuser.getFirstName();
		 Order newOrder = orderService.createOrder(orderName, "Ordered");
		 newOrder.setOrderer(newuser);
		 newOrder.setCreatedAt(date);
		 
		 for (int i=0;i<selectList.size();i++) {
			Product productA = productService.findProductById(selectList.get(i).getId());
			productA.getBuyers().add(newuser);
			productA.getSelectors().remove(newuser);
			productService.update(productA);
			System.out.println(productA.getProductName());
			
			newOrder.getProdList().add(productA);
		    orderService.update(newOrder);

		 }		 
		 return "redirect:/productBought";
	 }
	 
	 @RequestMapping("/productBought")
	    public String productBought(HttpSession session, Model model) {
		 
		 User suser = (User) session.getAttribute("user");
		 User newuser = userService.findUserById(suser.getId());	
		 List<Product> boughtList = newuser.getBuyProducts();
		 model.addAttribute("boughtList",boughtList);
		 
		 BigDecimal sumTotal = (BigDecimal)session.getAttribute("sumTotal");
		 model.addAttribute("sumTotal",sumTotal);
		 
		 return "confirm.jsp";
	 }

	 @RequestMapping(value="/admin")
	    public String adminPage(Model model) {
		 List<Product> productAll = productService.allProducts();				
		 model.addAttribute("productAll",productAll);
		 return "admin.jsp";
	 }
	 

	@RequestMapping(value = "/admin/jewels", method = RequestMethod.POST)
    public String chooseJewels (Model model, @RequestParam("selectJewels") String selectJewels,
    		HttpSession session) {
		if (selectJewels.equals("all")) {
			return "redirect:/admin";
		}
		else {
			List<Product> selectedProducts = productService.findJewels(selectJewels);	
			session.setAttribute("selectedProducts", selectedProducts);
			return "redirect:/admin/" + selectJewels;
		}
	}
		
		@SuppressWarnings("unchecked")
		@RequestMapping(value = "admin/{jewels}")
		public String displayJewels (@PathVariable("jewels") String jewels, HttpSession session, Model model) {
			List <Product> selectedProducts = (List<Product>) session.getAttribute("selectedProducts");
			model.addAttribute("selectedProducts", selectedProducts);
			return "jeweltable.jsp";
		}
	 
	 @RequestMapping("/prodNew")
	    public String prodNew(@ModelAttribute("product") Product product) {
		 return "prodNew.jsp";
	 }
	 
	 @RequestMapping(value="/createProducts", method=RequestMethod.POST)
	    public String createProducts(@Valid @ModelAttribute("product") Product product, BindingResult result) {
	    	 if (result.hasErrors()) {
	 	        return "prodNew.jsp";
	 	    } else {
	 	    	Product q = productService.createProduct(product);    	
	 	    	return "redirect:/admin";
	 	    }	    	 
	    }
	   @RequestMapping(value="/editProduct/{id}")
	   public String editProduct(@ModelAttribute("product") Product product,@PathVariable("id") Long id,Model model) {
		   Product productA = productService.findProductById(id);
		   model.addAttribute("product",productA);
		   return "editProduct.jsp";
	   }
	   @RequestMapping(value="/updateProduct/{id}",method=RequestMethod.POST)
	   public String updateProduct(@PathVariable("id") Long id, 
			   @RequestParam(value="productName") String productName,
			   @RequestParam(value="prodPrice") String prodPrice,
			   @RequestParam(value="prodDesc") String prodDesc,
			   @RequestParam(value="prodCategory") String prodCategory
			   ) {
		   Product productA = productService.findProductById(id);
		   productService.update(id,productName,prodPrice,prodDesc,prodCategory);
		   return "redirect:/admin";
	   }
	   
	   @RequestMapping(value="/orderMgmt")
	   public String orderMgmt(Model model) {
		   List<Order> allOrders = orderService.allOrders();
		   model.addAttribute("allOrders",allOrders);
		   return "orders.jsp";
	   }
	   

	   @RequestMapping(value = "/orderMgmt/process", method = RequestMethod.POST) 
	   public String orderMgmtProcess (Model model, @RequestParam("status") String status,
	    		HttpSession session) {
		   if (status.equals("all")) {
			   return "redirect:/orderMgmt";
		   }
		   else {
			   List <Order> selectedOrders = orderService.findStatus(status);
			   session.setAttribute("selectedOrders", selectedOrders);
			   return "redirect:/orderMgmt/" + status;
		   }
	   }
	   
	   @RequestMapping ("/orderMgmt/{process}")
	   public String ordersTable (@PathVariable("process") String process, Model model) {
		   return "orderstable.jsp";
	   }
	   
	    
	
	   @RequestMapping(value="/delete/{id}")
	    public String destroy(@PathVariable("id") Long id) {
	        productService.deleteById(id);
	        return "redirect:/admin";
	    }

	    @RequestMapping("/logout")
	    public String logout(HttpSession session) {
	        // invalidate session
	        // redirect to login page
	    	session.invalidate();
	    	return "redirect:/";
	    }
	    @RequestMapping("/hindi")
	    public String hindi(@ModelAttribute("user") User user) {
	        return "hindi.jsp";
	    }
	    @RequestMapping("/korean")
	    public String korean(@ModelAttribute("user") User user) {
	        return "korean.jsp";
	    }

}
