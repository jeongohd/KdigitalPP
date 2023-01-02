package pp.pp.portfolio.team.board;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import pp.pp.portfolio.team.map.MapVO;
import pp.pp.portfolio.team.member.MemberVO;
import pp.pp.portfolio.team.message.MessageVO;
import pp.pp.portfolio.team.room.RoomVO;
import pp.pp.portfolio.team.util.CategoryVO;
import pp.pp.portfolio.team.util.FileVO;

@Mapper
public interface teamBoardMapper {
	
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
//	마이페이지
	List<BoardVO> myList1(BoardVO vo);
	List<BoardVO> myList2(BoardVO vo);
	List<BoardVO> myList3(BoardVO vo);
	List<MessageVO> myList4(MessageVO vo);
	List<MessageVO> myList5(MessageVO vo);
	List<RoomVO> myList6(RoomVO vo);
	int count1(BoardVO vo);
	int count2(BoardVO vo);
	int count3(BoardVO vo);
	int count4(MessageVO vo);
	int count5(MessageVO vo);

//	메인
	List<BoardVO> list(BoardVO vo); // 출력할 내용 가져오기
	List<FileVO> getTravPic(int board_no); // 게시한 이미지 가져오기
	List<MapVO> place(int board_no); // 게시한 여행장소 가져오기
	List<CategoryVO> getHashTags(int board_no); // 게시한 해쉬태그 가져오기
	int commentCount(int board_no); // 댓글수 가져오기
	int thumbsUp(int board_no); // 좋아요수 가져오기
	MemberVO getImgOfWriter(int board_no); // 게시글 작성자 사진 불러오기
	int total(BoardVO vo); // 총 게시물 수
	
//	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 정길  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ	
	
	// 여행코스글쓰기 -진경
	int insert(BoardVO vo);
	// 여행코스글쓰기/코스등록-진경
	int insertCourse(BoardVO vo);
	// 여행코스수정 화면출력-진경
	BoardVO updateView(BoardVO vo);
	List<MapVO> updateCourse(BoardVO vo);
	List<CategoryVO> updateCategory(BoardVO vo);
	List<CategoryVO> updateCategory2(BoardVO vo);
	// 여행코스글,타이틀 수정 -진경
	int titleEdit(BoardVO vo);
	int courseEdit(BoardVO vo);

	
	//=================================정현===============================
	public BoardVO view2(BoardVO vo); 
	public void updateViewcount2(BoardVO vo);
	public List<CategoryVO> categoryList(BoardVO vo);
	//게시글 삭제
	public int delete(BoardVO vo);
	//게시글 좋아요
	public int clickBoardLike(BoardVO vo);
	//게시글 싫어요
	public void clickDislike(BoardVO vo);
	//댓글 좋아요
	public void clickReplyLike(BoardVO vo);
	//로그인한 member_no가 좋아요 눌렀는지 체크
	public int likeCheck(BoardVO vo);
	//로그인한 member_no가 싫어요 눌렀는지 체크
	public int dislikeCheck(BoardVO vo);
	//좋아요 취소
	public int likeBack(BoardVO vo);
	//싫어요 취소
	public int dislikeBack(BoardVO vo);
	//=================================정현===============================
	
}
