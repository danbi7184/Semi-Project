package semi.proj.PfF.qa.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.proj.PfF.qa.model.dao.QaDAO;

@Service("qService")
public class QaService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private QaDAO qDAO;
}
