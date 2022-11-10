package com.sp.pd.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sp.pd.model.PdDTO;
import com.sp.pd.model.PdService;

@Controller
public class PdDetailController {
	private PdService pdService;
	
	
	public PdDetailController() {
		System.out.println("생성자 호출 : PdDetailController");
	}

	//DI - setter에 의한 종속 객체 주입
	public void setPdService(PdService pdService) {
		this.pdService = pdService;
		System.out.println("Setter 호출 - PdDetailController: setPdService 생성");
	}

	@RequestMapping("/pd/pdDetail.do")
	public ModelAndView pdDetail(@RequestParam(defaultValue = "0") int no) {
		//1
		System.out.println("상품상세보기");
		//2
		PdDTO dto = null;
		try {
			dto =pdService.selectByNo(no);
			System.out.println("상품 상세보기 결과 pdDto = "+dto);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		//3
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto",dto);
		mav.setViewName("/pd/pdDetail");
		//4
		return mav;
	}
}
