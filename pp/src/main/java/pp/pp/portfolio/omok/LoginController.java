package pp.pp.portfolio.omok;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/ppomok")
public class LoginController {
	
	
	@Autowired
	LoginDAO dao;
	
	// 예외처리
	@ExceptionHandler(Exception.class)
	public String catcher(Exception ex, Model model) {
		ex.printStackTrace();
		model.addAttribute("msg", "잘못된 요청입니다.");
		model.addAttribute("url", "/pp/ppomok/login.do");
		return "/common/alert";
	}
	
	// 로그인 화면
	@RequestMapping("/login.do")
	public String a() {
		return "ppomok/login";
	}
	
	// 회원가입 화면
	@RequestMapping("/register.do")
	public String b() {
		return "ppomok/register";
	}
	
	@PostMapping("/insert")
	public String insert(LoginDTO dto, Model model) {
		if(dao.insert(dto)>0) {
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			model.addAttribute("url", "/pp/ppomok/login.do");
			return "/common/alert";
		} else {
			model.addAttribute("msg", "잘못된 접근입니다");
			model.addAttribute("url", "/pp/ppomok/login.do");
			return "/common/alert";
		}
	}
	
	// 아이디 중복체크만.
	@PostMapping("/check")
	@ResponseBody
	public int check(LoginDTO dto) {
		if (dao.count(dto) == 1) {
			System.out.println("중복된 아이디 존재");
			return 1;  
		} else {
			return 0; 
		}
	}
	
	// 로그인 성공 시 대기방(wait)으로
	// 로그인 실패 시 다시 로그인(login)화면으로
	@RequestMapping("/check2")
	public String check2(HttpServletRequest req, LoginDTO dto, Model model) {
		if (dao.loginCount(dto) == 1) {
			HttpSession sess = req.getSession();
			sess.setAttribute("id", dto.getId());
			model.addAttribute("msg", sess.getAttribute("id")+"님 안녕하세요 : )");
			model.addAttribute("url", "/pp/ppomok/wait");
			return "/common/alert";
		} else {
			model.addAttribute("msg", "회원이 아닙니다.");
			model.addAttribute("url", "/pp/ppomok/login.do");
			return "/common/alert";
		}
	}
	
	// 승 숫자에 따른 탑10 랭킹. 
	@RequestMapping("/rankers.do")
	@ResponseBody
	public List<LoginDTO> rankers(){
		List<LoginDTO> rankers = dao.rankers();
		return rankers;
	}
	
	@PostMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id");
		return "ppomok/login";
	}
}
