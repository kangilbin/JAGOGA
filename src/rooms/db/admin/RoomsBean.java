package rooms.db.admin;

import java.sql.Date;

public class RoomsBean {
	private String rooms_thumbnail;
	private String rooms_nm;
	private String rooms_intro;
	private String rooms_contents;
	private String rooms_info;
	private int rooms_amt;
	private int rooms_pay;
	private String rooms_file;
	private Date rooms_date;

	public String getRooms_thumbnail() {
		return rooms_thumbnail;
	}

	public Date getRooms_date() {
		return rooms_date;
	}

	public void setRooms_date(Date rooms_date) {
		this.rooms_date = rooms_date;
	}

	public void setRooms_thumbnail(String rooms_Thumbnail) {
		this.rooms_thumbnail = rooms_Thumbnail;
	}

	public String getRooms_nm() {
		return rooms_nm;
	}

	public void setRooms_nm(String rooms_nm) {
		this.rooms_nm = rooms_nm;
	}

	public String getRooms_contents() {
		return rooms_contents;
	}

	public void setRooms_contents(String rooms_contents) {
		this.rooms_contents = rooms_contents;
	}

	public int getRooms_amt() {
		return rooms_amt;
	}

	public void setRooms_amt(int rooms_amt) {
		this.rooms_amt = rooms_amt;
	}

	public int getRooms_pay() {
		return rooms_pay;
	}

	public void setRooms_pay(int rooms_pay) {
		this.rooms_pay = rooms_pay;
	}

	public String getRooms_file() {
		return rooms_file;
	}

	public String getRooms_intro() {
		return rooms_intro;
	}

	public void setRooms_intro(String rooms_intro) {
		this.rooms_intro = rooms_intro;
	}

	public String getRooms_info() {
		return rooms_info;
	}

	public void setRooms_info(String rooms_info) {
		this.rooms_info = rooms_info;
	}

	public void setRooms_file(String rooms_file) {
		this.rooms_file = rooms_file;
	}

}
