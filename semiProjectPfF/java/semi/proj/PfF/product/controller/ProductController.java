package semi.proj.PfF.product.controller;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import semi.proj.PfF.cart.model.vo.Cart;
import semi.proj.PfF.common.Pagination;
import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.member.model.exception.MemberException;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.product.model.service.ProductService;
import semi.proj.PfF.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	ProductService pService;
	
	@GetMapping("productList.pr")
	public String productList(@RequestParam(value="page", required=false) Integer currentPage, @ModelAttribute Product productType, Model model) {
		
		if(currentPage == null) {
			currentPage = 1;
		} else if(currentPage < 0) {
			currentPage = 1;
		}
		
		if(productType.getProductType2() == null) productType.setProductType2("전체");
		
		int listCount = pService.selectCountPrList(productType); // �긽�뭹珥앷갗�닔
		
		ArrayList<String> ProductType2 = pService.selectType2(productType);	// productType2 異붿텧
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 20); // => �럹�씠吏��꽕�씠�뀡
		
		ArrayList<Product> list = pService.selectPrList(pi, productType); // => �쟾泥� �긽�뭹由ъ뒪�듃戮묒븘�삤湲�
		// �긽�뭹 type2, ���몴�궗吏�, productName, productPrice
		
		if(list != null) {
			model.addAttribute("productType", productType.getProductType());	// �뼱�뼡移댄뀒怨좊━瑜� 蹂쇱� �쐞�븿
			model.addAttribute("productType2", productType.getProductType2());	// �뼱�뼡移댄뀒怨좊━瑜� 蹂쇱� �쐞�븿
			model.addAttribute("productType2List", ProductType2);	// 移댄뀒怨좊━2 議고쉶�븯湲곗쐞�븿
			model.addAttribute("pi", pi);	// �럹�씠吏��꽕�씠�뀡
			model.addAttribute("list", list);	// �럹�씠吏��꽕�씠�뀡�맂 由ъ뒪�듃
			return "productList";
		} else {
			throw new MemberException("조회할 상품이 없습니다.");
		}
	}
	
	@GetMapping("productDetail/detail/{productNo}.pr")
	public ModelAndView  productDetail(@PathVariable ("productNo") int productNo, ModelAndView mv){
		Product p = pService.productDetail(productNo);
		mv.addObject("p", p);
		mv.setViewName("productDetail");
		return mv;
	}
	
	@GetMapping("/cartPage.ca")
	public String cartPage(@ModelAttribute Cart c, @ModelAttribute Product Product,  Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		model.addAttribute("Product",Product);
		
		return "cartPage";
	}
	
	@RequestMapping("productList2.pr")
	public ModelAndView productList(ModelAndView mv) {
		ArrayList<Product> list = pService.productList();
		mv.addObject("list", list);
		mv.setViewName("productList");
		return mv;
	}
	
	@GetMapping("/buyProduct.pr")
	public String buyProduct(@ModelAttribute Product Product, @RequestParam("buyCount") int butCount, @RequestParam("size") String size, HttpServletRequest request) {
		ArrayList<Product> list = new ArrayList<Product>();
		Product p = pService.productDetail(Product.getProductNo());
		p.setSize(size);
		p.setBuyCount(butCount);
		list.add(p);
		request.setAttribute("list", list);
		return "forward:/paymentView.pay";
	}
	
	@RequestMapping("/cartToPay.pr")
	public String cartToPay(@RequestParam("cNoArr") Integer[] cNo, @RequestParam("pNoArr") Integer[] pNo, @RequestParam("sizeArr") String[] size, 
							@RequestParam("countArr") Integer[] count, HttpServletRequest request) {
		
		ArrayList<Product> list = new ArrayList<Product>();
		for(int i=0; i<pNo.length; i++) {
			System.out.println(cNo[i]);
			Product p = pService.productDetail((int)pNo[i]);
			p.setSize(size[i]);
			p.setBuyCount(count[i]);
			list.add(p);
		}
		
		request.setAttribute("list", list);
		request.setAttribute("cNoList", cNo);
		return "forward:/paymentView.pay";
	}
}
