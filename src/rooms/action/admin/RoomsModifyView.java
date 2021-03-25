package rooms.action.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooms.action.Action;
import rooms.action.ActionForward;
import rooms.db.admin.RoomsBean;
import rooms.db.admin.RoomsDAO;

public class RoomsModifyView implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		RoomsBean roomsModify = RoomsDAO.roomsInfo(request.getParameter("name"));

		// 관리자 인증
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sessionID");

		if ((id == null) || (!id.equals("admin"))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('잘못된 접근 입니다!');");
			out.println("location.href='./';");
			out.println("</script>");
			out.close();
			return null;
		}

		request.setAttribute("rooms", roomsModify);

		forward.setRedirect(false);
		forward.setPath("./rooms/roomsAdmin/AdminRoomsModifyView.jsp");
		return forward;
	}
}
