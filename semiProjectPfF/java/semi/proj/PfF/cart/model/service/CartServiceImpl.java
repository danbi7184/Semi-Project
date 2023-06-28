package semi.proj.PfF.cart.model.service;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.proj.PfF.cart.model.dao.CartDAO;
import semi.proj.PfF.cart.model.vo.Cart;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.product.model.vo.Product;


@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CartDAO cDAO;
	
	@Override
	public int addCart(Cart c) {
		return cDAO.addCart(sqlSession, c);
	}

	@Override
	public ArrayList<Cart> showCart(Member m) {
		return cDAO.showCart(sqlSession, m);
	}

	@Override
	public void deleteCart(Cart c) {
		cDAO.deleteCart(sqlSession, c);
	}

}
