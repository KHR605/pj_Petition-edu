package model;

public class PageInfo {
	
	private int page;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int listCount;
	private int ingpetiCount;
	private int endpetiCount;
	private int boardlistCount;
	
	public int getIngpetiCount() {
		return ingpetiCount;
	}

	public void setIngpetiCount(int ingpetiCount) {
		this.ingpetiCount = ingpetiCount;
	}

	public int getEndpetiCount() {
		return endpetiCount;
	}

	public void setEndpetiCount(int endpetiCount) {
		this.endpetiCount = endpetiCount;
	}

	public int getBoardlistCount() {
		return boardlistCount;
	}

	public void setBoardlistCount(int boardlistCount) {
		this.boardlistCount = boardlistCount;
	}

	private int startrow;
	private String search;
	
	public String getSearch() {
		return search;
	}
	
	public void setSearch(String search) {
		this.search = search;
	}
	
	public int getStartrow() {
		return startrow;
	}
	
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getMaxPage() {
		return maxPage;
	}
	
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public int getListCount() {
		return listCount;
	}
	
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

}
