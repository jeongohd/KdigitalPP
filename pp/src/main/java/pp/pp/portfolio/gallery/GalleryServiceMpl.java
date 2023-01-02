package pp.pp.portfolio.gallery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GalleryServiceMpl implements GalleryService{
	@Autowired
	GalleryMapper mapper;

	@Override
	public int insert(GalleryVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public List<GalleryVO> galleryList(GalleryVO vo) {
		return mapper.galleryList(vo);
	}

	@Override
	public GalleryVO view(int no) {
		return mapper.view(no);
	}
	
	
}
