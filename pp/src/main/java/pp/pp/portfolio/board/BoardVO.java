package pp.pp.portfolio.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int no;
	private String title;
	private String content; 
	private Timestamp regdate;
	private int viewcount;
	private String filename_org;
	private String filename_real;
	private int count;
	private int filename_chk;
	private String stype;
	private String sword;
	
	
	private int page;
	private int startIdx;
	private int pageRow;
	
	public BoardVO() {
		this.page = 1;
		this.pageRow=5;
	};
	
	public BoardVO(int page,int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
}
