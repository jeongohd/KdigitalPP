package pp.pp.portfolio.reply;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVO {
	private int no;
	private String id;
	private String title;
	private String content; 
	private Timestamp regdate;
	private int viewcount;
	private int gno;
	private int ono;
	private int nested;
	
	private int page;
	private int startIdx;
	private int pageRow;
	
	public ReplyVO() {
		this.page = 1;
		this.pageRow=10;
	};
	
	public ReplyVO(int page,int pageRow) {
		this.page = page;
		this.pageRow = pageRow;
	}
}
