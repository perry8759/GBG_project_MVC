package com.web.GBG_project.shoppingCart.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.shoppingCart.model.OrderDetailsBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;

@Controller
@SessionAttributes("LoginOK")
@RequestMapping("/order")
public class OrderController {
	@Autowired
	ShoppingCartService service;
	
	final int ORDER_COMPLETE=3;

	// 管理訂單
	@RequestMapping("/manageOrders")
	public String getmanageOrders(Model model) {
		List<OrdersBean> orders = service.getOrders();
		model.addAttribute("orders", orders);
		return "/management_page/order/manageOrders";
	}

	// 查看會員訂單
	@GetMapping("/queryMemberOrders")
	public String getMemberOrders(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		List<OrdersBean> orders = service.getOrdersByMemberId(member.getMember_id());
		List<Integer> amountList = new ArrayList<Integer>();
		List<Double> totalList = new ArrayList<Double>();
		for (OrdersBean i : orders) {
			int amount = 0;
			double total = 0;
			Set<OrderDetailsBean> orderDetails = i.getOrderDetailsBean();
			for (OrderDetailsBean j : orderDetails) {
				int orderAmount = j.getOrder_amount();
				double orderTotal = j.getProductDetailBean().getProductBean().getProduct_price();
				amount += orderAmount;
				total += orderAmount * orderTotal;
			}
			totalList.add(total + 60);
			amountList.add(amount);
		}
		model.addAttribute("totalList", totalList);
		model.addAttribute("amountList", amountList);
		model.addAttribute("orders", orders);
		return "/shoppingCart/memberOrders";
	}
	//會員以訂單狀態列出訂單
	@PostMapping(value = "/memberqueryByOrderStatus", params = { "statusId" })
	public String memberqueryOrderStatus(Model model, @RequestParam(value = "statusId") int statusId) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		String path = "";
		if (statusId == -1) {
			path = "redirect:/order/queryMemberOrders?mId="+member.getMember_id();//待修正
//			path = "redirect:/order/queryMemberOrders?mId=1";//待修正
		} else {
			List<OrdersBean> orders = service.getOrdersByStatusId(statusId);
			model.addAttribute("orders", orders);
			path = "/shoppingCart/memberOrders";
		}
		return path;
	}
//	以訂單狀態列出訂單
	@PostMapping(value = "/queryByOrderStatus", params = { "statusId" })
	public String queryOrderStatus(Model model, @RequestParam(value = "statusId") int statusId) {
		String path = "";
		if (statusId == -1) {
			path = "redirect:/order/manageOrders";
		} else {
			List<OrdersBean> orders = service.getOrdersByStatusId(statusId);
			model.addAttribute("orders", orders);
			path = "/management_page/order/manageOrders";
		}
		return path;
	}
	// 查看orderId
	@GetMapping("/qureyOrder")
	public String getOrderDetails(@RequestParam("osId") Integer oseqId, Model model) {
		OrdersBean order = service.getOrdersById(oseqId);
		model.addAttribute("order", order);
		return "management_page/order/orderDetails";
	}

	@PostMapping("/updateOrderStatus")
	public String updateOrderStatus(@RequestParam("statusId") int statusId, @RequestParam("oseqId") int oseqId,
			Model model) {
		service.updateOrderStatus(oseqId, statusId);

		return "redirect:/order/manageOrders";
	}

	// 將勾選的訂單修改為已完成
	@PostMapping("/checkOrdersDone")
	public String updateCheckOrderStatus(@RequestParam(value = "oseqId", required = false) int[] oseqId, Model model) {
		System.out.println("===============已成功近來此方法=====================");
		if (oseqId != null) {
			System.out.println("checkbox is checked");
			for (int i = 0; i < oseqId.length; i++) {
				int seqId = oseqId[i];
//				System.out.println(seqId);
				service.updateOrderStatus(seqId, ORDER_COMPLETE);
			}
		} else {
			System.out.println("checkbox is not checked");
		}
		return "redirect:/order/manageOrders";
	}

	@ModelAttribute
	public void commonData(Model model) {
		List<OrderSatusBean> orderStatus = service.getOrderStatus();
		model.addAttribute("orderStatus", orderStatus);
	}

}
