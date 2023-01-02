package pp.pp.portfolio.team.room;

import java.util.List;

import pp.pp.portfolio.team.board.BoardVO;


public interface RoomService {
	RoomVO view(int no);
	
	//=================================정현===============================
	//방 새로 만들기
	public int makeRoom(RoomVO vo);
	
	//해당 게시물에 맞는 방 리스트 가져옴
	public List<RoomVO> list2(BoardVO vo);
	
	//비밀방일때, 비밀번호 확인
	public int pwdCheck(RoomVO vo);
	
	//방 입장
	public int enterRoom(RoomVO vo);
	
	//내가 입장한 방인지 아닌지 확인
	public int checkRoom(RoomVO vo);
	//=================================정현===============================
}
