package pp.pp.portfolio.gallery;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GalleryMapper {
	int insert(GalleryVO vo);
	List<GalleryVO> galleryList(GalleryVO vo);
	int update(GalleryVO no);
	int delete(int no);
	GalleryVO view(int no);
	int updateViewcount(int no);
	int count();
}
