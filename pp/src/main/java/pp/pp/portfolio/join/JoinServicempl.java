package pp.pp.portfolio.join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.SendMail;

@Service
public class JoinServicempl implements JoinService {
	
	@Autowired
	JoinMapper mapper;
	
	@Override
	public int insert(JoinVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public int idCheck(String id) {
		return mapper.idCheck(id);
	}

	@Override
	public JoinVO login(JoinVO vo) {
		return mapper.loginCheck(vo);
	}

	@Override
	public String findId(JoinVO vo) {
		return mapper.findId(vo);
	}

	@Override
	public JoinVO findPwd(JoinVO vo,String email) {
		System.out.println("dddddddddddd"+email);
		JoinVO pwd = mapper.findPwd(vo);
		if(pwd != null) {
			String temp ="";
			for(int i=0;i<2;i++) {
				temp += (char)(Math.random()*26+65);
			}
			for(int i=0;i<2;i++) {
				temp += (int)(Math.random()*9);
			}
			vo.setPwd(temp);
			mapper.updateTempPwd(vo);
			
			SendMail.sendMail("jeonggil5579@naver.com", email, "이진경 포트폴리오 임시 비밀전호 전송", "임시비밀번호 : "+temp);
			return pwd;
		};
		return null;
	}

}
