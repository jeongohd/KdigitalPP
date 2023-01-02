package pp.pp.portfolio.team.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class teamCommentController {
	@Autowired
	CommentService service;
	
	@Autowired
	teamCommentMapper mapper;
	
	//댓글 리스트
	@GetMapping("/comment/list.do")
	public String list(CommentVO vo, Model model) {
		model.addAttribute("comment", service.index(vo));
		return "ppteam/common/comment";
	}
	
	// 댓글 입력
	@GetMapping("/comment/insert.do")
	public String insert(CommentVO vo, Model model) {
		model.addAttribute("result", service.insert(vo));
		return "ppteam/common/result";
	}
	
	// 댓글 삭제
	@GetMapping("/comment/delete.do")
	public String delete(CommentVO vo, Model model) {
		model.addAttribute("result", service.delete(vo.getReply_no()));
		return "ppteam/common/result";
	}
	
	//댓글 수정
	@RequestMapping("/comment/modify.do")
	@ResponseBody
	public int modify(CommentVO vo, Model model) {
		if(service.modify(vo)) {
			return 1; 
		} else {
			return 0;
		}
	}
	//=====================================답글======================
	
	//답글 리스트
	@GetMapping("/comment/commentList.do")
	@ResponseBody
	public List commentList(CommentVO vo, Model model) {
		return service.commentList(vo);
	}
	
	//답글 작성
	@GetMapping("/comment/reply.do")
	@ResponseBody
	public String reply(CommentVO vo, Model model) {
		if(service.reply(vo)) {
			System.out.println("성공 : ###################################");
			return "success";
		} else {
			System.out.println("실패 : !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			return "fail";
		}
		
	}
}
