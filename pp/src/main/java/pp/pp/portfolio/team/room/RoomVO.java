package pp.pp.portfolio.team.room;

import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class RoomVO {
	private String board_name;
	private int board_no;
	private int room_no;
	private String roommaker_id;
	private String room_title;
	private String room_content;
	private String room_startdate;
	private String room_enddate;
	private int room_participant_no;
	private int member_no;
	
	private Timestamp room_makedate;
	private String room_pwd;
	
	//방 참여자 수
	private int room_participant_count;
  
}