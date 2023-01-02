package pp.pp.portfolio.gallery;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/resources/config/context-servlet.xml")
@Log4j
public class GalleryMapperTests {
	
	@Autowired
	private GalleryMapper mapper;
	
	//@Test
	public void test() {
		log.info(mapper);
	}
	
	@Test
	public void testlist() {
		GalleryVO vo = new GalleryVO();
		List<GalleryVO> list = mapper.galleryList(vo); 
		System.out.println(list);
		log.info(list);
	}
	
	
}
