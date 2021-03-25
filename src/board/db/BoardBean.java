package board.db;

import java.sql.Date;

public class BoardBean {
	private int  res_ord;
	private String rooms_type;
	private String MEMBER_NAME;
	private String id;
	private Date startday; 
	private Date endday;
	private int  rooms_pay;


	public String getMEMBER_NAME() {
		return MEMBER_NAME;
	}
	public void setMEMBER_NAME(String mEMBER_NAME) {
		MEMBER_NAME = mEMBER_NAME;
	}
	public int getRooms_pay() {
		return rooms_pay;
	}
	public void setRooms_pay(int rooms_pay) {
		this.rooms_pay = rooms_pay;
	}
	public int getRes_ord() {
		return res_ord;
	}
	public void setRes_ord(int res_ord) {
		this.res_ord = res_ord;
	}
	public String getRooms_type() {
		return rooms_type;
	}
	public void setRooms_type(String rooms_type) {
		this.rooms_type = rooms_type;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getStartday() {
		return startday;
	}
	public void setStartday(Date startday) {
		this.startday = startday;
	}
	public Date getEndday() {
		return endday;
	}
	public void setEndday(Date endday) {
		this.endday = endday;
	}
	
}
