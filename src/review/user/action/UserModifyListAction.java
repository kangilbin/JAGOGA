package review.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.db.ReviewBean;
import review.db.ReviewDAO;
import review.*;

public class UserModifyListAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession sesObj = request.getSession();
		ActionForward forward = new ActionForward();
		ReviewBean reviewBean = new ReviewBean();
		ReviewDAO reviewDao = new ReviewDAO();
		
		request.setCharacterEncoding("UTF-8");
		
		int page = 1; int limit = 10;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
			reviewBean.setMember_id((String) sesObj.getAttribute("sessionID"));
			String member_id = reviewBean.getMember_id();
			int listcount = reviewDao.userCount(member_id);
			List<ReviewBean> listRecent = null;
			
			listRecent = reviewDao.listUser2(page, limit, member_id);	
			
			System.out.println(listcount);
			System.out.println(page);
			System.out.println(limit);
			System.out.println(member_id);
			System.out.println(listRecent.size());
					
			
			//총페이지수
			int maxpage = (int) ((double) listcount /limit + 0.95);
			//현재 페이지에 보여줄 시작페이지 수 (1, 11, 21 등...)
			int startpage = (((int) ((double) page / 10 + 0.9))-1) * 10 + 1;
			// 현재 페이지에 보여줄 마지막 페이지수(10,20, 30등 ..)
			int endpage = startpage + 10 -1;
			if (endpage > maxpage) endpage = maxpage;
			
			request.setAttribute("page", page); //현재페이지수
			request.setAttribute("maxpage", maxpage); //최대페이지수
			request.setAttribute("startpage", startpage); //현재페이지에 첫 끝페이지
			request.setAttribute("endpage", endpage); //현재페이지에 표시할 끝페이지
			request.setAttribute("listcount", listcount); //글 수
			request.setAttribute("listRecent", listRecent); 
			
			forward.setRedirect(false);
			forward.setPath("./review/review_modify.jsp");
			
			return forward;		
	}
}
