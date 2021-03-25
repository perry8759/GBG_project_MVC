package com.web.GBG_project.product.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductCommentBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.model.ProductStausBean;
import com.web.GBG_project.product.service.ProductService;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;
import com.web.GBG_project.util.CommonUtils;

@Controller
@SessionAttributes({"LoginOK", "shoppingCartList", "requestURL", "orderMap", "shoppingCartLocking"})
@RequestMapping("/product")
public class ProductController {
	final int PRODUCT_PER_PAGE=8;  //若有每頁商品數，JSP頁碼處也必須修正
	
	@Autowired
	ShoppingCartService shoppingCartService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductService service;
	@Autowired
	MemberService memberService;
	@Autowired
	ServletContext context;
	@Autowired
	CommonUtils common;

	// 導向商城首頁
	@RequestMapping("/index")
	public String productIndex(Model model) {
		List<ProductBean> hotP = service.getHotProducts();
		List<ProductBean> newP = service.getNewSaleProducts();
		
		model.addAttribute("hotPs", hotP);
		model.addAttribute("newPs", newP);
//		model.addAttribute("categoryCover", newP);
		return "product/index";
	}

	@RequestMapping("/getAllProducts")  // 列出所有商品
	public String getProducts(Model model, @RequestParam(value = "start", defaultValue = "0") Integer start) {
		Integer begin = 0;
		Integer count = PRODUCT_PER_PAGE; // 每頁幾筆資料
		Integer total = 0; // 商品總數
		Vector<Integer> pages = new Vector<>();
		total = service.countProducts();
		Integer n = 1;
		if (total % count == 0) {
			for (n = 1; n <= total / count; n++) {
				pages.add(n); // 若商品可平分頁數，pages加1頁,2頁...total/count頁
			}
		} else {
			for (n = 1; n <= total / count; n++) {
				pages.add(n);
			}
			pages.add(n);
		}
		try {
			begin = start; // 取得jsp的start參數
		} catch (NumberFormatException e) {
			System.out.println("沒有起始值");
		}
		int next = begin + count; // 下一頁的起始值
		int pre = begin - count; // 上一頁的起始值
		int last;
		if (total % count == 0) {
			last = total - count;// 最後一頁的起始值
		} else {
			last = total - total % count;
		}
		pre = pre < 0 ? 0 : pre;
		next = next > last ? last : next;
		model.addAttribute("next", next);
		model.addAttribute("pre", pre);
		model.addAttribute("last", last);
		model.addAttribute("allPages", pages);
		model.addAttribute("productsAll", service.perPageProducts(begin, count));
		return "/product/categories";
	}

	// 以客群分類找商品
//	@RequestMapping("/customerCategory")
//	public String getProductsByCustomerCategory(@RequestParam("ccId") Integer ccId, Model model) {
//		List<ProductBean> products = service.getProductsByCustomerCategory(ccId);
//		model.addAttribute("products", products);
//		return "/product/categories";
//	}

	// 各種客群找商品
	@RequestMapping("/customerProductCategory")
	public String getProductsByCustomerProductCategory(
			@RequestParam(value = "start", defaultValue = "0") Integer start,
			@RequestParam("ccId") Integer ccId,
			@RequestParam("pcId") Integer pcId, Model model) {
		
		Integer begin = 0;
		Integer count = PRODUCT_PER_PAGE;
		Integer total = 0; // 商品總數
		Vector<Integer> pages = new Vector<>();
		total = service.getProductsByCategoriesSize(ccId, pcId);
		System.out.println(total);
		Integer n = 1;
		if (total % count == 0) {
			for (n = 1; n <= total / count; n++) {
				pages.add(n); // 若商品可平分頁數，pages加1頁,2頁...total/count頁
			}
		} else {
			for (n = 1; n <= total / count; n++) {
				pages.add(n);
			}
			pages.add(n);
		}
		try {
			begin = start; // 取得jsp的start參數
		} catch (NumberFormatException e) {
			System.out.println("沒有起始值");
		}
		int next = begin + count; // 下一頁的起始值
		int pre = begin - count; // 上一頁的起始值
		int last;
		if (total % count == 0) {
			last = total - count;// 最後一頁的起始值
		} else {
			last = total - total % count;
		}
		pre = pre < 0 ? 0 : pre;
		next = next > last ? last : next;
		List<ProductBean> products = service.getProductsByCategories(ccId, pcId,begin,count);
		model.addAttribute("next", next);
		model.addAttribute("pre", pre);
		model.addAttribute("last", last);
		model.addAttribute("allPages", pages);
		model.addAttribute("categoriesProducts", products);
		model.addAttribute("ccId", ccId);
		model.addAttribute("pcId", pcId);
		return "/product/categories";
//		return "forward:/product/listCategories";
	}
	
//	@RequestMapping("/listCategories")
//	public String listCategories() {
//		return "/product/categories";
//	}

