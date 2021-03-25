package review.db;

import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

public class ReviewBean {
	private int review_id;
	private String member_id;
	private String rooms_nm;
	private int review_star_tt;
	private String review_content;
	private String review_file;
	private Date review_dt;
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getRooms_nm() {
		return rooms_nm;
	}
	public void setRooms_nm(String rooms_nm) {
		this.rooms_nm = rooms_nm;
	}
	public int getReview_star_tt() {
		return review_star_tt;
	}
	public void setReview_star_tt(int review_star_tt) {
		this.review_star_tt = review_star_tt;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_file() {
		return review_file;
	}
	public void setReview_file(String review_file) {
		this.review_file = review_file;
	}
	public Date getReview_dt() {
		return review_dt;
	}
	public void setReview_dt(Date review_dt) {
		this.review_dt = review_dt;
	}	
	
	
}
