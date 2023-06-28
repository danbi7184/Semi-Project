package semi.proj.PfF.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.proj.PfF.review.model.vo.Review;

@Repository
public class ReviewDAO {
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, Review r) {
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList", r);
	}

	public ArrayList<Review> insertBoardList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.insertBoardList", productNo);
	}

}
