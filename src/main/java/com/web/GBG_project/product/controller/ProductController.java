package com.web.GBG_project.product.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCommentBean;
import com.web.GBG_project.product.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService service;
	
	@RequestMapping("/queryByCategory")
	public String getCustomerCategoryList(Model model) {
		List<String> cclist=service.getAllCustomerCategory();
		List<ProductBean> plist=service.getAllProducts();
		model.addAttribute("customerCategoryList", cclist);
		model.addAttribute("products", plist);
		return "queryByCustomerCategory";
	}
	
	@RequestMapping("/customerCategory/${customerCategory}")
	public String getProductCategoryList(@PathVariable("customerCategory") String customerCategory, Model model) {
//		List<Integer> id=service.getCustomerCategoryIdByCustomerCategoryName(customerCategory);
		List<String> pclist=service.getAllProductCategory();  //待修正
		List<ProductBean> plist=service.getProductsByProductCategory(customerCategory);
		model.addAttribute("productCategoryList", pclist);
		model.addAttribute("products", plist);
		return "queryByProductCategorys.jsp";
	}
	
	@RequestMapping("/product")
	public String getProductsById(@RequestParam("product_id") Integer id, Model model) {
		List<String> pdslist=service.getProductDetailSizeByProductId(id);
		model.addAttribute("product", service.getProductById(id));
		model.addAttribute("productDetailSize", pdslist);
		return "product";
	}
	
	//管理商品
	@RequestMapping("/manageProducts")
	public String getManageProducts(Model model) {
		List<ProductBean> plist=service.getAllProducts();
//		int totalStock=service.getProductTotalStockByProductId();
		model.addAttribute("products", plist);
		return "manageProducts";
	}
	
	//新增商品
//	@GetMapping("/products/add")
//	public String getAddNewProductForm(Model model) {
//		BookBean bb=new BookBean();
//		model.addAttribute("bookBean", bb);
//		return "addProduct";
//	}
	
	//新增評論
	@GetMapping("/comments/add")
	public String getAddNewCommentForm(Model model) {
		ProductCommentBean pcb=new ProductCommentBean();
		model.addAttribute("productCommentBean", pcb);
		return "addComment";
	}
	
	@PostMapping("/comments/add")
	public String processAddNewProductForm(@ModelAttribute("productCommentBean") ProductCommentBean pcb) {
		service.addProductComment(pcb);
		return "redirect:/product";		//待修改
	}
	
}
