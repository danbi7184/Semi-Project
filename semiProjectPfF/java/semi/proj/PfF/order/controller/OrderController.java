package semi.proj.PfF.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import semi.proj.PfF.member.model.vo.KakaoMember;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.order.model.vo.Coupon;
import semi.proj.PfF.order.model.vo.Order;
import semi.proj.PfF.order.model.vo.OrderProduct;
import semi.proj.PfF.order.service.OrderService;

@Controller
public class OrderController {
	
	private IamportClient api;
	@Autowired
	private OrderService oService;
	
	public OrderController() {
		this.api = new IamportClient("5261363133676612", "OPSJjueLH9082g7bOolj9JKnAM8yb724xKQEPZNttT8dCzv19y70XJ7AaRIpn04rwihZsXbkVdeavBVd");
	}
	
	@ResponseBody
	@RequestMapping("verifyIamport/{imp_uid}.pay")
	public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid) throws IamportResponseException, IOException {
		return api.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping("paymentView.pay")
	public String paymentView(Model model, HttpServletRequest request) {
		model.addAttribute("productList", request.getAttribute("list"));
		model.addAttribute("cNoList", request.getAttribute("cNoList"));
		return "payment";
	}
	
	@ResponseBody
	@RequestMapping("insertOrder.pay")
	public long insertOrder(@ModelAttribute Order order, @RequestParam("productInfo") String productInfo, @RequestParam("couponNo") int couponNo, @RequestParam("cNoList") String[] cNoList, HttpSession session) {
		try {
			((Member)session.getAttribute("loginUser")).setPoint(((Member)session.getAttribute("loginUser")).getPoint() - order.getOrderUsedPoint() + order.getOrderEarnPoint());
		} catch(ClassCastException e) {
			((KakaoMember)session.getAttribute("loginUser")).setPoint(((KakaoMember)session.getAttribute("loginUser")).getPoint() - order.getOrderUsedPoint() + order.getOrderEarnPoint());
		}
		
		String[] productArr = productInfo.split("&");
		ArrayList<OrderProduct> opList = new ArrayList<OrderProduct>();
		for(String product : productArr) {
			String[] element = product.split("/");
			OrderProduct op = new OrderProduct(Integer.parseInt(element[0]), Integer.parseInt(element[1]), element[2], order.getOrderNo());
			opList.add(op);
		}
		
		if(couponNo != 0) {
			oService.useCoupon(couponNo);
		}
		
		for(int i=0; i<cNoList.length; i++) {
			System.out.println(cNoList[i]);
		}

		if(cNoList.length != 0) {
			oService.deleteCartList(cNoList);
		} 
		
		int oResult = oService.insertOrder(order);
		int opResult = oService.insertOrderProduct(opList);
		
		if(oResult > 0 && opResult > 0) {
			return order.getOrderNo();
		}
		return 0;
	}
	
	@RequestMapping("payCompleteView.pay")
	public String payCompleteView(@RequestParam("orderNo") long orderNo, Model model) {
		Order order = oService.selectOrder(orderNo);
		ArrayList<OrderProduct> opList = oService.selectOrderProduct(orderNo);
		
		if(order != null && opList != null) {
			model.addAttribute("order", order);
			model.addAttribute("opList", opList);
			return "paymentComplete";
		}
		return null;
	}
	
	@GetMapping("coupon.pay")
	public String couponView(HttpSession session, Model model) {
		long memNo;
		try {
			memNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		} catch(ClassCastException e) {
			memNo = ((KakaoMember)session.getAttribute("loginUser")).getMemberNo();
		}
		ArrayList<Coupon> couponList = oService.selectCoupon(memNo);
		model.addAttribute("list", couponList);
		return "coupon";
	}
	
}

