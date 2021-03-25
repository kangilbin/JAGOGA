package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardDAO;

public class AdminDeleteAction implements Action { 
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception { 
	ActionForward forward = new ActionForward();
	request.setCharacterEncoding("UTF-8");
	
	HttpSession session = request.getSession();
	String id = (String) session.getAttribute("sessionID");
	
	
	boolean result = false;
	int ord= Integer.parseInt(request.getParameter("ord"));
	
	BoardDAO boarddao = new BoardDAO();
	
	if(!id.equals("admin")) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제할 권환이 없습니다.');");
		out.println("location.href='./ResList.admin';");
		out.println("</script>");
		out.close(); return null;
	}
	result = boarddao.boardDelete(ord);
	if(result == false) {
		System.out.println("예약 삭제 실패");	return null;
	}
	System.out.println("예약 삭제 완료");
	forward.setRedirect(true);
	forward.setPath("./ResList.admin");
	return forward;
	}
}
