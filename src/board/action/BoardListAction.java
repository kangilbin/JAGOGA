package board.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;

public class BoardListAction implements Action { 
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception { 
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");
		
		String search = request.getParameter("search");
		String searchText = request.getParameter("searchText");
		
		
		if (id == null) {
			forward.setRedirect(true); 
			forward.setPath("./MemberLogin.me");
			return forward; 
			} else if (!id.equals("admin")) {
				response.setContentType("text/html; charset=UTF-8"); 
				PrintWriter out = response.getWriter(); 
				out.println("<script>"); 
				out.println("alert('관리자가 아닙니다.');");
				out.println("location.href='./AdminLogin.me';"); 
				out.println("</script>"); 
				out.close(); 	return null;
		}
		
		BoardDAO boarddao = new BoardDAO(); 
		  List boardlist = new ArrayList();
		int page = 1;		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		int listcount = boarddao.getListCount(); // 총 리스트 수를 받아옴
		
		if(search == null && searchText == null) {
			boardlist = boarddao.getBoardList(page, limit); // 리스트를 받아옴
		} else if (search != null && searchText.equals("")) {
			boardlist = boarddao.getBoardList(page, limit);
		} else if (search == null && searchText != null) {
			boardlist = boarddao.getBoardList(page, limit);
		} else if (search != null && searchText != null) {
			boardlist = boarddao.getSearchList(search, searchText, page, limit); 
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
	request.setAttribute("boardlist", boardlist);
	
	for (int i=0; i < boardlist.size(); i++) {

		System.out.println(boardlist.get(i));

	}
	
	forward.setRedirect(false);
	forward.setPath("./reservation/res_list.jsp");
	return forward;
	}
}