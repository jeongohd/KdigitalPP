package pp.pp.portfolio.team.map;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;


@Controller
@RequestMapping("/map")
public class MapController {

	@Autowired
	MapMapper mapper;

	// 테스트용
	@RequestMapping("/map.do")
	public String map() {
		return "ppteam/map/map";
	}

	@RequestMapping(value="/mapcourselist.do", produces = "application/text; charset=UTF-8" )
	@ResponseBody
	public String mapcourselist(MapVO vo
						, Model model) throws JsonProcessingException {
		
		// board_no 받아서 조건 추가해야함 배열에 넣을때 순서 정확성 위해 course_no로 순서주기 
		List<MapVO> courseList = mapper.list(vo);
		String json = new ObjectMapper().writeValueAsString(courseList);
		return json;
	}
	
	@RequestMapping("/mapinsert.do")
	@ResponseBody
	public boolean mapinsert(HttpServletRequest req
						, HttpServletResponse res
						,@RequestParam int board_no) throws IOException {
		
		if(board_no != 0) {
			mapper.delete(board_no);
		}
		
		String json = req.getParameter("json");
		Gson gson = new Gson();
		MapVO[] list = gson.fromJson(json, MapVO[].class);

		for(int i=0; i<list.length; i++) {
			list[i].setCourse_no(i+1);
			list[i].setBoard_no(board_no);
			mapper.insert(list[i]);
		}
		return true;
	}
}