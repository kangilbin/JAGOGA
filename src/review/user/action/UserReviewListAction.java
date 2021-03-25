package review.user.action;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.db.ReviewBean;
import review.db.ReviewDAO;
import review.*;

public class UserReviewListAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession sesObj = request.getSession();
		ActionForward forward = new ActionForward();
		ReviewBean reviewBean = new ReviewBean();
		ReviewDAO reviewDao = new ReviewDAO();
		
		List<ReviewBean> listRecent = null;
		request.setCharacterEncoding("UTF-8");
		try {
			String sort = (request.getParameter("sort") == null) ? "" : request.getParameter("sort");
		    reviewBean.setRooms_nm(request.getParameter("rooms_nm"));
		    request.setAttribute("rooms_nm", reviewBean.getRooms_nm());
		    int count = reviewDao.reviewCount(reviewBean);
		    float startt_avg = reviewDao.startAvg(reviewBean); 
	
		    request.setAttribute("count", count); 
			request.setAttribute("startt_avg", startt_avg);
			request.setAttribute("sort", sort);
					
			
			if(sort.equals("datet:desc")||sort.equals("")) {
			listRecent = reviewDao.listRecent(reviewBean);
			request.setAttribute("listRecent", listRecent);
			} else if(sort.equals("score:desc")) {
			listRecent = reviewDao.listStarde(reviewBean);
			request.setAttribute("listRecent", listRecent);
			System.out.println("2");
			}else {
			listRecent = reviewDao.listStarac(reviewBean);
			request.setAttribute("listRecent", listRecent);
			System.out.println("3");
			}
			forward.setRedirect(false);
			forward.setPath("./review/reviews_list.jsp");
			return forward;
		} catch (Exception ex){ ex.printStackTrace();}
		
		
		return null;
	}
}
