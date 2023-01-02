package pp.pp.portfolio.team.message;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageVO {
   
   private int message_no;
   private int send_member_no;
   private int receive_member_no;
   private String message_content;
   private Timestamp senddate;
   private Timestamp readdate;
   private int delete;
   private String nickname;
   private String id;
   private int member_no;
   private String stype;
   private String sword;
   private int startIdx;
   private int pageRow;
   private int page;
	
   public MessageVO (int page, int pageRow){
	   this.page=page;
	   this.pageRow=pageRow;
   }
   public MessageVO (){
	   this(1,5);
   }
   
}