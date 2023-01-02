package pp.pp.portfolio.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	Map index(BoardVO vo);
	//글등록
	boolean insert(BoardVO vo);
	//수정
	boolean update(BoardVO vo);
	//삭제
	boolean delete(int no);
	//글상세보기
	BoardVO view(int no);
	
}
