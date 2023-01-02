package pp.pp.portfolio.team.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import pp.pp.portfolio.team.map.MapMapper;
import pp.pp.portfolio.team.map.MapVO;
import pp.pp.portfolio.team.member.MemberVO;
import pp.pp.portfolio.team.message.MessageVO;
import pp.pp.portfolio.team.room.RoomMapper;
import pp.pp.portfolio.team.room.RoomVO;
import pp.pp.portfolio.team.util.CategoryMapper;
import pp.pp.portfolio.team.util.CategoryVO;
import pp.pp.portfolio.team.util.FileMapper;
import pp.pp.portfolio.team.util.FileVO;

@Slf4j
@Service
@AllArgsConstructor
public class teamBoardServiceImpl implements BoardService {
	
	teamBoardMapper mapper;
	RoomMapper rmapper;
	MapMapper pmapper;
	CategoryMapper cmapper;
	FileMapper fmapper;
	
	//////////////////////////진경//////////////////////
	//여행코스글쓰기(for문-코스등록)
	@Override
	public boolean insert(BoardVO bvo) {
		mapper.insert(bvo);
		pmapper.updateBoardNo(bvo);  // 진귀: board_no 가지고 오자마자 업데이트하기.
		for(int i=0; i<bvo.getContents().length; i++) {
			bvo.setContent(bvo.getContents()[i]);
			bvo.setCourse_no(i+1);
			mapper.insertCourse(bvo);
		}
		return true;
	}
	//여행코스글수정 화면 불러오기
	@Override
	public Map updateView(BoardVO vo) {
		//vo에 board_no가 담겨있음
		List<MapVO> mapList = mapper.updateCourse(vo); //board_no에 맞는 코스내용,map테이블내용불러옴
		for (int i=0; i<mapList.size(); i++) {//MapVO가 배열로 담겨있음
			vo.setCourse_no(mapList.get(i).getCourse_no()); //BoardVO의 course_no에  MapVO의 course_no를 set해줌
			mapList.get(i).setFileList(fmapper.fileUpdate(vo));//maplist의 i번쨰에 filelist필드에 vo(board_no,위에서set한 코스번호를 사용해서 파일을 조회한 값을 set함)
		}
		Map ud = new HashMap();
		ud.put("view",mapper.updateView(vo));
		ud.put("course",mapList); // 파일코스명
		ud.put("hrcategory",mapper.updateCategory(vo)); //해쉬태그
		ud.put("hrcategory2",mapper.updateCategory2(vo)); // 지역번호
		return ud;
	}
	//여행코스글수정
	@Override
	public boolean titcouEdit(BoardVO bvo) {
		mapper.courseEdit(bvo);  // content 삭제
		for(int i=0; i<bvo.getContents().length; i++) {
			System.out.println("서비스에서 코스"+bvo.getCourse_no());
			System.out.println("서비스에서 코스내용"+bvo.getContent());
			bvo.setContent(bvo.getContents()[i]);
			bvo.setCourse_no(i+1);
			mapper.insertCourse(bvo);
		}
		return mapper.titleEdit(bvo) > 0 ? true : false;
	}

//	================================= 정길 시작 ===============================

	// 내가 쓴 게시물(마이페이지)
	@Override
	public Map myList1(BoardVO vo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setMember_no(no);
		int totalCount = mapper.count1(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.myList1(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	// 내가 쓴 댓글(마이페이지)
	@Override
	public Map myList2(BoardVO vo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setMember_no(no);
		int totalCount = mapper.count2(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.myList2(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	// 내가 좋아요 누른 게시물(마이페이지)
	@Override
	public Map myList3(BoardVO vo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setMember_no(no);
		int totalCount = mapper.count3(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<BoardVO> list = mapper.myList3(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	// 내가 받은 쪽지(마이페이지)
	@Override
	public Map myList4(MessageVO vo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setReceive_member_no(no);
		int totalCount = mapper.count4(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<MessageVO> list = mapper.myList4(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}
	
	// 내가 보낸 쪽지(마이페이지)
	@Override
	public Map myList5(MessageVO vo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setSend_member_no(no);
		int totalCount = mapper.count5(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<MessageVO> list = mapper.myList5(vo);
		int endPage = (int)(Math.ceil(vo.getPage()/5.0)*5);
		int startPage = endPage - 4;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true: false;
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	// 내가 참여한 방(마이페이지)
	@Override
	public List<RoomVO> myList6(RoomVO vo, HttpSession sess) {
		MemberVO vo1 = (MemberVO) sess.getAttribute("loginInfo");
		int no = vo1.getMember_no();
		vo.setRoom_participant_no(no);
		return mapper.myList6(vo);
	}
	
	// 메인
	@Override
	public Map index(BoardVO vo) {
		vo.setPageRow(9);
		int totalCount = mapper.total(vo);
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) totalPage++;
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		int endPage = (int)(Math.ceil(vo.getPage()/9.0) * 9);
		int startPage = endPage - 8;
		if (endPage > totalPage) endPage = totalPage;
		List<BoardVO> list = mapper.list(vo);
		for (int i=0; i< list.size(); i++) {
			list.get(i).setPlaceList(mapper.place(list.get(i).getBoard_no())); // 장소 이름
			list.get(i).setHashtagList(mapper.getHashTags(list.get(i).getBoard_no())); // 해쉬태그
			list.get(i).setGetTravPic(mapper.getTravPic(list.get(i).getBoard_no())); // 게시글 사진
			list.get(i).setCommentCount(mapper.commentCount(list.get(i).getBoard_no())); // 댓글 수
			list.get(i).setThumbsUp(mapper.thumbsUp(list.get(i).getBoard_no())); // 좋아요 수
		}
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("list", list);
	
		return map;
	}

//	================================= 정길 끝 ===============================

	
	//================================= 정현 ===============================
	//게시글 상세보기
	@Override
	public Map view(BoardVO vo) {
		Map map = new HashMap();
		mapper.updateViewcount2(vo); //조회수 증가 후
		map.put("roomList", rmapper.list2(vo));
		map.put("categoryList", mapper.categoryList(vo));
		map.put("board", mapper.view2(vo));
		return map;
	}

	@Override
	public int clickBoardLike(BoardVO vo) {
		return mapper.clickBoardLike(vo);
		
	}

	@Override
	public void clickDislike(BoardVO vo) {
		mapper.clickDislike(vo);
	}

	@Override
	public void clickReplyLike(BoardVO vo) {
		mapper.clickReplyLike(vo);
	}

	@Override
	public int likeCheck(BoardVO vo) {
		return mapper.likeCheck(vo);
	}

	@Override
	public void likeBack(BoardVO vo) {
		mapper.likeBack(vo);
	}

	@Override
	public int dislikeCheck(BoardVO vo) {
		return mapper.dislikeCheck(vo);
	}

	@Override
	public void dislikeBack(BoardVO vo) {
		mapper.dislikeBack(vo);
	}

	@Override
	public int delete(BoardVO vo) {
		return mapper.delete(vo);
	}
	//=================================정현===============================
	
	




}
