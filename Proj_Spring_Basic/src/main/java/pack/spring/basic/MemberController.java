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
		
		String memberid = this.memberService.create(map);
		
		if(memberid == null) {
			mav.setViewName("redirect:/create");
		}else {
			mav.setViewName("redirect:/detail?memberid="+memberid);
		}
		return mav;
		
	}
	
	
	
}
