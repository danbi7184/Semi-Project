package semi.proj.PfF.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.proj.PfF.member.model.dao.MemberDAO;
import semi.proj.PfF.member.model.vo.KakaoMember;
import semi.proj.PfF.member.model.vo.Member;

@Service
public class MemberService {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDAO mDAO;

	public Member login(Member login) {
		return mDAO.login(sqlSession, login);
	}

	public int enroll(Member enrollUser) {
		return mDAO.enroll(sqlSession, enrollUser);
	}

	public int checkId(String id) {
		return mDAO.checkId(sqlSession, id);
	}

	public int checkNickName(String nickname) {
		return mDAO.checkNickName(sqlSession, nickname);
	}

	public int checkEmail(String email) {
		return mDAO.checkEmail(sqlSession, email);
	}

	public KakaoMember selectKakaoMember(KakaoMember loginUser) {
		return mDAO.selectKakaoMember(sqlSession, loginUser);
	}

	public int enrollKakao(KakaoMember loginUser) {
		return mDAO.enrollKakao(sqlSession, loginUser);
	}
    
	public String findIdResult(String email) {
		return mDAO.findIdResult(sqlSession, email);
	}

	public int findPwdResult(HashMap<String, String> map) {
		return mDAO.findPwdResult(sqlSession, map);
	}

	public int updatePw(HashMap<String, String> map) {
		return mDAO.updatePw(sqlSession, map);
	}
	
	public int updateMyInfoNickName(HashMap<String, String> map) {
		return mDAO.updateMyInfoNickName(sqlSession, map);
	}

	public int updateMyInfoEmail(HashMap<String, String> map) {
		return mDAO.updateMyInfoEmail(sqlSession, map);
	}
	
	public ArrayList<HashMap<String, Object>> selectMyList(String id) {
		return mDAO.selectMyList(sqlSession, id);
	}

	public int deleteLeaveMember(String id) {
		return mDAO.deleteLeaveMember(sqlSession, id);
	}

	public int checkNickname(String nickName) {
		return mDAO.checkNickname(sqlSession, nickName);
	}

	public int updateMyInfoPwd(String id) {
		return mDAO.updateMyInfoPwd(sqlSession, id);
	}
	
	public int updateKakaoInfo(KakaoMember km) {
		return mDAO.updateKakaoInfo(sqlSession, km);
	}
}
