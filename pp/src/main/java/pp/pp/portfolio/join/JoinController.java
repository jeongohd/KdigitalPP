package pp.pp.portfolio.join;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	JoinService service;
	
	@GetMapping("login.do")
	public String login() {
		return "portfolio/join/login";
	}
	@PostMapping("login.do")
	public String login(JoinVO vo) {
		service.login(vo);
		return "portfolio/join/index";
	}
	@GetMapping("signUp.do")
	public String signUp() {
		return "portfolio/join/signUp";
	}
	@PostMapping("signUpProcess.do")
	public String signUpProcess(JoinVO vo) {
		service.insert(vo);
		return "portfolio/join/login";
	}
	@GetMapping("idCheck.do")
	public void idCheck(@RequestParam String id,HttpServletResponse res) throws Exception {
		int count = service.idCheck(id);
		boolean r = false;
		if(count == 1) r=true;
		PrintWriter out = res.getWriter();  // HttpServletResponse 에서 getWriter 사용시 무조건예외처리!
		out.print(r);
		out.flush();	
	}
	@GetMapping("findId.do")
	public String findId() {
		return "portfolio/join/findId";
	}
	@ResponseBody
	@PostMapping("findId.do")
	public String findId(JoinVO vo) {
		return service.findId(vo);
	}
//	@PostMapping("findId.do")
//	public void findId(HttpServletResponse res,JoinVO vo) throws Exception {
//		PrintWriter id = res.getWriter();
//		id.print(service.findId(vo));
//		id.flush();
//	}
	
	@GetMapping("findPwd.do")
	public String findPwd() {
		return "portfolio/join/findPwd";
	}
	@ResponseBody
	@PostMapping("findPwd.do")
	public String findPwd(JoinVO vo,@RequestParam String email) {
		JoinVO pwd = service.findPwd(vo,email);
		if(pwd == null) {
			return null;
		}
		service.findPwd(vo,email);
		return "success";
		
	}
	
}
