package semi.proj.PfF.administrator.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.proj.PfF.administrator.model.DAO.AdministratorDAO;
import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.order.model.vo.OrderProduct;
import semi.proj.PfF.product.model.vo.Product;

@Service
public class AdministratorService {
	
	@Autowired
	AdministratorDAO aDAO;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public ArrayList<Integer> selectNumPayer(Date oneMonthAgo) {
		return aDAO.selectNumPayer(sqlSession, oneMonthAgo);
	}

	public ArrayList<Integer> selectNumPay(Date oneMonthAgo) {
		return aDAO.selectNumPay(sqlSession, oneMonthAgo);
	}

	public ArrayList<Date> selectDate(Date oneMonthAgo) {
		return aDAO.selectDate(sqlSession, oneMonthAgo);
	}

	public ArrayList<Integer> selectSumPrice() {
		return aDAO.selectSumPrice(sqlSession);
	}

	public ArrayList<Integer> selectAvgPrice() {
		return aDAO.selectAvgPrice(sqlSession);
	}

	public ArrayList<Date> selectAmountPayDate() {
		return aDAO.selectAmountPayDate(sqlSession);
	}
	
	public int getOrderCount(HashMap<String, String> searchMap) {
		return aDAO.getOrderCount(sqlSession, searchMap);
	}

	public ArrayList<Integer> searchAllOrder(PageInfo pi, HashMap<String, String> searchMap) {
		return aDAO.selectAllOrder(sqlSession, pi, searchMap);
	}

	public ArrayList<OrderProduct> selectAllOrderProduct( ArrayList<Integer> orders) {
		return aDAO.selectAllOrderProduct(sqlSession, orders);
	}
	
	public int updateMember(Member m) {
		return aDAO.updateMember(m);
	}

	public ArrayList<Member> memberList() {
		return aDAO.memberList();
	}

	public void deleteMember(HashMap<String, String> map) {
		aDAO.deleteMember(map);
	}
	
	public int AdminproductInsert(Product p) {
		return aDAO.AdminproductInsert(sqlSession,p);
	}

	public int deleteProduct(String productNo) {
		return aDAO.deleteProduct(sqlSession,productNo);
	}
	
}
