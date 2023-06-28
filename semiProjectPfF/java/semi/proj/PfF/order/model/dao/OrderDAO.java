package semi.proj.PfF.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.proj.PfF.order.model.vo.Coupon;
import semi.proj.PfF.order.model.vo.Order;
import semi.proj.PfF.order.model.vo.OrderProduct;

@Repository
public class OrderDAO {

	public int insertOrder(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("orderMapper.insertOrder", order);
	}

	public int insertOrderProduct(SqlSessionTemplate sqlSession, ArrayList<OrderProduct> opList) {
		return sqlSession.insert("orderMapper.insertOrderProduct", opList);
	}

	public Order selectOrder(SqlSessionTemplate sqlSession, long orderNo) {
		return sqlSession.selectOne("orderMapper.selectOrder", orderNo);
	}

	public ArrayList<OrderProduct> selectOrderProduct(SqlSessionTemplate sqlSession, long orderNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectOrderProduct", orderNo);
	}

	public ArrayList<Coupon> selectCoupon(SqlSessionTemplate sqlSession, long memNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectCoupon", memNo);
	}

	public void useCoupon(SqlSessionTemplate sqlSession, int couponNo) {
		sqlSession.update("orderMapper.useCoupon", couponNo);
	}

	public void deleteCartList(SqlSessionTemplate sqlSession, String[] cNoList) {
		sqlSession.delete("cartMapper.deleteCartList", cNoList);
	}
	
}