	@RequestMapping("/search_products")
	public String searchProducts(
			@RequestParam(value = "start", defaultValue = "0") Integer start,
			@RequestParam(value = "searchText") String searchText,
			@RequestParam(value = "productCategory") int productCategoryId,
			@RequestParam(value = "productStatus") int productStatusId, Model model) {
		
		Integer begin = 0;
		Integer count = PRODUCT_PER_PAGE;
		Integer total = 0; // 商品總數
		Vector<Integer> pages = new Vector<>();
		total = service.searchProductsResultSize(searchText, productCategoryId, productStatusId);
		System.out.println(total);
		Integer n = 1;
		if (total % count == 0) {
			for (n = 1; n <= total / count; n++) {
				pages.add(n); // 若商品可平分頁數，pages加1頁,2頁...total/count頁
			}
		} else {
			for (n = 1; n <= total / count; n++) {
				pages.add(n);
			}
			pages.add(n);
		}
		try {
			begin = start; // 取得jsp的start參數
		} catch (NumberFormatException e) {
			System.out.println("沒有起始值");
		}
		int next = begin + count; // 下一頁的起始值
		int pre = begin - count; // 上一頁的起始值
		int last;
		if (total % count == 0) {
			last = total - count;// 最後一頁的起始值
		} else {
			last = total - total % count;
		}
		pre = pre < 0 ? 0 : pre;
		next = next > last ? last : next;
		List<ProductBean> products=service.searchProducts(searchText, productCategoryId, productStatusId, begin, count);
		model.addAttribute("next", next);
		model.addAttribute("pre", pre);
		model.addAttribute("last", last);
		model.addAttribute("allPages", pages);
		model.addAttribute("productsSearch", products);
		model.addAttribute("searchText", searchText);
		model.addAttribute("productCategoryId", productCategoryId);
		model.addAttribute("productStatusId", productStatusId);

		return "/product/categories";
	}

	// 以分類找商品
	@RequestMapping("/queryByCategory")
	public String getCustomerCategoryList(Model model) {
		List<CustomerCategoryBean> ccblist = service.getAllCustomerCategory();
		List<ProductBean> plist = service.getAllProducts();
		model.addAttribute("customerCategoryList", ccblist);
		model.addAttribute("products", plist);
//		System.out.println("products:"+plist);
		System.out.println("customerCategoryList" + ccblist);
		return "product/Categories";
	}

	// 客群分類的商品、選擇客群中的商品分類
//	 <a href='customerCategory/${customerCategory.customer_category_id}'>
//	@RequestMapping("/customerCategory/{customer_category_id}")
//	public String getProductCategoryList(@PathVariable("customer_category_id") Integer ccId, Model model) {
////		String name =service.getCustomerCategory(ccId);
//		List<ProductBean> pblist = service.getProductsByCustomerCategory(ccId);
//		model.addAttribute("ccProducts", pblist);
////		model.addAttribute("ccName", name);
//		// 希望能夠動態產生客群中有哪些商品分類
//		return "product/queryByCustomerCategory";
//	}

