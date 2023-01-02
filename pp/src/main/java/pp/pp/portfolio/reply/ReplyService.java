package pp.pp.portfolio.reply;

import java.util.Map;

public interface ReplyService {
	Map index(ReplyVO vo);
	//글등록
	boolean insert(ReplyVO vo);
	//수정
	boolean update(ReplyVO vo);
	//삭제
	boolean delete(int no);
	//글상세보기
	ReplyVO view(int no);
	//댓글 등록
	boolean reply(ReplyVO vo);
	
}
