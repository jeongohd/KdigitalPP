package pp.pp.portfolio.join;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface JoinMapper {
	int insert(JoinVO vo);
	int idCheck(String id);
	JoinVO loginCheck(JoinVO vo);
	String findId(JoinVO vo);
	JoinVO findPwd(JoinVO vo);
	int updateTempPwd(JoinVO vo);
}
