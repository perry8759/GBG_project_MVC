package com.web.GBG_project.shoppingCart.controller;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.support.SessionStatus;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.service.ProductService;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;
import com.web.GBG_project.util.CommonUtils;
import com.web.GBG_project.util.ValidatorText;

@Controller
@SessionAttributes({"LoginOK", "shoppingCartList", "requestURL", "orderMap", "shoppingCartLocking"})
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
	
	@Autowired
	CommonUtils common;
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ServletContext context;
	
	//將頁面轉跳至shoppingCart.jsp
	@GetMapping("shoppingCart")
	public String shoppingCartContent(
				Model model
			) {
		return "shoppingCart/shoppingCart";
	}
	
	@SuppressWarnings("unchecked")
	@PostMapping(value = "addProduct", params = {"productAmount", "productColor", "productSize", "productId"})
	public String addProduct(
				@RequestParam("productAmount") int productAmount,
				@RequestParam("productColor") String productColor,
				@RequestParam("productSize") String productSize,
				@RequestParam("productId") int productId,
				@RequestParam(value = "buyNow", defaultValue = "false") boolean buyNow,
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
				Model model,
				HttpServletRequest req
			) {	
		//獲得上個頁面的URI
		String previousPageUrl = (req.getHeader("Referer").split("GBG_project_mvc"))[1];
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
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
		//永遠轉跳到上個頁面
		return "redirect:" + previousPageUrl;
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
	
	@SuppressWarnings("unchecked")
	@GetMapping("orderForm")
	public String orderForm(
				Model model,
				HttpServletRequest req
			) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		String shoppingCartLocking = (String) model.getAttribute("shoppingCartLocking");
		List<List<Integer>> shoppingCartList = (List<List<Integer>>) model.getAttribute("shoppingCartList");
		if (member == null) {
			model.addAttribute("requestURL", req.getRequestURI());
			return "redirect:/member/loginForm";
		}
		if (shoppingCartList != null && shoppingCartLocking == null) {
			for (List<Integer> n : shoppingCartList) {
				int productDetailId = n.get(0);
				int productAmount = n.get(1);
				int memberId = member.getMember_id();
				shoppingCartService.saveShoppingCart(productDetailId, productAmount, memberId);
			}
			model.addAttribute("shoppingCartLocking", "shoppingCartLocking");
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
	
	@SuppressWarnings("unchecked")
	@GetMapping("enterOrder")
	public String enterOrderForm(
				Model model
			) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		Map<String, String> orderMap = (Map<String, String>) model.getAttribute("orderMap");
		String orderId = common.getMD5Endocing(String.valueOf(new Timestamp(System.currentTimeMillis())));
		shoppingCartService.saveOrder(member, orderMap, orderId);
		shoppingCartService.saveOrderDetail(member, orderMap, orderId);
		return "redirect:/order/queryMemberOrders";
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
	
	@ModelAttribute
	public void shoppingCart(Model model) {
		common.shoppingCart(model, shoppingCartService, productService);
	}
	
	//取得ShoppingCart的商品圖片
	@GetMapping("/getPicture/{productId}")
	public ResponseEntity<byte[]> getPicture(
				Model model,
				@PathVariable("productId") int productId
			) {
		Object[] product = productService.getProductById(productId).getProductPicBean().toArray();
		Blob blob = ((ProductPicBean)product[0]).getProduct_pic_img();
		return common.getPicture(product, blob);
	}
}
