package pp.pp.portfolio.reply;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReplyMapper {
	int insert(ReplyVO vo);
	int gnoUpdate(int no);
	int onoUpdate(ReplyVO vo);
	List<ReplyVO> list(ReplyVO vo);
	int update(ReplyVO no);
	int delete(int no);
	ReplyVO view(int no);
	int updateViewcount(int no);
	int count();
	int reply(ReplyVO vo);

}
