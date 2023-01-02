package pp.pp.portfolio.omok;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO {
	
	@Autowired
	SqlSessionTemplate sst;
	
	// 회원등록
	public int insert(LoginDTO dto) {
		return sst.insert("omok.insert", dto);
	}
	
	//아이디 중복체크만
	public int count(LoginDTO dto) {
		return sst.selectOne("omok.count", dto);
	}
	
	// 로그인하기 위해 아이디, 비밀번호 둘 다 체크
	public int loginCount(LoginDTO dto) {
		return sst.selectOne("omok.loginCount", dto);
	}
	
	// 랭킹확인
	public List<LoginDTO> rankers(){
		return sst.selectList("omok.rank");
	}
}

