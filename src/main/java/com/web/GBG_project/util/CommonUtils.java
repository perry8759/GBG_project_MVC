package com.web.GBG_project.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.service.ProductService;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;

@Component
public class CommonUtils {
	
	@Autowired
	ServletContext context;
	
	//文字加密
	public String getMD5Endocing(String message) {
		
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();

			for (int i = 0; i < digest.length; ++i) {
				final byte b = digest[i];
				final int value = Byte.toUnsignedInt(b);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	
	public ResponseEntity<byte[]> getPicture(Object fromObject, Blob blob) {
		String defaultPicture = "/WEB-INF/resource/images/NoImage.jpg";
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		if (fromObject != null) {
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
	
	@SuppressWarnings("unchecked")
	public void shoppingCart(Model model, ShoppingCartService shoppingCartService, ProductService productService) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		System.out.println(model.getAttribute("shoppingCartList"));
		List<List<Integer>> shoppingCartList = (List<List<Integer>>) model.getAttribute("shoppingCartList");
		String shoppingCartLocking = (String) model.getAttribute("shoppingCartLocking");
		List<Map<String, String>> shoppingCartTotalList = new ArrayList<Map<String,String>>();
		int totlePrice = 0;
		if (member != null) {
			if (shoppingCartList != null && shoppingCartLocking == null) {
				for (List<Integer> n : shoppingCartList) {
					int productDetailId = n.get(0);
					int productAmount = n.get(1);
					int memberId = member.getMember_id();
					shoppingCartService.saveShoppingCart(productDetailId, productAmount, memberId);
				}
				model.addAttribute("shoppingCartLocking", "shoppingCartLocking");
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
	}

}
