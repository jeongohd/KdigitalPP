package pp.pp.portfolio.team.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import pp.pp.portfolio.team.map.MapVO;
import pp.pp.portfolio.team.message.MessageVO;
import pp.pp.portfolio.team.room.RoomVO;
import pp.pp.portfolio.team.util.CategoryVO;
import pp.pp.portfolio.team.util.FileVO;


public interface BoardService {
	
	//================================= 정길 시작 ===============================

	// 마이페이지
	Map myList1(BoardVO vo,  HttpSession sess);
	Map myList2(BoardVO vo, HttpSession sess);
	Map myList3(BoardVO vo, HttpSession sess);
	Map myList4(MessageVO vo, HttpSession sess);
	Map myList5(MessageVO vo, HttpSession sess);
	List<RoomVO> myList6(RoomVO vo, HttpSession sess);

	// 메인
	Map index(BoardVO vo);

	//================================= 정길 끝 ===============================

	// write(진경)
	boolean insert(BoardVO bvo);
	Map updateView(BoardVO bvo);
	//여행글쓰기 글수정(진경)
	boolean titcouEdit(BoardVO bvo); 

	
	//=================================정현===============================
	// 상세
	Map view(BoardVO vo);
	//게시글 삭제
	int delete(BoardVO vo);
	//게시글 좋아요
	int clickBoardLike(BoardVO vo);
	//게시글 싫어요
	void clickDislike(BoardVO vo);
	//댓글 좋아요
	void clickReplyLike(BoardVO vo);
	int likeCheck(BoardVO vo);
	int dislikeCheck(BoardVO vo);
	void likeBack(BoardVO vo);
	void dislikeBack(BoardVO vo);
	//=================================정현===============================


}
