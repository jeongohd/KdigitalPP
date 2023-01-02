package pp.pp.portfolio.api;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ApiBoardVO{
	
	private int no;
	private String title;
	private int viewcount;
	private String member_no;
	@JsonFormat(pattern = "yyyy.MM.dd")
	private Timestamp regdate; //날짜함수 사용안할꺼면 String으로
	
}
