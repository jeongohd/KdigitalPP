package pp.pp.portfolio.team.board;
import java.sql.Timestamp;
import java.util.List;

import lombok.Data;
import pp.pp.portfolio.team.map.MapVO;
import pp.pp.portfolio.team.reply.ReplyVO;
import pp.pp.portfolio.team.util.CategoryVO;
import pp.pp.portfolio.team.util.FileVO;

@Data
public class BoardVO {
	
	private String board_name; 
	private int board_no; 
	private String id; 
	private int member_no; 
	private String title;
	private int viewcount; 
	private Timestamp writedate; 
	private Timestamp updatedate; 
	private Timestamp reply_writedate; 
	
	
	
	// Search
	private String stype;
	private String sword;
	private String stag;
	
	private String content; 
	private int likecount;
	private int replycount;
	private int dislikecount;
	private int hashtag_no;
	private String hashtag_name;
	private String filename_server;
	
	
	
	// Paging
	private int startIdx;
	private int pageRow;
	private int total;
	private int page;
	public BoardVO (int page, int pageRow){
		this.page=page;
		this.pageRow=pageRow;
	}
	public BoardVO (){
		this(1,5);
	}
	
	// 정길 메인에 이미지 띄우기
	private List<FileVO> getTravPic;
	private int commentCount;
	private int thumbsUp;
	private String getId;
	
	
	// 내용여러개
	private List<MapVO> placeList;
	private List<CategoryVO> hashtagList; 
	private String[] contents;
	private int course_no;
	private int login_member_no;
}
