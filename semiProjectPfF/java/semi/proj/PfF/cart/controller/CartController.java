package semi.proj.PfF.cart.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import semi.proj.PfF.cart.model.service.CartService;
import semi.proj.PfF.cart.model.vo.Cart;
import semi.proj.PfF.member.model.vo.Member;

@Controller
public class CartController {

	@Autowired
	private CartService cService;
	
	@GetMapping("/showCart.ca")
	public String cartPage(@ModelAttribute Cart c, Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Cart> list = cService.showCart(m);
		model.addAttribute("Cartlist", list);
		return "Cart";
		}
	
	@ResponseBody
	@RequestMapping(value = "/addCart.ca", method = RequestMethod.POST)
	public int addCart(Cart c, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		c.setMemberNo(m.getMemberNo());
		
		int result = cService.addCart(c);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteCart.ca", method = RequestMethod.POST)
	public int deleteCart(Cart c, HttpSession session, @RequestParam(value = "chbox[]") List<String>chArr) {
		
		Member m = (Member)session.getAttribute("loginUser");
		int memberNo = m.getMemberNo();
		
		int result = 0;
		int cartNo = 0;
		
		if(m != null) {
			for(String i : chArr) {
				cartNo = Integer.parseInt(i);
				System.out.println(cartNo);
				c.setCartNo(cartNo);
				cService.deleteCart(c);
			}
			result = 1;
		}
		return result;
	}
	
	
}
