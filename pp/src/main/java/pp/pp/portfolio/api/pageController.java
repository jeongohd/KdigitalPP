package pp.pp.portfolio.api;

public class pageController {
	public int startPage;
	public int endPage;
	public boolean prev,next;
	public int totalPage;

	
	public void pageProcess(Param param,int total) { 
		totalPage = total / param.getPageRow();
		if(total % param.getPageRow() > 0 ) totalPage++;
		
		this.endPage = (int)(Math.ceil(param.getPageNo()/10.0)*10);
		this.startPage = this.endPage - 9;
		int realEnd = (int)((total*1.0)/param.getPageRow());
		if(realEnd<this.endPage) this.endPage = realEnd;
		this.prev = this.startPage > 1 ? true:false;
		this.next = this.endPage < realEnd;

			
	}
	
	
}
