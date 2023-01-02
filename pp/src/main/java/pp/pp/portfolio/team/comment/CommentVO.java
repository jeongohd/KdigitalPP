package pp.pp.portfolio.team.comment;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class CommentVO {
	
	String content;
	int member_no;
	String id;
	int board_no;
	int reply_no;
	String member_id;
	String board_name;
	Timestamp reply_writedate;
	Timestamp reply_updatedate;
	Timestamp regdate;
	Timestamp writedate;
	int replycount;
	int gno;
	int ono;
	int room_no;
	private int commentcount;
	//private String member_name;
	String member_name;
	int startIdx;
	int pageRow;
	int page;
	String nickname;
	
	public CommentVO() {
		this.pageRow = 10;
		this.page = 1;
	}
	
	public String getReply_writedate_str() {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(reply_writedate);
	}
}
