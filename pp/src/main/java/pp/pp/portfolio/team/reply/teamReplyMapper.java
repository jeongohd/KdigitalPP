package pp.pp.portfolio.team.reply;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface teamReplyMapper {
	int insert(ReplyVO vo);
	List<ReplyVO> list(ReplyVO vo);
	int update(ReplyVO vo);
	
	
	//=================================정현===============================
	//댓글 목록 출력
	public List<ReplyVO> list2(ReplyVO vo); 
	//총 댓글 개수
	public int count(ReplyVO vo);
	//ono=0 댓글 수
	public int pagingCount(ReplyVO vo);
	//답글 목록
	public List<ReplyVO> replyList(ReplyVO vo); 
	//댓글 삭제
	public int delete2(int no);
	//댓글 작성
	public int insert2(ReplyVO vo);
	//답글달때 gno값을 reply_no값으로 업뎃
	public int gnoUpdate(int no);
	//답글달때 기존답글 ono + 1 업뎃
	public int onoUpdate(ReplyVO vo);
	//댓글에 답글달기
	public int reply(ReplyVO vo);
	//댓글 수정
	public int update2(ReplyVO vo);
	//=================================정현===============================
		
}
