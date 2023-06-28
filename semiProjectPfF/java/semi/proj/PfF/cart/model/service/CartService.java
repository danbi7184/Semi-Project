package semi.proj.PfF.cart.model.service;

import java.util.ArrayList;
import java.util.List;

import semi.proj.PfF.cart.model.vo.Cart;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.product.model.vo.Product;


public interface CartService {

	int addCart(Cart c);

	ArrayList<Cart> showCart(Member m);

	void deleteCart(Cart c);

	}
    


