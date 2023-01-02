package pp.pp.portfolio.team.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pp.pp.portfolio.team.board.teamBoardMapper;
import pp.pp.portfolio.team.room.RoomMapper;

@Service
public class teamReplyServicempl implements ReplyService {
	@Autowired
	teamReplyMapper rmapper;
	
	
	@Override
	public int insert(ReplyVO vo) {
		return rmapper.insert(vo);
	}
	@Override
	public List<ReplyVO> list(ReplyVO vo) {
		return rmapper.list(vo);
	}
	@Override
	public int update(ReplyVO vo) {
		return rmapper.update(vo);
	}

	
	//=================================정현===============================
	@Override
	public Map list2(ReplyVO vo) {
		//총 댓글 수
		int totalCount = rmapper.count(vo);
		//ono=0 댓글수
		int pagingCount = rmapper.pagingCount(vo);
		//총 댓글 페이지 수
		int totalPage = pagingCount/vo.getPageRow(); 
		if(pagingCount % vo.getPageRow() > 0) totalPage++;
		
		//시작인덱스
		int startIdx = (vo.getPage() - 1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<ReplyVO> list = rmapper.list2(vo);
		
		//페이징처리	startPage ,endPage
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage-9;
		if(endPage>totalPage) endPage=totalPage;
		boolean prev = startPage > 1 ? true:false;
		boolean next = endPage < totalPage ? true:false;
		
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("pagingCount", pagingCount);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("prev", prev);
		map.put("next", next);
		map.put("list", list);
		return map;
	}

	@Override
	public boolean update2(ReplyVO vo) {
		return rmapper.update2(vo) > 0 ? true:false;
	}

	@Override
	public boolean delete(int no) {
		return rmapper.delete2(no) > 0 ? true:false;
	}

	@Override
	public boolean insert2(ReplyVO vo) {
		boolean r = rmapper.insert2(vo) > 0 ? true:false;
		if (r) rmapper.gnoUpdate(vo.getReply_no());
		return r;
	}

	@Override
	public boolean reply(ReplyVO vo) {
		rmapper.onoUpdate(vo);
		vo.setOno(vo.getOno()+1);
		return rmapper.reply(vo) > 0 ? true : false;
	}

	@Override
	public List replyList(ReplyVO vo) {
		return rmapper.replyList(vo);
	}
	//=================================정현===============================

	
}
