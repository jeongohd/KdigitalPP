package pp.pp.portfolio.team.util;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

//글등록
@Mapper
public interface CategoryMapper {
	//해쉬태그 등록
	int insert(CategoryVO vo);
	//해쉬태그 출력
	List<CategoryVO> hash();
	//해쉬태그 수정(삭제후재등록)
	int hashRegionEdit(CategoryVO vo);
	//지역 출력
	List<CategoryVO> regionSelect();
	//지역 대분류 db전송후 소분류 가져오기
	List<CategoryVO> regionDetail(String rs);
	//지역번호 가져와서 카테고리테이블에 등록
	int regionInsert(CategoryVO vo);
}
