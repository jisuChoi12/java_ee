package imageboard.bean;


public class ImageBoardPaging {
	private int currentPage; // 현재페이지
	private int pageBlock; // 3개씩 [1][2][3][다음] -> [이전][4][5][6][다음] (현재페이지로 구분)
	private int pageSize; // 1페이지당 5개씩
	private int totalA; // 총글수
	private StringBuffer pagingHTML; // String - 편집X | StringBuffer/StringBuilder 편집O
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalA() {
		return totalA;
	}
	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}
	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}
	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}
	
	public void makePagingHTML(){
		//ex)
		//[1][2][3][다음]
		//[이전][4][5][6][다음]
		//[이전][7][8]
		pagingHTML = new StringBuffer();
		int totalPage = (totalA+(pageSize-1))/pageSize; // 총페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1; // 시작페이지
		int endPage = startPage+pageBlock-1; // 끝페이지
		
		if(endPage>totalPage) { // 예를 들어 totalPage가 8이고 endPage가 9인 경우
			endPage = totalPage; // endPage를 totalPage와 같게 만든다 -> [이전][7][8] 이런식으로
		}
		
		if(startPage>pageBlock) { // [이전]이 나오는 시점
			pagingHTML.append("[<a id='prev' href='imageboardList.do?pg="+(startPage-1)+"'>이전</a>]"); // [이전]을 누르면 startPage-1 페이지로 이동 
		}
		
		for (int i = startPage; i <= endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<a id='currentPaging' href='imageboardList.do?pg="+i+"'>"+i+"</a>]");
			} else {
				pagingHTML.append("[<a id='paging' href='imageboardList.do?pg="+i+"'>"+i+"</a>]");
			}
		}
		
		if(endPage<totalPage) { // [다음]이 나오는 시점
			pagingHTML.append("[<a id='next' href='imageboardList.do?pg="+(endPage+1)+"'>다음</a>]"); // [다음]을 누르면 endPage+1 페이지로 이동
		}
		
	}
}


// /miniproject/board/boardSearch.do?searchOption="+document.getElementById("searchOption").value+"&keyword="+document.getElementById("keyword").value+"&pg=1