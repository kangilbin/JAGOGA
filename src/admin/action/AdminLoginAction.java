package admin.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.action.ActionForward;
import admin.db.MemberBean;
import admin.db.AdminDAO;

public class AdminLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		AdminDAO memberdao = new AdminDAO();
		MemberBean member = new MemberBean();
		int result = -1;

		member.setMember_id(request.getParameter("member_id"));
		member.setPassword(request.getParameter("password"));

		result = memberdao.isMember(member);
		if (result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다. ');");
			out.println("location.href='./AdminLogin.me';");
			out.println("</script>");
			out.close();
			return null;
		} else if (result == -1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("location.href='./AdminLogin.me';");
			out.println("</script>");
			out.close();
			return null;
		}

		session.setAttribute("id", member.getMember_id());
		forward.setRedirect(true);
		forward.setPath("./AdminListAction.me");
		return forward;
	}
}
