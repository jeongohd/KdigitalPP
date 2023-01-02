package pp.pp.portfolio.team.reply;

import java.util.List;
import java.util.Map;

public interface ReplyService {
	int insert(ReplyVO vo);
	List<ReplyVO> list(ReplyVO vo);
	int update(ReplyVO vo);
	
	//=================================정현===============================
	//목록 출력
	public Map list2(ReplyVO vo);
	//답글 목록
	public List replyList(ReplyVO vo);
	//수정처리
	boolean update2(ReplyVO vo);
	//삭제처리
	boolean delete(int no);
	//등록처리
	boolean insert2(ReplyVO vo);
	//답변등록
	boolean reply(ReplyVO vo);
	//=================================정현===============================
}
	