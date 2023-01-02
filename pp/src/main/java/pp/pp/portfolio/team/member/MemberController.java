package pp.pp.portfolio.team.member;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import pp.pp.portfolio.team.board.BoardService;
import pp.pp.portfolio.team.message.MessageVO;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	
	@Autowired
	MemberService service;
	
	@Autowired
	BoardService bService;
	
	
	@ExceptionHandler(Exception.class)
	public String catcher(Exception ex, Model model) {
		ex.printStackTrace();
		model.addAttribute("msg", "잘못된 요청입니다.");
		model.addAttribute("url", "/pp/ppbank/accountMain");
		return "/common/alert";
	}

	// 회원가입화면
	@GetMapping("/register")
	public String insert() {
		return "ppteam/member/register";
	}
	
	// 입력하지 않거나 틀린 정보를 입력 후, 회원가입을 클릭했을 때
	@PostMapping("/register")
	public String insert(MemberVO vo, Model model, 
			@RequestParam MultipartFile filename, 
			HttpServletRequest req) {
		
		String emailT = vo.getEmail() + '@'+ vo.getEmail2();
		vo.setEmail(emailT);
		
		// 중복아이디 가입불가
		int countI = service.checkId(vo);
		if (countI == 1) {
			model.addAttribute("msg", "동일한 아이디가 있어 회원가입이 불가능합니다.");
			return "ppteam/common/alert";
		}
		
		// 두 패스워드가 다를 시 가입불가
		if (!vo.getPw1().equals(vo.getPwd())) {
			model.addAttribute("msg", "비밀번호가 같지 않아 회원가입이 불가능합니다.");
			return "ppteam/common/alert";
		}
		
		// 중복이메일 가입불가
		int countE = service.checkEmail(vo);
		if(countE == 1) {
			model.addAttribute("msg", "동일한 이메일이 있어 회원가입이 불가능합니다.");
			return "ppteam/common/alert";
		}
		
		if (vo.getId().equals("") || vo.getEmail().equals("") || vo.getEmail2().equals("") ) {
			model.addAttribute("msg", "입력하지 않은 회원정보가 있습니다.");
			return "ppteam/common/alert";
		}
		
		// 파일등록.
		if (!filename.isEmpty()) {
			// 파일명 구하기
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf(".")); // 확장자
			String real = new Date().getTime()+ext;
			// 파일저장
			String path = req.getRealPath("/img/");
			try {
				filename.transferTo(new File(path+real));
			} catch (Exception e) {}
			
			vo.setM_filename_org(org);
			vo.setM_filename_server(real);
		} else {
			vo.setM_filename_server("123.png");
		}
		
		if (service.register(vo)) {
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			model.addAttribute("url", "/pp/board/main.do");
			return "ppteam/common/alert";
		} else {
			model.addAttribute("msg", "가입할 회원정보를 다시 한 번 확인해주세요.");
			return "ppteam/common/alert";
		}
	}
	
	// 아이디 중복체크
	@PostMapping("/checkId")
	@ResponseBody
	public int count1(MemberVO vo, @RequestParam String id) {
		vo.setId(id);
		int count = service.checkId(vo);
		if(count == 1) {
			return count;
		} else {
			return 0;
		}
	}
	
	// 이메일 중복체크
	@PostMapping("/checkEmail")
	@ResponseBody
	public int count2(MemberVO vo, @RequestParam String email, @RequestParam String email2) {
		String emailT = email + '@'+ email2;
		vo.setEmail(emailT);
		int count = service.checkEmail(vo);
		if(count == 1) {
			return count;
		} else {
			return 0;
		}
	}
	
	// 로그인
	@GetMapping("/login")
	public String login() {
		return "ppteam/member/login";
	}
	
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpSession sess, Model model, MessageVO mvo) {
		if(service.loginCheck(vo, sess)) {
			MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
			model.addAttribute("msg",  vo1.getNickname() + " 님 안녕하세요 : ) ");
			model.addAttribute("url", "/pp/board/main.do");
			return "ppteam/common/alert";
		} else {
			model.addAttribute("msg", "아이디 혹은 비밀번호가 틀립니다.");
			return "ppteam/common/alert";
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(Model model, HttpServletRequest req) {
		HttpSession sess= req.getSession();
		sess.invalidate(); // 세션객체에 저장된 값 모두 초기화. 
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/pp/board/main.do");
		return "ppteam/common/alert";
	}
	
	// 회원정보수정화면
	@GetMapping("/editMemberInfo") 
	public String editUserInfo() {
		return "ppteam/member/editMemberInfo";
	}
	
	// 회원정보수정처리
	@PostMapping("/editUserInfo")
	public String editUserInfo(MemberVO vo, 
								HttpSession sess,
								Model model, 
								@RequestParam MultipartFile filename, 
								HttpServletRequest req){
		
		vo.setEmail(vo.getEmail());
		
		// 두 패스워드가 다를 시 가입불가
		if (!vo.getPw1().equals(vo.getPwd())) {
			model.addAttribute("msg", "비밀번호가 같지 않아 수정이 불가능합니다.");
			return "ppteam/common/alert";
		}
		
		// 중복이메일 가입불가
		int countE = service.checkEmail(vo);
		if(countE == 1) {
			model.addAttribute("msg", "동일한 이메일이 있어 수정이 불가능합니다.");
			return "ppteam/common/alert";
		}
		
		if (vo.getId().equals("") || vo.getEmail().equals("") || vo.getEmail2().equals("") ) {
			model.addAttribute("msg", "입력하지 않은 회원정보가 있습니다.");
			return "ppteam/common/alert";
		}
		
		if (!filename.isEmpty()) {
			// 파일명 구하기
			String org = filename.getOriginalFilename();
			String ext = org.substring(org.lastIndexOf(".")); // 확장자
			String real = new Date().getTime()+ext;
			// 파일저장
			String path = req.getRealPath("/img/");
			try {
			filename.transferTo(new File(path+real));
			} catch (Exception e) {}
			vo.setM_filename_org(org);
			vo.setM_filename_server(real);
		} else {
			vo.setM_filename_server("123.png");
		}
		String email = vo.getEmail()+'@'+vo.getEmail2();
		vo.setEmail(email);
		if (service.editUserInfo(vo)) {
			model.addAttribute("msg",  "회원정보 수정이 완료되었습니다. 다시 로그인해주세요");
			model.addAttribute("url", "/pp/board/main.do");
//			sess.setAttribute("loginInfo", vo); // 세션에 바뀐 값 덮어쓰기.
			sess.invalidate(); // 세션객체에 저장된 값 모두 초기화. 

			return "ppteam/common/alert";
		} else {
			model.addAttribute("msg", "회원정보를 확인해 주세요");
			return "ppteam/common/alert";
		}
	}
	
	// 아이디 찾기
	@GetMapping("/findId")
	public String findId(){
		return "ppteam/member/findId";
	};
	@RequestMapping("/findId")
	public String findId(Model model, MemberVO vo) {
		MemberVO vo1 = service.findId(vo);
		if (vo1 != null) {
			model.addAttribute("result", vo1.getId());
		}
		return "ppteam/common/result";
	}
	
	// 비밀번호 찾기
	@GetMapping("/findPwd")
	public String findPwd(){
		return "ppteam/member/findPwd";
	};
	@RequestMapping("/findPwd")
	public String findPwd(Model model, MemberVO vo) {
		MemberVO vo1 = service.findPwd(vo);
		if (vo1 != null) {
			model.addAttribute("result", vo1.getId());
		}
		return "ppteam/common/result";
	}
	
	// 아이디, 비밀번호 찾기 화면
	@GetMapping("/findIdPwd")
	public String findIdPwd(){
		return "ppteam/member/findIdPwd";
	};

	// 탈퇴처리
	@PostMapping("/leave")
	public String leave(MemberVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO)sess.getAttribute("loginInfo");
		String id1 = vo1.getId();
		vo.setId(id1);
		String pwd = vo.getPwd();
		if (service.loginCheck(vo, sess)) {
			service.deleteId(vo);
			model.addAttribute("msg",  "계정 삭제가 완료되었습니다.");
			model.addAttribute("url", "/pp/board/main.do");
			sess.invalidate();
			return "ppteam/common/alert";
		} else {
			model.addAttribute("msg", "비밀번호가 맞지 않습니다.");
			return "ppteam/common/alert";
		}
	}
	
	@GetMapping("/myPage")
	public String myPage() {
		return "ppteam/member/myPage";
	}
	
	
	// 메인화면에 종 아이콘 클릭시 안읽은 쪽지내용 보기
	@PostMapping("/alarm")
	public String alarm(MessageVO vo, Model model, HttpSession sess) {
		MemberVO vo1 = (MemberVO)sess.getAttribute("loginInfo");
		int num = vo1.getMember_no();
		vo.setReceive_member_no(num);
		model.addAttribute("list", service.unreadMsgContent(vo));
		return "ppteam/board/alarm";
	}
	
	// 메인화면에 종 아이콘 클릭시 안읽은 쪽지내용 읽음처리
	@PostMapping("/readProcess")
	@ResponseBody
	public int readProcess(MessageVO vo,  HttpSession sess, Model model, HttpServletRequest req) {
		MemberVO vo1 = (MemberVO)sess.getAttribute("loginInfo");
		String[] message_noArr = req.getParameterValues("message_no");
		int count = 0;
		for (int i=0; i<message_noArr.length; i++) {
			int message_no = Integer.parseInt(message_noArr[i]);
			int num = vo1.getMember_no();
			vo.setReceive_member_no(num);
			vo.setMessage_no(message_no);
			count += service.readUpdate(vo);
		}
		if (message_noArr.length == count) {
			return 1; 
		} else {
			return 0; 
		}
	}
	
	
	@RequestMapping("/deleteProcess")
	@ResponseBody
	public int deleteProcess(Model model, HttpServletRequest req, MessageVO vo) {
		String[] message_noArr = req.getParameterValues("message_no");
		int count = 0;
		for(int i = 0; i < message_noArr.length; i++) {
			int message_no = Integer.parseInt(message_noArr[i]);
			vo.setMessage_no(message_no);
			count += service.deleteMsg(message_no);
		}
		if (message_noArr.length == count) {
			return 1;
		} else {
			return 0;
		}
	};
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	

	
	
}
