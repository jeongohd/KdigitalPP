package pp.pp.portfolio.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;

@Service
public class CommentServicempl implements CommentService {
	@Autowired
	CommentMapper mapper;
	//글목록
	@Override
	public List<CommentVO> list() {
		return mapper.list();
	}
	@Override
	public CommentVO view(int no) {
		mapper.viewCount(no);
		return mapper.view(no);
	}
	
	//댓글
	@Override
	public Map commentList(CommentVO vo) {
		int totalCount = mapper.count(vo.getNo());
		int totalPage = totalCount /vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage - 9;
		if(endPage>totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true:false;
		boolean next = endPage < totalPage ? true:false;
		
		int startIndex = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIndex);
		
		List<CommentVO> list = mapper.commentList(vo);
		
		Map map = new HashMap();
		map.put("totalCount", totalCount);
		map.put("totalPage", totalPage);
		map.put("endPage", endPage);
		map.put("startPage", startPage);
		map.put("list", list);
		map.put("prev", prev);
		map.put("next", next);
		
		return map;
	}
	@Override
	public int insert(CommentVO vo) {
		int i = mapper.insert(vo);
		if(i>0) mapper.gnoUpdate(vo.getCno());
		return i;
	}
	
	@Override
	public int commentInsert(CommentVO vo) {
		if(vo.getNested()<=2) {
			vo.setNested(vo.getNested()+1);	
		}
		return mapper.commentInsert(vo);
	}

	@Override
	public int Update(CommentVO vo) {
		return mapper.update(vo);
	}

	@Override
	public int delete(CommentVO vo) {
		return mapper.delete(vo);
	}


	
}
