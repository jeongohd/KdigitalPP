package pp.pp.portfolio.team.room;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pp.pp.portfolio.team.board.BoardVO;

@Service
public class RoomServicempl implements RoomService {
	@Autowired
	RoomMapper rmapper;

	//모임방상세보기
	@Override
	public RoomVO view(int no) {
		return rmapper.view(no);
	}
	
	//=================================정현===============================
	//방 만들고 방장 방 입장
	@Override
	public int makeRoom(RoomVO vo) {
		rmapper.makeRoom(vo);
		rmapper.enterRoom(vo);
		return 1;
	}
 
	@Override
	public List<RoomVO> list2(BoardVO vo) {
		return rmapper.list2(vo);
		
	}

	@Override
	public int pwdCheck(RoomVO vo) {
		return rmapper.pwdCheck(vo);
	}
	
	//방 참여
	@Override
	public int enterRoom(RoomVO vo) {
		return rmapper.enterRoom(vo);
	}
	
	//내가 참여한 방인지 확인
	@Override
	public int checkRoom(RoomVO vo) {
		return rmapper.checkRoom(vo);
	}
	//=================================정현===============================
}
