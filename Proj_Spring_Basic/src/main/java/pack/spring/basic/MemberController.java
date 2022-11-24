package pack.spring.basic;

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
	
	
}
