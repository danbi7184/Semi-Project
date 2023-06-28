package semi.proj.PfF.administrator.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import semi.proj.PfF.administrator.model.service.AdministratorService;
import semi.proj.PfF.common.Pagination;
import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.order.model.vo.OrderProduct;
import semi.proj.PfF.product.model.vo.Product;

@Controller
public class AdministratorController {
	
	@Autowired
	AdministratorService aService;
	
	@RequestMapping("main.ad")
	public String main() {
		return "checkPayment";
	}
	
	@RequestMapping("statistics.ad")
	public String statistics() {
		return "statistics";
	}
	
	// 결제자/결제 수 통계
		@RequestMapping("numOfPay.ad")
		public void numOfPay(HttpServletResponse response) {
//			1. 결제자 수 , 날짜로 그룹바이 해서 COUNT 하는데 같은사람이 결제햇을때 중복이되면안됨 
//			2. 결제 수 , 날짜로 그룹바이해서 COUNT 해야하지않을까
//			3. 날짜들
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.MONTH, -1);
			Date oneMonthAgo = calendar.getTime();
			
			ArrayList<Integer> numPayer	= aService.selectNumPayer(oneMonthAgo);
			ArrayList<Integer> numPay = aService.selectNumPay(oneMonthAgo);
			ArrayList<Date> date = aService.selectDate(oneMonthAgo);
			
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
			Gson gson = gb.create();
			
			Map<String, Object> responseData = new HashMap<>();
		    responseData.put("numPayer", numPayer);
		    responseData.put("numPay", numPay);
		    responseData.put("date", date);
			
			try {
				gson.toJson(responseData, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
			
		}
		
		// 일별결제금액 통계
		@RequestMapping("amountOfPay.ad")
		public void amountOfPay(HttpServletResponse response) {
//			1. 일별 결제 금액 , 날짜로 그룹바이해서 sum
//			2. 해당날짜 포함한 7일간평균 금액, 맨 첫날은 7일 평균이 없을테니 0으로 설정
//			3. 날짜들
			
			ArrayList<Integer> sumPrice = aService.selectSumPrice();
			ArrayList<Integer> avgPrice = aService.selectAvgPrice();
			avgPrice.add(0, 0);
			ArrayList<Date> date = aService.selectAmountPayDate();
			
			response.setContentType("application/json; charset=UTF-8");
			
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
			Gson gson = gb.create();
			
			Map<String, Object> responseData = new HashMap<>();
			responseData.put("sumPrice", sumPrice);
		    responseData.put("avgPrice", avgPrice);
		    responseData.put("date", date);
		    
		    try {
				gson.toJson(responseData, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
			
		}
	
	@GetMapping("checkPayment.ad")
	public String paymentView() {
		return "checkPayment";
	}
	
	@GetMapping("searchOrder.ad")
	public String searchOrder(@RequestParam(value="page", required=false) Integer page, Model model, @RequestParam("name") String name, @RequestParam("address") String address, 
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, @RequestParam("payMethod") String payMethod) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		HashMap<String, String> searchMap = new HashMap<String, String>();
		searchMap.put("name", name);
		searchMap.put("address", address);
		searchMap.put("startDate", startDate);
		searchMap.put("endDate", endDate);
		searchMap.put("payMethod", payMethod);
		
		int orderCount = aService.getOrderCount(searchMap);
//		System.out.println(orderCount);
		if(orderCount != 0) {
			PageInfo pi = Pagination.getPageInfo(currentPage, orderCount, 10);
			ArrayList<Integer> orders = aService.searchAllOrder(pi, searchMap);
//			System.out.println(pi);
//			System.out.println(orders);
			
			ArrayList<OrderProduct> list = aService.selectAllOrderProduct(orders);
//			System.out.println(list);
			model.addAttribute("orders", orders);
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		}
		model.addAttribute("orderCount", orderCount);
		model.addAttribute("name", name);
		model.addAttribute("address", address);
		model.addAttribute("startDate", startDate);
		model.addAttribute("endDate", endDate);
		model.addAttribute("payMethod", payMethod);
		return "checkPayment";
	}
	
	@RequestMapping(value = "/mng_member.ad", method = RequestMethod.GET)
	public String memberList(HttpSession Session, Model model) {
		ArrayList<Member> list = aService.memberList();
		model.addAttribute("memberList", list);
		return "mng_member";
	}
	
	
	@PostMapping(value="/updateMember.ad")
	public String updateMember(@ModelAttribute Member m, Model model) {
		int result = aService.updateMember(m);
		System.out.println(result);
		
		return "redirect:/mng_member.ad";
	}
	
	@PostMapping("/deleteMember.ad")
	public String deleteMember(@RequestParam("memberId") String memberId, @RequestParam("memberStatus") String memberStatus) {
		String status = memberStatus.equals("Y") ? "N" : "Y";
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("memberStatus", status);
		
	    aService.deleteMember(map);
	    return "redirect:/mng_member.ad";
	}
	
	@PostMapping(value="/insertProduct.pr")//상품수정 
	public String AdminproductInsert(Product p) {
		aService.AdminproductInsert(p);
		return "redirect:/productList2.pr";
	}
	
	@GetMapping(value="/AdminproductInsert.pr")//상품등록창으로 이동
	public String productInsert() {
		return "AdminproductInsert";
	}
	
	@GetMapping("/delete.pr") //상품 삭제
	public String deletProduct(@RequestParam("productNo")  String productNo) {
		aService.deleteProduct(productNo);
		return "redirect:/productList2.pr";
	}
	
	
}
