package pp.pp.portfolio.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServicempl implements ReplyService {
	
	@Autowired
	ReplyMapper mapper;

	@Override
	public boolean insert(ReplyVO vo) {
		boolean i = mapper.insert(vo) > 0 ? true:false;
		if(i) mapper.gnoUpdate(vo.getNo()); 
		return i;
	}
	@Override
	public Map index(ReplyVO vo) {
		int totalCount = mapper.count();
		int totalPage = totalCount / vo.getPageRow();
		if(totalCount % vo.getPageRow() > 0) totalPage++;
		
		int endPage = (int)(Math.ceil(vo.getPage()/10.0)*10);
		int startPage = endPage - 9;
		if (endPage>totalPage) endPage = totalPage;
		boolean prev = startPage > 1 ? true:false;
		boolean next = endPage < totalPage ? true:false;
		
		int startIndex = (vo.getPage()-1) * vo.getPageRow();
		vo.setStartIdx(startIndex);
		
		List<ReplyVO> list = mapper.list(vo);
		
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
	public boolean update(ReplyVO vo) {
		return mapper.update(vo) > 0 ? true:false;
	}

	@Override
	public boolean delete(int no) {
		return mapper.delete(no) > 0?true:false;
	}
	@Override
	public ReplyVO view(int no) {
		mapper.updateViewcount(no);
		return mapper.view(no);
	}
	@Override
	public boolean reply(ReplyVO vo) {
		mapper.onoUpdate(vo);
//		vo.setGno(vo.getGno());
		vo.setOno(vo.getOno()+1);
		vo.setNested(vo.getNested()+1);
		return mapper.reply(vo)>0 ?true:false;
	}



	
	
}
