package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.action.ActionForward;
import admin.db.AdminDAO;

public class AdminDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		AdminDAO memberdao = new AdminDAO();
		boolean result = false;

		String id = (String) session.getAttribute("sessionID");
		
		if (id == null) {
			forward.setRedirect(true);
			forward.setPath("./AdminLogin.me");
			return forward;
		} else if (!id.equals("admin")) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./AdminLogin.me';");
			out.println("</script>");
			out.close();
			return null;
		}

		String deleteId = request.getParameter("member_id");
		result = memberdao.deleteMember(deleteId);

		forward.setRedirect(true);
		forward.setPath("./AdminListAction.me");
		return forward;
	}
}