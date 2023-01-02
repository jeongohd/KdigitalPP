package pp.pp.portfolio.team.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pp.pp.portfolio.team.reply.ReplyVO;


@Service
public class teamCommentServiceImpl implements CommentService {
	
	@Autowired
	teamCommentMapper mapper;
	
	@Override
	public Map index(CommentVO vo) {
		int totalCount = mapper.count(vo); // 총게시물수
		
		//ono=0 댓글수
		int pagingCount = mapper.pagingCount(vo);
		
		// 총페이지수
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) totalPage++;
		
		// 시작인덱스
		int startIdx = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIdx);
		List<CommentVO> list = mapper.list(vo);
		
		// 페이징처리
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage-9;
		if (endPage > totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true : false;
		boolean next = endPage < totalPage ? true : false;
		
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
	// 정현이꺼 따라함
	@Override
	public boolean insert(CommentVO vo) {
		boolean r = mapper.insert(vo) > 0 ? true:false;
		if (r) mapper.gnoUpdate(vo.getReply_no());
		return r;
	}

	@Override
	public int delete(int num) {
		return mapper.delete(num);
	}

	@Override
	public boolean modify(CommentVO vo) {
		return mapper.modify(vo) > 0 ? true:false;
	}

	@Override
	public List commentList(CommentVO vo) {
		return mapper.commentList(vo);
	}

	@Override
	public boolean reply(CommentVO vo) {
		mapper.onoUpdate(vo);
		vo.setOno(vo.getGno()+1);
		return mapper.reply(vo) > 0 ? true : false;
	}

}
