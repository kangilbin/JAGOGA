package admin.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.action.ActionForward;
import admin.db.AdminDAO;

public class AdminListAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String search = request.getParameter("search");
		String searchText = request.getParameter("searchText");

		String id = (String) session.getAttribute("sessionID");
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		} else if (!id.equals("admin")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./MemberLogin.me';");
			out.println("</script>");
			out.close();
			return null;
		}
		AdminDAO memberdao = new AdminDAO();
		List memberlist = new ArrayList();
			int page = 1;		int limit = 10; 
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
			}
		int listcount = memberdao.getListCount(); 
		
		if(search == null && searchText == null) {
			memberlist = memberdao.getMemberList(page, limit);; // 리스트를 받아옴
		} else if (search != null && searchText.equals("")) {
			memberlist = memberdao.getMemberList(page, limit);
		} else if (search == null && searchText != null) {
			memberlist = memberdao.getMemberList(page, limit);
		} else if (search != null && searchText != null) {
			memberlist = memberdao.getSearchList(search, searchText, page, limit); 
		}
		
		if (memberlist == null) {
			return null;
		}
		// 총페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); 
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 215...) 
		int startpage = (((int) ((double) page / limit + 0.9)) - 1) * limit + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수 (10, 20, 30 5...) 
		int endpage = maxpage + limit - 1;
		if(endpage > startpage) 
		endpage = maxpage;
		
		request.setAttribute("page",page);// 현재 페이지 수
		request.setAttribute("maxpage",maxpage); // 최대 페이지수
		request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지
		request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지
		request.setAttribute("listcount", listcount); // 글 수
		request.setAttribute("memberlist", memberlist);
		
		forward.setRedirect(false);
		forward.setPath("./admin/admin_list.jsp");
		return forward;
	}
}