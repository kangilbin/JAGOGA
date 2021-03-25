package review.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.db.ReviewBean;
import review.db.ReviewDAO;
import review.*;

public class UserModifyAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		ReviewBean reviewBean = new ReviewBean();
		ReviewDAO reviewDao = new ReviewDAO();
		request.setCharacterEncoding("UTF-8");
		List<ReviewBean> listRecent = null;
		int review_id = Integer.parseInt(request.getParameter("review_id"));
		try {
			listRecent = reviewDao.selReviewID(review_id);
		}catch(Exception e) {}
		request.setAttribute("listRecent", listRecent);
		System.out.println(review_id);
		forward.setRedirect(false);
		forward.setPath("./review/review_modifydetail.jsp"); //review_modifydetail
		return forward;
	}
}
