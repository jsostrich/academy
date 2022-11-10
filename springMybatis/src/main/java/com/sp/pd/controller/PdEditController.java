package com.sp.pd.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sp.pd.model.PdDTO;
import com.sp.pd.model.PdService;

@Controller
@RequestMapping("/pd/pdEdit.do")
public class PdEditController {
	private PdService pdService;
	
	public PdEditController() {
		System.out.println("생성자 호출 : PdEditController");
	}
	
	//DI - setter에 의한 종속객체 주입
	public void setPdService(PdService pdService) {
		this.pdService = pdService;
		System.out.println("setter 호출 PdEditController : setPdService");
	}

	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView pdEdit(@RequestParam (defaultValue = "0")int no) {
		//1
		System.out.println("제품 수정 페이지 보기, no = "+no);
		
		//2
		PdDTO dto = null;
		try {
			dto = pdService.selectByNo(no);
			System.out.println("수정 할 정보 dto = "+dto);
		}catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//3
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("/pd/pdEdit");
		//4
		return mav;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView pdEdit_ok(@ModelAttribute PdDTO dto) {
		//1
		System.out.println("제품 수정 시작, 파라미터 dto = "+dto);
		//2
		String msg="상품 수정 실패!", url="/pd/pdEdit.do?no="+dto.getNo();
		try {
			int cnt = pdService.updatePd(dto);
			if(cnt >0) {
				msg="수정 완료";
				url="/pd/pdDetail.do?no="+dto.getNo();
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		//3
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url",url);
		mav.setViewName("/common/message");
		//4
		return mav;
	}
	
}
