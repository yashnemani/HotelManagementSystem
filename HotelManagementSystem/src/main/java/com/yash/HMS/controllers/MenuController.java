package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yash.HMS.models.Menu;
import com.yash.HMS.models.Order;
import com.yash.HMS.models.OrderItem;
import com.yash.HMS.repositories.MenuRepository;
import com.yash.HMS.repositories.OrderItemRepository;
import com.yash.HMS.repositories.OrderRepository;
import com.yash.HMS.repositories.ReservationRepository;
@Controller
@RequestMapping("/menu")
public class MenuController {
	@Autowired
	private MenuRepository mrep;
	@Autowired
	private ReservationRepository rep;
	@Autowired
	private OrderRepository orep;
	@Autowired
	private OrderItemRepository irep;
	List<Menu> menuItems = new ArrayList<>();
	@RequestMapping(method=GET)
	public String menu(Model model, HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
		if(menuItems.size()>0){
			model.addAttribute("menu",menuItems);
			return "menu";
		}
		mrep.findAll().forEach((m)->menuItems.add(m));
		model.addAttribute("menu",menuItems);
		return "menu";
		}
		}
	@RequestMapping(value="/type/{action}/",method=GET)
public @ResponseBody List<Menu> menuType(@PathVariable(value="action") String type){
		List<Menu> typeItems = new ArrayList<>();
 if(type.equals("app")){
		menuItems.forEach((m)->{if(m.getType().equals("Appetizer")){typeItems.add(m);}});
	}
	else if(type.equals("main")){
		menuItems.forEach((m)->{if(m.getType().equals("Maincourse")){typeItems.add(m);}});
	}
	else if(type.equals("des")){
		menuItems.forEach((m)->{if(m.getType().equals("Dessert")){typeItems.add(m);}});
	}
	else if(type.equals("bev")){
		menuItems.forEach((m)->{if(m.getType().equals("Beverages")){typeItems.add(m);}});
	}
	return typeItems;
}
	@RequestMapping(value="/newOrder/{room}/",method=POST,consumes = "application/json")
	public String newOrder(@RequestBody List<OrderItem> items, @PathVariable("room") int room, HttpServletRequest req, Model model){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
		System.out.println(room);
		double total = items.stream().filter(i-> i.getAmount()>0).mapToDouble(i -> i.getAmount()).sum();
		items.forEach((i)->System.out.println("itemId: "+i.getI_id()+" item_qty: "+i.getQty()+" item_amt: "+i.getAmount()));
		rep.findAll().forEach((r)->{
			if(r.getRoom()==room){
				/*if(r.getStatus()=="active"){}*/
				 int id = r.getRes_id();
				 Order order = new Order();
					order.setRes_id(id);
					order.setTotal(total);
					orep.save(order);
					System.out.println("Order created..");
			}
		});
		int last_id = orep.getlastId();
		System.out.println("last id retrieved is: "+last_id);
		List<OrderItem> its = new ArrayList<>();
		its = items;
		its.forEach((i)->i.setO_id(last_id));
		its.forEach((i)->System.out.println("ID: "+i.getId()+"OrderId: "+i.getO_id()+" itemId: "+i.getI_id()+" item_qty: "+i.getQty()+" item_amt: "+i.getAmount()));
	its.forEach((i)->irep.save(i));
	return "index";}	}
}
