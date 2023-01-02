package pp.pp.portfolio.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServicempl implements BoardService {
	
	@Autowired
	BoardMapper mapper;

	@Override
	public boolean insert(BoardVO vo) {
		return mapper.insert(vo) > 0 ? true:false;
	}
	@Override
	public Map index(BoardVO vo) {
		int totalCount = mapper.count(vo);
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*5);
		int startPage = endPage - 4;
		if (endPage>totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true:false;
		boolean next = endPage < totalPage ? true:false;
		
		int startIndex = (vo.getPage()-1) * vo.getPageRow(); //페이지의 시작게시글
		vo.setStartIdx(startIndex);
		
		List<BoardVO> list = mapper.list(vo);
		
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
	public boolean update(BoardVO vo) {
		return mapper.update(vo) > 0 ? true:false;
	}

	@Override
	public boolean delete(int no) {
		return mapper.delete(no) > 0?true:false;
	}
	@Override
	public BoardVO view(int no) {
		mapper.updateViewcount(no);
		return mapper.view(no);
	}



	
	
}
