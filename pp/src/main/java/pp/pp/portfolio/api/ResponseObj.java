package pp.pp.portfolio.api;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResponseObj {
	//response 객체로 받아서 사용할떄??
	private int totalCount;
	private int totalPage;
	private int page;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private List<ApiBoardVO> items;
}
