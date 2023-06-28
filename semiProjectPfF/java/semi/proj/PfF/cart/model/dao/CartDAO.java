package semi.proj.PfF.cart.model.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.proj.PfF.cart.model.vo.Cart;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.product.model.vo.Product;



@Repository
public class CartDAO {
	
	public int addCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("cartMapper.addCart", c);
	}

	public ArrayList<Cart> showCart(SqlSessionTemplate sqlSession, Member m) {
		return (ArrayList)sqlSession.selectList("cartMapper.showCart", m);
	}

	public void deleteCart(SqlSessionTemplate sqlSession, Cart c) {
		sqlSession.delete("cartMapper.deleteCart", c);
	}

}
