package com.web.GBG_project.product.controller;

import java.io.IOException;
import java.sql.Blob;
import java.util.List;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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

	// 測試用 /GBG_project_mvc/product/manageProducts
//	@RequestMapping("/manageProducts")
//	public String tryRequestPath1() {
//		System.out.println("===================1===================");
//		return "index";
//	}
//	@RequestMapping("/product/manageProducts2")
//	public String tryRequestPath2() {
//		return "index";
//	}
//	@RequestMapping("/GBG_project_mvc/manageProducts")
//	public String tryRequestPath3() {
//		System.out.println("===================3===================");
//		return "index";
//	}

	// 管理商品
	@RequestMapping("/product/manageProducts")
//	@RequestMapping("/manageProducts")
	public String getManageProducts(Model model) {
		System.out.println("===================2===================");
		List<ProductBean> plist = service.getAllProducts();
//		int countPic=service.countPictures(pId);
		model.addAttribute("products", plist);
		return "/management_page/product/manageProducts";
	}
	//商品細項頁
	@RequestMapping("/product/manageProductInfo")
	public String getManageProductInfo(@RequestParam("pId") Integer pId, Model model) {
		List<Integer> pictureId=service.getProductPictureId(pId);
		model.addAttribute("pictures", pictureId);
		model.addAttribute("product", service.getProductById(pId));

		return "/management_page/product/manageProductInfo";
	}
