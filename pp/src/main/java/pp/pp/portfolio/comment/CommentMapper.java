package pp.pp.portfolio.comment;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommentMapper {
	List<CommentVO> list();
	CommentVO view(int no);
	
	List<CommentVO> commentList(CommentVO vo);
	int insert(CommentVO vo);
	int update(CommentVO vo);
	int delete(CommentVO vo);
	int gnoUpdate(int gno);
	int onoUpdate(CommentVO vo);
	int count(int boardno);
	int commentInsert(CommentVO vo);
	int viewCount(int no);
	
}
