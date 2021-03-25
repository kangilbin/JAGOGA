package rooms.db.user;

//mybatis 매개변수를 두개 넘겨야하는데 모르겠습니다..
public class PageBean {
	private int endrow;
	private int startrow;
	private String searchName;
	private String search_Param;

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public String getSearch_Param() {
		return search_Param;
	}

	public void setSearch_Param(String search_Param) {
		this.search_Param = search_Param;
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}

}