//	商品篩選條件
	@PostMapping(value = "/product/productFilterCondition", params = { "statusId","customerCategoryId","sortValue"})
	public String listProductByCondition(Model model, 
			@RequestParam(value = "statusId") int statusId,
			@RequestParam(value = "customerCategoryId") int customerCategoryId,
			@RequestParam(value = "sortValue") int sortValue
			) {
		String path="";
		System.out.println("customerCategoryId="+customerCategoryId+",statusId="+statusId+",sortValue="+sortValue);
		if(statusId==-1&customerCategoryId==-1&sortValue==-1) {
			path="redirect:/product/manageProducts";
		}else{
			List<ProductBean> plist=service.listProductByCondition( customerCategoryId, statusId, sortValue);
			model.addAttribute("products", plist);
			path="/management_page/product/manageProducts";
		}
		return path;
	}
	//修改多項商品上下架狀態 updateProductsStatus
	@PostMapping("/product/updateProductsStatus")
	public String updateProductsStatus(
			@RequestParam(value = "productId", required = false) int[] productId,
			@RequestParam(value = "statusId", required = false) int statusId,
			Model model) {
		if(productId!=null&statusId!=0) {
			for(int n=0;n<productId.length;n++) {
				System.out.println(productId[n]+",");
				service.updateProductStatus(productId[n], statusId);
			}
		}
		return "redirect:/product/manageProducts";
	}
	// 修改商品
	@GetMapping("/product/product_update")
	public String getUpdateProduct(@RequestParam("pId") Integer pId, Model model) {
		ProductBean pb = service.getProductById(pId);
//		List<CustomerCategoryBean> customerCategories = service.getAllCustomerCategory();
//		ProductBean pb = service.selectProductById(pId);
		model.addAttribute("product", pb);
//		model.addAttribute("customerCategories", customerCategories);
		return "management_page/product/addProduct";
	}
	//修改商品
	@PostMapping("/product/product_update")
	public String updateProduct(@ModelAttribute("product")ProductBean pb) {
		service.updateProduct(pb);
		return "redirect:/product/manageProducts";
	}

	// 新增商品
	@GetMapping("/product/addProduct")
	public String addNewProduct(Model model) {
		ProductBean pb = new ProductBean();
		ProductDetailBean pdb = new ProductDetailBean();
		model.addAttribute("pdb", pdb);
		model.addAttribute("product", pb);
		return "management_page/product/addProduct";
	}
	@PostMapping("/addProduct")
	public String processAddNewProductForm(@ModelAttribute("product") ProductBean pb, Model model) {
		service.addProduct(pb);
//		Set<ProductDetailBean> pdbs = pb.getProductDetailBean();

//		ProductDetailBean productDetail = (ProductDetailBean) model.getAttribute("productDetail");
//		String ps = productDetail.getProduct_color();
//		System.out.println("=======================================");
//		System.out.println("color = " + ps);
//		System.out.println("pdbs = " + pdbs);
//		System.out.println("pdb = " + pb.getProductDetailBean());
//		System.out.println("=======================================");
		return "redirect:../product/manageProducts";  //回到管理商品頁
	}

	// 新增商品細項
	@GetMapping("/addProductDetails")
	public String addProductDetails(@RequestParam("pId") Integer pId, Model model) {
		ProductBean pb = service.getProductById(pId);
		ProductDetailBean pdb = new ProductDetailBean();
		pdb.setProductBean(pb);
		model.addAttribute("product", pb);
		model.addAttribute("productDetail", pdb);

		return "management_page/product/addProductDetail";
	}
	@PostMapping("/addProductDetails")
	public String processProductDetail(@ModelAttribute("productDetail") ProductDetailBean pdb, Model model) {
		System.out.println("==========controller儲存pdb之前==========");
		service.addProductDetail(pdb);
		return "redirect:/product/manageProducts";  //回到管理商品頁
	}
	
	//修改商品細項
	@GetMapping("/updateProDetail")
	public String getUpdateProductDetail(@RequestParam("dId") Integer dId, Model model) {
		ProductDetailBean pdb=service.getProductDetailById(dId);
		model.addAttribute("productDetail", pdb);
		return "management_page/product/addProductDetail";
	}
	//修改商品細項
	@PostMapping("/updateProDetail")
	public String updateProductDetail(@ModelAttribute("productDetail")ProductDetailBean productDetail, Model model) {
		service.updateProductDetail(productDetail);
//		String path="management_page/product/manageProductInfo?pId=";
//		int pId=productDetail.getProductBean().getProduct_id();
//		return path+pId;
		return "redirect:/product/manageProducts";
	}
	//新增商品照片
	@GetMapping("/product/addtProductPic")  //NEW ProductPicBean給jsp
	public String addProductPicture(@RequestParam("pId") Integer pId, Model model) {
		ProductBean product=service.getProductById(pId);
		ProductPicBean picture=new ProductPicBean();
		picture.setProductBean(product);
		model.addAttribute("product", product);
		model.addAttribute("productPicture", picture);
		return "/management_page/product/addProductPic";
	}
	//
	@PostMapping("/product/addtProductPic")  //新增ProductPicBean
	public String processProductPicture(
			ProductBean product,
			ProductPicBean productPicture
			) {
		productPicture.setProductBean(product);
		
		MultipartFile picture=productPicture.getProductImage();
		if(picture!=null && !picture.isEmpty()&&picture.getSize()!=0) {
			try {
				byte[]b=picture.getBytes();
				Blob blob=new SerialBlob(b);
				productPicture.setProduct_pic_img(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:"+e.getMessage());
			}
		}
		service.addProductPicture(productPicture);
		return "redirect:/product/manageProducts";
	}
	
	
	

	@ModelAttribute
	public void commonData(Model model) {
		List<CustomerCategoryBean> customerCategories = service.getAllCustomerCategory();
		List<ProductCategoryBean> productCategories = service.getAllProductCategory();
		List<ProductStausBean> productStausBean = service.getAllProductStatus();
		model.addAttribute("customerCategories", customerCategories);
		model.addAttribute("productCategories", productCategories);
		model.addAttribute("productStatus", productStausBean);

		// ===============以下測試===============
//		Map<String, String> categoryMap=new HashMap();
//		categoryMap.put("key", "value");
		ProductDetailBean productDetail = new ProductDetailBean();
		ProductPicBean productPic = new ProductPicBean();
		model.addAttribute("productDetail", productDetail);
		model.addAttribute("productPic", productPic);
	}
}
