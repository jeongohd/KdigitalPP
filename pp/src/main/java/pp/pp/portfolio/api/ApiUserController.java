package pp.pp.portfolio.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApiUserController {
	
	//화면출력 선생님project용
	@GetMapping("/user/board/list.do")
	public String page() {
		return "api/view";
	}
	
	//화면출력 포폴용
	@GetMapping("/pp/user/board/list.do")
	public String pppage() {
		return "portfolio/api/view";
	}

}
