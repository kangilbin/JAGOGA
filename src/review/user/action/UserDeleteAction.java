package review.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.db.ReviewBean;
import review.db.ReviewDAO;
import review.*;

public class UserDeleteAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession sesObj = request.getSession();
		ActionForward forward = new ActionForward();
		ReviewBean reviewBean = new ReviewBean();
		ReviewDAO reviewDao = new ReviewDAO();
		
		request.setCharacterEncoding("UTF-8");		
		int review_id = Integer.parseInt(request.getParameter("review_id"));
		System.out.println(review_id);

		try {

		reviewDao.delReview(review_id);
		System.out.println("review_id : "+review_id+"번 삭제");		
		} catch(Exception e) {}
		forward.setRedirect(true);
		forward.setPath("./UserModifyList.re");
		
		return forward;
	}
}
