package semi.proj.PfF.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.common.model.vo.Picture;
import semi.proj.PfF.notice.model.dao.NoticeDAO;
import semi.proj.PfF.notice.model.vo.Notice;

@Service("nService")
public class NoticeService {
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private NoticeDAO nDAO;

	public int getListCount() {
		return nDAO.getListCount(sqlSession);
	}

	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDAO.selectNoticeList(sqlSession, pi);
	}

//	public ArrayList<Picture> selectNoticePictureList() {
//		return nDAO.selectNoticePictureList(sqlSession);
//	}

	
	

	
}
