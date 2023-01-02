package pp.pp.portfolio.team.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import pp.pp.portfolio.team.message.MessageVO;

@Mapper
public interface MemberMapper {
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// 회원등록
	int insert(MemberVO vo);
	// 중복아이디 찾기
	int checkId(MemberVO vo);
	// 중복이메일 찾기
	int checkEmail(MemberVO vo);
	// 로그인 할 때, 아이디 패스워드 확인용
	MemberVO checkIdPw(MemberVO vo); 
	// 아이디로 해당하는 개인정보 가져오기
	MemberVO myInfo(String id);
	// 회원번호로 해당하는 개인정보 가져오기
	MemberVO myInfo2(int no);
	// 회원정보수정
	int editUserInfo(MemberVO vo);
	// 아이디 찾기
	MemberVO findId(MemberVO vo);
	// 비밀번호 찾기
	MemberVO findPwd(MemberVO vo);
	// 임시비밀번호로 비밀번호 업데이트
	int updateTempPwd(MemberVO vo); 
	// 회원삭제
	int deleteId(MemberVO vo);
	// 알람 옆에 뜨는 안 읽은 쪽지 수
	int alarmForMessage(MessageVO vo);
	// 안 읽은 쪽지 내용들.
	List<MessageVO> unreadMsgContent(MessageVO vo);
	// 안 읽은 쪽지 읽음처리. 
	int readUpdate(MessageVO vo);
	// 쪽지 삭제
	int deleteMsg(int message_no);
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 끝 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ

	
}
