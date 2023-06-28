package semi.proj.PfF.order.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.proj.PfF.order.model.dao.OrderDAO;
import semi.proj.PfF.order.model.vo.Coupon;
import semi.proj.PfF.order.model.vo.Order;
import semi.proj.PfF.order.model.vo.OrderProduct;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private OrderDAO oDAO;

	@Override
	public int insertOrder(Order order) {
		return oDAO.insertOrder(sqlSession, order);
	}

	@Override
	public int insertOrderProduct(ArrayList<OrderProduct> opList) {
		return oDAO.insertOrderProduct(sqlSession, opList);
	}

	@Override
	public Order selectOrder(long orderNo) {
		return oDAO.selectOrder(sqlSession, orderNo);
	}

	@Override
	public ArrayList<OrderProduct> selectOrderProduct(long orderNo) {
		return oDAO.selectOrderProduct(sqlSession, orderNo);
	}

	@Override
	public ArrayList<Coupon> selectCoupon(long memNo) {
		return oDAO.selectCoupon(sqlSession, memNo);
	}

	@Override
	public void useCoupon(int couponNo) {
		oDAO.useCoupon(sqlSession, couponNo);
	}

	@Override
	public void deleteCartList(String[] cNoList) {
		oDAO.deleteCartList(sqlSession, cNoList);
	}

}
