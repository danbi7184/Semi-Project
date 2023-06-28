package semi.proj.PfF.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.proj.PfF.common.Pagination;
import semi.proj.PfF.common.model.vo.PageInfo;
import semi.proj.PfF.common.model.vo.Picture;
import semi.proj.PfF.notice.model.exception.NoticeException;
import semi.proj.PfF.notice.model.service.NoticeService;
import semi.proj.PfF.notice.model.vo.Notice;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService nService;
	
	@GetMapping("noticeList.bo")
	public String noticeList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = nService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Notice> nList = nService.selectNoticeList(pi);
//		ArrayList<Picture> pList = nService.selectNoticePictureList();
				
		if(nList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("nList", nList);
//			model.addAttribute("pList", pList);
			
			return "noticeList";
		} else {
			throw new NoticeException("�������� ��ȸ�� �����Ͽ����ϴ�.");
		}	
	
	}	
}
