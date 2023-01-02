package pp.pp.portfolio.board;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	//리스트
	@RequestMapping("/board.do")
	public String index(BoardVO vo,Model model) {
		model.addAttribute("data",service.index(vo));
		return "portfolio/board/index";
	}
	//글쓰기 화면
	@RequestMapping("/write.do")
	public String write() {
		return "portfolio/board/write";
	}
	//글쓰기
	@RequestMapping("/writeProcess.do")
	public String insert(BoardVO vo,@RequestParam MultipartFile filename, HttpServletRequest req) {
		if(!filename.isEmpty()) {
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime()+ext;
			
			String pate = req.getRealPath("/upload/");
			try {
				filename.transferTo(new File(pate+real));
			}catch(Exception e) {}
			
			vo.setFilename_org(org);
			vo.setFilename_real(real);
		}
		service.insert(vo);
		return "redirect:board.do";
	}
	//글상세보기
	@RequestMapping("/view.do")
	public String view(BoardVO vo,Model model) {
		BoardVO data= service.view(vo.getNo());
		model.addAttribute("data",data);
		return "portfolio/board/view";
	}
	//글수정화면
	@RequestMapping("/edit.do")
	public String edit(BoardVO vo,Model model) {
		model.addAttribute("data",service.view(vo.getNo()));
		return "portfolio/board/edit";
	}
	//글수정
	@RequestMapping("/editProcess.do")//파일삭제와 파일수정은 다른 처리!! if문 따로 작성
	public String editeProcess(BoardVO vo,@RequestParam MultipartFile filename, HttpServletRequest req) {	
		//파일삭제 체크를 했을때
		if(vo.getFilename_chk() == 1) {
			String fDirectory = req.getServletContext().getRealPath("/upload");
			File file = new File(fDirectory + File.separator + vo.getFilename_real());
				if(file.exists()) {
					file.delete();
				}
		}
		//글수정 + 파일추가 할때
		if(vo.getFilename_real() == null)  { 
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime()+ext;
			
			String pate = req.getRealPath("/upload/");
			try {
				filename.transferTo(new File(pate+real));
			}catch(Exception e) {}	
			vo.setFilename_org(org);
			vo.setFilename_real(real);
 		}
 		service.update(vo);
 		
		return "redirect:view.do?no="+vo.getNo();
	}
	//글삭제
	@RequestMapping("/delete.do")
	public String delete(BoardVO vo,Model model) {
		service.delete(vo.getNo());
		return "redirect:board.do";
	}

}
