package pp.pp.portfolio.team.board;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import pp.pp.portfolio.team.map.MapMapper;
import pp.pp.portfolio.team.member.MemberService;
import pp.pp.portfolio.team.member.MemberVO;
import pp.pp.portfolio.team.message.MessageVO;
import pp.pp.portfolio.team.room.RoomVO;
import pp.pp.portfolio.team.util.CategoryVO;
import pp.pp.portfolio.team.util.FileVO;
import pp.pp.portfolio.team.util.UtilService;

@Controller
@RequestMapping("/board")
public class teamBoardController {
	
	@Autowired
	BoardService service;
	
	@Autowired
	teamBoardMapper tbm;
	
	@Autowired
	MemberService mService;

	@Autowired
	UtilService uservice;
	
	@Autowired
	MapMapper mapper;
	

	// +++진귀
	@RequestMapping("/getAllCourse.do")
	@ResponseBody  // board_no넘어옴
	public Map vview(BoardVO bvo) {
		return service.updateView(bvo);
	}
	
	// 진귀++++++
	
	
	////////////////////////////////진경시작////////////////////////////////////////
	//여행코스 글쓰기화면
	@GetMapping("/travelWrite.do")
	public String write(Model model) {
		model.addAttribute("category",uservice.writeCategory());
		return "ppteam/travelboard/write";
	}
	
	// 여행코스 글쓰기 from 진경
	@PostMapping("/insert.do")
	public String insert(BoardVO bvo,CategoryVO cvo,FileVO fvo,@RequestParam MultipartFile[] filename, HttpServletRequest req) {
		service.insert(bvo);
		uservice.insert(cvo,bvo);
		uservice.fileupload(fvo, filename, req,bvo);
		uservice.regionInsert(cvo);
		int[] a =cvo.getHashtag_no_arr();
		return "redirect:/board/main.do";
	}
	   //여행코스 글쓰기 수정화면  // board_no넘어옴
	   @RequestMapping("/updateView.do")
	   public String updateView(BoardVO bvo,HttpSession sess,Model model) {
	      MemberVO mvo =(MemberVO)sess.getAttribute("loginInfo");
	      bvo.setMember_no(mvo.getMember_no());
	      model.addAttribute("category",uservice.writeCategory()); //카테고리전체 리스트 화면출력
	      model.addAttribute("bvo",service.updateView(bvo));
	      return "ppteam/travelboard/update";
	   }
	   //여행코스 글쓰기 수정
		@RequestMapping("/edit.do")
		public String update(BoardVO bvo,CategoryVO cvo) throws UnsupportedEncodingException {
			String encodedParam = URLEncoder.encode("여행게시판", "UTF-8");
			service.titcouEdit(bvo);//타이틀,코스삭제후
			uservice.hashRegionEdit(cvo);//태그,지역삭제후
			uservice.regionInsert(cvo);//등록
			uservice.insert(cvo,bvo);//태그재등록
			System.out.println("여행코스 넘어오는지 확인"+bvo.getCourse_no());
			return "redirect:/board/view.do?board_no="+bvo.getBoard_no()+"&board_name="+encodedParam;
	   }
	   //지역나오게
	   @RequestMapping("/region_detail")
	   @ResponseBody
	   public Map regionDatail(String rs) {
	      return uservice.regionDetail(rs);
	   }
	////////////////////////////////진경끝////////////////////////////////////////
	
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	

	// 마이페이지 내가 쓴 게시글 보기
	@RequestMapping("/myList1")
	public String mylist1(BoardVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList1(vo, sess));
		return "ppteam/board/myList1";
	}
	
	// 마이페이지 내가 쓴 댓글 보기
	@PostMapping("/myList2")
	public String mylist2(BoardVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList2(vo, sess));
		return "ppteam/board/myList2";
	}
	
	// 마이페이지 내가 좋아요 누른 게시글 보기
	@PostMapping("/myList3")
	public String mylist3(BoardVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList3(vo, sess));
		return "ppteam/board/myList3";
	}
	
	// 마이페이지 내가 받은 쪽지 보기
	@PostMapping("/myList4")
	public String mylist4(MessageVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList4(vo, sess));
		return "ppteam/board/myList4";
	}
	
	// 마이페이지 내가 보낸 쪽지 보기
	@PostMapping("/myList5")
	public String mylist5(MessageVO vo, Model model, HttpSession sess) {
		model.addAttribute("data", service.myList5(vo, sess));
		return "ppteam/board/myList5";
	}
	
	// 마이페이지 내가 참여한 채팅방 보기
	@PostMapping("/myList6")
	public String mylist6(RoomVO vo, Model model, HttpSession sess) {
		model.addAttribute("list", service.myList6(vo, sess));
		return "ppteam/board/myList6";
	}
	
	
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	
	
	// main + 정길 수정.
	@GetMapping("/main.do")
	public String mainGet(Model model, BoardVO vo, MessageVO mvo, HttpSession sess, HttpServletRequest req) {
		model.addAttribute("data",service.index(vo));
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		if (vo1 != null) {
			int num = vo1.getMember_no();
			mvo.setReceive_member_no(num); 
			int num2 = mService.alarmForMessage(mvo); // 내가 읽지 않은 쪽지 불러오기.
			String result = String.valueOf(num2); 
			model.addAttribute("UnreadMsgs", result);
			return "ppteam/board/main";
		}
		return "ppteam/board/main";
	}
	
	@GetMapping("/posts.do")
	public String posts(Model model, BoardVO vo, MessageVO mvo, HttpSession sess, HttpServletRequest req ) {
		System.out.println("vo.getStag() : "+vo.getStag());
		System.out.println("vo.getStype() : "+vo.getStype());
		System.out.println("vo.getSword() : "+vo.getSword());
		System.out.println("vo.getStag() : "+req.getParameter("stag"));
		System.out.println("vo.getStype() : "+req.getParameter("stype"));
		System.out.println("vo.getSword() : "+req.getParameter("stag"));
		model.addAttribute("data",service.index(vo));
		return "ppteam/board/main2";
	}
	
	
	
	
	//=================================정현===============================
	@GetMapping("/view.do")
	public String view(BoardVO vo, RoomVO rvo, Model model, HttpSession sess) {
		MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
		//글 보고있는 사람(로그인 한 사람)
		if(mvo!= null) {
			vo.setLogin_member_no(mvo.getMember_no());
		}
		Map map = new HashMap();
		map = service.view(vo);
		model.addAttribute("data", map);
		model.addAttribute("pic", tbm.getImgOfWriter(vo.getBoard_no()));
		return "ppteam/board/view";
	}
	
	@PostMapping("/initBoardLike.do")
	@ResponseBody
	public Integer boardLike(BoardVO vo, Integer likeCheck) {
		//
		if(likeCheck==0) {
			service.clickBoardLike(vo);
			return 1;
		} else if(likeCheck > 0) {
			service.likeBack(vo);
			return 0;
		}
		return service.likeCheck(vo);
	}
	
	@PostMapping("/clickDislike.do")
	@ResponseBody
	public Integer boardDislike(BoardVO vo, Integer dislikeCheck) {
		if(dislikeCheck==0) {
			service.clickDislike(vo);
			return 1;
		} else if(dislikeCheck > 0) {
			service.dislikeBack(vo);
			return 0;
		}
		return service.dislikeCheck(vo);
	}
	
	@PostMapping("/viewDelete.do")
	public String viewDelete(BoardVO vo, Model model) {
		if(service.delete(vo)==1) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "/pp/board/main.do");
			return "ppteam/common/alert";
		} else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			return "ppteam/common/alert";
		}
	}
	//=================================정현===============================
}
