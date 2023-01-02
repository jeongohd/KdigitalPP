package pp.pp.portfolio.gallery;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

	@Autowired
	GalleryService service;
	
	@GetMapping("/index.do")
	public String index(Model model,GalleryVO vo) {
		model.addAttribute("data", service.galleryList(vo));
		return "portfolio/gallery/index";
	}
	@ResponseBody
	@GetMapping("view.do")
	public GalleryVO view(int no) {
		return service.view(no);
	}
	@GetMapping("/write.do")
	public String insert() {
		return "portfolio/gallery/write";
	}
	@PostMapping("/writeProcess.do")
	public String writeProcess(GalleryVO vo,@RequestParam MultipartFile filename, HttpServletRequest req) {
		if(!filename.isEmpty()) {
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf("."));
			String real = new Date().getTime()+ext;
			
			String pate = req.getRealPath("/img/gallery/");
			try {
				filename.transferTo(new File(pate+real));
			}catch(Exception e) {}
			
			vo.setFilename_org(org);
			vo.setFilename_real(real);
		}
		service.insert(vo);
		return "redirect:/gallery/index.do";
	} 
}
