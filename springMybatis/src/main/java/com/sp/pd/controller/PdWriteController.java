package com.sp.pd.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sp.pd.model.PdDTO;
import com.sp.pd.model.PdService;

@Controller
public class PdWriteController {
	private PdService pdService;
	
	
	public PdWriteController() {
		System.out.println("생성자 호출 : PdWriterController");
	}


	//DI - Setter에 의한 종속개체 주입
	public void setPdService(PdService pdService) {
		this.pdService = pdService;
		System.out.println("setter 호출 - PdWriteController:setPdService()");
	}
	
	
	@RequestMapping(value="/pd/pdWrite.do", 
			method=RequestMethod.GET)
	public ModelAndView pdWrite() {
		//1
		System.out.println("상품 등록 화면 보여주기");
		
		//2
		//3 모델앤뷰에 저장하기
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/pd/pdWrite");
		//4
		
		return mav;
		
	}
	

	@RequestMapping(value="pd/pdWrite.do",
			method= RequestMethod.POST)
	public ModelAndView pdWrite_post(@ModelAttribute PdDTO pdDto) {
		//1 요청 파라미터 읽어오기
		System.out.println("상품 등록 처리, 파라미터 pdDto="+pdDto);
		
		//2 db작업
		try {
			int cnt = pdService.insertPd(pdDto);
			System.out.println("상품 등록 결과 cnt ="+cnt);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		//3 결과, 뷰페이지 작성
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/pd/pdList.do");
		
		//4 리턴
		return mav;
		
	}
	
	
}
