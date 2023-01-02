package pp.pp.portfolio.comment;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentConteroler {
	@Autowired
	CommentService service;
	
	//글목록
	@RequestMapping("/index.do")
	public String index(HttpServletRequest req) {
		req.setAttribute("data", service.list());
		System.out.println();
		return "portfolio/comment/index";
	}
	@RequestMapping("/view.do")
	public String view(HttpServletRequest req,CommentVO vo) {
		req.setAttribute("data", service.view(vo.getNo()));
		return "portfolio/comment/view";
	}
	//댓글
	@RequestMapping("/list.do")
	public String commentList(Model model,CommentVO vo) {
		model.addAttribute("data",service.commentList(vo));
		return "/portfolio/comment/comment";
	}
	
	@RequestMapping("/insert.do")
	public String insert(CommentVO vo) {
		service.insert(vo);
		return "redirect:/comment/view.do?no="+vo.getBoardno();
	}
	
	@RequestMapping("/commentInsert.do")
	public String commentInsert(CommentVO vo) {
		service.commentInsert(vo);
		return "redirect:/comment/view.do?no="+vo.getBoardno();
	}
	
	@PostMapping("/delete.do")
	public String delete(CommentVO vo) {
		service.delete(vo);
		return "/portfolio/comment/comment";
	}
}
