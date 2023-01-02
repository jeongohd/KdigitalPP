package pp.pp.portfolio.api;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Param {
	private int pageNo; 
	private int pageRow;
	private String search;
	private String searchType;

	public int startIdx;
	
	public Param() {
		this.pageNo = 1;
		this.pageRow = 5;
	}
	
	public int getStartIdx() {
		startIdx = (pageNo-1)*pageRow;
		return startIdx;
	}
}
