package rooms.action.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import rooms.action.Action;
import rooms.action.ActionForward;

public class RoomsWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

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

		forward.setRedirect(false);
		forward.setPath("./rooms/roomsAdmin/AdminRoomsWrite.jsp");
		return forward;
	}

}
