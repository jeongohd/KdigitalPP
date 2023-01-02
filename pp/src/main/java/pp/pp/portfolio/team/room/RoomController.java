package pp.pp.portfolio.team.room;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import pp.pp.portfolio.team.member.MemberVO;
import pp.pp.portfolio.team.reply.ReplyService;
import pp.pp.portfolio.team.reply.ReplyVO;

@Controller
@RequestMapping("/room")
public class RoomController {
	@Autowired
	RoomService rservice;
	@Autowired
	ReplyService rpservice;

	// 모임방상세보기
//	@RequestMapping("/view")
//	public String view(RoomVO vo, Model model) {
//		model.addAttribute("view", rservice.view(vo.getRoom_no()));
//		System.out.println("여행제목"+vo.getRoom_title());
//		return "room/room";
//	}

	// 모임방채팅리스트
	@RequestMapping("/chatlist")
	public String chatlist(ReplyVO vo, Model model, MemberVO mvo) {
		model.addAttribute("list", rpservice.list(vo));
		return "ppteam/room/chat";
	}

	// 모임방채팅글쓰기
	@RequestMapping("/chatWrite")
	public String chatWrite(ReplyVO vo) {
		rpservice.insert(vo);

		System.out.println("*************방번호" + vo.getRoom_no());

		return "redirect:/room/room.do?room_no=" + vo.getRoom_no() + "&member_no=" + 1;
	}

	//=================================정현===============================
	@PostMapping("/write.do")
	@ResponseBody
	public int writeRoom(RoomVO vo) {
		return rservice.makeRoom(vo);
	}

	@GetMapping("/room.do")
	public String enterRoom(RoomVO vo, HttpSession sess, Model model) {
		//세션에 저장되어있는 로그인 한 사람의 member_no를 roomVO의 room_participant_no번호로 set해서 방에 참가시킴
		 MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
		 
		 
		 vo.setRoom_participant_no(mvo.getMember_no());
		 //System.out.println(vo.getRoom_participant_no());

		// no=[ ] 로 파라미터 넘어오니 받고 session에 있는 로그인 정보 를 이용해서 디비에 참여자 추가시켜야함.
		int r = rservice.checkRoom(vo);
		//아직 참여하지 않은 방이라면 DB에 insert
		if (r == 0) {
			rservice.enterRoom(vo);
		}
		// if문으로 proom 디비로 로그인정보가 방넘버 만든이랑 같으면 proommember 디비에 넣지 말고 바로 리턴시켜주면 됨.
		//이미 참여 했다면 DB insert 생략하고, 바로 방으로 입장시켜줌 
		
		//진경-방상세보기jsp에 등록된 내용 넘겨줌
		model.addAttribute("view", rservice.view(vo.getRoom_no()));
		return "ppteam/room/room";
	}

//	 @PostMapping("/room.do")
//	 @ResponseBody 
//	 public Integer roomCheck(RoomVO vo, HttpSession sess) {
//	 
//	 MemberVO mvo = (MemberVO)sess.getAttribute("loginInfo");
//	 vo.setRoom_participant_no(mvo.getMember_no());
//	 
//	 // no=[ ] 로 파라미터 넘어오니 받고 session에 있는 로그인 정보 를이용해서 디비에 참여자 추가시켜야함. 
//	 int r = rservice.checkRoom(vo);
//	 
//	 return r; 
//	 }
//	 


	@PostMapping("/pwdCheck.do")
	public String pwdCheck(RoomVO vo) {
		
		int r = rservice.pwdCheck(vo);
		//비밀번호 일치하면 해당 방으로 입장
		if (r == 1) {
			return "redirect:/room/room.do?room_no=" + vo.getRoom_no();
		} else { // 일치하지 않으면 다시 목록으로
			return "redirect:/board/view.do";
		}

	}
	
	//=================================정현===============================

}
