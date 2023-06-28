package semi.proj.PfF.order.service;

import java.util.ArrayList;

import semi.proj.PfF.order.model.vo.Coupon;
import semi.proj.PfF.order.model.vo.Order;
import semi.proj.PfF.order.model.vo.OrderProduct;

public interface OrderService {

	int insertOrder(Order order);

	int insertOrderProduct(ArrayList<OrderProduct> opList);

	Order selectOrder(long orderNo);

	ArrayList<OrderProduct> selectOrderProduct(long orderNo);

	ArrayList<Coupon> selectCoupon(long memNo);

	void useCoupon(int couponNo);

	void deleteCartList(String[] cNoList);
	
}