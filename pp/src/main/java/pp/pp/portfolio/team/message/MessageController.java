package pp.pp.portfolio.team.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {
	
	@Autowired
	MessageService service;
	
	//=================================정현===============================
	@GetMapping("/message/sendMessage.do")
	@ResponseBody
	public int sendMessage(MessageVO vo) {
		return service.insert(vo);
	}
	
	
	//=================================정현===============================

	
	// 정길
	@RequestMapping("/message/SM")
	public String sendM(MessageVO vo) {
		service.insert(vo);
		return "ppteam/member/myPage";
	}
	
	
}
