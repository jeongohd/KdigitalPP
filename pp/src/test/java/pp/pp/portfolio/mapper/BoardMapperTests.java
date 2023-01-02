package pp.pp.portfolio.mapper;

import javax.annotation.security.RunAs;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import pp.pp.portfolio.board.BoardMapper;
import pp.pp.portfolio.board.BoardVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/context-servlet.xml")
@Log4j
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void test() {
		log.info(mapper);
	}
	
	//@Test
	public void testinsert() {
		BoardVO vo = new BoardVO();
		vo.setContent("야호");
		vo.setTitle("테스트제목");
		mapper.insert(vo);
	}
	
	
}
