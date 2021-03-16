package com.web.GBG_project.shoppingCart.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.service.ProductService;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;

@Controller
@SessionAttributes({ "LoginOK", "ShoppingCart"})
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServletContext context;
	
	@GetMapping(value = "deleteProduct", params = {"cartId"})
	public String deleteProduct(
				@RequestParam("cartId") Integer cartId,
				Model model
			) {
		int memberId = ((MemberBean) model.getAttribute("LoginOK")).getMember_id();
		shoppingCartService.deleteShoppingCart(cartId, memberId);
		return "redirect:/shoppingCart/shoppingCart";
	}
	
	//將頁面轉跳至shoppingCart.jsp
	@GetMapping("shoppingCart")
	public String shoppingCartContent(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		//如果未登入會員轉跳至登入頁面
		if (member == null) {
			return "member/login";
		}
		List<ShoppingCartBean> shoppingCart = shoppingCartService.getShoppingCart(member.getMember_id());
		model.addAttribute("ShoppingCart", shoppingCart);
		return "shoppingCart/shoppingCart";
	}
	
	@PostMapping(value = "updateProductCount", params = {"cartId", "productAmount"})
	public String updateProductCount(
				@RequestParam("cartId") int cartId,
				@RequestParam("productAmount") int productAmount,
				Model model
			) {
		int memberId = ((MemberBean) model.getAttribute("LoginOK")).getMember_id();
		if (productAmount > 0) {
			shoppingCartService.updateShoppingCart(cartId, productAmount, memberId);
		} else {
			shoppingCartService.deleteShoppingCart(cartId, memberId);
		}
		return "redirect:/shoppingCart/shoppingCart";
	}
	
	//取得ShoppingCart的商品圖片
	@GetMapping("/getPicture/{productId}")
	public ResponseEntity<byte[]> getPicture(
				Model model,
				@PathVariable("productId") int productId
			) {
		String defaultPicture = "/WEB-INF/resource/images/NoImage.jpg";
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		Object[] product = productService.getProductById(productId).getProductPicBean().toArray();
		if (product != null) {
			Blob blob = ((ProductPicBean)product[0]).getProduct_pic_img();
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
