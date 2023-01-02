package pp.pp.portfolio.team.util;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pp.pp.portfolio.team.board.BoardVO;

public interface UtilService {
	//해시태그 등록/진경
	boolean insert(CategoryVO cvo, BoardVO bvo);
	//해시,지역 수정/진경
	boolean hashRegionEdit(CategoryVO vo);
	//글쓰기 사진등록/진경
	boolean fileupload(FileVO fvo,@RequestParam MultipartFile[] filename, HttpServletRequest re, BoardVO bvo);
	//해시태그,지역정보 출력/진경
	Map writeCategory();
	//지역 대분류 db에 넘겨 소분류가지고오기/map으로 해보고싶어서 해본거,list로해도됨
	Map regionDetail(String rs);
	//resion_no 카테고리 테이블에 등록
	int regionInsert(CategoryVO cvo);
	
	
}
