package rooms.action.user;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooms.action.Action;
import rooms.action.ActionForward;
import rooms.db.user.RoomsBean;
import rooms.db.user.RoomsDAO;

import review.db.ReviewBean;
import review.db.ReviewDAO;

public class RoomsDetailAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		ArrayList<String> images = new ArrayList<String>();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");
		
		System.out.println("숙소 보기 id 값 : "+id);

		// 리뷰 베스트 3개
		ReviewBean reviewBean = new ReviewBean();
		ReviewDAO reviewDao = new ReviewDAO();

		float startt_avg = 0;

		reviewBean.setRooms_nm(request.getParameter("name"));

		int count = reviewDao.reviewCount(reviewBean);
		request.setAttribute("count", count);

		if (reviewBean.getReview_star_tt() != 0) {
			startt_avg = reviewDao.startAvg(reviewBean);
		}

		request.setAttribute("startt_avg", startt_avg);

		List<ReviewBean> listRecent = null;
		reviewBean.setRooms_nm(request.getParameter("name"));
		System.out.println(reviewBean.getRooms_nm());

		listRecent = reviewDao.listBest(reviewBean.getRooms_nm());
		request.setAttribute("listRecent", listRecent);
		request.setAttribute("rooms_nm", reviewBean.getRooms_nm());

		// 숙소 상세보기 코드
		RoomsBean roomsDetail = RoomsDAO.userRoomsInfo(request.getParameter("name"));

		String str = roomsDetail.getRooms_file();
		StringTokenizer token = new StringTokenizer(str, "/");
		while (token.hasMoreTokens()) {
			images.add(token.nextToken());
		}

		request.setAttribute("pUri", request.getParameter("pUri"));
		request.setAttribute("rooms", roomsDetail);
		request.setAttribute("images", images);
		request.setAttribute("replaceChar", "\n");

		forward.setRedirect(false);
		forward.setPath("./rooms/roomsUser/RoomsDetail.jsp");
		return forward;
	}
}
