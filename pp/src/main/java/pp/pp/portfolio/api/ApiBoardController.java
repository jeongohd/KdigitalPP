package pp.pp.portfolio.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin(origins = {"*"})
public class ApiBoardController extends pageController{
	@Autowired
	ApiBoardMapper mapper;

	@GetMapping("/api/board/list")
	public ResponseObj list(Param param) {
		int totalCount = mapper.count(param);
		pageProcess(param, totalCount);
		ResponseObj obj = new ResponseObj();
		obj.setTotalCount(totalCount);
		obj.setPage(param.getPageNo());
		obj.setTotalPage(totalPage);
		obj.setItems(mapper.list(param));
		obj.setStartPage(startPage);
		obj.setEndPage(endPage);
		obj.setPrev(prev);
		obj.setNext(next);
		return obj;
	}
	
//	@GetMapping("/api/board/list")
//	public ResponseEntity<Map> index(ApiBoardVO vo) {
//		Map map = new HashMap<String,Object>();
//		map.put("totalcount", service.count());
//		map.put("PageNo", vo.getPageNo());
//		map.put("items",service.index(vo));
//		map.put("pageRow", vo.getPageRow());
//		map.put("totalPage",vo.getTotalpage()); //service를 먼저 실행해야지 값이 담김
//		pageProcess(vo); //메서드 자체를 못넘기고 파라미터값을 하나씩 등록? or list
//		map.put("startIdx",vo.getStartIdx());
//		map.put("startPage",startPage);
//		map.put("endPage", endPage);
//		map.put("prev",prev);
//		map.put("next",next);
//		return new ResponseEntity<>(map,HttpStatus.OK);
//
//	};
}
