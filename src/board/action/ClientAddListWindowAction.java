package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.db.BoardBean;
import board.db.BoardDAO;

public class ClientAddListWindowAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");

		boolean result = false;
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		java.sql.Date startday = null;
		java.sql.Date endday = null;
		String type = null;

		try {

			if (id == null) {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인이 필요합니다.');");
				out.println("self.close();");
				out.println("</script>");
				out.close();
				return null;
			}

			startday = java.sql.Date.valueOf(request.getParameter("startday"));
			endday = java.sql.Date.valueOf(request.getParameter("endday"));
			type = request.getParameter("type");

			boarddata.setId(id);
			boarddata.setRooms_type(type);
			boarddata.setStartday(startday);
			boarddata.setEndday(endday);

			result = boarddao.boardInsert(boarddata);

			if (result == false) {
				System.out.println("예약 실패");
				return null;
			}
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('예약 되었습니다.');");
			out.println("self.close();");
			out.println("</script>");
			out.close();
			return null;
		} catch (IllegalArgumentException ex) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('날짜를 입력하시오.');");
			out.println("self.close();");
			out.println("</script>");
			out.close();
			return null;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}