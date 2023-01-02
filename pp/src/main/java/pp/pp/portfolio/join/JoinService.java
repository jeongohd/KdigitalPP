package pp.pp.portfolio.join;

import javax.servlet.http.HttpServletResponse;

public interface JoinService {
	int insert(JoinVO vo);
	int idCheck(String id);
	JoinVO login(JoinVO vo);
	String findId(JoinVO vo);
	JoinVO findPwd(JoinVO vo, String email);

}
