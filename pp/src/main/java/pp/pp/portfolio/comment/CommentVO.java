package pp.pp.portfolio.comment;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentVO {
	//댓글
	private int cno;
	private String comment;
	private Timestamp cregdate;
	private String name;
	private int password;
	private int boardno;
	private int viewCount;
	private int gno;
	private int ono;
	private int nested;
	//댓글페이징
	private int page;
	private int startIdx;
	private int pageRow;
	
	//글목록
	private int no;
	private String title;
	private String content;
	private Timestamp regdate;
	private int count;
	
	public CommentVO() {
		this.page = 1;
		this.pageRow = 10;
	};
	
	public CommentVO(int page) {
		this.page = page;

	};
}
