package pp.pp.portfolio.team.util;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import pp.pp.portfolio.team.board.BoardVO;

@Service
public class UtilServicempl implements UtilService {
	@Autowired
	CategoryMapper cmapper;
	@Autowired
	FileMapper fmapper;
	///////////////////////////////진경시작///////////////////////////////////////////
	//해쉬태그등록
	@Override
	public boolean insert(CategoryVO cvo, pp.pp.portfolio.team.board.BoardVO bvo) {
		for(int hashtag:cvo.getHashtag_no_arr()) {
			cvo.setBoard_no(bvo.getBoard_no());
			cvo.setHashtag_no(hashtag);
			cmapper.insert(cvo);
		}
		//cmapper.regionInsert(cvo);
		return true;
	}
	//해쉬태그 수정
	@Override
	public boolean hashRegionEdit(CategoryVO vo) {
		cmapper.hashRegionEdit(vo);
		return true;
	}

	//파일업로드
	@Override
	public boolean fileupload(FileVO fvo, @RequestParam MultipartFile[] filename, HttpServletRequest req,BoardVO bvo) {
		int a = 1;
		System.out.println("filename.length:"+filename.length);
		for(MultipartFile files :filename) {
			a++;
			if(!files.isEmpty()) {
				String org = files.getOriginalFilename();
				String ext=org.substring(org.lastIndexOf('.'));
				String sever = new Date().getTime()+ext;
				
//				String pate = req.getRealPath("/upload/"); 
//				정길이가 밑의 경로로 수정. 
//				폴더를 upload로 할 시, 개인 pc에 각각 workspace 에 upload폴더를 따로 만들어야하니,
//				이미 만들어져 있는 img 폴더에 저장하는게 낫겠다 싶어서.
				String pate = req.getRealPath("/img/");
				try {
					files.transferTo(new File(pate+sever));
				}catch(Exception e) {}
					fvo.setCourse_no(a/2);
					fvo.setFilename_org(org);
					fvo.setFilename_server(sever);
					fvo.setBoard_no(bvo.getBoard_no());
					fmapper.fileupload(fvo);
			}
		}
		return true;
	}

	//해시태그,지역대분류 출력
	@Override
	public Map writeCategory() {
		Map category = new HashMap();
		category.put("hash", cmapper.hash());
		category.put("region", cmapper.regionSelect());
		return category;
	}
	//지역 소분류 리스트로 받아서 map에 담기
	@Override
	public Map regionDetail(String rs) {
		List<CategoryVO> regionDetailList =cmapper.regionDetail(rs);
		Map regionDetail = new HashMap();
		regionDetail.put("regionDetailList", regionDetailList);
		return regionDetail;
		
	}
	//resion_no 카테고리 테이블에 등록
	@Override
	public int regionInsert(CategoryVO cvo) {
		cvo.setRegion_no(0);
		for(int region:cvo.getRegion_no_arr()) {
			//arr에 체크하기
			cvo.setRegion_no(region);
			cmapper.regionInsert(cvo);
		}
		return 0;
	}

	///////////////////////////////진경끝///////////////////////////////////////////
}
