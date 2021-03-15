package com.web.GBG_project.shoppingCart.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.service.ProductService;

@Controller
@SessionAttributes({ "LoginOK", "ShoppingCart"})
public class ShoppingCartController {
	
	@Autowired
	ProductService service;
	
	//新增商品進購物車
	@SuppressWarnings("unchecked")
	@GetMapping(value = "addProduct", params = {"productFormatId", "productId", "productCount"})
	public String addProduct(
				@RequestParam("productFormat") Integer productFormatId,
				@RequestParam("productId") Integer ProductId,
				@RequestParam("productCount") Integer productCount,
				Model model
			) {
		Map<Integer, List<Integer>> shoppingCart = (Map<Integer, List<Integer>>) model.getAttribute("ShoppingCart");
		List<Integer> productFormat = new LinkedList<Integer>();
		if (shoppingCart == null) {
			shoppingCart = new HashMap<Integer, List<Integer>>();
			productFormat.add(ProductId);
			productFormat.add(productCount);
			shoppingCart.put(productFormatId, productFormat);
		} else {
			productFormat.add(ProductId);
			productFormat.add(productCount);
			shoppingCart.put(productFormatId, productFormat);
		}
		model.addAttribute("ShoppingCart", shoppingCart);
		return "ShoppingCart";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "deleteProduct", params = {"productFormatId"})
	public String deleteProduct(
				@RequestParam("productFormatId") Integer productFormatId,
				Model model
			) {
		Map<Integer, List<Integer>> shoppingCart = (Map<Integer, List<Integer>>) model.getAttribute("ShoppingCart");
		shoppingCart.remove(productFormatId);
		model.addAttribute("ShoppingCart", shoppingCart);
		return "ShoppingCart";
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "updateProduct", params = {"productId", "productFormatId","productCount"})
	public String updateProduct() {
		
		return "ShoppingCart";
	}
	
	//將頁面轉跳至shoppingCart.jsp
	@GetMapping("shoppingCart")
	public String shoppingCartContent(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		//如果未登入會員轉跳至登入頁面
		if (member == null) {
			return "member/login";
		}
		return "ShoppingCart";
	}
}
