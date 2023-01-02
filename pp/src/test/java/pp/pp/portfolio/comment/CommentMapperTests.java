package pp.pp.portfolio.comment;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;
import pp.pp.portfolio.comment.CommentMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/context-servlet.xml")
@Log4j
public class CommentMapperTests {
	@Autowired
	CommentMapper mapper;
	
//	@Test
//	public void test() {
//		System.out.println(mapper.list());
//	}
}
