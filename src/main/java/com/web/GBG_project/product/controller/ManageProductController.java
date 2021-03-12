package com.web.GBG_project.product.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.model.ProductStausBean;
import com.web.GBG_project.product.service.ProductService;

@Controller
public class ManageProductController {

	@Autowired
	ProductService service;

	// 測試用
//	@RequestMapping("/product/aaa")
//	public String tryRequestPath() {
//		return "index";
//	}

	// 管理商品
	@RequestMapping("/product/manageProducts")
	public String getManageProducts(Model model) {
		List<ProductBean> plist = service.getAllProducts();
//		int countPic=service.countPictures(pId);
		model.addAttribute("products", plist);
		return "/management_page/product/manageProducts";
	}

	// 修改商品
	@GetMapping("/product/product_update")
	public String getUpdateProduct(@RequestParam("pId") Integer pId, Model model) {
		ProductBean pb = service.getProductById(pId);
		model.addAttribute("product", pb);
		return "management_page/product/addProduct";
	}
	//修改商品
	@PostMapping("/product/product_update")
	public String updateProduct(ProductBean pb) {
		service.updateProduct(pb);
		return "redirect:../product/manageProducts";
	}

	// 新增商品
	@GetMapping("/product/addProduct")
	public String addNewProduct(Model model) {
		ProductBean pb = new ProductBean();
		ProductDetailBean pdb = new ProductDetailBean();
//		ProductPicBean ppb = new ProductPicBean();
//		pdb.setProduct_color("yellow");
//		model.addAttribute("yellow", pdb.getProduct_color());
		model.addAttribute("pdb", pdb);

//		Set<ProductDetailBean> pdbs=new  LinkedHashSet<>();
//		pdbs.add(pdb);
//		Set<ProductPicBean> ppbs=new  LinkedHashSet<>();
//		ppbs.add(ppb);
//		pb.setProductDetailBean(pdbs);
//		pb.setProductPicBean(ppbs);
		System.out.println("1111: " + pb.getProductDetailBean().getClass());
		model.addAttribute("product", pb);
		return "management_page/product/addProduct";
	}
	@PostMapping("/product/addProduct")
	public String processAddNewProductForm(@ModelAttribute("product") ProductBean pb, Model model) {
		service.addProduct(pb);
		Set<ProductDetailBean> pdbs = pb.getProductDetailBean();

		ProductDetailBean productDetail = (ProductDetailBean) model.getAttribute("productDetail");
		String ps = productDetail.getProduct_color();
		System.out.println("=======================================");
		System.out.println("color = " + ps);
		System.out.println("pdbs = " + pdbs);
		System.out.println("pdb = " + pb.getProductDetailBean());
		System.out.println("=======================================");
		return "redirect:../product/manageProducts";
	}

	// 新增商品細項
	@GetMapping("/product/addProductDetails")
	public String addProductDetails(@RequestParam("pId") Integer pId, Model model) {
		ProductBean pb = service.getProductById(pId);
		ProductDetailBean pdb = new ProductDetailBean();
		pdb.setProductBean(pb);
		model.addAttribute("product", pb);
		model.addAttribute("productDetail", pdb);

		return "management_page/product/addProductDetail";
	}

	@PostMapping("/product/addProductDetails")
	public String processProductDetail(@ModelAttribute("productDetail") ProductDetailBean pdb, Model model) {
		System.out.println("==========controller儲存pdb之前==========");
		service.addProductDetail(pdb);
		return "redirect:../product/manageProducts";
	}
	
	//修改商品細項  updateProDetail?dId
	@GetMapping("/product/updateProDetail")
	public String getUpdateProductDetail(@RequestParam("dId") Integer dId, Model model) {
		ProductDetailBean pdb=service.getProductDetailById(dId);
		model.addAttribute("productDetail", pdb);
		return "management_page/product/addProductDetail";
	}
	//修改商品細項
	@PostMapping("/product/updateProDetail")
	public String updateProductDetail(ProductBean pb) {
		service.updateProduct(pb);
		return "redirect:../product/manageProducts";
	}

	@ModelAttribute
	public void commonData(Model model) {
		List<CustomerCategoryBean> customerCategories = service.getAllCustomerCategory();
		List<ProductCategoryBean> productCategories = service.getAllProductCategory();
		List<ProductStausBean> productStausBean = service.getAllProductStatus();
		model.addAttribute("customerCategories", customerCategories);
		model.addAttribute("productCategories", productCategories);
		model.addAttribute("productStaus", productStausBean);

		// ===============以下測試===============
//		Map<String, String> categoryMap=new HashMap();
//		categoryMap.put("key", "value");
		ProductDetailBean productDetail = new ProductDetailBean();
		ProductPicBean productPic = new ProductPicBean();
		productDetail.setProduct_color("white");
		System.out.println("======================");
		System.out.println(productDetail);
		System.out.println(productDetail.getProduct_color());
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("productPic", productPic);
	}

	// 嘗試動態新增商品資料
//	@GetMapping("/Product/add")
//	public String addNewProductAction(Model model) {
//		ProductBean pb = new ProductBean();
//		ProductDetailBean pdb = new ProductDetailBean();
//		ProductPicBean ppb = new ProductPicBean();
//
//		model.addAttribute("product", pb);
//		model.addAttribute("productDetail", pdb);
//		model.addAttribute("productPic", ppb);
//		return "/management_page/product/addProduct02tryaction";
//	}

}
