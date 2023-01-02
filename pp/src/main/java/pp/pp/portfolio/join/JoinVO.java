package pp.pp.portfolio.join;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JoinVO {
	private int no;
	private String id;
	private String pwd;
	private String name;
	private int gender;
	private String birthday;
	private String hp;
	private String zipcode;
	private String addr1;
	private String addr2;
	private Timestamp regdate;
}
