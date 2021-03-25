package review.user.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.Action;
import review.ActionForward;

public class UserReviewWriteBeforeAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		HttpSession sesObj = request.getSession();
		ActionForward forward = new ActionForward();
		
		String rooms_nm = request.getParameter("rooms_nm");
		System.out.println(rooms_nm);
		request.setAttribute("rooms_nm", rooms_nm);

		forward.setRedirect(false);
		forward.setPath("./review/review_write.jsp");
		return forward;
	}
}
