package com.web.GBG_project.product.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCommentBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.service.ProductService;
import com.web.GBG_project.shoppingCart.model.OrdersBean;

@Controller
@SessionAttributes("LoginOK")
@RequestMapping("/product")
public class ProductController {

	@Autowired
	ProductService service;
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext context;

	// 導向商品首頁
	@RequestMapping("/index")
	public String productIndex(Model model) {
		List<ProductBean> hotP = service.getHotProducts();
		List<ProductBean> newP = service.getNewSaleProducts();
		model.addAttribute("hotPs", hotP);
		model.addAttribute("newPs", newP);
		return "product/index";
	}
	//以客群分類找商品
	@RequestMapping("/customerCategory")
	public String getProductsByCustomerCategory(@RequestParam("ccId") Integer ccId, Model model) {
		List<ProductBean> products = service.getProductsByCustomerCategory(ccId);
		model.addAttribute("products", products);
		return "/product/categories";
	}
	//客群商品下的商品分類找商品
		@RequestMapping("/customerProductCategory")
		public String getProductsByCustomerProductCategory(
				@RequestParam("ccId") Integer ccId, 
				@RequestParam("pcId") Integer pcId, 
				Model model) {
			
			List<ProductBean> products = service.getProductsByCustomerProductCategory(ccId, pcId);
			String emptyMessage="";
			if(products.size()==0) {
				emptyMessage="熱銷商品即將上架";
			}
			model.addAttribute("products", products);
			model.addAttribute("emptyMessage", emptyMessage);
			return "/product/categories";
		}
	
	//以分類找商品
	@RequestMapping("/queryByCategory")
	public String getCustomerCategoryList(Model model) {
		List<CustomerCategoryBean> ccblist = service.getAllCustomerCategory();
		List<ProductBean> plist = service.getAllProducts();
		model.addAttribute("customerCategoryList", ccblist);
		model.addAttribute("products", plist);
//		System.out.println("products:"+plist);
		System.out.println("customerCategoryList"+ccblist);
		return "product/Categories";
	}

	//客群分類的商品、選擇客群中的商品分類
//	 <a href='customerCategory/${customerCategory.customer_category_id}'>
	@RequestMapping("/customerCategory/{customer_category_id}")
	public String getProductCategoryList(@PathVariable("customer_category_id") Integer ccId, Model model) {
//		String name =service.getCustomerCategory(ccId);
		List<ProductBean> pblist = service.getProductsByCustomerCategory(ccId);
		model.addAttribute("ccProducts", pblist);
//		model.addAttribute("ccName", name);
		//希望能夠動態產生客群中有哪些商品分類
		return "product/queryByCustomerCategory";
	}
	//get商品by商品ID
//	<a href="<spring:url value='manageProductDetails?id=${product.product_id}' />">
	@RequestMapping("/product")
	public String getProductsById(@RequestParam("id") Integer id, Model model) {
		List<String> pSizes = service.getPSizesByProductId(id);
		List<String> pColors = service.getPColorsByProductId(id);
		List<ProductDetailBean> pdList = service.getProductsDetailsByProductId(id);
		model.addAttribute("product", service.getProductById(id));
		model.addAttribute("pSizes", pSizes);
		model.addAttribute("pColors", pColors);
		model.addAttribute("pdetailsList", pdList);
		
		int commentsCount =service.totalComments(id);
		model.addAttribute("commentsCount", commentsCount);
		
		List<ProductPicBean> pclist = service.getProductsPicByProductId(id);
		List<ProductCommentBean> pcommentlist = service.getProductCommentByProductId(id);
		model.addAttribute("ppicList", pclist);
		model.addAttribute("pcommentlist", pcommentlist);
		return "product/product";
	}

	//新增評論
	@GetMapping("/comment/add")
	public String getAddNewCommentForm(@RequestParam("id") Integer id, Model model) {
		ProductBean pb =service.getProductById(id);
		ProductCommentBean pComment =new ProductCommentBean();
		pComment.setProductBean(pb);
		
		model.addAttribute("product", pb);
		model.addAttribute("productCommentBean", pComment);
		return "product/addProductComment";
	}
	
	@PostMapping("/comment/add")
	public String processAddNewProductForm(@ModelAttribute("productCommentBean") ProductCommentBean pcb, Model model) {
		MemberBean member=(MemberBean) model.getAttribute("LoginOK");
		pcb.setMemberBean(member);
		service.addProductComment(pcb);
		
		Integer pId=pcb.getProductBean().getProduct_id();
		service.setProductScore(pId);

		return "forward:/product/product";
	}
	//查看會員的商品評論
	@GetMapping("/memberProductComment")
	public String manageProductComment(@RequestParam("mId") Integer mId, Model model) {
//		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		List<ProductCommentBean> comments= service.getProductCommentByMemberId(memberService.getMember(mId));
		model.addAttribute("comments", comments);
		return "/management_page/product/memberProductComment";
	}
	@GetMapping("/getPicture/{productId}")
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer productId, Model model) {
		String defaultPicture = "/WEB-INF/resource/images/NoImage.jpg";
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		List<ProductPicBean> productPics = service.getProductsPicByProductId(productId);
		if (productPics != null) {
			for(ProductPicBean productPic:productPics) {
				Blob blob = productPic.getProduct_pic_img();
				filename = "/ss.png";
				if (blob != null) {
					try {
						len = (int) blob.length();
						media = blob.getBytes(1, len);
					} catch (SQLException e) {
						throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
					}
				} else {
					media = toByteArray(defaultPicture);
					filename = defaultPicture;
				}
			}
		} else {
			media = toByteArray(defaultPicture);
			filename = defaultPicture;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		System.out.println("mimeType: " + mimeType);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}