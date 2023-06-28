package semi.proj.PfF.administrator.model.DAO;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.member.model.vo.Member;
import semi.proj.PfF.order.model.vo.OrderProduct;
import semi.proj.PfF.product.model.vo.Product;

@Repository
public class AdministratorDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Integer> selectNumPayer(SqlSessionTemplate sqlSession, Date oneMonthAgo) {
		return (ArrayList)sqlSession.selectList("administratorMapper.selectNumPayer", oneMonthAgo);
	}

	public ArrayList<Integer> selectNumPay(SqlSessionTemplate sqlSession, Date oneMonthAgo) {
		return (ArrayList)sqlSession.selectList("administratorMapper.selectNumPay", oneMonthAgo);
	}

	public ArrayList<Date> selectDate(SqlSessionTemplate sqlSession, Date oneMonthAgo) {
		return (ArrayList)sqlSession.selectList("administratorMapper.selectDate", oneMonthAgo);
	}

	public ArrayList<Integer> selectSumPrice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("administratorMapper.selectSumPrice");
	}

	public ArrayList<Integer> selectAvgPrice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("administratorMapper.selectAvgPrice");
	}

	public ArrayList<Date> selectAmountPayDate(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("administratorMapper.selectAmountPayDate");
	}
	
	public int getOrderCount(SqlSessionTemplate sqlSession, HashMap<String, String> searchMap) {
		return sqlSession.selectOne("orderMapper.getOrderCount", searchMap);
	}

	public ArrayList<Integer> selectAllOrder(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> searchMap) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("orderMapper.selectAllOrder", searchMap, rowBounds);
	}

	public ArrayList<OrderProduct> selectAllOrderProduct(SqlSessionTemplate sqlSession, ArrayList<Integer> orders) {
		return (ArrayList)sqlSession.selectList("orderMapper.selectAllOrderProduct", orders);
	}
	
	public void deleteMember(HashMap<String, String> map) {
		sqlSession.update("administratorMapper.deleteMember", map);
	}

	public int updateMember(Member m) {
		return sqlSession.update("administratorMapper.updateMember", m);
	}
		
	public ArrayList<Member> memberList() {
		return (ArrayList)sqlSession.selectList("administratorMapper.memberList");
	}
	public int AdminproductInsert(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("administratorMapper.productInsert", p);
	}

	public int deleteProduct(SqlSessionTemplate sqlSession, String productNo) {
		return sqlSession.update("administratorMapper.deleteProduct",productNo);
	}
	
}
