package pp.pp.portfolio.gallery;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class GalleryVO {
	private int no;
	private String title;
	private String content; 
	private Timestamp regdate;
	private int viewcount;
	private String filename_org;
	private String filename_real;
	private int count;
	private int filename_chk;
	private String sword;
	

}
