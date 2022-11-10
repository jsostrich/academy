package com.sp.pd.controller;

import java.sql.SQLException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sp.pd.model.PdDTO;
import com.sp.pd.model.PdService;

@Controller
@RequestMapping(value = "/pd/pdDelete.do")
public class PdDeleteController {
	private PdService pdService;
	
	
	public PdDeleteController() {
		System.out.println("생성자 호출 PdDeleteController");
	}

	//DI - setter에 의한 종속객체 주입
	public void setPdService(PdService pdService) {
		this.pdService = pdService;
		System.out.println("setter 호출자 생성 ! PdDeleteController: setPdService");
	}


	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView pdDelete(@RequestParam (defaultValue = "0")int no) {
		//1
		System.out.println("삭제한다! no = "+no);
		//2
		try {
			int cnt = pdService.deletePd(no);
		}catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		//3
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/pd/pdList.do");
		//4
		return mav;
		
	}
}
