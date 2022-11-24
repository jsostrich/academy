package pack.spring.basic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	//회원 가입  창//
	@RequestMapping(value="/create", method = RequestMethod.GET)
	public ModelAndView create() {
		
		//Model 관련내용(DAO, DTO, VO, Service, ...)
		return new ModelAndView("member/create");
	}

	@Autowired
	MemberService memberService;
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object>map) {
		
		ModelAndView mav = new ModelAndView();
		
		String no = this.memberService.create(map);
		
		if(no == null) {
			mav.setViewName("redirect:/create");
		}else {
			mav.setViewName("redirect:/detail?no="+no);
		}
		return mav;
	}
	//회원 가입 창 끝 //
	
	//회원정보 상세 보기 시작//
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object>map) {
		Map<String, Object> detailMap = this.memberService.detail(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data",detailMap);
		String no = map.get("no").toString();
		mav.addObject("no",no);
		mav.setViewName("/member/detail");
		return mav;
	}
	//회원정보 상세 보기 끝//
	
	//전체 회원 정보 보기 시작//
	@RequestMapping(value = "/list")
	public ModelAndView list(@RequestParam Map<String, Object>map) {
		
		List<Map<String, Object>> list = this.memberService.list(map);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("data",list);
		mav.setViewName("/member/list");
		
		return mav;
	}
	//전체 회원 정보 보기 끝//
	
	//인덱스 페이지(=메인페이지) 시작
	@RequestMapping(value = "/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		return mav;
	}
	// 인덱스 페이지 끝 //
	
	
	
	
	
}
