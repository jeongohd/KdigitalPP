package pp.pp.portfolio.comment;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface CommentService {
	//게시글
	List<CommentVO> list();
	CommentVO view(int no);
	//댓글
	Map commentList(CommentVO vo);
	int insert(CommentVO vo);
	int Update(CommentVO vo);
	int delete(CommentVO vo);
	int commentInsert(CommentVO vo);
}
