package pp.pp.portfolio.gallery;

import java.util.List;

public interface GalleryService {
	int insert(GalleryVO vo);
	List<GalleryVO> galleryList(GalleryVO vo);
	GalleryVO view(int no);
	
}
