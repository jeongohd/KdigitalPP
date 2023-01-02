package pp.pp.portfolio.team.comment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import pp.pp.portfolio.team.reply.ReplyVO;

@Mapper
public interface teamCommentMapper {
	
	// 댓글입력
	public int insert(CommentVO vo);
	// 총 댓글 갯수
	public int count(CommentVO vo);
	// 댓글 목록
	public List<CommentVO> list(CommentVO vo);
	//댓글 삭제
	public int delete(int num);
	//댓글 수정
	public int modify(CommentVO vo);
	
	
	
	//답글달때 gno값을 reply_no값으로 업뎃
	public int gnoUpdate(int num);
	//답글달때 기존답글 ono + 1 업뎃
	public int onoUpdate(CommentVO vo);
	//댓글에 답글달기
	public int reply(CommentVO vo);
	//답글 목록
	public List<CommentVO> commentList(CommentVO vo); 
	//ono=0 댓글 수
	public int pagingCount(CommentVO vo);
	
}
