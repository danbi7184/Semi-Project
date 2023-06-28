package semi.proj.PfF.review.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import semi.proj.PfF.review.model.service.ReviewService;
import semi.proj.PfF.review.model.vo.Review;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	@GetMapping("createReview/{productNo}.pr")
	public String  createReview(@PathVariable (value = "productNo") int productNo) {
		return "createReview";
	}
	
	@GetMapping("reviewBoard/{productNo}.pr")
	public ModelAndView insertBoardList(@PathVariable (value = "productNo") int productNo, ModelAndView mv) {
		
		ArrayList<Review> list = rService.insertBoardList(productNo);
		mv.addObject("list", list);
		mv.setViewName("reviewBoard");
		return mv;
	}
	
	@GetMapping("insertReview.pr")
	public String selectReviewList(int productNo, @ModelAttribute Review r) {
		ArrayList<Review> list = rService.selectReviewList(r);
		
		if(list != null) {
			r.getReviewWriter();
			r.getReview_color();
			r.getReview_thick();
			r.getReviewContent();
			r.getReviewStar();
		}
		
		return "insertReview";
	}
	
	
	
}
