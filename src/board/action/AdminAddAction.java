package board.action;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardBean;
import board.db.BoardDAO;

public class AdminAddAction implements Action { 
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception { 
		ActionForward forward = new ActionForward();
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");
		java.sql.Date startday = null;
		java.sql.Date endday = null;
	boolean result = false;
	BoardDAO boarddao = new BoardDAO(); 
	BoardBean boarddata = new BoardBean(); 
	

	try {
	if(!id.equals("admin")) {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('권환이 없습니다.');");
		out.println("location.href='./AdminLogin.me';");
		out.println("</script>");
		out.close(); return null;
	}
	
	 startday = java.sql.Date.valueOf(request.getParameter("startday"));
	 endday = java.sql.Date.valueOf(request.getParameter("endday"));

		boarddata.setId(request.getParameter("id"));
		boarddata.setRooms_type(request.getParameter("type"));
		boarddata.setStartday(startday);
		boarddata.setEndday(endday);
		
		result = boarddao.boardInsert(boarddata);
		if(result == false) {
			System.out.println("예약  등록 실패"); 	
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약 정보를 다시 확인해 주십시오.');");
			out.println("location.href='./ResWrite.admin';");
			out.println("</script>");
			out.close(); return null;
		}
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('예약 되었습니다.');");
		out.println("opener.location.reload();");
		out.println("self.close();");
		out.println("</script>");
		out.close(); return null;
		} catch (IllegalArgumentException ex) {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('날짜를 입력하시오.');");
		out.println("location.href='./ResWrite.admin';");
		out.println("</script>");
		out.close(); 
		
	} catch (Exception ex) {ex.printStackTrace();}
	return null;
	}
}