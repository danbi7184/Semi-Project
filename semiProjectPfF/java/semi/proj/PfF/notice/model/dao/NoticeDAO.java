package semi.proj.PfF.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.common.model.vo.Picture;
import semi.proj.PfF.notice.model.vo.Notice;

@Repository
public class NoticeDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", rowBounds);
	}

//	public ArrayList<Picture> selectNoticePictureList(SqlSessionTemplate sqlSession) {
//		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticePictureList");
//	}

	
}
