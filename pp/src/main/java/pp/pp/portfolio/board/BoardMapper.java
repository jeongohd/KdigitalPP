package pp.pp.portfolio.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	int insert(BoardVO vo);
	List<BoardVO> list(BoardVO vo);
	int update(BoardVO no);
	int delete(int no);
	BoardVO view(int no);
	int updateViewcount(int no);
	int count(BoardVO vo);
}
