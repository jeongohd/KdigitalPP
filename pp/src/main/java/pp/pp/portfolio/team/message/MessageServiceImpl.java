package pp.pp.portfolio.team.message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	MessageMapper mapper;
	
	//=================================정현===============================
	@Override
	public int insert(MessageVO vo) {
		return mapper.insert(vo);
	}
	//=================================정현===============================

}
