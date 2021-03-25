package review.db;

import java.util.List;

public interface ReviewInterface {
	public List<ReviewBean>	listAll();
	public List<ReviewBean> listRecent(ReviewBean reviewBean);
	public List<ReviewBean> listStarde(ReviewBean reviewBean);
	public List<ReviewBean> listStarac(ReviewBean reviewBean);
	public List<ReviewBean> listUser(String member_id);
	public List<ReviewBean> selReviewID(int review_id);
	public List<ReviewBean> listBest(String rooms_nm);
	public List<ReviewBean> listDel(int page, int limit);
	public List<ReviewBean> listUser2(int page, int limit, String member_id);
	public void reviewInsert(ReviewBean reviewBean);
	public void reviewInsert2(ReviewBean reviewBean);
	public int reviewCount(ReviewBean reviewBean);
	public int reviewAllCount();
	public int userCount(String member_id);
	public float startAvg(ReviewBean reviewBean);
	public void delReview(int review_id);
	public void reviewUpdate(ReviewBean reviewBean);
	public void reviewUpdate2(ReviewBean reviewBean);
}
