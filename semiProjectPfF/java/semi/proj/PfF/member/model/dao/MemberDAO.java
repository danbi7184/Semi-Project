package semi.proj.PfF.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.proj.PfF.member.model.vo.KakaoMember;
import semi.proj.PfF.member.model.vo.Member;

@Repository
public class MemberDAO {

	public Member login(SqlSessionTemplate sqlSession, Member login) {
		return sqlSession.selectOne("memberMapper.login", login);
	}

	public int enroll(SqlSessionTemplate sqlSession, Member enrollUser) {
		return sqlSession.insert("memberMapper.enroll", enrollUser);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.checkId", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.checkNickName", nickname);
	}

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmail", email);
	}

	public KakaoMember selectKakaoMember(SqlSessionTemplate sqlSession, KakaoMember loginUser) {
		return sqlSession.selectOne("memberMapper.selectKakao", loginUser);
	}

	public int enrollKakao(SqlSessionTemplate sqlSession, KakaoMember loginUser) {
		return sqlSession.insert("memberMapper.enrollKakao", loginUser);
	}
	
	public String findIdResult(SqlSessionTemplate sqlSession, String email) {
	    return sqlSession.selectOne("memberMapper.findIdResult", email);
	}

	public int findPwdResult(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.findPwdResult", map);
	}

	public int updatePw(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updatePw", map);
	}
	
	public int updateMyInfoNickName(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updateMyInfoNickName", map);
	}

	public int updateMyInfoEmail(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("memberMapper.updateMyInfoEmail", map);
	}
	
	public ArrayList<HashMap<String, Object>> selectMyList(SqlSessionTemplate sqlSession, String id) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyList", id);
	}

	public int deleteLeaveMember(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.deleteLeaveMember", id);
	}

	public int checkNickname(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickname", nickName);
	}

	public int updateMyInfoPwd(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.update("memberMapper.updateMyInfoPwd", id);
	}
	
	public int updateKakaoInfo(SqlSessionTemplate sqlSession, KakaoMember km) {
		return sqlSession.insert("memberMapper.updateKakaoInfo", km);
	}
}
