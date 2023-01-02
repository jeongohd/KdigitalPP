package pp.pp.portfolio.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	@Autowired
	ReplyService service;
	
	//리스트
	@RequestMapping("/index.do")
	public String index(ReplyVO vo,Model model) {
		model.addAttribute("data",service.index(vo));
		return "portfolio/reply/index";
	}
	//글쓰기 화면
	@RequestMapping("/write.do")
	public String write() {
		return "portfolio/reply/write";
	}
	//글쓰기
	@RequestMapping("/writeProcess.do")
	public String insert(ReplyVO vo) {
		service.insert(vo);
		return "redirect:index.do";
	}
	//글상세보기
	@RequestMapping("/view.do")
	public String view(ReplyVO vo,Model model) {
		ReplyVO data= service.view(vo.getNo());
		model.addAttribute("data",data);
		return "portfolio/reply/view";
	}
	//글수정화면
	@RequestMapping("/edit.do")
	public String edit(ReplyVO vo,Model model) {
		model.addAttribute("data",service.view(vo.getNo()));
		return "portfolio/reply/edit";
	}
	//글수정
	@RequestMapping("/editProcess.do")
	public String editeProcess(ReplyVO vo) {	
 		service.update(vo);
		return "redirect:view.do?no="+vo.getNo();
	}
	//글삭제
	@RequestMapping("/delete.do")
	public String delete(ReplyVO vo,Model model) {
		service.delete(vo.getNo());
		return "redirect:index.do";
	}
	@RequestMapping("/reply.do")
	public String reply(ReplyVO vo,Model model) {
		model.addAttribute("data", service.view(vo.getNo()));
		System.out.println("12123123123132"+service.view(vo.getNo()));
		return "portfolio/reply/reply";
	}
	//답글등록
	@RequestMapping("/replyProcess.do")
	public String replyProcess(ReplyVO vo) {
		service.reply(vo);
		return "portfolio/reply/index";
	}

}
