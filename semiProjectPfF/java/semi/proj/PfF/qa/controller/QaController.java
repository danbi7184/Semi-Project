package semi.proj.PfF.qa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import semi.proj.PfF.qa.model.service.QaService;
import semi.proj.PfF.qa.model.vo.Qa;

@Controller
public class QaController {
	
	@Autowired
	private QaService qService;
	
	@RequestMapping("qaView.qa")
	public String qaView() {
		return "qaList";
	}
	
	@RequestMapping("writeQA.qa")
	public String writeQA() {
		return "qaInsert";
	}
	
	@RequestMapping("insertQA.qa")
	public String insertQA(@ModelAttribute Qa qa) {
		System.out.println(qa);
		return null;
	}
}
