package pp.pp.portfolio.team.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import pp.pp.portfolio.team.message.MessageVO;
import pp.pp.portfolio.team.util.SendMail;

@Slf4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// 회원 등록
	@Override
	public boolean register(MemberVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
	
	// 아이디 중복확인
	@Override
	public int checkId(MemberVO vo) {
		return mapper.checkId(vo);
	}
	
	// 이메일 중복확인
	@Override
	public int checkEmail(MemberVO vo) {
		return mapper.checkEmail(vo);
	}
	
	// DB에 저장된 정보가 있어서 로그인 성공하면 로그인정보가 세션에 저장.
	@Override
	public boolean loginCheck(MemberVO vo, HttpSession sess) {
		boolean r = false;
		MemberVO loginInfo = mapper.checkIdPw(vo);
		if (loginInfo != null) { // 로그인 가능한 상태. 
			r = true;
			sess.setAttribute("loginInfo", loginInfo);
		}
		return r; // 로그인 불가능한 상태. 
	}
	
	// 아이디로 해당하는 개인정보 가져오기
	@Override
	public MemberVO myInfo(String id) {
		return mapper.myInfo(id);
	}
	
	// 회원정보수정
	@Override
	public boolean editUserInfo(MemberVO vo) {
		return mapper.editUserInfo(vo) > 0 ? true : false;
	}
	
	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) {
		return mapper.findId(vo);
	}
	
	// 비밀번호찾기화면에서 입력한 아이디와 이메일이 디비에 저장되어 있나 확인 후, 임시비밀번호로 업데이트.
	@Override
	public MemberVO findPwd(MemberVO vo) {
		MemberVO vo1 = mapper.findPwd(vo);
		if (vo1 != null) {
			// 임시비밀번호 생성
			// 영문 두 자리, 숫자 두 자리
			String temp ="";
			for (int i=0; i < 2; i++) { 
				temp += (char)(Math.random()*26 + 65); // 26은 대문자만 나오게 하려고, 65부터 대문자 A
			}
			for (int i=0; i < 2; i++) { 
				temp += (int)(Math.random()*9);
			}
			vo1.setPwd(temp);
			mapper.updateTempPwd(vo1);  // 임시비밀번호로 업데이트
			String email = vo1.getEmail();
			// email발송
			SendMail.sendMail("jeonggil5579@naver.com", email, "[Dataro]임시 비밀번호", "임시비밀번호는 "+ temp + " 입니다.");
			return vo1;
		} else {
			return null;
		}
	}

	// 회원탈퇴
	@Override
	public int deleteId(MemberVO vo) {
		return mapper.deleteId(vo);
	}

	// 회원번호로 해당하는 개인정보 가져오기
	@Override
	public MemberVO myInfo2(int no) {
		return mapper.myInfo2(no);
	}
	
	// 읽지 않은 쪽지 숫자
	@Override
	public int alarmForMessage(MessageVO vo) {
		return mapper.alarmForMessage(vo);
	}
	
	// 읽지 않은 쪽지
	@Override
	public List<MessageVO> unreadMsgContent(MessageVO vo) {
		return mapper.unreadMsgContent(vo);
	}

	// 쪽지 읽음처리
	@Override
	public int readUpdate(MessageVO vo) {
		return mapper.readUpdate(vo);
	}

	@Override
	public int deleteMsg(int message_no) {
		return mapper.deleteMsg(message_no);
	}

//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	
}