	// get商品by商品ID
//	<a href="<spring:url value='manageProductDetails?id=${product.product_id}' />">
	@RequestMapping("/product")
	public String getProductById(@RequestParam("id") Integer id, Model model) {
		List<String> pSizes = service.getPSizesByProductId(id);
		List<String> pColors = service.getPColorsByProductId(id);
		List<ProductDetailBean> pdList = service.getProductsDetailsByProductId(id);
		List<Integer> pictureId=service.getProductPictureId(id);
		List<ProductBean> recommendProduct = service.getAllProducts();
		model.addAttribute("product", service.getProductById(id));
		model.addAttribute("pSizes", pSizes);
		model.addAttribute("pColors", pColors);
		model.addAttribute("pdetailsList", pdList);
		model.addAttribute("pictures", pictureId);

		int commentsCount = service.totalComments(id);
		model.addAttribute("commentsCount", commentsCount);

		List<ProductPicBean> pclist = service.getProductsPicByProductId(id);
		System.out.println("pclist: " + pclist.size());
		List<ProductCommentBean> pcommentlist = service.getProductCommentByProductId(id);
		model.addAttribute("ppicList", pclist);
		model.addAttribute("pcommentlist", pcommentlist);
		model.addAttribute("recommendProduct", recommendProduct);
		return "product/product";
	}

	// 新增評論
	@GetMapping("/comment/add")
	public String getAddNewCommentForm(@RequestParam("id") Integer id, Model model) {
		ProductBean pb = service.getProductById(id);
		ProductCommentBean pComment = new ProductCommentBean();
		pComment.setProductBean(pb);

		model.addAttribute("product", pb);
		model.addAttribute("productCommentBean", pComment);
		return "product/addProductComment";
	}

	@PostMapping("/comment/add")
	public String processAddNewProductForm(@ModelAttribute("productCommentBean") ProductCommentBean pcb, Model model) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		pcb.setMemberBean(member);
		service.addProductComment(pcb);

		Integer pId = pcb.getProductBean().getProduct_id();
		service.setProductScore(pId);

		return "redirect:/product/product?id=" + pId;
	}

	// 查看會員的商品評論
	@GetMapping("/memberProductComment")
	public String manageProductComment(@RequestParam("mId") Integer mId, Model model) {
//		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		List<ProductCommentBean> comments = service.getProductCommentByMemberId(memberService.getMember(mId));
		model.addAttribute("comments", comments);
		return "/management_page/product/memberProductComment";
	}
	
	@ModelAttribute
	public void shoppingCartData(Model model) {
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
				ProductDetailBean productDetail = service.getProductDetail(n.get(0));
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
	
	@ModelAttribute
	public void commonData(Model model) {
		List<CustomerCategoryBean> customerCategories = service.getAllCustomerCategory();
		List<ProductCategoryBean> productCategories = service.getAllProductCategory();
		List<ProductStausBean> productStausBean = service.getAllProductStatus();
		model.addAttribute("customerCategories", customerCategories);
		model.addAttribute("productCategories", productCategories);
		model.addAttribute("productStatus", productStausBean);
	}
	@GetMapping("/getCoverPicture")
	public ResponseEntity<byte[]> getCoverPicture(
			@RequestParam("pId") Integer pId,
			Model model){
		Integer coverID=service.getProductCoverId(pId);
		ResponseEntity<byte[]> response=null;
		if(coverID==0) {
			response=getDefaultPicture();
			System.out.println("====================使用defaultPic======================");
		}else {
			ProductPicBean picture=service.getProductPicById(coverID);
			System.out.println("====================ProductPicBean picture=service======================");
			response=common.getPicture(picture,picture.getProduct_pic_img());
		}
		return response;
	}
	@GetMapping("/getPicture")
	public ResponseEntity<byte[]> getPicture(
			@RequestParam("ppId") Integer ppId
			){
		ProductPicBean picture=service.getProductPicById(ppId);
		return common.getPicture(picture,picture.getProduct_pic_img());
	}
	
	@GetMapping("/getAllPicture")
	public ResponseEntity<byte[]> getAllPicture(
			@RequestParam("productId") int productId,
			@RequestParam("imageId") int imageId
			){
		List<ProductPicBean> pictureList = service.getProductsPicByProductId(productId);
		ProductPicBean picture = pictureList.get(imageId);
		return common.getPicture(picture, picture.getProduct_pic_img());
	}
	
	@ModelAttribute
	public void shoppingCart(Model model) {
		common.shoppingCart(model, shoppingCartService, productService);
	}
	
	public ResponseEntity<byte[]> getDefaultPicture() {
		String defaultPicture = "/WEB-INF/resource/images/NoImage.jpg";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		
		media = toByteArray(defaultPicture);
		filename = defaultPicture;
		
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