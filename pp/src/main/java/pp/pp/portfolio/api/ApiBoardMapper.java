package pp.pp.portfolio.api;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ApiBoardMapper {
	public List<ApiBoardVO> list(Param p); // 목록출력되니깐 list로
	public int count(Param p);
}
