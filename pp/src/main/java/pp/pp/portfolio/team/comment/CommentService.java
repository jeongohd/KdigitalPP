package pp.pp.portfolio.team.comment;

import java.util.List;
import java.util.Map;

import pp.pp.portfolio.team.reply.ReplyVO;

public interface CommentService {
	
	// 댓글 리스트
	public Map index(CommentVO vo); 
	// 댓글 입력
	public boolean insert(CommentVO vo);
	// 댓글 삭제
	public int delete(int num);
	// 댓글 수정
	public boolean modify(CommentVO vo);
	//답글 목록
	public List commentList(CommentVO vo);
	//답변등록
	public boolean reply(CommentVO vo);
	
	
	
}
