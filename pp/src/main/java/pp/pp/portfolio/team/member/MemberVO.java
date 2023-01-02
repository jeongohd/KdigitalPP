package pp.pp.portfolio.team.member;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	
	private int member_no;
	private String id;
	private String nickname;
	private String pwd;
	private String pw1;
	private String email;
	private String email2;
	private String m_filename_org;
	private String m_filename_server;
	private Timestamp regdate;
	
	
}
