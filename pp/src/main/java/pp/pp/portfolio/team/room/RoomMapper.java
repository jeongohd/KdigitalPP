package pp.pp.portfolio.team.room;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import pp.pp.portfolio.team.board.BoardVO;

@Mapper
public interface RoomMapper {
	//진경
	RoomVO view(int no);
	
	//=================================정현===============================
	public int makeRoom(RoomVO vo);
	
	public List<RoomVO> list2(BoardVO vo);
	
	public int pwdCheck(RoomVO vo);
	
	public int enterRoom(RoomVO vo);
	
	public int checkRoom(RoomVO vo);
	//=================================정현===============================
}
