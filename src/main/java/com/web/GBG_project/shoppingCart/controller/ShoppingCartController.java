package com.web.GBG_project.shoppingCart.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.support.SessionStatus;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.util.ValidatorText;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.service.ProductService;
import com.web.GBG_project.shoppingCart.model.OrdersBean;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;

@Controller
@SessionAttributes({ "LoginOK", "shoppingCartList", "requestURL", "orderList"})
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServletContext context;
	
	//將頁面轉跳至shoppingCart.jsp
	@SuppressWarnings("unchecked")
	@GetMapping("shoppingCart")
	public String shoppingCartContent(
				Model model,
				SessionStatus status,
				HttpSession session
			) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		List<List<Integer>> shoppingCartList = (List<List<Integer>>) model.getAttribute("shoppingCartList");
		List<Map<String, String>> shoppingCartTotalList = new ArrayList<Map<String,String>>();
		int totlePrice = 0;
		if (member != null) {
			if (shoppingCartList != null) {
				for (List<Integer> n : shoppingCartList) {
					int productDetailId = n.get(0);
					int productAmount = n.get(1);
					int memberId = member.getMember_id();
					shoppingCartService.saveShoppingCart(productDetailId, productAmount, memberId);
				}
				//清除所有session
				status.setComplete();
				session.invalidate();
				//將member session重新丟回
				model.addAttribute("LoginOK", member);
			}
			List<ShoppingCartBean> shoppingCart = shoppingCartService.getShoppingCart(member.getMember_id());
			for (ShoppingCartBean n : shoppingCart) {
				Map<String, String> shoppingCartMap = new HashMap<String, String>();
				shoppingCartMap.put("product_id", String.valueOf(n.getProductDetailBean().getProductBean().getProduct_id()));
				shoppingCartMap.put("product_title", n.getProductDetailBean().getProductBean().getProduct_title());
				shoppingCartMap.put("product_price", String.valueOf(n.getProductDetailBean().getProductBean().getProduct_price()));
				shoppingCartMap.put("product_amount",  String.valueOf(n.getProduct_amount()));
				shoppingCartMap.put("cart_id",  String.valueOf(n.getCart_id()));
				shoppingCartMap.put("product_color", n.getProductDetailBean().getProduct_color());
				shoppingCartMap.put("product_size", n.getProductDetailBean().getProduct_size());
				shoppingCartTotalList.add(shoppingCartMap);
				totlePrice += (n.getProductDetailBean().getProductBean().getProduct_price() * n.getProduct_amount());
			}
		} else if (shoppingCartList != null) {
			//用index值當作為登入購物車的cart_id
			int index = 0;
			for (List<Integer> n : shoppingCartList) {
				Map<String, String> shoppingCartMap = new HashMap<String, String>();
				ProductDetailBean productDetail = productService.getProductDetail(n.get(0));
				shoppingCartMap.put("product_id", String.valueOf(productDetail.getProductBean().getProduct_id()));
				shoppingCartMap.put("product_title", String.valueOf(productDetail.getProductBean().getProduct_title()));
				shoppingCartMap.put("product_price", String.valueOf(productDetail.getProductBean().getProduct_price()));
				shoppingCartMap.put("product_amount", String.valueOf(n.get(1)));
				shoppingCartMap.put("cart_id", String.valueOf(index));
				shoppingCartMap.put("product_color", productDetail.getProduct_color());
				shoppingCartMap.put("product_size", productDetail.getProduct_size());
				shoppingCartTotalList.add(shoppingCartMap);
				index++;
				totlePrice += (productDetail.getProductBean().getProduct_price() * n.get(1));
			}
		}
		model.addAttribute("totlePrice", totlePrice);
		model.addAttribute("ShoppingCart", shoppingCartTotalList);
		return "shoppingCart/shoppingCart";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "addProduct", params = {"productAmount", "productColor", "productSize", "productId"})
	public String addProduct(
				@RequestParam("productAmount") int productAmount,
				@RequestParam("productColor") String productColor,
				@RequestParam("productSize") String productSize,
				@RequestParam("productId") int productId,
				@RequestParam(value = "buyNow", defaultValue = "true") boolean buyNow,
				Model model
			) {
		if (productColor.equals("-1") || productSize.equals("-1")) {
			model.addAttribute("EnterError", "請選擇商品規格");
			return "redirect:/product/product?id=" + productId;
		}
		//取得session中的member物件
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		System.out.println(productColor + ", " + productSize + ", " + productId);
		int productDetailId = productService.getProductDetailId(productColor, productSize, productId);
		System.out.println("productDetailId是多少: " + productDetailId);
		//判斷使用者是否有登入
		if (member != null) {
			//取得member id
			int memberId = member.getMember_id();
			//新增一筆shopping cart資料到db
			shoppingCartService.saveShoppingCart(productDetailId, productAmount, memberId);
		//使用者未登入
		} else {
			List<List<Integer>> shoppingCartList = (List<List<Integer>>) model.getAttribute("shoppingCartList");
			List<Integer> shoppingCart = new ArrayList<Integer>();
			if (shoppingCartList != null) {
				shoppingCart.add(productDetailId);
				shoppingCart.add(productAmount);
				shoppingCartList.add(shoppingCart);
			} else {
				shoppingCartList = new ArrayList<List<Integer>>();
				shoppingCart.add(productDetailId);
				shoppingCart.add(productAmount);
				shoppingCartList.add(shoppingCart);
			}
			model.addAttribute("shoppingCartList", shoppingCartList);
		}
		
		if (buyNow) {
			return "redirect:/shoppingCart/shoppingCart";
		} else {
			return "redirect:/product/product?id=" + productId;
		}
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping(value = "deleteProduct", params = {"cartId"})
	public String deleteProduct(
				@RequestParam("cartId") int cartId,
				Model model
			) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		System.out.println("LoginOK: " + member);
		//判斷是否有登入會員
		if (member != null) {
			//取得member id
			int memberId = member.getMember_id();
			//針對該會員，資料庫中cartId對應之shopping cart資料刪除
			shoppingCartService.deleteShoppingCart(cartId, memberId);
		//未登入會員
		} else {
			//抓取session中之shopping cart資料
			List<List<Integer>> shoppingCartList = (List<List<Integer>>) model.getAttribute("shoppingCartList");
			//刪除對應之list物件
			shoppingCartList.remove(cartId);
			//上傳已刪除完成之session
			model.addAttribute("shoppingCartList", shoppingCartList);
		}
		return "redirect:/shoppingCart/shoppingCart";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "updateProductCount", params = {"cartId", "productAmount"})
	public String updateProductCount(
				@RequestParam("cartId") int cartId,
				@RequestParam("productAmount") int productAmount,
				Model model
			) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		if (member != null) {
			int memberId = member.getMember_id();
			if (productAmount > 0) {
				shoppingCartService.updateShoppingCart(cartId, productAmount, memberId);
			} else {
				shoppingCartService.deleteShoppingCart(cartId, memberId);
			}
			
		} else {
			//抓取session中之shopping cart資料
			List<List<Integer>> shoppingCartList = (List<List<Integer>>) model.getAttribute("shoppingCartList");
			if (productAmount > 0) {
				List<Integer> tempList = shoppingCartList.get(cartId);
				shoppingCartList.remove(cartId);
				tempList.remove(1);
				tempList.add(1, productAmount);
				shoppingCartList.add(cartId, tempList);
			} else {
				//刪除對應之list物件
				shoppingCartList.remove(cartId);
			}
			//上傳已更改完成之session
			model.addAttribute("shoppingCartList", shoppingCartList);
		}
		return "redirect:/shoppingCart/shoppingCart";
	}
	
	@GetMapping("orderForm")
	public String orderForm(
				Model model,
				HttpServletRequest req
			) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		if (member == null) {
			model.addAttribute("requestURL", req.getRequestURI());
			return "redirect:/member/loginForm";
		}
		return "/shoppingCart/orderForm";
	}
	
	@PostMapping("orderForm")
	public String orderFormCheck(
				@RequestParam("memberName") String memberName,
				@RequestParam("memberPhone") String memberPhone,
				@RequestParam("postalCode") String postalCode,
				@RequestParam("memberAddress") String memberAddress,
				Model model
			) {
		Map<String, String> errorMap = new HashMap<String, String>();
		if (memberName.isEmpty()) {
			errorMap.put("memberNameError", "請輸入姓名");
		}
		if (!memberPhone.matches(ValidatorText.MOBILE_PHONE_CHECK)) {
			errorMap.put("memberPhoneError", "請輸入合法號碼");
		}
		if (!errorMap.isEmpty()) {
			return "/shoppingCart/orderForm";
		}
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		List<Map<String, String>> shoppingCartTotalList = new ArrayList<Map<String,String>>();
		List<ShoppingCartBean> shoppingCart = shoppingCartService.getShoppingCart(member.getMember_id());
		int totlePrice = 0;
		for (ShoppingCartBean n : shoppingCart) {
			Map<String, String> shoppingCartMap = new HashMap<String, String>();
			shoppingCartMap.put("product_id", String.valueOf(n.getProductDetailBean().getProductBean().getProduct_id()));
			shoppingCartMap.put("product_title", n.getProductDetailBean().getProductBean().getProduct_title());
			shoppingCartMap.put("product_price", String.valueOf(n.getProductDetailBean().getProductBean().getProduct_price()));
			shoppingCartMap.put("product_amount",  String.valueOf(n.getProduct_amount()));
			shoppingCartMap.put("cart_id",  String.valueOf(n.getCart_id()));
			shoppingCartMap.put("product_color", n.getProductDetailBean().getProduct_color());
			shoppingCartMap.put("product_size", n.getProductDetailBean().getProduct_size());
			shoppingCartTotalList.add(shoppingCartMap);
			totlePrice += (n.getProductDetailBean().getProductBean().getProduct_price() * n.getProduct_amount());
		}
		Map<String, String> orderMap = new HashMap<String, String>();
		orderMap.put("memberName", memberName);
		orderMap.put("memberPhone", memberPhone);
		orderMap.put("postalCode", postalCode);
		orderMap.put("memberAddress", memberAddress);
		model.addAttribute("orderMap", orderMap);
		model.addAttribute("totlePrice", totlePrice);
		model.addAttribute("ShoppingCart", shoppingCartTotalList);
		return "/shoppingCart/enterOrderForm";
	}
	
	@PostMapping("enterOrder")
	public String enterOrderForm(
				Model model
			) {
		int memberId = ((MemberBean) model.getAttribute("LoginOK")).getMember_id();
		OrdersBean order = new OrdersBean();
		return "/shoppingCart/enterOrderForm";
	}
	
	@GetMapping("withOrderMen")
	public String withOrderMen(
				Model model
			) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		model.addAttribute("memberName", member.getMember_real_name());
		model.addAttribute("memberPhone", member.getMember_mobile_phone());
		model.addAttribute("memberAddress", member.getMember_address());
		return "/shoppingCart/orderForm";
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
