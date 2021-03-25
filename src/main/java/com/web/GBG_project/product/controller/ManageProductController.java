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
import com.web.GBG_project.util.ProductPicturesVO;

@Controller
public class ManageProductController {

	@Autowired
	ProductService service;

	// 管理商品
	@RequestMapping("/product/manageProducts")
//	@RequestMapping("/manageProducts")
	public String getManageProducts(Model model) {
		List<ProductBean> plist = service.getAllProducts();
//		int countPic=service.countPictures(pId);
		model.addAttribute("products", plist);
		return "/management_page/product/manageProducts";
	}

	// 商品資訊頁
	@RequestMapping("/product/manageProductInfo")
	public String getManageProductInfo(@RequestParam("pId") Integer pId, Model model) {
		List<Integer> pictureId = service.getProductPictureId(pId);
		model.addAttribute("pictures", pictureId);
		model.addAttribute("product", service.getProductById(pId));
		Integer coverID=service.getProductCoverId(pId);  //若coverID=0，表示沒有封面照片
		model.addAttribute("coverID", coverID);
		return "/management_page/product/manageProductInfo";
	}

//	商品篩選條件
	@PostMapping(value = "/product/productFilterCondition", params = { "statusId", "customerCategoryId", "sortValue" })
	public String listProductByCondition(Model model, @RequestParam(value = "statusId") int statusId,
			@RequestParam(value = "customerCategoryId") int customerCategoryId,
			@RequestParam(value = "sortValue") int sortValue) {
		String path = "";
		System.out.println(
				"customerCategoryId=" + customerCategoryId + ",statusId=" + statusId + ",sortValue=" + sortValue);
		if (statusId == -1 & customerCategoryId == -1 & sortValue == -1) {
			path = "redirect:/product/manageProducts";
		} else {
			List<ProductBean> plist = service.listProductByCondition(customerCategoryId, statusId, sortValue);
			model.addAttribute("products", plist);
			path = "/management_page/product/manageProducts";
		}
		return path;
	}

	// 修改多項商品上下架狀態 updateProductsStatus
	@PostMapping("/product/updateProductsStatus")
	public String updateProductsStatus(@RequestParam(value = "productId", required = false) int[] productId,
			@RequestParam(value = "statusId", required = false) int statusId, Model model) {
		if (productId != null & statusId != 0) {
			for (int n = 0; n < productId.length; n++) {
				System.out.println(productId[n] + ",");
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

	// 修改商品
	@PostMapping("/product/product_update")
	public String updateProduct(@ModelAttribute("product") ProductBean pb) {
		service.updateProduct(pb);
		int pId = pb.getProduct_id();
//		return "redirect:/product/manageProducts";
		return "redirect:/product/manageProductInfo?pId=" + pId;
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

	@PostMapping("/product/addProduct")
	public String processAddNewProductForm(@ModelAttribute("product") ProductBean pb, Model model) {
		service.addProduct(pb);
		int pId = pb.getProduct_id();
//		return "redirect:../product/manageProducts"; // 回到管理商品頁
		return "redirect:/product/manageProductInfo?pId=" + pId;
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
		int pId = pdb.getProductBean().getProduct_id();
//		return "redirect:/product/manageProducts"; // 回到管理商品頁
		return "redirect:/product/manageProductInfo?pId=" + pId; // 回到管理商品資訊頁
	}

	// 修改商品細項
	@GetMapping("/product/updateProDetail")
	public String getUpdateProductDetail(@RequestParam("dId") Integer dId, Model model) {
		ProductDetailBean pdb = service.getProductDetailById(dId);
		model.addAttribute("productDetail", pdb);
		return "management_page/product/addProductDetail";
	}

	// 修改商品細項
	@PostMapping("/product/updateProDetail")
	public String updateProductDetail(@ModelAttribute("productDetail") ProductDetailBean productDetail, Model model) {
		service.updateProductDetail(productDetail);
		int pId = productDetail.getProductBean().getProduct_id();
//		String path="management_page/product/manageProductInfo?pId=";
//		int pId=productDetail.getProductBean().getProduct_id();
//		return path+pId;
		return "redirect:/product/manageProductInfo?pId=" + pId;
	}

	// 新增多張商品照片
	@GetMapping("/product/addtProductPictures") // NEW ProductPicBean給jsp
	public String addProductPictures(@RequestParam("pId") Integer pId, Model model) {
		ProductBean product = service.getProductById(pId);
		ProductPicturesVO pictureVO = new ProductPicturesVO();
		pictureVO.setProductBean(product);

		model.addAttribute("product", product);
		model.addAttribute("pictureVO", pictureVO);
		return "/management_page/product/addProductPictures";
	}

	// 重新上傳覆蓋舊照片
	// 刪除單張商品照片
	@GetMapping("/product/deleteProductPic")
	public String deleteProductPicture(@RequestParam("pId") Integer pId,@RequestParam("ppId") Integer ppId) {
		ProductPicBean picture = service.getProductPicById(ppId);
//		ProductBean product = picture.getProductBean();
		service.deleteProductPicture(picture);
		return "redirect:/product/manageProductInfo?pId=" + pId;
	}

	// 新增單張商品照片
	@GetMapping("/product/addProductPic") // NEW ProductPicBean給jsp
	public String addProductPicture(@RequestParam("pId") Integer pId,@RequestParam("seqId") Integer seqId, Model model) {
		ProductBean product = service.getProductById(pId);
		ProductPicBean picture = new ProductPicBean();

		
		picture.setProductBean(product);
		if(seqId==0) {
			picture.setProduct_pic_seq(0);
		}else {
			picture.setProduct_pic_seq(1);
		}
		model.addAttribute("product", product);
		model.addAttribute("productPicture", picture);
		
		return "/management_page/product/addProductPic";
	}

	// 新增ProductPicBean
	@PostMapping("/product/addProductPic")
	public String processProductPicture(ProductPicBean productPicture) {
		int pId = productPicture.getProductBean().getProduct_id();
		MultipartFile picture = productPicture.getProductImage();
		if (picture != null && !picture.isEmpty() && picture.getSize() != 0) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				productPicture.setProduct_pic_img(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常:" + e.getMessage());
			}
		}
		service.addProductPicture(productPicture);
		return "redirect:/product/manageProductInfo?pId=" + pId;
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
