package semi.proj.PfF.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.proj.PfF.review.model.dao.ReviewDAO;
import semi.proj.PfF.review.model.vo.Review;

@Service
public class ReviewService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReviewDAO rDAO;


	public ArrayList<Review> insertBoardList(int productNo) {
		return rDAO.insertBoardList(sqlSession, productNo);
	}

	public ArrayList<Review> selectReviewList(Review r) {
		return rDAO.selectReviewList(sqlSession, r);
	}

	
}
