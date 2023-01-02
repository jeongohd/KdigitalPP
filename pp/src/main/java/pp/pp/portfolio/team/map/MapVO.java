package pp.pp.portfolio.team.map;

import java.util.List;

import lombok.Data;
import pp.pp.portfolio.team.util.FileVO;

@Data
public class MapVO {
	private int board_no;
	private int course_no;
	private String address_name;
	private String category_group_code;
	private String categoy_group_name;
	private String category_name;
	private String id;
	private String phone;
	private String place_name; // 
	private String place_url;
	private String road_address_name;
	private String x;
	private String y;
	
	//글수정에서 사용하기위해 추가함-진경
	private String content;
	//코스별로 파일리스트형식으로 저장-진경
	private List<FileVO> fileList; 
}
