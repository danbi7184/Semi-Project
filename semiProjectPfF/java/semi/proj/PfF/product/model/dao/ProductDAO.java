package semi.proj.PfF.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.product.model.vo.Product;

@Repository
public class ProductDAO {

	public int selectCountPrList(SqlSessionTemplate sqlSession, Product productType) {
		if(productType.getProductType2() == null || productType.getProductType2().equals("전체")) {
			return sqlSession.selectOne("productMapper.selectCountPrList", productType);
		} else {
			return sqlSession.selectOne("productMapper.selectCountPr2List", productType);
		}
	}

	public ArrayList<Product> selectPrList(SqlSessionTemplate sqlSession, PageInfo pi, Product productType) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		if(productType.getProductType2() == null || productType.getProductType2().equals("전체")) {
			return (ArrayList)sqlSession.selectList("productMapper.selectPrList", productType, rowBounds);
		} else {
			return (ArrayList)sqlSession.selectList("productMapper.selectPr2List", productType, rowBounds);
		}
	}

	public ArrayList<String> selectType2(SqlSessionTemplate sqlSession, Product productType) {
		return (ArrayList)sqlSession.selectList("productMapper.selectType2", productType);
	}
	
	public Product productDetail(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.productDetail", productNo);
	}

	public ArrayList<Product> productList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.productList");
	}
	
}
